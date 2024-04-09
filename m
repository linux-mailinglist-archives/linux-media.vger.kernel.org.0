Return-Path: <linux-media+bounces-8861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1189CFFF
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 03:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E70E1F23C2D
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 01:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4CA4E1BE;
	Tue,  9 Apr 2024 01:47:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DC4DA0D
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712627255; cv=none; b=go08foPLLBhwsuN+AmS3hvx/ajHaDt21MsNUwrMB9ELm6tUxdsLexCiPPx8dQPwyDJG6Nh1/7O8ACgl6fRXtO2TZPx9yqK057PmRBCqDO4tVdX97VoVjmoNHHjQaDH8/YnKg8N792UHZlZlU0Z7olIGvkKbb044a2JW9VOvcg1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712627255; c=relaxed/simple;
	bh=2Q9UFUM+ChQR+SHuYhvNhxrl/bk9ZmdT2XVakFLMW9w=;
	h=Date:From:To:Subject:Message-Id; b=Z9PyW8MQ5E16g2kCh2f02MdWVnlTfDBokHpmEGtcOiQ/9upHwY6s39GhWBwXwXgaHI5wvJABD4rcZR2famrjVrm2hm/jMi7K23iys79YJVPc/LFQDlUT9jO/Ur3jdfwGu2jLfGDZkws0qYAy0ZlwIrOM6CHmZ8pvhGp1z1HJfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1863C433C7
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 01:47:34 +0000 (UTC)
Date: Tue, 09 Apr 2024 03:47:32 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240409014734.E1863C433C7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr  9 03:00:21 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	b82779648dfd3814df4e381f086326ec70fd791f
v4l-utils git hash:	20e3e93450850280ddce5cef44a7dcf7e9d96105
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8613-g721ca29e
sparse version:		v0.5.0-8613-g721ca29e
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a7ebc7863dd57d9fa70443fa9f071ca22da90b8c
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/spi/cxd2880-spi.c:391 cxd2880_start_feed() warn: Please consider using kzalloc instead of kmalloc
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Apr  9 03:14:04 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 4

date:			Tue Apr  9 03:46:32 CEST 2024

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

