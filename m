Return-Path: <linux-media+bounces-10259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD558B4397
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 03:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AFE5B21C13
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 01:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6009383A0;
	Sat, 27 Apr 2024 01:51:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6059F39850
	for <linux-media@vger.kernel.org>; Sat, 27 Apr 2024 01:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714182685; cv=none; b=PkEklDY6IRNmW3hxW8uRF5Y22ZfMBwXjkDAmwV7hLQjzFHOF6SpIhw7TxR4qHV460ILHWnCSKnsQ/PJ/LfF3+tCCKv+SW7BKakdapK2M0g+8pN0/pGoem6CTydIP/E0glI/HLUOmRB1NihaDmwX1BlurL/duH8ELOw8n3vgPz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714182685; c=relaxed/simple;
	bh=xdwoSK1xe+D5K7haddzL/HR1M1Ru1x00LBiHtnWD7C0=;
	h=Date:From:To:Subject:Message-Id; b=odoftRfnAa7Dqb/mRv4tamPnk/eqmsVhwSEcNqb05hbpR81QqyNBN8iXirWAdKsasjcLPb3bGkvjyGrJ9T7oSVmFiiEZ3Oh6GYIpU2GJ+b4PLw3LgfdUjXoX4wyOBkzYOLGb/rO4KMyQgjT8VqqJpvChQNyPXjCb7neKDoP6Oh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58EC113CD
	for <linux-media@vger.kernel.org>; Sat, 27 Apr 2024 01:51:24 +0000 (UTC)
Date: Sat, 27 Apr 2024 03:51:22 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240427015124.9A58EC113CD@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Apr 27 03:00:21 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	8a718752f5c339137c5b05e54f116cd26d5a4143
v4l-utils git hash:	3944af31f58db873129d25db42a7a39c1ac3942d
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8638-gcc6d585a
sparse version:		v0.5.0-8638-gcc6d585a
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

date:			Sat Apr 27 03:14:06 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 2

date:			Sat Apr 27 03:50:21 CEST 2024

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

