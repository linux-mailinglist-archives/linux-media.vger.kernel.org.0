Return-Path: <linux-media+bounces-17464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9B969A8C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 12:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A2A51C2363A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731911C62A8;
	Tue,  3 Sep 2024 10:47:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B71A3AA3
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360440; cv=none; b=VbcdD7zTTqgYjAZyIxLv62S9pGudgdRYs28kYWBDbFKwHc5hlE8kavmzoh8WuZp2br9fBQYMP2tAJLzTxxxN2HHtHYBcIYIrfwBRsrHjX85Y4akIXd9E4Nk+jMO4Z3CakRNUdCuXZ3PUgRzPoEuNuWHVfcYvUYQbQyrLXa/uJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360440; c=relaxed/simple;
	bh=hBjA0/HqC6IXojbS3wLl8QbqYk4EkgrJOb9vroK4pOs=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iL6dfc6VPP6LE/TDDaO/3MTh2tKnlu+39LMuDZMAQl1oYfsW33wJWwMUPLVqwH0rsBuU1lW7W2d6UBEAHNVAtLHzViFUZRfjwjS/yQimKZJA6IxYQdB7uccaI1u+lt3II663cpfLToLzTykA3BSDXyv0SQdbI2xgmrwj2UdR5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1slR4A-0006S9-0G;
	Tue, 03 Sep 2024 10:47:18 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1slR49-008P5o-34;
	Tue, 03 Sep 2024 10:47:18 +0000
Date: Tue, 3 Sep 2024 10:47:17 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <149227735.1.1725360437778@builder.linuxtv.org>
In-Reply-To: <266846885.1.1724264231332@builder.linuxtv.org>
References: <266846885.1.1724264231332@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #331
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

See <https://builder.linuxtv.org/job/edid-decode/331/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: Fix Visual Studio builds. Add utf-8 option and parse-if.cpp file.


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
Checking out Revision 8ede65a820c7115962fdfad6da314a85f9c0e61c (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 8ede65a820c7115962fdfad6da314a85f9c0e61c # timeout=10
Commit message: "edid-decode: Fix Visual Studio builds. Add utf-8 option and parse-if.cpp file."
 > git rev-list --no-walk 10bc5ee3901ef337f6d255a8d5bee211277543c0 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 8ede65a820c7115962fdfad6da314a85f9c0e61c^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #330' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '10bc5ee'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '8ede65a' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@3905f2b9'
[edid-decode] $ /bin/sh -xe /tmp/jenkins5614671437865746155.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

