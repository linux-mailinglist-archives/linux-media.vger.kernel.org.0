Return-Path: <linux-media+bounces-16625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A795C301
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 03:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8594D284A43
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 01:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFCF17BDC;
	Fri, 23 Aug 2024 01:52:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25506A934
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724377948; cv=none; b=XFsCS5h484B1Xru+Ai+F8bxdwaYMthZuyRwvufqLNBvx57mMkihWrvbrV4hQl8n3oxLawk3+LXfTfpwAiZRMi/PLwiYyEqVgbozj488YtPRJ5UrCAOH2Hiho8UC8EYG0MUfS/HwseImpyJIIQgxmupWyR4rwKleiuW1UduYOBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724377948; c=relaxed/simple;
	bh=fwF/prX51LHHJwdjQxZL4PjYqkdtevnrKI3LghbMBRE=;
	h=Date:From:To:Subject:Message-Id; b=F6j5F+AEiR455HDkSddrlxHAfYn9jeb2WVdi0O7T+i0uowUWQoBqLYw4HOEwl1tZaYWB78pwRp2xG8fZwT70qglrK0DI8dMOalrsmKPqUWitC/3zk2ZAr/jFygOkRBQJfaSPQh3evVtIMCv+3PQiM5WJ0596x7G5+NnA2ZqlgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E2AC32782
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 01:52:27 +0000 (UTC)
Date: Fri, 23 Aug 2024 03:52:25 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240823015227.43E2AC32782@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Aug 23 03:00:14 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a043ea54bbb975ca9239c69fd17f430488d33522
v4l-utils git hash:	37d02fb3e909237320b0bca6edf736870677fb1f
edid-decode git hash:	10bc5ee3901ef337f6d255a8d5bee211277543c0
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8688-g8ea74b5a
sparse version:		v0.5.0-8688-g8ea74b5a
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6315b97764c964464fbdbae5543cfd95225e251a
host hardware:		x86_64
host os:		6.5.0-35-generic

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
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri Aug 23 03:13:35 CEST 2024
virtme-64: OK: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Fri Aug 23 03:51:20 CEST 2024

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

