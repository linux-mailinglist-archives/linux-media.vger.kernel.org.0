Return-Path: <linux-media+bounces-13313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D119909B21
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 03:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35DA7B20D73
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 01:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2600D154C19;
	Sun, 16 Jun 2024 01:51:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA619D89B
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718502711; cv=none; b=bNK0NV4kwSggbbUoYpn0x4Lft89p32TRmoNlENrJ1o3pjCEweazrGW5b2qC6TzlaRWdAGQOcVTU95UfsPaHd4y8nYQk8QSRPwmP01O9M2iiQ2kzvuFPSVJzMFNilVHX5h0JQTLzSneeqb96IaC93N6eGS75Yg+M1zPDWDsML2dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718502711; c=relaxed/simple;
	bh=ReALB9a0A6hb9lpBBbULs1DYMnp9bZz43jAOBAMqsR4=;
	h=Date:From:To:Subject:Message-Id; b=MBtDz0KmTzHV0QTkKN4Y4Q+QQ/ZsCw6UHH7fbikNYbx6ekvqZSH6byGOP5ICWCHL7h16aIWTlkqpZ8y/UoSk5nVKhmjOT1xceeaf75FeFcHFtVX7hrko0v56q4PAQU9HDTis79G3NM6DA9u81jjaVTA91V9U2VIvZNlR/TNQw/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61ECC116B1
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 01:51:50 +0000 (UTC)
Date: Sun, 16 Jun 2024 03:51:48 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240616015150.D61ECC116B1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jun 16 03:00:46 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	91798162245991e26949ef62851719bb2177a9c2
v4l-utils git hash:	9b1ffffaa7408c1a4e55c2f375c66ad9a0cf16c4
edid-decode git hash:	2c4ba3ec64d0fd7ee4343f5f328c5c71f8282b74
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: be24540c169ec3016775f81d1a36b4133e96c7df
host hardware:		x86_64
host os:		6.5.0-35-generic

linux-git-arm: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
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

date:			Sun Jun 16 03:14:35 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Sun Jun 16 03:50:47 CEST 2024

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

