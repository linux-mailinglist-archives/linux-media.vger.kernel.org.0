Return-Path: <linux-media+bounces-16090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C363094E494
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 03:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C82DB21262
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 01:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBCB49659;
	Mon, 12 Aug 2024 01:52:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C216D272
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 01:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723427571; cv=none; b=qtg/Dw/Z5bXrvLXAg0Xo0wI00qf1rREO5fytz9y56d2Ejd29NOuQK7XZSn9uA8AK4rXQf5assozp5rOP1gdjD0WQLXSt3QLzBmcUK6wKr9SBS8YbzG4AWL80kKw0/4ne3KEFWLjx0qD6PxtL4NrphLdZhhrbdsd2KbvlS0ZXY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723427571; c=relaxed/simple;
	bh=g7HiXmV/60wpcE5mefGi3S9icDY875R3J/z8jC3fjhE=;
	h=Date:From:To:Subject:Message-Id; b=n477Q9qXPxViTF1IsSEQ5j8vAaKnRi3GynFBZtAmch1MPdzS198eg2xoPyrvyN7y1mroWlDY2Q2nNmX5Q00maq8pZUghZ9omyH5KyJUHbN1caS/53vMUCWlrdDOatiFcY7XWwfLXw65YE9lcLURhtwUPL+PW7T3sZGsGyylf+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A8BC32786
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 01:52:50 +0000 (UTC)
Date: Mon, 12 Aug 2024 03:52:48 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20240812015250.C7A8BC32786@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Aug 12 03:00:21 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
v4l-utils git hash:	a1ebb4dad512025a7fbb2e7ff6ab6e5f5e604987
edid-decode git hash:	c3708827ae080b3ae8118a1bd812c53c760accc5
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8683-g412f2874
sparse version:		v0.5.0-8683-g412f2874
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

date:			Mon Aug 12 03:13:51 CEST 2024
virtme-64: OK: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 0
virtme-32: ERRORS: Final Summary: 3546, Succeeded: 3543, Failed: 3, Warnings: 0

date:			Mon Aug 12 03:51:44 CEST 2024

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

