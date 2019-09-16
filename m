Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A18B3FBD
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 19:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388247AbfIPRrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 13:47:49 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36465 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729707AbfIPRrs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 13:47:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i9v6I-0008N9-Df; Mon, 16 Sep 2019 17:47:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i9ujx-0004bE-Ni; Mon, 16 Sep 2019 17:24:41 +0000
Date:   Mon, 16 Sep 2019 17:24:41 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <544830473.2.1568654681732.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #854
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/854/display/redirect>

Changes:

------------------------------------------
Started by timer
Running as SYSTEM
Building remotely on slave1 in workspace /var/lib/jenkins/workspace/media-build
FATAL: java.io.IOException: Unexpected termination of the channel
java.io.EOFException
	at java.base/java.io.ObjectInputStream$PeekInputStream.readFully(ObjectInputStream.java:2763)
	at java.base/java.io.ObjectInputStream$BlockDataInputStream.readShort(ObjectInputStream.java:3258)
	at java.base/java.io.ObjectInputStream.readStreamHeader(ObjectInputStream.java:873)
	at java.base/java.io.ObjectInputStream.<init>(ObjectInputStream.java:350)
	at hudson.remoting.ObjectInputStreamEx.<init>(ObjectInputStreamEx.java:49)
	at hudson.remoting.Command.readFrom(Command.java:140)
	at hudson.remoting.Command.readFrom(Command.java:126)
	at hudson.remoting.AbstractSynchronousByteArrayCommandTransport.read(AbstractSynchronousByteArrayCommandTransport.java:36)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:63)
Caused: java.io.IOException: Unexpected termination of the channel
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:77)
Also:   hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave1
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1743)
		at hudson.remoting.Request.call(Request.java:202)
		at hudson.remoting.Channel.call(Channel.java:956)
		at hudson.FilePath.act(FilePath.java:1070)
		at hudson.FilePath.act(FilePath.java:1059)
		at hudson.FilePath.mkdirs(FilePath.java:1244)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1202)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:574)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:86)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:499)
		at hudson.model.Run.execute(Run.java:1818)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
		at hudson.model.ResourceController.execute(ResourceController.java:97)
		at hudson.model.Executor.run(Executor.java:429)
Caused: hudson.remoting.RequestAbortedException
	at hudson.remoting.Request.abort(Request.java:340)
	at hudson.remoting.Channel.terminate(Channel.java:1040)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:94)
