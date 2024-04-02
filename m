Return-Path: <linux-media+bounces-8338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E175894904
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 03:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A091F212DB
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 01:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48B4D2F0;
	Tue,  2 Apr 2024 01:52:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50405EADD
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 01:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712022732; cv=none; b=nRVdXJwN01FyZk6xBgGeBEFqEmozHNf8CtvxsUnxg/8GVw9C4FcoOhXmcVixOeeUDFXgSvcFnHiaefvoeDkysovUSY3u0DVC/kp/zSaBQEjiYZynShKDEfXozNJB9b7N3lekUBdVbPR79NxtelodYupKmvVIRWNkqYU9NduoHcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712022732; c=relaxed/simple;
	bh=d3IXbbME1sIh1rpDCYaRdhkL6MD7ItBDczGNHKYaL8M=;
	h=Date:Message-ID:From:To:Subject; b=kC1bZhsj6U1NXq3H8gtGrQ69v2zr74TS5T3dETB3YCWXTL6ULokqQGHmrJvMe1w0bUwFPqVxpwIA7jZsKaYb5DTmT7QR2fd5Nlunq10zOLNE3thYzkvhHlPsSMm2gW0fyrrtlONKFjpKxqBSJBgGq9QAhdIbAyqHQO9d5Fi7V8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C15C433C7
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 01:52:11 +0000 (UTC)
Date: Tue, 02 Apr 2024 03:52:09 +0200
Message-ID: <1ec29351c71adebe8e2bfda926914893.hverkuil@xs4all.nl>
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr  2 03:00:20 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	b82779648dfd3814df4e381f086326ec70fd791f
v4l-utils git hash:	a04dfa5b72df01c6dbdf68fd9365e2d913fe5a0f
edid-decode git hash:	7a27b339cf5ee1ab431431a844418a7f7c16d167
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8613-g721ca29e
sparse version:		v0.5.0-8613-g721ca29e
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b79a7217767e7837924cfc503701b5bc549d70af
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

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
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/spi/cxd2880-spi.c:391 cxd2880_start_feed() warn: Please consider using kzalloc instead of kmalloc
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Apr  2 03:20:20 CEST 2024
virtme-64: WARNINGS: Final Summary: 3350, Succeeded: 3350, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3482, Succeeded: 3482, Failed: 0, Warnings: 2

date:			Tue Apr  2 03:50:49 CEST 2024

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

