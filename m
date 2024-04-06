Return-Path: <linux-media+bounces-8783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6B89A847
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 03:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B06B1C212A0
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 01:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D314F4FB;
	Sat,  6 Apr 2024 01:44:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20733C9
	for <linux-media@vger.kernel.org>; Sat,  6 Apr 2024 01:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712367886; cv=none; b=kCoILsWhlG/XCaw1tXUS/N69O4m8tVkQeqEcta07PppNsFw1HxVH+xJTbk/CxuViyfERGh1tJZ8k337tUtg+td316VM9Af/PdbSEXYxHizRBW5pA8sQ2FFqfe1IDKDiXYwwZCY8ORwrBfDQ/W02CyEpkV+w8gC1QibESdGd9M/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712367886; c=relaxed/simple;
	bh=SxYYUHN+pG0KPJiVOE/kD36680oKHpsa6LLkjYtjvNQ=;
	h=Date:From:To:Subject:Message-Id; b=SE+JiYr4YM6uWFrAmhoNiPCSnQ9JZI4K8pBxr7He6NEFMrH/B3WRbeLG9AYgYcIUKH+oI6XUxigbu0WxZHt2PLt9fUdgTdX6XBxCf8w6FHe+tAv1DnTFcp0Q0691s/1xkOszFa0sEOwD7/DzMqV2PFWcgXvJ3PpLaSKvKwAxfrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E83C433F1
	for <linux-media@vger.kernel.org>; Sat,  6 Apr 2024 01:44:45 +0000 (UTC)
Date: Sat, 06 Apr 2024 03:44:43 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240406014445.97E83C433F1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Apr  6 03:00:12 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	b82779648dfd3814df4e381f086326ec70fd791f
v4l-utils git hash:	62f1c6833e12f22c81750529761410621aa54830
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
linux-git-powerpc64: OK
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

date:			Sat Apr  6 03:13:41 CEST 2024
virtme-64: WARNINGS: Final Summary: 3350, Succeeded: 3350, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3482, Succeeded: 3482, Failed: 0, Warnings: 4

date:			Sat Apr  6 03:43:45 CEST 2024

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

