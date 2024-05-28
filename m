Return-Path: <linux-media+bounces-12051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4A8D118D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 03:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0FFA1C2278E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 01:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CB18F49;
	Tue, 28 May 2024 01:51:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C110E9
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716861071; cv=none; b=GAjlnka/m5KxNU9aA+z8d63OA4q4uFgDuvLnMoL0I5OX53YbdYGkcutjUp/xe2e5MuObkoMYB6bBtmSUHIV8VvJZIIPd9Ua90Tk2BM5LONfnLdasO0GzPQRW16hv/eWl2kux2hac8twvs7bD4oUQg20skJPInQSW0bwnBKikSrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716861071; c=relaxed/simple;
	bh=1oo9FJrYcCBw6Ia+eqOAT5Ii6YIQ4laReVoofuRefgI=;
	h=Date:From:To:Subject:Message-Id; b=J8mfHcLIH5v6QI2mJr3sWDKByn32hcSUoT5JZvX14HRM9joytpHaUZ81yyO93eAzRIZMbysDf+swMGjA94o37Kc+RC8R4SOCr/DxRB6VyfbTU0RHk29I6NwyPunZJPm+on7KYPJdmg3rBj4WE0kDY2BrlbPcpG1NPNY3rbkiGCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA70C2BBFC
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 01:51:09 +0000 (UTC)
Date: Tue, 28 May 2024 03:51:07 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240528015109.EFA70C2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue May 28 03:00:19 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
v4l-utils git hash:	649f37341d935bc73c3f7854a7c67e98fe55a60e
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
no-of.config: OK
no-acpi.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: OK
smatch: WARNINGS:

drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->dec_mem' from ioremap() not released on lines: 1296.
drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->enc_mem' from ioremap() not released on lines: 1296.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue May 28 03:13:54 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Tue May 28 03:50:10 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

