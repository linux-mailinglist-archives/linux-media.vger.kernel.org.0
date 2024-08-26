Return-Path: <linux-media+bounces-16742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35695E677
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 03:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABE1D1C209F9
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 01:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41CE79CF;
	Mon, 26 Aug 2024 01:52:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE592F24
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 01:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637154; cv=none; b=jIL/vSwYz7hxq23PksjSfa2dmtnS/E2+lhmZJyi1KxFKjMpLi0NEunfWUQa8lUqlrImQG3CqjtoAWbQjJrDhy35pS2/X0hvJ6OyOkPpgUOfHBWcLrDtK5QTP5HIEHOhB4ihIbgA0gYCKfHPwEjD0Dl0/KWoOsU0R/H3NYT4D9W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637154; c=relaxed/simple;
	bh=/AInDMp+ArvZLkNRr+5xF/K+sa5YMPR4K4+PS+Rh7jo=;
	h=Date:From:To:Subject:Message-Id; b=pmjwNmkfjsGGfpJcY0hUlXAq9KUyy9IvQZ4c4ZKdV67B1tojUh8penosKJZfYq8eJshNUhTqliCyZYofSYn45HkRbTQGj3sLt0NLsyWRjJLb7csGyzy18l1HMqFPjbgpuMYXmIKI2MRHqL2p5jqi8PxJyptOW33AgvY+mWsALoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77D5C32782
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 01:52:33 +0000 (UTC)
Date: Mon, 26 Aug 2024 03:52:31 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20240826015233.A77D5C32782@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Aug 26 03:00:16 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9
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

date:			Mon Aug 26 03:13:51 CEST 2024
virtme-64: WARNINGS: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Mon Aug 26 03:51:26 CEST 2024

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

