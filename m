Return-Path: <linux-media+bounces-17060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2D963800
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 03:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEACAB224EC
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 01:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1EA1C6B2;
	Thu, 29 Aug 2024 01:53:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8497134B1
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896382; cv=none; b=N85vvREs2A2gk4JwlmwoJwbuAPe1EuAyTmh1FDH23UBnONTCkCt/1BdPcwy3y/Z9sP6pe1QQ3j2oiBdMiIPOjFHJB/MNnKrmhfsBR4v69EbL4XypghwgNLMx4FqV0eQCXlRk9Dul/Iclb6YemowWj6mC01SLh9uIFtPg4uab9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896382; c=relaxed/simple;
	bh=EaxJgxmMOUIOwMPHLlu0goUbxcfn0DJtzC48LlJFDmg=;
	h=Date:From:To:Subject:Message-Id; b=R+7m+VUjN3Rgbn1EVmWnY+h49vBAn1NglAuOvaRYgsoIGW0LGDVDGYu0sqaOywjxniBIr6RFyxoI7cYzu5TauOVCdrrZA67SM8/We3CFtFF3FO7k47++s0gpLXtPHWRhvpXqQL/V2SU1NmbjNyTMk4lqrd1eFUydvfANcrgmjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4001C4CEC0
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 01:53:01 +0000 (UTC)
Date: Thu, 29 Aug 2024 03:53:00 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240829015301.F4001C4CEC0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Aug 29 03:00:17 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	393556c9f56ced8d9776c32ce99f34913cfd904e
v4l-utils git hash:	e87fefa5d0fea252dc128d6d3fb9340056dde3c3
edid-decode git hash:	10bc5ee3901ef337f6d255a8d5bee211277543c0
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8688-g8ea74b5a
sparse version:		v0.5.0-8688-g8ea74b5a
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6315b97764c964464fbdbae5543cfd95225e251a
host hardware:		x86_64
host os:		6.5.0-35-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-of.config: OK
no-acpi.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: OK
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Thu Aug 29 03:14:04 CEST 2024
virtme-64: OK: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Thu Aug 29 03:51:52 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

