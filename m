Return-Path: <linux-media+bounces-13765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DA90FB10
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 03:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5152BB21C72
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 01:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A784017577;
	Thu, 20 Jun 2024 01:51:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510AD171A1
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718848272; cv=none; b=VTw/c1HcM2CfYUD0Y4pMDuFwRnwBB4tECvks37xx2wtsLsUwRiR4MacHE0pJDmLWMI1LiGLSxcAIPMqk99qY0pG20aQbVbqc9mh+oj3XOVMbPsCrDT1VKYNGa/RkyGenZq7DZlfjPRohE8WHjE1/gKrgmVAJzDN2NABsIfPscAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718848272; c=relaxed/simple;
	bh=exIU+yq3UQ524T7HjE/ymsP/pJPFq/Rm3CEZk7UpIJo=;
	h=Date:From:To:Subject:Message-Id; b=LEg0Ifx+TJM96kAhc0dLeDpVN0JEr/KW1k1xrecW0B67mN8y3HHnUi1ODUDEGUCQkp/BYuz6xCpnYB1QSh8J1H1ZSFKQmzw6/6PGlkCr9Jgpjlf4EfuQCWGgTJ7575LojXgflbyDk8GQBd0t90jKjMPlYw2NzeHE8w2G9TZ8+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816C5C2BBFC
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 01:51:11 +0000 (UTC)
Date: Thu, 20 Jun 2024 03:51:09 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240620015111.816C5C2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Jun 20 03:00:13 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	91798162245991e26949ef62851719bb2177a9c2
v4l-utils git hash:	9b1ffffaa7408c1a4e55c2f375c66ad9a0cf16c4
edid-decode git hash:	5d66c548e93acac1ab09675aa424912a4be879a8
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8655-ge9a8c157
sparse version:		v0.5.0-8655-ge9a8c157
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: be24540c169ec3016775f81d1a36b4133e96c7df
host hardware:		x86_64
host os:		6.5.0-35-generic

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
sparse: OK
smatch: WARNINGS:

drivers/media/usb/b2c2/flexcop-usb.c:199 flexcop_usb_memory_req() warn: iterator 'i' not incremented
drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming() warn: mixing irqsave and irq

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Thu Jun 20 03:14:06 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Thu Jun 20 03:50:08 CEST 2024

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

