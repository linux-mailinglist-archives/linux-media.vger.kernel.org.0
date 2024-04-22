Return-Path: <linux-media+bounces-9835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD878AC297
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 03:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76EBF1F20F4A
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 01:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336AF3D60;
	Mon, 22 Apr 2024 01:50:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D9205E33
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713750655; cv=none; b=J3Ogfd9UjSbiEBRmwYk7Tijbw71+3vV0ptB2udcaNpeEuvcWqCyGaYDBKG/Gnn2/R63ISHd6e+Tr4BO/ZnmnLovVK3A5oWRVNPzqZgDd5yc5pcur0mhyuU6zjmYtHuIKhVIMbKu00steO1nc5KTKQqXDGTAKi/FPM9GFiDmDwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713750655; c=relaxed/simple;
	bh=ReyFiobpBUvvICJ3Cfjav0ZZ8KoL/iAuYZUpgt6l4Ak=;
	h=Date:From:To:Subject:Message-Id; b=mXZvti0j1Mx1xuotl2i9Xbaf7ERSVhuAJcoA7DR2KGEpdu6Nzb/KFj1n6gp4tVjiZjeJAx2lmubfx6ENjQ0DTutOG2XS4TKRIbNT5L+SVKX/CnDaJazpuxF6CgCEfjVS2eSXS/Wo7WYwFA3Wt0wsm5MKWFWvAXP5U3rx0h7yn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003E8C113CE
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 01:50:54 +0000 (UTC)
Date: Mon, 22 Apr 2024 03:50:52 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240422015055.003E8C113CE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Apr 22 03:00:13 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	836e2548524d2dfcb5acaf3be78f203b6b4bde6f
v4l-utils git hash:	27d7df2461b7efe8251e3e828b9910fea1c48cc8
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8635-g375ffc07
sparse version:		v0.5.0-8635-g375ffc07
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 17e6ec53dd49dd4f29af7582d1be51dbbf55be1c
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-of.config: OK
no-acpi.config: OK
no-pm-sleep.config: OK
no-pm.config: OK
no-debug-fs.config: OK
sparse: OK
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Mon Apr 22 03:13:41 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Mon Apr 22 03:49:47 CEST 2024

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

