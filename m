Return-Path: <linux-media+bounces-16076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0194DBF2
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61C31C20D47
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1F214E2CD;
	Sat, 10 Aug 2024 09:24:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF974436E
	for <linux-media@vger.kernel.org>; Sat, 10 Aug 2024 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723281872; cv=none; b=nSAIxNHbPwkVrYm99A32UvAawdAV7FYqdjx1m7EcKhwN2vTmdTvV7rHw0J0tC51L0jszwlWlvkrwoybMT2nEiP0B46KR0rJMj6wbwvcEEP0UggOZ+W63eGlICnHCt1CEkv2wFJZbKGIFhrVkt1xAuqYLvatlSmy5aV0EiiafEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723281872; c=relaxed/simple;
	bh=GUPQqU3ASiEoiKxlRg9yZQs3qmEvXbKZdBWFynFVeB0=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=BfYKHuiiSd240e+pPj3CldWff5nA1a572M46+QtIWGq1Cm8M2wcUzs8a55QCu2vAnqfTgrXFoCvNxMrM/bZkSC07UGOBPT//DncbTeNLJ7eJX7k3XzBM45Tey9V9WB7YrQMdH9OYlzbLvSdmjPOPsKowjzzPd3zY99J13dCOcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1schze-0006Yc-1B;
	Sat, 10 Aug 2024 09:02:35 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1schzd-004GnU-23;
	Sat, 10 Aug 2024 09:02:33 +0000
Date: Sat, 10 Aug 2024 09:02:33 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1161248457.2.1723280553627@builder.linuxtv.org>
In-Reply-To: <1041029412.4.1722438184995@builder.linuxtv.org>
References: <1041029412.4.1722438184995@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #325
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: edid-decode
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/edid-decode/325/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: translate cp437 and ISO 8859-1 to UTF-8

[Hans Verkuil] edid-decode.1: document new --utf8 option


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/edid-decode/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/edid-decode/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/edid-decode.git # timeout=10
Fetching upstream changes from git://linuxtv.org/edid-decode.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/edid-decode.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision cadf102014149dacab0ac4429448f952cf969c59 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f cadf102014149dacab0ac4429448f952cf969c59 # timeout=10
Commit message: "edid-decode.1: document new --utf8 option"
 > git rev-list --no-walk 303b033f92683fa3f2e73d642bf86ead8fec77b1 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse cadf102014149dacab0ac4429448f952cf969c59^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #324' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '303b033'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'cadf102' as starting point
[GitCheckoutListener] -> Recorded 2 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@6df0ece5'
[edid-decode] $ /bin/sh -xe /tmp/jenkins18439944043101625517.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

