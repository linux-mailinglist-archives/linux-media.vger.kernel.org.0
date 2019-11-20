Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB022103D1E
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 15:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730735AbfKTOSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 09:18:20 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44024 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729000AbfKTOST (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 09:18:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iXQoH-0001S1-KE; Wed, 20 Nov 2019 14:18:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iXQou-00074m-Go; Wed, 20 Nov 2019 14:19:00 +0000
Date:   Wed, 20 Nov 2019 14:19:00 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1933533846.10.1574259540512.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1735325726.3.1574255946954.JavaMail.jenkins@builder.linuxtv.org>
References: <1735325726.3.1574255946954.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #2417
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/2417/display/redirect>

Changes:


------------------------------------------
Started by timer
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/media-build/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_build.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_build.git
 > git --version # timeout=10
 > git fetch --tags --force --progress -- git://linuxtv.org/media_build.git +refs/heads/*:refs/remotes/origin/*
ERROR: Error fetching remote repo 'origin'
hudson.plugins.git.GitException: Failed to fetch from git://linuxtv.org/media_build.git
	at hudson.plugins.git.GitSCM.fetchFrom(GitSCM.java:894)
	at hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1161)
	at hudson.plugins.git.GitSCM.checkout(GitSCM.java:1192)
	at hudson.scm.SCM.checkout(SCM.java:504)
	at hudson.model.AbstractProject.checkout(AbstractProject.java:1208)
	at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:574)
	at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:86)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:499)
	at hudson.model.Run.execute(Run.java:1815)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
	at hudson.model.ResourceController.execute(ResourceController.java:97)
	at hudson.model.Executor.run(Executor.java:429)
Caused by: hudson.plugins.git.GitException: Command "git fetch --tags --force --progress -- git://linuxtv.org/media_build.git +refs/heads/*:refs/remotes/origin/*" returned status code 128:
stdout: 
stderr: fatal: unable to connect to linuxtv.org:
linuxtv.org[0: 130.149.80.248]: errno=Connection refused


	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.launchCommandIn(CliGitAPIImpl.java:2172)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.launchCommandWithCredentials(CliGitAPIImpl.java:1864)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.access$500(CliGitAPIImpl.java:78)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl$1.execute(CliGitAPIImpl.java:545)
	at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler$1.call(RemoteGitImpl.java:153)
	at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler$1.call(RemoteGitImpl.java:146)
	at hudson.remoting.UserRequest.perform(UserRequest.java:212)
	at hudson.remoting.UserRequest.perform(UserRequest.java:54)
	at hudson.remoting.Request$2.run(Request.java:369)
	at hudson.remoting.InterceptingExecutorService$1.call(InterceptingExecutorService.java:72)
	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at java.base/java.lang.Thread.run(Thread.java:834)
	Suppressed: hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave1
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1743)
		at hudson.remoting.UserRequest$ExceptionResponse.retrieve(UserRequest.java:357)
		at hudson.remoting.Channel.call(Channel.java:957)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.execute(RemoteGitImpl.java:146)
		at jdk.internal.reflect.GeneratedMethodAccessor571.invoke(Unknown Source)
		at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
		at java.base/java.lang.reflect.Method.invoke(Method.java:566)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.invoke(RemoteGitImpl.java:132)
		at com.sun.proxy.$Proxy90.execute(Unknown Source)
		at hudson.plugins.git.GitSCM.fetchFrom(GitSCM.java:892)
		at hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1161)
		at hudson.plugins.git.GitSCM.checkout(GitSCM.java:1192)
		at hudson.scm.SCM.checkout(SCM.java:504)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1208)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:574)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:86)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:499)
		at hudson.model.Run.execute(Run.java:1815)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
		at hudson.model.ResourceController.execute(ResourceController.java:97)
		at hudson.model.Executor.run(Executor.java:429)
ERROR: Error fetching remote repo 'origin'
