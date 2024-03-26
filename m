Return-Path: <linux-media+bounces-7806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FDC88B759
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 03:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3F92E37BD
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 02:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D779B57320;
	Tue, 26 Mar 2024 02:21:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A01CAA5
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 02:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711419686; cv=none; b=bfzvuPca+NqfQS/ItgRh5w72uPShKkNokrE8VOjMDAdmBZNFl3xwpELtNCGYvClaXDeqiZK2lx2ePMDxhDZkV2O9ejvCv/EE8lQ9lICtj9n/eCMO9+waGbiXqCTm2OJYjybYvGRw8lAZdvKSNR1ZskjLSZWu/VRVg7lKF2i5dAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711419686; c=relaxed/simple;
	bh=p/rtS0LV+1nvW5Qs1aYTvGrzHUV2nazvXdOw5xPvMZc=;
	h=Date:Message-ID:From:To:Subject; b=GEfwPZ0YWVpvgdK5mNVo3t/Zbt4U5d54ShbykTmZNVyja22vF8J4ZqAM85pUkKmbQT1n+E5HYmRxIldH1Q28TGun+Tmq6+h7AyJYR03pbyJ+x900YmF0zu8XHw4g2nEJXA1ql0wbc8J0QBDntc8MqGC4MW8AIj5427bzbm1ZDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB353C433C7
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 02:21:25 +0000 (UTC)
Date: Tue, 26 Mar 2024 03:21:23 +0100
Message-ID: <0713ed00bd36608a178d8ee7d627a1a3.hverkuil@xs4all.nl>
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

date:			Tue Mar 26 03:00:17 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	fe19aab844ad76a4e001082f633b1ac34f2a943d
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

date:			Tue Mar 26 03:20:02 CET 2024

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

