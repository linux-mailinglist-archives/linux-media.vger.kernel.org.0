Return-Path: <linux-media+bounces-1388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45817FE768
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 03:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C363282446
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 02:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307B7F9E7;
	Thu, 30 Nov 2023 02:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A54CB3C
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 02:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D51DC433C8
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 02:49:24 +0000 (UTC)
Date: Thu, 30 Nov 2023 03:49:22 +0100
Message-ID: <f2051764df918908d276e9d42fd4822b.hverkuil@xs4all.nl>
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

date:			Thu Nov 30 03:00:07 CET 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	3b8551e73271fc375b15c887db54ad31686eb2ea
v4l-utils git hash:	db9478a91120dccc18d1388fe9b812567e33b6bb
edid-decode git hash:	08b5ddb2ed529e1e0bbfa8d6f1af836712bac327
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8526-gd4827317
sparse version:		v0.5.0-8526-gd4827317
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0e92f35343cd1684f7ff2d0d8814d821953976f2
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

date:			Thu Nov 30 03:19:34 CET 2023
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 4

date:			Thu Nov 30 03:48:10 CET 2023

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

