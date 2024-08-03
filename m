Return-Path: <linux-media+bounces-15735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB29466D9
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 03:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A24F1C20CD1
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 01:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F35879D1;
	Sat,  3 Aug 2024 01:51:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C75C99
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722649914; cv=none; b=E3xuaS+gxIExDa/fLBIzKHukXJ/EwskTiild6M6tVFjyJsTPh33+pfNY0vIaNYlaRkI+EvxFuaGHRhaMyGhk5Jiyx3Xm/Eu0xxErBLOjOogdRoQaJ3/UII8qHbOOP1sm7O6C39N1Y+qPszHbf4fOpQaYce93FljJkSM6XdQD46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722649914; c=relaxed/simple;
	bh=0gvSx+7MHK84nbmzzYunyD70vMBCd9aWmE3bskNwDXY=;
	h=Date:From:To:Subject:Message-Id; b=NhKg2USMNnJ6cjawdyGgGh2lsHS8X1PMBUw7FVt/pkRqNNZOP4x5pZ1xjYhZSiSyFOfrUefJkVnQGCqgBJ8kGLohGvmW1138IBJ/OnE2Sf0zREW+sgkX9h9uOeuj+Ux2Vp0KTocN3RaoLEQQq+ZSn5s7nfIBDxRmF9hAQrk5rEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D328C32782
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 01:51:53 +0000 (UTC)
Date: Sat, 03 Aug 2024 03:51:51 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240803015153.7D328C32782@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Aug  3 03:00:56 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	ba5c778cab1dd3e4918f940989e771e2818afee8
v4l-utils git hash:	69b3a7618cb5dd084f5b3c27609009ff89ddae36
edid-decode git hash:	303b033f92683fa3f2e73d642bf86ead8fec77b1
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8683-g412f2874
sparse version:		v0.5.0-8683-g412f2874
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6315b97764c964464fbdbae5543cfd95225e251a
host hardware:		x86_64
host os:		6.5.0-35-generic

linux-git-arm: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-of.config: OK
no-acpi.config: OK
no-pm.config: OK
no-debug-fs.config: OK
no-pm-sleep.config: OK
sparse: OK
smatch: WARNINGS:

drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Sat Aug  3 03:14:35 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sat Aug  3 03:50:45 CEST 2024

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

