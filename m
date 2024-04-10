Return-Path: <linux-media+bounces-8957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCED89E7F0
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 03:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527591C212C5
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 01:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A341C2E;
	Wed, 10 Apr 2024 01:48:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB4748E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712713705; cv=none; b=BpFqoNW33w5xV46YwGcR3uTmx8+gYY1QlcLzyMqCsASkhnUHJwbanCcepq6wR8VxdFFw89EeTm3KbaJonMTI3l7Gmd4J/kgso/1roaQzJ9CUY2ji4iKzfM1/XQB45bgWgPYNAkfUddp520d0whTLmXujyb8qp39J379zqbowp9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712713705; c=relaxed/simple;
	bh=awYaoQ5RjTiXEd2zyXOdi1T+j0zQPMuy5DS4CsxUd30=;
	h=Date:From:To:Subject:Message-Id; b=ZjjGkPAOW+uUQpS0rTAfGJPx9Dj+xkMOVYvq1LMAjU2zdF/63PijOGQ17KL31KEAMICaWWbuCzdWE/nEhLsD7ammO1v8y7iNH7zwxvVtVSI3moZxAQKs3Ep4tYDJrlIJ+keh8mwKRwc9lmWnpbF9FAktph//ktfDN4FGc5aVk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BF3C433F1
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 01:48:24 +0000 (UTC)
Date: Wed, 10 Apr 2024 03:48:21 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240410014824.62BF3C433F1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Apr 10 03:00:46 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	682f4968084a3d3eed08718b23fe9b6777dd6c2a
v4l-utils git hash:	20e3e93450850280ddce5cef44a7dcf7e9d96105
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8627-gd1052429
sparse version:		v0.5.0-8627-gd1052429
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a7ebc7863dd57d9fa70443fa9f071ca22da90b8c
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
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
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.
drivers/media/test-drivers/vivid/vivid-core.c:1989 vivid_create_instance() parse error: turning off implications after 60 seconds
drivers/media/usb/em28xx/em28xx-video.c:2861 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Wed Apr 10 03:14:29 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 5

date:			Wed Apr 10 03:47:06 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

