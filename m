Return-Path: <linux-media+bounces-16536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041E958323
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 11:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF65281051
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A141118A95A;
	Tue, 20 Aug 2024 09:47:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BF18E364
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724147243; cv=none; b=NlgQP+AF+8RXe/K889iwP7ju/6+8PKvjKbd0bcb5pLxlT22LkhAMtOWgUHNQFwrBdNUCmolz8c8/FMZw1usXjjripLcZfDRDQv8QK9CbPNarVu+ENXr91OfVKDyR3OpvJ/HS9PLa4Dgzz0i048QaIYo8jprr3n8EwA8KKt4VMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724147243; c=relaxed/simple;
	bh=C1nTEgmE+0Qk/V4B7cIKzqEY5pMJvt/+k6gCBTcaLs8=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=uUGdJdEUpSWWAFOuQJknCvW33eGI59TVts1Q0Q/A/ZxrdtQuqX5kZlTBbZW6ofRV4KRi/mA80qB6Ed/xLp+EuAhK5tPiAsCCYVYsPjICGutoPXW1xYXHRkn7Qn2iSdTezPb+LCa95+QkjI0ES34SFkCvf2T4et5yt//AwB/HR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sgLST-0001YK-1x;
	Tue, 20 Aug 2024 09:47:21 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sgLST-00Gw1d-1E;
	Tue, 20 Aug 2024 09:47:21 +0000
Date: Tue, 20 Aug 2024 09:47:21 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1278146339.1.1724147241340@builder.linuxtv.org>
In-Reply-To: <811865535.1.1723806141382@builder.linuxtv.org>
References: <811865535.1.1723806141382@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #329
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

See <https://builder.linuxtv.org/job/edid-decode/329/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: check if linux/i2c-dev.h is available


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
Checking out Revision e52c38f0515adbc51e8b2c4d5addde2be4ea1067 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f e52c38f0515adbc51e8b2c4d5addde2be4ea1067 # timeout=10
Commit message: "edid-decode: check if linux/i2c-dev.h is available"
 > git rev-list --no-walk 590a1ae57a3be3d590b5ab401086e7ec9672e3f5 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse e52c38f0515adbc51e8b2c4d5addde2be4ea1067^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #328' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '590a1ae'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'e52c38f' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@2e3f2020'
[edid-decode] $ /bin/sh -xe /tmp/jenkins13083959560829533841.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

