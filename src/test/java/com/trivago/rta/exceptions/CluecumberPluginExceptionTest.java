package com.trivago.rta.exceptions;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class CluecumberPluginExceptionTest {
    @Test
    public void testErrorMessage() {
        CluecumberPluginException exception = new CluecumberPluginException("This is a test");
        assertThat(exception.getMessage(), is("This is a test"));
    }
}
