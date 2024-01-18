Return-Path: <linux-media+bounces-3836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95E831185
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 03:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCE01F24675
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 02:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD285665;
	Thu, 18 Jan 2024 02:50:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C49F5395
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705546250; cv=none; b=ulWhX3JqAWrZ8Mtd+g8ilOZ7gE3rZos0sQdKxDAy8iNN0Do4hMTz9hw7327gOEiOOM+HiTlme7yM5aSDpD33NMfBmoipMVgpqj4cZwLrqNji91OqC7vmybAP/SEv8r1C/2W+aWkz6wbGsSQobCDmLOpxPsrP25B2UA2TKQNebCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705546250; c=relaxed/simple;
	bh=MVYtqwUoAWpPFIoD3G7Tq9Hf73W6wsuBd8d61b+lAX0=;
	h=Received:Date:Message-ID:From:To:Subject; b=SEGhwF2xnGfePWgQHs5/xER8C85ARByf8H7g5JvflXs1NHvG5mC1ch0tzRAdxX2s7IGpYAYrY9h4ojBw72ohME23PSWX0mqrmYSeJPJccMDTD1McGZDQyE931eLEYLe97rcKnKsDytsAZW2n4YR398DP1rqu40B/I/iDjlYzLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB35C433C7
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 02:50:49 +0000 (UTC)
Date: Thu, 18 Jan 2024 03:50:47 +0100
Message-ID: <5b81d670908abc45cfa7737e0d816a16.hverkuil@xs4all.nl>
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

date:			Thu Jan 18 03:00:31 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	60a031b64984ad4a219a13b0fe912746b586bb9b
v4l-utils git hash:	2d0a47ad3e7db6e3ecd053dbcee772299eeb82ed
edid-decode git hash:	6e4132123fae3d71ac9350d71a60a7a97020df13
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
no-pm-sleep.config: OK
no-pm.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Thu Jan 18 03:20:34 CET 2024
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 3
virtme-32: WARNINGS: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 2

date:			Thu Jan 18 03:49:11 CET 2024

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

