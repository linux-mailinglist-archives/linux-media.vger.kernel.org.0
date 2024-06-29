Return-Path: <linux-media+bounces-14374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0E91CA14
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 03:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42C671F226EF
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 01:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BD5469D;
	Sat, 29 Jun 2024 01:45:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F24184F
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 01:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719625556; cv=none; b=uOXCkagPI50g3NXP6k5xDHtWwGeV1tGHUXM/K/38sMyMlxNiIW6X/laLRrO1GkSEs+7PFkbb3sHeICYHKiOM/lb5jUpZiZG+JF8phdzAjRJGrFZyr7teGYbk0b/glaOEtAlBHPTe/zoMH2ySphSFu6KjkulKhgVnAX9ejykSmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719625556; c=relaxed/simple;
	bh=75bRlV+EFxqzga3HwU19WxEM3QgyigE9REZX+YI0GwE=;
	h=Date:From:To:Subject:Message-Id; b=IfGMuTVgikKXWXKTJeBG0Ks1FAXfzTewkBTMfmxh7fVnqv7HZFXVvCIyzBcuv7zWlWjQRbL7PL1+YMHckPHqKMzPOvYVvwgMc8B/7ZftdDjwTKfqrpH7ZKYaRQBnXM3gunMi1VDll3c8genJOY3xF6O4Gshrx+wAL1QU5VhbOMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B215C116B1
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 01:45:55 +0000 (UTC)
Date: Sat, 29 Jun 2024 03:45:54 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20240629014556.1B215C116B1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jun 29 03:00:33 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	f5306b757cb78aeec45e03ee52ec038c6423ad7a
v4l-utils git hash:	a0fd7261492d3ffeb33a3ad2e25e3642a23e01a2
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

date:			Sat Jun 29 03:14:24 CEST 2024
virtme-64: ERRORS: Final Summary: 3243, Succeeded: 3240, Failed: 3, Warnings: 0
virtme-32: ERRORS: Final Summary: 3546, Succeeded: 3543, Failed: 3, Warnings: 0

date:			Sat Jun 29 03:44:49 CEST 2024

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

