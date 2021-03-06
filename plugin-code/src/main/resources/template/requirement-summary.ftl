<#--
Copyright 2019 trivago N.V.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<#import "macros/page.ftl"as page>
<#import "macros/common.ftl" as common>
<#import "macros/navigation.ftl" as navigation>

<@page.page
title="${pageTitle} - All Requirements"
base=".."
highlight="requirement_summary"
headline="All Requirement"
subheadline=""
preheadline=""
preheadlineLink="">


    <div class="row" id="available-requirements">
        <@page.card width="12" title="Available Requirements" subtitle="" classes="">
            <div id="requirement_summary" class="text-left pb-0"">
                <#list requirements as requirement >
                    <#if requirement.level != 0>
                        <#if requirement.level <= level>
                            <#list requirement.level..level as n>
                            </div>
                            </#list>
                        </#if>
                        <div class="deeper parent active">
                        <table width="100%">
                        <tr>
                            <td class="text-left firstcol" >
                                <a style="padding-left: ${(requirement.level-1) * 15}px" class="collapsed requirement" data-toggle="collapse" id="menu-group${requirement.id}" href="#sub-item${requirement.id}">
                                    ${requirement.name}
                                </a>
                            </td>
                            <#if requirement.count.passed!=0>
                            <#assign percent = requirement.count.passed/requirement.count.total * 0.4 * 100>
                            <td class="bar-color-passed bar" style="--bar-value:${percent?c}%;">
                                ${requirement.count.passed}    
                            </td>
                            </#if>
                            <#if requirement.count.failed!=0>
                            <#assign percent = requirement.count.failed/requirement.count.total * 0.4 * 100>                    
                            <td class="bar-color-failed bar" style="--bar-value:${percent?c}%;">
                                ${requirement.count.failed}
                            </td>
                            </#if>
                            <#if requirement.count.skipped!=0>
                            <#assign percent = requirement.count.skipped/requirement.count.total * 0.4 * 100>                    
                            <td class="bar-color-skipped bar" style="--bar-value:${percent?c}%;">
                                ${requirement.count.skipped}
                            </td>
                            </#if>
                        </tr>
                        </table>

                        </div>
                        <div class="collapse" id="sub-item${requirement.id}" data-parent="#menu-group${requirement.id}">
                    </#if>
                    <#assign level = requirement.level>
                    <#list requirement.features as feature>
                    <div class="deeper parent active">
                    <table width="100%">
                    <tr>
                        <td class="text-left firstcol">
                            <a style="padding-left: ${requirement.level * 15}px"
                                class="feature"
                                href="pages/feature-scenarios/feature_${feature.index?c}.html">
                                <i class="color-${feature.status?lower_case} icon-${feature.status?lower_case}"></i>
                                ${feature.name}
                            </a>
                        </td>                        
                        <td class="text-right nextcol"><strong>${feature.resultcount.total}</strong></td>
                        <td class="text-right color-passed nextcol">${feature.resultcount.passed}</td>
                        <td class="text-right color-failed nextcol">${feature.resultcount.failed}</td>
                        <td class="text-right color-skipped nextcol">${feature.resultcount.skipped}</td>
                    </tr>
                    </table>

                    </div>
                    </#list>
                </#list>
            </div>
        </@page.card>
    </div>
</@page.page>
