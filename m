Return-Path: <linux-media+bounces-25633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DBA26F7C
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 11:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DE461887FB9
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AF20AF96;
	Tue,  4 Feb 2025 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="DJB68YTv"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4751209F4A
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665976; cv=none; b=CIkfwd1nyF7FdenlWfsJSN1Vs/qg3tqOcyN7JLeXRqHWJKT7hcHziXmcPUVEgh1PigKx4lVCjLl5v47JmtX05/XxAWGGrp6HzVkRyPRzRBPrRMgOu+uPrz8NW80E5CiHchhMH2hOB2I1+Pz/tD+CCLIlMhs2reAXo9RYiclnOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665976; c=relaxed/simple;
	bh=XRThojEwdMhJr+RcnKY46qrqijGDX9+BPZRud6t3iMc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=nbIW6rGrP0MSL5a67EPlYq+wCuwlU+aVQp4pHHkYwhvy83/nd+27R0YwTOXSl5AY+lyNn6UskvLSFd2+iKQVs4i5pB7eCKLyVWfG9TBR0YgdJST2Jnh8FAM16mkeWnVvpa5DQ5afm8b3fi/qtZygOQ2B/OBgIv6lNnXT70xXrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=DJB68YTv; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=R3YyB7qcZrd2+rwAbCpKuEJjB1iZVey3q4qMY/FuEkY=; b=DJB68YTvVzkpFFRWW6QET/Y2lJ
	0AKbdzjtwSPK3DJbcHYydgTl18mezX2TORUQ0vd2jm4/n/y4ZxHMAd/gkI/kW2Dn1JonthkXdw6B0
	gI7+w/1rodiL6vOUoZgyGvCV2Lh3/vJ/+8e2/+ug3pqBLXZo/9dA76celGvP9f17j+VFmnq3f3oXb
	s4PV5fxB6p4XFnbFdU5s6/wseWcLIrCPbkARqFnVgffSPCYrA6WiCWvGwNgMG9HkT3fvfJuUMj6BI
	M/ziwDjJKnfpp1xfyVGnNECyaZeGLaFHoPJSqoUqqypfhxQN4TK66LtR4XZYtPudlo9R4vm4utUxU
	izXpRPNA==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tfGRY-0001eG-0T;
	Tue, 04 Feb 2025 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tfGRX-00C56i-2m;
	Tue, 04 Feb 2025 10:46:12 +0000
Date: Tue, 4 Feb 2025 10:46:11 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <630810402.1.1738665971856@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/v4l-utils/600/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave0 in workspace /var/lib/jenkins/workspace/v4l-utils
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/v4l-utils/.git # timeout=10
FATAL: java.io.StreamCorruptedException: invalid stream header: 636F7272
java.io.StreamCorruptedException: invalid stream header: 636F7272
	at java.base/java.io.ObjectInputStream.readStreamHeader(ObjectInputStream.java:958)
	at java.base/java.io.ObjectInputStream.<init>(ObjectInputStream.java:392)
	at hudson.remoting.ObjectInputStreamEx.<init>(ObjectInputStreamEx.java:50)
	at hudson.remoting.Command.readFrom(Command.java:141)
	at hudson.remoting.Command.readFrom(Command.java:127)
	at hudson.remoting.AbstractSynchronousByteArrayCommandTransport.read(AbstractSynchronousByteArrayCommandTransport.java:35)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:62)
Also:   hudson.remoting.Channel$CallSiteStackTrace: Remote call to slave0
		at hudson.remoting.Channel.attachCallSiteStackTrace(Channel.java:1923)
		at hudson.remoting.Request.call(Request.java:204)
		at hudson.remoting.Channel.call(Channel.java:1111)
		at hudson.remoting.RemoteInvocationHandler.invoke(RemoteInvocationHandler.java:306)
		at PluginClassLoader for git-client/jdk.proxy95/jdk.proxy95.$Proxy185.hasGitRepo(Unknown Source)
		at PluginClassLoader for git-client//org.jenkinsci.plugins.gitclient.RemoteGitImpl.hasGitRepo(RemoteGitImpl.java:330)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM.retrieveChanges(GitSCM.java:1206)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM._checkout(GitSCM.java:1311)
		at PluginClassLoader for git//hudson.plugins.git.GitSCM.checkout(GitSCM.java:1278)
		at hudson.scm.SCM.checkout(SCM.java:540)
		at hudson.model.AbstractProject.checkout(AbstractProject.java:1250)
		at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:649)
		at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:85)
		at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:522)
		at hudson.model.Run.execute(Run.java:1831)
		at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:44)
		at hudson.model.ResourceController.execute(ResourceController.java:101)
		at hudson.model.Executor.run(Executor.java:445)
Caused: hudson.remoting.RequestAbortedException
	at hudson.remoting.Request.abort(Request.java:358)
	at hudson.remoting.Channel.terminate(Channel.java:1196)
	at hudson.remoting.SynchronousCommandTransport$ReaderThread.run(SynchronousCommandTransport.java:95)

