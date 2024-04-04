Return-Path: <linux-media+bounces-8602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C13897D79
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 03:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFD4EB27138
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 01:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D8ECA40;
	Thu,  4 Apr 2024 01:44:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B877492
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 01:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712195066; cv=none; b=hZuvPs2KL94zK4mJI3gJLzKiSHPd7tCS9TF+eO7JEnCmfaMCSVt1jK02DsQYL+Jz4UW66+zsxfXnUaXgHYoZSmWUtrYgM7tAZrTSuDR2/CuBbWyczs1KsCPw1Br0JXOtH37vlsmMmCmPnpimENLqoMDKwpzfP4+sEuTT/htQyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712195066; c=relaxed/simple;
	bh=seOPPJPVS6TQC8MYyI/qg9uXCZgK5CsMyshbKU3TMXA=;
	h=Date:From:To:Subject:Message-Id; b=X0ABE5CKZuQzacRusRhr47VbAFFMg5rwl7SKesYUcaZEUrUEugfybaaKYP8/Xyr8Y5Ysq9C2+vE0bSeH785Am4kYJLHF1MC+r4MMhkJHQyX1Gcdy8XWrdWJRI4TGP61n0RH8mAnJAUtfK0CYi5pP8HOXJcHOrdSklVbo0ZBP0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB3FC433C7
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 01:44:25 +0000 (UTC)
Date: Thu, 04 Apr 2024 03:44:24 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240404014426.0CB3FC433C7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Apr  4 03:00:11 CEST 2024
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
build-scripts git hash: b79a7217767e7837924cfc503701b5bc549d70af
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-of.config: OK
no-acpi.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/spi/cxd2880-spi.c:391 cxd2880_start_feed() warn: Please consider using kzalloc instead of kmalloc
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Thu Apr  4 03:13:33 CEST 2024
virtme-64: WARNINGS: Final Summary: 3350, Succeeded: 3350, Failed: 0, Warnings: 5
virtme-32: OK: Final Summary: 3482, Succeeded: 3482, Failed: 0, Warnings: 0

date:			Thu Apr  4 03:43:25 CEST 2024

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

