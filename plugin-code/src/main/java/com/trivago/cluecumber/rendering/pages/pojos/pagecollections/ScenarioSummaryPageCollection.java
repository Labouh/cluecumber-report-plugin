package com.trivago.cluecumber.rendering.pages.pojos.pagecollections;

import com.trivago.cluecumber.constants.Status;

import java.util.HashSet;
import java.util.Set;

public class ScenarioSummaryPageCollection extends SummaryPageCollection {
    private Set<Integer> totalFailed = new HashSet<>();
    private Set<Integer> totalPassed = new HashSet<>();
    private Set<Integer> totalSkipped = new HashSet<>();

    ScenarioSummaryPageCollection(final String pageName) {
        super(pageName);
    }

    public int getTotalNumberOfScenarios() {
        return getTotalNumberOfPassed() + getTotalNumberOfFailed() + getTotalNumberOfSkipped();
    }

    public int getTotalNumberOfPassed() {
        return totalPassed.size();
    }

    public int getTotalNumberOfFailed() {
        return totalFailed.size();
    }

    public int getTotalNumberOfSkipped() {
        return totalSkipped.size();
    }

    public void addScenarioIndexByStatus(final Status status, final int scenarioIndex) {
        switch (status) {
            case FAILED:
                totalFailed.add(scenarioIndex);
                break;
            case PASSED:
                totalPassed.add(scenarioIndex);
                break;
            case SKIPPED:
                totalSkipped.add(scenarioIndex);
            default:
        }

    }
}
