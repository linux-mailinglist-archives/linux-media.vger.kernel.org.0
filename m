Return-Path: <linux-media+bounces-15007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F341F930E3A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 08:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1551F2150E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 06:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E291836C3;
	Mon, 15 Jul 2024 06:47:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667313B29F
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721026049; cv=none; b=gg7avGA2ivlJs6abNLnAlNAx9sv6pwlfRklNE8HMLpFpZ6VkAunWPGxtE8FjTNikyputecqb8uu3HSwgLcytI9E58sWFztIUAdEeev0NLfIKl1rmpoA5jqFnA7P9z9Mhb8PRscBfSZLaus8jGez+CZdEj7oonGumcmjPRYazRe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721026049; c=relaxed/simple;
	bh=28rmNv4oIs4t6UYehBklzODqUFH1sChBVTw9L1VLpPg=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=iX2EA8DDqoK0Sk3TWE5N4jTAVEOYEViah6HefslunxJbpRJN8Ou5VcTzmzmpr/jTFb/TY2+HN6nTxoCF07rBw351Y7RAWPE8f0SppseCeCKoN3L/3GYoMmLURWZKbdOwpK11nWi3j4OX5l5FFTsxN8hR19LYq/+8PoYIjKl71HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTFUd-00081h-2u;
	Mon, 15 Jul 2024 06:47:27 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTFUc-0000gq-2N;
	Mon, 15 Jul 2024 06:47:27 +0000
Date: Mon, 15 Jul 2024 06:47:27 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1457209410.1.1721026047720@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #320
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

See <https://builder.linuxtv.org/job/edid-decode/320/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: print hdmi 3d audio max channels same as SAT

[Hans Verkuil] edid-decode: build: add support for building with meson

[Hans Verkuil] edid-decode: minor modifications to README and emscripten path

[Hans Verkuil] edid-decode: Cannot support NonMixed MS without MS

[Hans Verkuil] edid-decode: build: Move sources to its own variable and fix formatting

[Hans Verkuil] edid-decode: build: Use override_find_program to help subproject usage

[Hans Verkuil] edid-decode: build: compile with -Wno-variadic-macros

[Hans Verkuil] edid-decode: add support for CTA Product Information Data Block

[Hans Verkuil] edid-decode: update Colorimetry DB: drop MD1-MD3

[Hans Verkuil] edid-decode: deprecate a bunch of SADB speakers

[Hans Verkuil] edid-decode.1: add CTA-861.7 reference

[Hans Verkuil] edid-decode: Do not print the raw display use case value

[Hans Verkuil] edid-decode: incorporate CVT 2.1 changes

[Hans Verkuil] edid-decode: parse_displayid_parameters_v2: add missing version check

[Hans Verkuil] edid-decode: add initial support for DisplayID 2.1 ARVR DBs

[Hans Verkuil] edid-decode: fix Adative-Sync Seamless Transition

[Hans Verkuil] edid-decode: DisplayID: type 10: support alternate min vblank

[Hans Verkuil] edid-decode: add support for DisplayID 2.1a


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
Checking out Revision 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1 # timeout=10
Commit message: "edid-decode: add support for DisplayID 2.1a"
 > git rev-list --no-walk 7a27b339cf5ee1ab431431a844418a7f7c16d167 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #319' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '7a27b33'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '6f117a8' as starting point
[GitCheckoutListener] -> Recorded 18 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@4cc5396d'
[edid-decode] $ /bin/sh -xe /tmp/jenkins5478708654321063967.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

