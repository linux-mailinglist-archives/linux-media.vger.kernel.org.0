Return-Path: <linux-media+bounces-10775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6A8BBF08
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 03:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1556B21203
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 01:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C224EDB;
	Sun,  5 May 2024 01:47:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC117C2
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 01:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714873677; cv=none; b=irVM2qWdadTdg1qTImjhEvvxlavsr+sg96YujRKD8FmaTzL6iTVL1C9MX1JggrtfZg8Xu+5OAJC3qXpFK22NSVwS+b8B2EWVNupMRRrK23LpRimnwvk2VXjSTr8kvzmt+nb77MSCQQnWHWOL0IxSR7CHhqBPGElSFAz1/Q27kag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714873677; c=relaxed/simple;
	bh=/CtXkziblFxaeNVKOLD3aTyFGSoodUKVNi3L2XRfqOw=;
	h=Date:From:To:Subject:Message-Id; b=gKQkSAMxprhU9P24af7e5mBFHcugZ/qkuzPej86B443ZGZ9JNARTmn/odpFftPi8/fzFPUL5eIIbg+LvC1xxMDyFynkgJgzjGLms2BbRIphpjspLRCyX28XFkEWkfAFXD2ocwl82qUtecw4mVlM5uBL+6dZw11Vy7BXvuws9VX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B965C072AA
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 01:47:56 +0000 (UTC)
Date: Sun, 05 May 2024 03:47:55 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240505014757.0B965C072AA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sun May  5 03:00:19 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	e695668af8523b059127dfa8b261c76e7c9cde10
v4l-utils git hash:	dd049328e5282f478ba543a50dcb14618782abbb
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: f1270d27441158dfce6beed9d2609cec2a46b933
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
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Sun May  5 03:13:59 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 5
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sun May  5 03:46:52 CEST 2024

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

