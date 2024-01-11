Return-Path: <linux-media+bounces-3488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C88BF82A629
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 03:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 693E31F226E5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 02:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C265A4F;
	Thu, 11 Jan 2024 02:50:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A1650
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 02:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDF5C433F1
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 02:50:54 +0000 (UTC)
Date: Thu, 11 Jan 2024 03:50:52 +0100
Message-ID: <40ae9fa1658a100a4c653803f0da5571.hverkuil@xs4all.nl>
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

date:			Thu Jan 11 03:00:09 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	02d4e62ae2452c83e4a3e279b8e4cb4dcbad4b31
v4l-utils git hash:	8649f5190970ac7bcfc227bcbc210964e693dd1f
edid-decode git hash:	1e99fe84c08d2cea5d86668ac6948e382ef545e3
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8549-gd0c870a7
sparse version:		v0.5.0-8549-gd0c870a7
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 984d07544ad3abbb1ea6b06f44ae531858c1c047
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-powerpc64: OK
linux-git-arm: OK
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

date:			Thu Jan 11 03:20:28 CET 2024
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 2

date:			Thu Jan 11 03:49:14 CET 2024

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

