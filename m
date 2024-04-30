Return-Path: <linux-media+bounces-10394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE068B67B1
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 03:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABD0E1C21C22
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 01:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B1C2107;
	Tue, 30 Apr 2024 01:51:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B21843
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 01:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714441880; cv=none; b=TjOWsbnLX+mz8M7EppE3u6kGgwsN2+Kq4k+sF3lasbJf/CfeaOqjPDAqgp9/Bb6To2CmyYdjjsVZ2HJPYQn6l7UCQPvBRBZ21woEgDToDBraYkZzirOFczfJLaa3BK3l/+7I5wD6jtvyZ4ICORO2QMXTL11S/2O5L5IyEEYVl28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714441880; c=relaxed/simple;
	bh=a/snGdDTzZ/uhVzVDurTIE2bxDsIBXHRavOwnuPgwFU=;
	h=Date:From:To:Subject:Message-Id; b=YrA/n7fxd5grHNgATkglpy/Qva7HKH4Hd2UNQU3VvpVpffGT/RpN7k1n9cdIE/V1SRsnMUzu0A2TVNdjMxeJ7tw8Hu+yUHqJoTUZoBi0d8iJLm+6IoSg3wgtBsK/0E5ulewuGlxShNT+iakKgT87AmuJuU9r8bXodqvBeqg1+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89486C116B1
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 01:51:19 +0000 (UTC)
Date: Tue, 30 Apr 2024 03:51:17 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ABI WARNING
Message-Id: <20240430015119.89486C116B1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr 30 03:00:24 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	1c73d0b29d04bf4082e7beb6a508895e118ee30d
v4l-utils git hash:	dd049328e5282f478ba543a50dcb14618782abbb
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 00e599f8286b7f05e7c8c99b9e7caf4e21fc58b6
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
sparse: OK
smatch: WARNINGS:

drivers/media/test-drivers/vivid/vivid-core.c:1989 vivid_create_instance() parse error: turning off implications after 60 seconds
drivers/media/usb/em28xx/em28xx-video.c:2866 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI WARNING: changed for arm powerpc64
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Apr 30 03:14:05 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Tue Apr 30 03:50:15 CEST 2024

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

