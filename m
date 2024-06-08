Return-Path: <linux-media+bounces-12771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68502900F27
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 03:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7181C21245
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 01:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD1E8836;
	Sat,  8 Jun 2024 01:51:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F2163C8
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 01:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717811477; cv=none; b=O3Q1p6oLpaLR+8ihbKncT2VbSdi7hslKJA3h824lbf9ChO7gBwO8+gAlGMFLlewg7lnvQRjJL1/Doohe5k43ueG9h5aBMCNR6UIds2MLlCAIpBRObruCGrSXnghV/TSQ0+EYFEGWEi+lJ3vUW2PB1GPO+VOVtYJL2hiJG49P1MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717811477; c=relaxed/simple;
	bh=l46Qu2B5BO6n2/3/Sy2loTN1/HY9sT5Ttq7N0ntaj0s=;
	h=Date:From:To:Subject:Message-Id; b=HLtTQ2hmQ9Qo2Il9StentEhE7WEtMqNUVEvk2ZyZRj5qZPvyZpFxV9mG6Rdwf+e+lHKKN2W517OEbhg2dfHmCaWiLYVMwRPfhkPzjgBUe+O1UOrouWdTfO0ScdWrUAzrVW4z7q+z5632GecI9qTeJ7glEM5RA7lyo8DAAhjb1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9057EC2BBFC
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 01:51:16 +0000 (UTC)
Date: Sat, 08 Jun 2024 03:51:14 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240608015116.9057EC2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jun  8 03:00:20 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	1aea3d1d4a21e3e7895663b848ffae79ee82e065
v4l-utils git hash:	f4cf30a8b50f54210e181ecadbffaee4ce088e5e
edid-decode git hash:	c6b859d7f0251e2433fb81bd3f67bd2011c2036c
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3e9c9a50a2489e266e13733b4caff417b4634d71
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
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

date:			Sat Jun  8 03:13:45 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sat Jun  8 03:50:14 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

