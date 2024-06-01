Return-Path: <linux-media+bounces-12373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31358D6D6E
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 03:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C0C1C21522
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 01:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF16FB9;
	Sat,  1 Jun 2024 01:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3A11879
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 01:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717206686; cv=none; b=pQ6j5svz4/IRd0s/1M0CG/G0tnSi5dTCLri0ItmPGoL8kGSDbj7nNSw8nPg5A9XvKWr5Em9W2zVqcQIfVL7dqSePtA763jfM+/rTQ5Zvl1CcGls/jlcwdNWAzC2ulaJ8Y7egef9aZscaIdcbWRE2vQ1M+i24JwbDioIk+6SUuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717206686; c=relaxed/simple;
	bh=5qwpSMkA4HvTCYzlvJqyBX7/pm7NdHZBuT281SAHVtg=;
	h=Date:From:To:Subject:Message-Id; b=EcQ3FROllC+ZKcO9MCwkZZ1Q/mCb3v6+J+rhnT/Ee+RZvAOhlPg0aFMD14BIPJTulXyFIeub1SXMIvJJ38emIc/J2mp8s67Wq+bFvdCJCWnyOecHVmAxl6BuRcECn/x7e17NKwAXvomOGwh3XAAv4wN/RaTTmw1TyHb+Mxut8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2856FC116B1
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 01:51:25 +0000 (UTC)
Date: Sat, 01 Jun 2024 03:51:24 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240601015126.2856FC116B1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jun  1 03:00:23 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	24147897507cd3a7d63745d1518a638bf4132238
v4l-utils git hash:	7d55dd435be30c47bf4766ec264ace1c0ffb06e5
edid-decode git hash:	f4b0548cb4b4cdff7947be59ce795b23e60266ed
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

date:			Sat Jun  1 03:14:14 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sat Jun  1 03:50:25 CEST 2024

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

