Return-Path: <linux-media+bounces-10159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC08B2E79
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 03:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B774B1F23B74
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 01:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C891852;
	Fri, 26 Apr 2024 01:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80C15CE
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 01:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714096287; cv=none; b=EwydyCDUxynIUuHoyKbLS9XPv4amjDf3HPHVafmIWiCZw3eZFHFN2hApVs70mCzcYVE2zrWbOnnd6Aft2899fmC1mGtSgSBVrkQXimeHdfwTVv2d3tb7Xwf/hqdC14HCS5cpvao7GNtSTZiFCBVlfT08V4OsHR+g49FdevPsBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714096287; c=relaxed/simple;
	bh=5SiJ29KoqS7HtHxKtDDMLlR4f4bTRQPBJpu6lZBrOOU=;
	h=Date:From:To:Subject:Message-Id; b=MLpLaQguwuTMBA17bi5e1jbfD9qEO1a1t3snfCRTtbSC+lvmfDs0potxWa2nZHIWnPvCvWivqXFmRjQ7Ei8fBTTQAUbKjPqoagXJdOn7i3UfbbLQW0v9xW3qax8x2ym2+765uUh2bGwVyEsCg4vdVDBNNH5Evav7woO9QDk0enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5217FC2BBFC
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 01:51:26 +0000 (UTC)
Date: Fri, 26 Apr 2024 03:51:24 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240426015126.5217FC2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Apr 26 03:00:20 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	faa4364bef2ec0060de381ff028d1d836600a381
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
no-pm.config: OK
no-debug-fs.config: OK
no-pm-sleep.config: OK
sparse: OK
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: WARNINGS:

warning: source '/home/hansverk/work/build/v4l-utils/build/utils/v4l2-compliance/v4l2-compliance-32.p/v4l2-test-colors.cpp.o.d' is not a readable file or directory... skipping.

spec-git: OK
kerneldoc: OK

date:			Fri Apr 26 03:14:05 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Fri Apr 26 03:50:18 CEST 2024

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

