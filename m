Return-Path: <linux-media+bounces-2057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065B80B872
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 03:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11A51F21047
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 02:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E3615AB;
	Sun, 10 Dec 2023 02:49:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A757F
	for <linux-media@vger.kernel.org>; Sun, 10 Dec 2023 02:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CCAC433C8
	for <linux-media@vger.kernel.org>; Sun, 10 Dec 2023 02:49:40 +0000 (UTC)
Date: Sun, 10 Dec 2023 03:49:38 +0100
Message-ID: <84b41fe9e10c9317252938365afe457c.hverkuil@xs4all.nl>
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

date:			Sun Dec 10 03:00:11 CET 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	efa28efd9cba015f8c3d88123527c3c3cfcd13d0
v4l-utils git hash:	b22a2838ca31ea066f8bbc4561c3a602bd274441
edid-decode git hash:	1e99fe84c08d2cea5d86668ac6948e382ef545e3
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8526-gd4827317
sparse version:		v0.5.0-8526-gd4827317
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 7f2b6a17d7e96bd3784acdf5a85be8574a31b358
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-debug-fs.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1518 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1518.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Sun Dec 10 03:19:47 CET 2023
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 2

date:			Sun Dec 10 03:48:26 CET 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

