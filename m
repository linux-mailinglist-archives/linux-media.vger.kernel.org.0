Return-Path: <linux-media+bounces-16080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2F94DF7D
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 03:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD181C209AA
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 01:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9388825;
	Sun, 11 Aug 2024 01:52:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29779F4
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 01:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723341155; cv=none; b=t0nJMju0lmHVq/wnmipfN29+Hd5oKzpj5m36iIIz3PkgRbJWBbt1BeW5YUdYrhwGsXw1KFHFIqEZW3O8AuNQPknrqKezj+QhSbsb6ul3Z2FEUMUTk9BPgN0CmR2cRog5xdk4JqwPoDxpELjR3zo4UeQxDDCr7ghq+Q4rOt3I/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723341155; c=relaxed/simple;
	bh=FQw4YXfPoOXhBKq9fXl3MxFAT2V27ezRy88MH5EDgz4=;
	h=Date:From:To:Subject:Message-Id; b=dZlOWy19usYgf1qHXcwO2oxHYmlzbkKdzlnnPeuLsYVENSIaubXJOSSCDhiTMJ3dYFCrQ3H+hQXY4LLQwnz62FcRJV7kOfRYmda8KjJEMxmkr4TGnHsooUIypUWAOSGZxn3zcEqOCZrDa3zxikEC5z+ErSkEZVj4wBBZJhwziNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5BBC32781
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 01:52:34 +0000 (UTC)
Date: Sun, 11 Aug 2024 03:52:32 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240811015234.3B5BBC32781@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Aug 11 03:00:13 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
v4l-utils git hash:	a1ebb4dad512025a7fbb2e7ff6ab6e5f5e604987
edid-decode git hash:	0ad31a9fc047572c649810ed4c6a809af4b0c5e0
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8683-g412f2874
sparse version:		v0.5.0-8683-g412f2874
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

date:			Sun Aug 11 03:13:42 CEST 2024
virtme-64: OK: Final Summary: 3435, Succeeded: 3435, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sun Aug 11 03:51:27 CEST 2024

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

