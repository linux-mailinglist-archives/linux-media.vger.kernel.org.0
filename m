Return-Path: <linux-media+bounces-16591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E495AAB8
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 03:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E2F1F22E5C
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 01:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4A512B72;
	Thu, 22 Aug 2024 01:52:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC2156E4
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724291568; cv=none; b=DPxLrBKwD/ixBnYq3Czd4ilIY0OxZu/EpPhCjd3Ut1EodgHNZrCbeG7Bp85sjAJESjxPt5fzhptlO8X8brwIx6y9536jLjWu1kPFtzhiglvWgzvERrGL8HDqhHVi5JYt+57cb6yXzZsjxgQ4lqjHeJAvX8qxFnotLP77ivlKRWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724291568; c=relaxed/simple;
	bh=TDGV/WAZ/y9CdBqql9sA4hXeQ/5d8hEkBAfRBRHQW6o=;
	h=Date:From:To:Subject:Message-Id; b=MrMgW/4nWPWF/xbezPN82fQ35kXkQvp0Nj2tWr2ffQn58lcslaLAKf2o6gmb+VPKBDm/+K4KTztHEKdbHJVx9cE4QYn0CxyDWG4+f3+6Pq4m6l8LkWBMQShHYve/UAYN6m3uPE3FrzubH3jexzL6yyWRbRszkGC2x2+yfqkkeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90790C32781
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 01:52:47 +0000 (UTC)
Date: Thu, 22 Aug 2024 03:52:45 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240822015247.90790C32781@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Aug 22 03:00:37 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a043ea54bbb975ca9239c69fd17f430488d33522
v4l-utils git hash:	a1ebb4dad512025a7fbb2e7ff6ab6e5f5e604987
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

date:			Thu Aug 22 03:14:01 CEST 2024
virtme-64: WARNINGS: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Thu Aug 22 03:51:39 CEST 2024

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

