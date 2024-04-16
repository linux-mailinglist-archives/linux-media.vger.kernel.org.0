Return-Path: <linux-media+bounces-9466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB18A6091
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 03:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29907281CD7
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 01:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3954D79D1;
	Tue, 16 Apr 2024 01:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7831107B3
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 01:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713232286; cv=none; b=rB+CZtjRc8VbfgY4Weq4bmZ3464QYwU7nhD4TeXwDhAynojEEYnJD6aplG7wBAUWpz+M+FBtOatXqquXQvt4vLXlL8T/SzILPc2viYPkO3fcVtNfPe3lN64RZmz6HjvRIfxNvjaa8DfSrB99mgd7T09X1ALnHi3ypF616MLq3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713232286; c=relaxed/simple;
	bh=hCpj5vKFMPcUVoxJ7NcnVbVXMNhYES2hT4DA8XF1JgU=;
	h=Date:From:To:Subject:Message-Id; b=kjdo/Zj3CYERPLAfSu7T0BcpdeyqRCHluSMGwftse7KPYxnkNYr1Ban/QJCWrWO61GGYRrxwcBMZ1ZdePJGXjIZX3emkc2JPgRolljNzasI2APefed4K4sGTqwYReOxff5ZOdQf4u21GaSXrocUgM6LXzJbIxcWt6Kdw/VQ55tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1821C113CC
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 01:51:25 +0000 (UTC)
Date: Tue, 16 Apr 2024 03:51:23 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240416015125.D1821C113CC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr 16 03:00:22 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
v4l-utils git hash:	7997d8076c07c33ab5324e4d52092451598d9d40
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8635-g375ffc07
sparse version:		v0.5.0-8635-g375ffc07
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 85f64a945aa6b4547b8df8942d46e08561cc6b5c
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
no-debug-fs.config: OK
no-pm-sleep.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/spi/cxd2880-spi.c:391 cxd2880_start_feed() warn: Please consider using kzalloc instead of kmalloc
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

date:			Tue Apr 16 03:14:03 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 2

date:			Tue Apr 16 03:50:09 CEST 2024

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

