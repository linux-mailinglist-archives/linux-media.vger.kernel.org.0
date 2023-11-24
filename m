Return-Path: <linux-media+bounces-973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419F7F7298
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 12:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94E42817CC
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 11:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5071D554;
	Fri, 24 Nov 2023 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CE1CFB7
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 11:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2756C433C8
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 11:21:08 +0000 (UTC)
Date: Fri, 24 Nov 2023 12:21:06 +0100
Message-ID: <6e17f4d783e5d142f4cac69129e84873.hverkuil@xs4all.nl>
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

date:			Fri Nov 24 10:38:58 CET 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a00b3f296eac3d43328615c3113e1a74143fc67a
v4l-utils git hash:	017644ebac36797cb2b1014a631a9216a90e8afa
edid-decode git hash:	d6d86cb9c9e13c7bbc6854699940f2d5a73567f5
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8523-g045d29f9
sparse version:		v0.5.0-8523-g045d29f9
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0e92f35343cd1684f7ff2d0d8814d821953976f2
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-x86_64: OK
linux-git-i686: OK
no-of.config: WARNINGS:

drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:34: warning: 'wave5_dt_ids' defined but not used [-Wunused-const-variable=]
  274 | static const struct of_device_id wave5_dt_ids[] = {
      |                                  ^~~~~~~~~~~~

no-pm-sleep.config: OK
no-pm.config: OK
no-debug-fs.config: OK
no-acpi.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1514 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1514.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri Nov 24 11:39:45 CET 2023
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 2

date:			Fri Nov 24 12:19:51 CET 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

