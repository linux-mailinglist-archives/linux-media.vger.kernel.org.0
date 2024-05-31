Return-Path: <linux-media+bounces-12314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3E8D5864
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 03:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8D5284BDF
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 01:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051B3524B4;
	Fri, 31 May 2024 01:51:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F06FB8
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 01:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717120279; cv=none; b=HMF5xVYlVpyQWOADg95TRJjqiEZNBKziL+pffwqdJ+BLteUTnDLj4DKqfn+4xDAfrpLYOriL6Yir9TWJep2k4fdGJy0DWqjuRR1xB1WOyJJ7yiKYOwLT46MXXpyGj9JSt4hT/SzAxwEmki07mdF3Orn4mHAPRlrtQqM+6HZyMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717120279; c=relaxed/simple;
	bh=3O6Y3bXeUnOEHRNghvChb3K4B1cO6JH7YUHvfqO96QA=;
	h=Date:From:To:Subject:Message-Id; b=EP6h5l6qIadXrO49Ac0agBRk7lq+CIzUEyn4nnL8deVU37ccvJp/+NBlAhLpXp3g3TSNt7bKV3p08OBBDor49X2uRXq/4aXAXkgTACKnpfG76qKUJRx55WxFLy9CMNFr10r8ofJgSaWa79Ks8P7lsbFQ5geRKbQHP9u11vZ1RVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A42C2BBFC
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 01:51:18 +0000 (UTC)
Date: Fri, 31 May 2024 03:51:17 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240531015118.E5A42C2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri May 31 03:00:18 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
v4l-utils git hash:	7d55dd435be30c47bf4766ec264ace1c0ffb06e5
edid-decode git hash:	f4b0548cb4b4cdff7947be59ce795b23e60266ed
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3e9c9a50a2489e266e13733b4caff417b4634d71
host hardware:		x86_64
host os:		6.5.0-26-generic

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

drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->dec_mem' from ioremap() not released on lines: 1296.
drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->enc_mem' from ioremap() not released on lines: 1296.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri May 31 03:14:04 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Fri May 31 03:50:17 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

