Return-Path: <linux-media+bounces-9887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EE8ADBB2
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 03:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A25B23115
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 01:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C0A17C66;
	Tue, 23 Apr 2024 01:51:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66417997
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 01:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713837067; cv=none; b=TpVRQn8J1uApM12h8rv83z2IXLidBvhGq9QiS0TxTM8+XAMEUGjjRnomIJcBE/lxGS5Ybp7cqoguGj3FGMEcEWlmwxICI06gBeR4lUnB6kFUVuBgtj0bRBudM/+dH6zwcPtl6SQQxZpaPuh677Q16ZAZb/oZ1E0nbpxRerJCosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713837067; c=relaxed/simple;
	bh=MSPbbhh11KCXMkc33ONDjeM5eil6GLaJPphWVwr8Hf4=;
	h=Date:From:To:Subject:Message-Id; b=SK73/8xyAYAEWUsiAr69GIvats/pngyq7AZhsXSyrxWQsnkzp/z24d+WyUNhJWSVIWfINJw8No9csR8KntIcTsXQogzkSvXdCK8T7K753pxamKABksvvE9msw3DWoR6VRkMj4HX9OfhTBA9wmfonpP6vo04u2zZ3Ll95sAdAfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBABC32786
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 01:51:06 +0000 (UTC)
Date: Tue, 23 Apr 2024 03:51:04 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240423015106.8DBABC32786@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr 23 03:00:17 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	e42a204f0519a2540f1507ac2798be2aeaa76bee
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
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-debug-fs.config: OK
no-pm-sleep.config: OK
sparse: OK
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Apr 23 03:13:57 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Tue Apr 23 03:50:05 CEST 2024

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

