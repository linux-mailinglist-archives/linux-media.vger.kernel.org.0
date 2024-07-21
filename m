Return-Path: <linux-media+bounces-15206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD193833D
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2024 03:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539D21C20AE5
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2024 01:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210A139D;
	Sun, 21 Jul 2024 01:51:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7317D2
	for <linux-media@vger.kernel.org>; Sun, 21 Jul 2024 01:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721526694; cv=none; b=BYP8pPObmhtFsiGv9NWki6HWCul6U9O8xlIfsRU70ynTHYZCZPTJ04A0tcdVloL8jXUYAJdU4jEku1tnsUQGQ3GPJpdV/qpDOQi4/+cyx4LRQjOiwfGiEG1ZN4FOnWbds+c3UJ9c66q/jSKZhk2WXsK6ZKGHxEI3bZmOj1MR9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721526694; c=relaxed/simple;
	bh=KNVUwoWd34joqCApurucgqcMRaKL3FEfGahGg1GM65s=;
	h=Date:From:To:Subject:Message-Id; b=oA7B5nDTNv+87M1qD2MOVBQyyfNmCkzxnQU8mwjI2LzESK5L5Nr+nzZdqMRAsF6yia7zgulfzWgsOZIhBqm/SSs7uGCZSiAsMPt3S5At7r7oHCIc+34jKU0IlZgD3lJo4OFez4KVy77hD6YUvPDdV9X6bqimuUvKYvymZ2ZV0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358BBC2BD10
	for <linux-media@vger.kernel.org>; Sun, 21 Jul 2024 01:51:33 +0000 (UTC)
Date: Sun, 21 Jul 2024 03:51:31 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240721015133.358BBC2BD10@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jul 21 03:00:20 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	68a72104cbcf38ad16500216e213fa4eb21c4be2
v4l-utils git hash:	93463ab74dbe74e007b4db14505421735e89e932
edid-decode git hash:	6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8672-g8bc27a52
sparse version:		v0.5.0-8672-g8bc27a52
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

date:			Sun Jul 21 03:14:09 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sun Jul 21 03:50:22 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

