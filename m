Return-Path: <linux-media+bounces-15456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7293F688
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB031282527
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F51148FEC;
	Mon, 29 Jul 2024 13:17:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD693C24
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259038; cv=none; b=JuvH/TWJ3YdBBvslYlSvx/lrNFkp6p5TV8qX3oycUbRsLIemIEM0Pa3R3PsQGV06MFH0PyAFCMhWN6rtttKfSOyyeu2efqq6BB1hQtpQ4hvu9oME0tirwlXpQL5xdB+rF++v7DdkUFy0/WpWPIaVW1ZRvlRNrfV4nlnyLhRHQwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259038; c=relaxed/simple;
	bh=cZGZvUASCKY/U/yvndicazvc4LHi13jmXjr/3zyYSCU=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Ih8GostL77mQqsy5DC7fWgMs7Qw/90JCP+fn3YymDwModaEdYek1UUaehsZOKhEba6x+A2xaXlchTddW4CkhY7vkUL82GKeAPWDJbaikX/sOyOur4ZcwIimIloQCVjLzhEnGUpFFRqH7qXWZLwj2JqkwiBMZ8Nh4Ub4ODEeHvgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sYQFY-00057v-1i;
	Mon, 29 Jul 2024 13:17:16 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sYQFY-007SQb-1V;
	Mon, 29 Jul 2024 13:17:16 +0000
Date: Mon, 29 Jul 2024 13:17:16 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1450743791.2.1722259036461@builder.linuxtv.org>
In-Reply-To: <787438067.1.1722258160213@builder.linuxtv.org>
References: <787438067.1.1722258160213@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #322
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

See <https://builder.linuxtv.org/job/edid-decode/322/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: improve the warning when the first VIC and DTD are different


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
Checking out Revision 82eb49af6af9bde9902d123077257ed44ecc6fc0 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 82eb49af6af9bde9902d123077257ed44ecc6fc0 # timeout=10
Commit message: "edid-decode: improve the warning when the first VIC and DTD are different"
 > git rev-list --no-walk 616fc557d5c2018dd4feb93d94580a9fd89b1a33 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 82eb49af6af9bde9902d123077257ed44ecc6fc0^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #321' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '616fc55'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '82eb49a' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@141dc337'
[edid-decode] $ /bin/sh -xe /tmp/jenkins16191765056115908458.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

