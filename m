Return-Path: <linux-media+bounces-12131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAAD8D2A1B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 03:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3DA1C23C18
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 01:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F069715ADAD;
	Wed, 29 May 2024 01:50:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC9E15ADA0
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716947454; cv=none; b=nx/2Fy5ls3UF+wzt6Uo+XD8kPC+hQyBsvYlVhuoW31jil06NHJrzmN4nexsUa8ZvPZh+di+DEzhyMX+QuAzM2jrsRQsvPs/omlc86kvayiVpgAorB4FfgVTDcHwdNL01o+M6hYWZ+VSiwsPPlVdzbMMyFVg6kN06UeJOPgU76b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716947454; c=relaxed/simple;
	bh=ZU/oztvXfupyrP8lqzz58nY/Kt8QAy+CAVgv71VKGrA=;
	h=Date:From:To:Subject:Message-Id; b=WcB2YELNStFTSPFgK+wAswl/NZuc3AU4TqexpzDQ6tWXBybmeCY18xZoNBKv0EvuuJyy3Gv9/H1v197hgrC5babgSADrOMvI+SCsxOETuXgOWfMPZfPXxUnkmDJJpGxBS5A7l58UQZ4CYxQ+HT2xMmtcQ2YqZ/b168lRA2vOuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FFBC3277B
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:50:53 +0000 (UTC)
Date: Wed, 29 May 2024 03:50:51 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240529015053.C1FFBC3277B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed May 29 03:00:12 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
v4l-utils git hash:	b13cb2cdedb224458e8c5932bccc7cf9bac18081
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

date:			Wed May 29 03:13:41 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Wed May 29 03:49:53 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

