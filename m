Return-Path: <linux-media+bounces-7711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66C889A7D
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 11:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06DE52A2B7C
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 10:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EC0140E37;
	Mon, 25 Mar 2024 05:42:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A409722E168
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711334456; cv=none; b=ArmvpDOOb6AVYcyGqo8/Wq5HNoLcimxNk0L0lbF2d50EdkKmrBS9EVeBQ5HElylTUGLy8EDGV9BOf9N5ctebThemBqBCCK5fmsSpa1heCXkXDLKZ6mFaMoRix00BUMW3RSimGFk/kz3PE5Gdd1Z8iqIRhjlhST7n4WEwLWTYtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711334456; c=relaxed/simple;
	bh=XZwv8GvLVkj3FnoKAE4sv+uhSnW4HT3sp9sqAJUKgmY=;
	h=Date:Message-ID:From:To:Subject; b=SNpMTdeNFUKroWSGOqWD1pnqE/sFhM74XEz5+a7+LM5zv56zTo7xk5SNx3P+L0/qYXt94qRWxvPzFDSeRSEAlNLate+JVlLB2nT25zDzDNLJZy4xHJXtLiIasDjr+Fnr+bQtInHft4qo27Xb6wWIMHPHoZ6d2BVvmPsdGamqU7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25EAC433F1
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 02:40:54 +0000 (UTC)
Date: Mon, 25 Mar 2024 03:40:52 +0100
Message-ID: <6eb2ceb96b1a93b4499590de9178714f.hverkuil@xs4all.nl>
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Mar 25 03:00:16 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	4cece764965020c22cff7665b18a012006359095
v4l-utils git hash:	e429366f9a04338cc63ddeb1127e7a34b60ee482
edid-decode git hash:	7a27b339cf5ee1ab431431a844418a7f7c16d167
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8613-g721ca29e
sparse version:		v0.5.0-8613-g721ca29e
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a8f15603520a101f1beb6cee5f6d82d6278c5d47
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
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Mon Mar 25 03:20:21 CET 2024
virtme-64: ERRORS
virtme-32: ERRORS

date:			Mon Mar 25 03:39:34 CET 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Monday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Monday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Monday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Monday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Monday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

