Return-Path: <linux-media+bounces-27204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16619A494AD
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24F973B2E1E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617E525742B;
	Fri, 28 Feb 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="odI+V5xt"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064F257425
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734378; cv=none; b=aSufGltK40hxCeHDIKO0hTSrFgSIiYaXIUUiJaVx8yItVUF+qjOtHB+8j3e1OOLmDfqmfMLgginYdLOhyCadG1+XAMD/5td8R2G5g6sQJKjPNBH9mtqDSTaChHt74u2onLcx3bnqmd/EX1NOpck4bPWOxH+oq6RfT85MjsKRgIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734378; c=relaxed/simple;
	bh=jjzxKK1xR6nlVKYSTdEj2FN8PHmdRbDHxdlqo2Bi6gQ=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=UlDnzoXUDZakeAB8C1qoPeoL791FHu+YWvv43dkKut87In4hXlYG4GZcQ+yV3Oc5/uZrMei2wIez2ltgKasi/wCPufpISLoElYZ83VUO860ZxLlGZAdprg1ZMHHXzYcfeVSpEc8i+oqK0hO2c58x/lxznRFO/jLrFJLXgBvgQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=odI+V5xt; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J3AhYmOEzZKkR+KdlADsXx7G+g0qsif41aJmBrpt8IA=; b=odI+V5xtJucsmnZyv4jiuTldNR
	EX7H3vsBOgSZLykQtxcq/tf37dffjVYpzkvwt/9B9PGCHrI0+2n/HkSqvqOVOoyZwE23cVHTJkhgh
	ePfcPRwaaM/S4Bco3zZdaMTmaAZtrh/Gz/WV33IBxPQZ2qi3KcrqQC99xuakcF1gbWg+Eu5bUoCN0
	95VAhQN9elyQgoUmSnL5dy/8Q4ZtV3w/Ca7i2JMDzjQy7VumO0cafodRFV4qqRImdeaIqxe6ZtDvI
	jRTQBEhgVBUCmkzh7ab01cHdxQEmh/EEGGTeRids+UC/Jd/bB9bso0BxAPhlE/FPQ4LvDw1+qr9FE
	NI4Tu79g==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tnwVj-0006O1-1D;
	Fri, 28 Feb 2025 09:18:25 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tnwVi-00GbDz-2o;
	Fri, 28 Feb 2025 09:18:23 +0000
Date: Fri, 28 Feb 2025 09:18:23 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <1460048367.1.1740734303217@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1320
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

See <https://builder.linuxtv.org/job/libcamera/1320/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace /var/lib/jenkins/workspace/libcamera
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/libcamera/.git # timeout=10
FATAL: java.io.StreamCorruptedException: invalid stream header: 636F7272
java.io.StreamCorruptedException: invalid stream header: 636F7272
	at java.base/java.io.ObjectInputStream.readStreamHeader(ObjectInputStream.java:958)
	at java.base/java.io.ObjectInputStream.<init>(ObjectInputStream.java:392)
	at hudson.remoting.ObjectInputStreamEx.<init>(ObjectInputStreamEx.java:50)
	at hudson.remoting.Command.readFrom(Command.java:141)
	at hudson.remoting.Command.readFrom(Command.java:127)
	at hudson.remoting.AbstractSynchronousByteArrayCommandTransport.read(AbstractSynchronousByteArrayCommandTransport.java:35)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:62)
Also:   hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave2
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1923)
		at hudson.remoting.Request.call(Request.java:204)
		at hudson.remoting.Channel.call(Channel.java:1111)
		at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:306)
		at PluginClassLoader for git-client/jdk.proxy89/jdk.proxy89.$Proxy170.hasGitRepo(Unknown Source)
		at PluginClassLoader for git-client//org.jenkinsci.plugins.gitclient.RemoteGitImpl.hasGitRepo(RemoteGitImpl.java:330)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1206)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM._checkout(GitSCM.java:1311)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM.checkout(GitSCM.java:1278)
		at hudson.scm.SCM.checkout(SCM.java:540)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1250)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:649)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:522)
		at hudson.model.Run.execute(Run.java:1833)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
		at hudson.model.ResourceController.execute(ResourceController.java:101)
		at hudson.model.Executor.run(Executor.java:446)
Caused: hudson.remoting.RequestAbortedException
	at hudson.remoting.Request.abort(Request.java:358)
	at hudson.remoting.Channel.terminate(Channel.java:1196)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:95)

