Return-Path: <linux-media+bounces-14893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774D92DE24
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 03:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B4691F22533
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849D38F4E;
	Thu, 11 Jul 2024 01:51:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A5946C
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 01:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662678; cv=none; b=AND7WEuyAfL5f9K2QtkRZ/Ez5k7ct608K1e+i8pwwDQt/NcT2z3x6LPIjCJYTTWI+D5msBatoCyfPB4BX+LxH40jqjQz8sbHav833/kJd1j9/qziOQv535clJEpNVoFh/NtJxgtzzQxqVarzaxlmJyoWSosqLFVf6NqRO0QuxzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662678; c=relaxed/simple;
	bh=MwXE2yaczbLMJs7jEiCz8tEEjnlNpKD3gtI1RMUC0yY=;
	h=Date:From:To:Subject:Message-Id; b=ezhrTjqnxl8kT2s+6A6JM1muEJekPNCT/AIKAj2N8DjTawQ8kW5IpRhteosbL+1oC2l/42NiAG5EmINclnoWf8aY18uSK2FdU9dzlZ/SjhxPqzU2S17BIcnq5VjCWKJci68oMpnLdq/d6x3flPlmSXiru5qFDfb8qCbJsXfTE4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB1C32781
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 01:51:17 +0000 (UTC)
Date: Thu, 11 Jul 2024 03:51:15 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240711015117.6FCB1C32781@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Jul 11 03:00:13 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a7351f0d3668b449fdc2cfd90403b1cb1f03ed6d
v4l-utils git hash:	8387e367383787e5d61b42503d99ebd5138cafb6
edid-decode git hash:	6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8663-g95ed8682
sparse version:		v0.5.0-8663-g95ed8682
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

date:			Thu Jul 11 03:14:01 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Thu Jul 11 03:50:09 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

