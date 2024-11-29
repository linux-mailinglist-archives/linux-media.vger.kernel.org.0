Return-Path: <linux-media+bounces-22340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D09DE6AC
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFB2281C01
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E3619CC22;
	Fri, 29 Nov 2024 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="Ui3Hsroc"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F62158520
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732884459; cv=none; b=Y53CgXQ7YYbhh44bXvlc7YywDe+/szYLTCH7HUFSKldsqJQVoe6ye8Sg729WWtS7ZikMty4Kd4evDdZqkB09+dImdYoJapDxt6gJZUn7HYmNB9i5WPlYzxQpUyj0xH3uCoRzfDJyJ7rOtr5StFJMOhKFg6A8aCx0sF9UvLNPTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732884459; c=relaxed/simple;
	bh=fAZczfwOEx2W5QdqmueEuHLCMnyObyATsBu3ASs0dzA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Zqr+Xm6H0y42f4MP2zwy5Y+hzBUN40q4/ceChQreRgNEfJCjfYnTwds3Ew5j3v/4lF/7e7mE6OfPJjYs/tvxl/PnbFJobLlCBS1rTo43254M1Wl7KF+YYivBTOpLKB03fqLNkRIPqduuAthBtWRuelsydhJZSBcoxia0to3uVOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=Ui3Hsroc; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fAZczfwOEx2W5QdqmueEuHLCMnyObyATsBu3ASs0dzA=; b=Ui3Hsroc9OF1UioTybi8gwsFVo
	MXYQLGfE2ttSU9aYPdLzYpIpeYdIadssSZEEt0ZZDvJNKC3+f6gKRVvJkELp+AFdlVcAfWolup679
	t+auz/E+tguSWnRjFc+jtvKJf76W0FDVNdhe9VqfCjxklOWhvuGV5epoIeuebNmU9D6IK2AEA/V6E
	kUZLtvVUFg8GdMIsbad03JNqo2cwMpfWdUCxYO1UzihA2ZxcERWg6UobT7tkT93LaIEM11CHqNus6
	q3KqFcR2f3zVKPHlrdeHvSrGxvliqQA6FUOTPtKmVle5/gYr8ZIQOQMJkXWIu57+40mBX7R/EAX4J
	GdaE+efQ==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tH0PI-0002OB-0P;
	Fri, 29 Nov 2024 12:47:37 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tH0PH-00D2sz-2u;
	Fri, 29 Nov 2024 12:47:35 +0000
Date: Fri, 29 Nov 2024 12:47:35 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1665057718.1.1732884455897@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #338
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

See <https://builder.linuxtv.org/job/edid-decode/338/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: moved to v4l-utils, remove all code and update README


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
 > git --version # 'git version 2.39.5'
 > git fetch --tags --force --progress -- git://linuxtv.org/edid-decode.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision cd4bba870bee3775d2bc811d1089fb3206437176 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f cd4bba870bee3775d2bc811d1089fb3206437176 # timeout=10
Commit message: "edid-decode: moved to v4l-utils, remove all code and update README"
 > git rev-list --no-walk 5332a3b76080e17137db15fd31e2d3949cef5f84 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse cd4bba870bee3775d2bc811d1089fb3206437176^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #337' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '5332a3b'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'cd4bba8' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@49122f7'
[edid-decode] $ /bin/sh -xe /tmp/jenkins8008731871802100235.sh
+ meson setup build

ERROR: Neither directory contains a build file meson.build.
Build step 'Execute shell' marked build as failure

