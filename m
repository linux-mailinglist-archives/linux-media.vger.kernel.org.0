Return-Path: <linux-media+bounces-1018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB27F8CB0
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 18:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F55E1C20C66
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 17:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEBB2C860;
	Sat, 25 Nov 2023 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E456BB6
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 09:18:27 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10])
	by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jenkins@linuxtv.org>)
	id 1r6wIU-000O9e-72; Sat, 25 Nov 2023 17:18:26 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1r6wIQ-00FyoE-23;
	Sat, 25 Nov 2023 17:18:23 +0000
Date: Sat, 25 Nov 2023 17:18:23 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <1871854536.0.1700932703904@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1138
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1138/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/libcamera/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision e25003e78b13b7db5d24a1082294d9596c735fd6 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f e25003e78b13b7db5d24a1082294d9596c735fd6 # timeout=10
Commit message: "Documentation: contributing: Integrate the code of conduct"
 > git rev-list --no-walk 62e5289819789e37cb169af94869fea0c86c8e9c # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse e25003e78b13b7db5d24a1082294d9596c735fd6^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
java.lang.Exception: Object was recently deallocated
    #5 (ref.0) : object=null type=hudson.plugins.git.GitAPI interfaces=[hudson.plugins.git.IGitAPI]
	at hudson.remoting.ExportTable.diagnoseInvalidObjectId(ExportTable.java:429)
Also:   hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave2
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1784)
		at hudson.remoting.UserRequest$ExceptionResponse.retrieve(UserRequest.java:356)
		at hudson.remoting.Channel.call(Channel.java:1000)
		at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:285)
		at jdk.proxy16/jdk.proxy16.$Proxy70.withRepository(Unknown Source)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl.withRepository(RemoteGitImpl.java:261)
		at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordCommitsSincePreviousBuild(GitCheckoutListener.java:125)
		at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordNewCommits(GitCheckoutListener.java:100)
		at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordNewCommits(GitCheckoutListener.java:71)
		at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.onCheckout(GitCheckoutListener.java:49)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:654)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:521)
		at hudson.model.Run.execute(Run.java:1900)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
		at hudson.model.ResourceController.execute(ResourceController.java:101)
		at hudson.model.Executor.run(Executor.java:442)
Caused: java.util.concurrent.ExecutionException: Invalid object ID 5 iota=6
	at hudson.remoting.ExportTable.diagnoseInvalidObjectId(ExportTable.java:441)
	at hudson.remoting.ExportTable.get(ExportTable.java:358)
	at hudson.remoting.Channel.getExportedObject(Channel.java:824)
	at hudson.remoting.RemoteInvocationHandler$RPCRequest.perform(RemoteInvocationHandler.java:915)
	at hudson.remoting.RemoteInvocationHandler$RPCRequest.call(RemoteInvocationHandler.java:902)
	at hudson.remoting.RemoteInvocationHandler$RPCRequest.call(RemoteInvocationHandler.java:853)
	at hudson.remoting.UserRequest.perform(UserRequest.java:211)
	at hudson.remoting.UserRequest.perform(UserRequest.java:54)
	at hudson.remoting.Request$2.run(Request.java:377)
	at hudson.remoting.InterceptingExecutorService.lambda$wrap$0(InterceptingExecutorService.java:78)
	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1136)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:635)
	at java.base/java.lang.Thread.run(Thread.java:833)
Caused: hudson.remoting.RemotingSystemException
	at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:301)
	at jdk.proxy16/jdk.proxy16.$Proxy70.withRepository(Unknown Source)
	at org.jenkinsci.plugins.gitclient.RemoteGitImpl.withRepository(RemoteGitImpl.java:261)
	at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordCommitsSincePreviousBuild(GitCheckoutListener.java:125)
	at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordNewCommits(GitCheckoutListener.java:100)
	at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.recordNewCommits(GitCheckoutListener.java:71)
	at io.jenkins.plugins.forensics.git.reference.GitCheckoutListener.onCheckout(GitCheckoutListener.java:49)
	at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:654)
Caused: java.io.IOException
	at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:656)
	at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:521)
	at hudson.model.Run.execute(Run.java:1900)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
	at hudson.model.ResourceController.execute(ResourceController.java:101)
	at hudson.model.Executor.run(Executor.java:442)

