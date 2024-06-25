Return-Path: <linux-media+bounces-14072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43170915BE6
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 03:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0906B21B5D
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 01:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713AC1CAB5;
	Tue, 25 Jun 2024 01:51:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA741BF54
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719280283; cv=none; b=qyCVT5Ju40pOgHnZ8+D7Zjtyg2/C88SqAwwODLlPJJkdYaamVK+/Y80pMEPeV5+77OWEFVThJZ0yIPVDzLYv+BAfAPl6BZKWkpnWh2kexIgnsL4itDetFaGAgUSqL612EL4dw6R0DVVHA2KyCmsQUeulHxp/32KUSLtQLVLkQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719280283; c=relaxed/simple;
	bh=J5Wo5fWlBI5nc2OSD6B4ZlV6aZ2qnhT8bVjDgp4omSU=;
	h=Date:From:To:Subject:Message-Id; b=BTskZR+5WJXEXAuISA0I1N7894nRqdrfJWewg3M65c3M727mzaqagJr7Wln0NiMz36vgcxT8wqNx4Zf+Gj34SSIIhc1uhwkcDOuK19Xs/ReDtveiQKUYpneWmUuOQZLTy9C/W+AdNly/9SaZ0ZxMbH8vnwG+PWq+yqxiVTc8res=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F5AC2BBFC
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 01:51:22 +0000 (UTC)
Date: Tue, 25 Jun 2024 03:51:20 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240625015122.40F5AC2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jun 25 03:00:20 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	bf9817d2ed3a499d4ec1a5125fb700185b2f2499
v4l-utils git hash:	9b1ffffaa7408c1a4e55c2f375c66ad9a0cf16c4
edid-decode git hash:	5d66c548e93acac1ab09675aa424912a4be879a8
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8660-g2dd6476c
sparse version:		v0.5.0-8660-g2dd6476c
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: be24540c169ec3016775f81d1a36b4133e96c7df
host hardware:		x86_64
host os:		6.5.0-35-generic

linux-git-arm: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: no-of.config: OK
OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: OK
smatch: WARNINGS:

drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming() warn: mixing irqsave and irq

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Jun 25 03:14:13 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Tue Jun 25 03:50:19 CEST 2024

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

