Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19005B67EF
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 08:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiIMGas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 02:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbiIMGaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 02:30:46 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463831260F
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 23:30:45 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oXzRS-007Qd8-Ki; Tue, 13 Sep 2022 06:30:42 +0000
Received: from [127.0.0.1] (helo=localhost)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oXz9x-00DeTO-De; Tue, 13 Sep 2022 06:12:38 +0000
Date:   Tue, 13 Sep 2022 06:12:36 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1578099267.2.1663049556803@localhost>
Subject: Build failed in Jenkins: media_stage_clang #490
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/490/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave0 in workspace <https://builder.linuxtv.org/job/media_stage_clang/ws/>
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository git://linuxtv.org/media_stage.git
 > git init <https://builder.linuxtv.org/job/media_stage_clang/ws/> # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
ERROR: Error cloning remote repo 'origin'
hudson.plugins.git.GitException: Command "git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/*" returned status code 128:
stdout: 
stderr: fatal: unable to look up linuxtv.org (port 9418) (Name or service not known)

	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.launchCommandIn(CliGitAPIImpl.java:2675)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.launchCommandWithCredentials(CliGitAPIImpl.java:2099)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.access$500(CliGitAPIImpl.java:85)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl$1.execute(CliGitAPIImpl.java:619)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl$2.execute(CliGitAPIImpl.java:848)
	at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler$GitCommandMasterToSlaveCallable.call(RemoteGitImpl.java:158)
	at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler$GitCommandMasterToSlaveCallable.call(RemoteGitImpl.java:151)
	at hudson.remoting.UserRequest.perform(UserRequest.java:211)
	at hudson.remoting.UserRequest.perform(UserRequest.java:54)
	at hudson.remoting.Request$2.run(Request.java:376)
	at hudson.remoting.InterceptingExecutorService.lambda$wrap$0(InterceptingExecutorService.java:78)
	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at java.base/java.lang.Thread.run(Thread.java:829)
	Suppressed: hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave0
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1784)
		at hudson.remoting.UserRequest$ExceptionResponse.retrieve(UserRequest.java:356)
		at hudson.remoting.Channel.call(Channel.java:1000)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.execute(RemoteGitImpl.java:143)
		at jdk.internal.reflect.GeneratedMethodAccessor101.invoke(Unknown Source)
		at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
		at java.base/java.lang.reflect.Method.invoke(Method.java:566)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.invoke(RemoteGitImpl.java:129)
		at com.sun.proxy.$Proxy84.execute(Unknown Source)
		at hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1226)
		at hudson.plugins.git.GitSCM.checkout(GitSCM.java:1308)
		at hudson.scm.SCM.checkout(SCM.java:540)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1217)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:647)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:519)
		at hudson.model.Run.execute(Run.java:1897)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
		at hudson.model.ResourceController.execute(ResourceController.java:101)
		at hudson.model.Executor.run(Executor.java:442)
ERROR: Error cloning remote repo 'origin'
