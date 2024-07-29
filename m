Return-Path: <linux-media+bounces-15455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C857F93F613
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6A71F22B7A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B1314EC4B;
	Mon, 29 Jul 2024 13:02:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30390148304
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722258163; cv=none; b=RCXMO8rX62sNewhlYmYey7LyeBE9Vuhl0hBzm3SX+a86o9hTpdOonb8g0ifMnFfEe5uGXuW5tyEL5Lv0KJfR0U6hbizEVf0wjPZj9kv/AM+lkO1d5TowFYrLXfkwP5D/+Qtq9qiO0lrTSixmpsTubGtZacV1Z5IR0uFRXHZU7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722258163; c=relaxed/simple;
	bh=hazUfA6OhwqdSLs7lFD65qOvY2soBGF9jUbnHgcMD8g=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XLtPFMA5StBhJv38YEnk2B6ryPyZwBk1tcQ6gow6GOrV0rGggLLk0H1bV+4cuWQPbC6YTHgPgonaWY7pSdfcBCWOcsnrO+oQ9BHnhoGMb/H+gBfRE4fwxYz6Zmrw5NXVIkB14TT22Fk7MvkYbWShYJGMIWlB9V/ivyLh5tr9lY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sYQ1R-0004n2-2K;
	Mon, 29 Jul 2024 13:02:41 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sYQ1Q-007QXl-1d;
	Mon, 29 Jul 2024 13:02:40 +0000
Date: Mon, 29 Jul 2024 13:02:40 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <787438067.1.1722258160213@builder.linuxtv.org>
In-Reply-To: <1457209410.1.1721026047720@builder.linuxtv.org>
References: <1457209410.1.1721026047720@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #321
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

See <https://builder.linuxtv.org/job/edid-decode/321/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: fix pref timing override check


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
Checking out Revision 616fc557d5c2018dd4feb93d94580a9fd89b1a33 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 616fc557d5c2018dd4feb93d94580a9fd89b1a33 # timeout=10
Commit message: "edid-decode: fix pref timing override check"
 > git rev-list --no-walk 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 616fc557d5c2018dd4feb93d94580a9fd89b1a33^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #320' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '6f117a8'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '616fc55' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@141dc337'
[edid-decode] $ /bin/sh -xe /tmp/jenkins5816331483432421000.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

