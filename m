Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F984C6EC2
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 15:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbiB1OAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 09:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbiB1OAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 09:00:35 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FBC7938E
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 05:59:56 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nOgZ9-0031f6-1U; Mon, 28 Feb 2022 13:59:55 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nOgZ6-00CZ8o-V6; Mon, 28 Feb 2022 13:59:52 +0000
Date:   Mon, 28 Feb 2022 13:59:52 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1617684551.1.1646056792187@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #420
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

See <https://builder.linuxtv.org/job/media_stage_clang/420/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave0 in workspace /var/lib/jenkins/workspace/media_stage_clang
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository git://linuxtv.org/media_stage.git
 > git init /var/lib/jenkins/workspace/media_stage_clang # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
FATAL: java.io.IOException: Unexpected termination of the channel
java.io.EOFException
	at java.base/java.io.ObjectInputStream$PeekInputStream.readFully(ObjectInputStream.java:2905)
	at java.base/java.io.ObjectInputStream$BlockDataInputStream.readShort(ObjectInputStream.java:3400)
	at java.base/java.io.ObjectInputStream.readStreamHeader(ObjectInputStream.java:936)
	at java.base/java.io.ObjectInputStream.<init>(ObjectInputStream.java:379)
	at hudson.remoting.ObjectInputStreamEx.<init>(ObjectInputStreamEx.java:49)
	at hudson.remoting.Command.readFrom(Command.java:142)
	at hudson.remoting.Command.readFrom(Command.java:128)
	at hudson.remoting.AbstractSynchronousByteArrayCommandTransport.read(AbstractSynchronousByteArrayCommandTransport.java:35)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:61)
Caused: java.io.IOException: Unexpected termination of the channel
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:75)
Also:   hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave0
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1797)
		at hudson.remoting.Request.call(Request.java:199)
		at hudson.remoting.Channel.call(Channel.java:1000)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.execute(RemoteGitImpl.java:143)
		at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
		at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
		at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
		at java.base/java.lang.reflect.Method.invoke(Method.java:566)
		at org.jenkinsci.plugins.gitclient.RemoteGitImpl$CommandInvocationHandler.invoke(RemoteGitImpl.java:129)
		at com.sun.proxy.$Proxy72.execute(Unknown Source)
		at hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1224)
		at hudson.plugins.git.GitSCM.checkout(GitSCM.java:1302)
		at hudson.scm.SCM.checkout(SCM.java:505)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1213)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:637)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:509)
		at hudson.model.Run.execute(Run.java:1888)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
		at hudson.model.ResourceController.execute(ResourceController.java:99)
		at hudson.model.Executor.run(Executor.java:432)
Caused: hudson.remoting.RequestAbortedException
	at hudson.remoting.Request.abort(Request.java:345)
	at hudson.remoting.Channel.terminate(Channel.java:1082)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:90)
