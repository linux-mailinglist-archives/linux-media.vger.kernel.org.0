Return-Path: <linux-media+bounces-14300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB091B4C6
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 03:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04A22840CC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 01:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5171429B;
	Fri, 28 Jun 2024 01:51:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CBA14267
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539482; cv=none; b=k6jS/lwkbzA9Q9Mxxt48j9nlaIOalgb5bmxp+rKUVsTRY67f+VHGV+WX9pBBLnJ/M3o1WU2GJiTKlpOsA5svWpf07tcZi7jcxT3UCmxFQc+cl7K79dS+4H1BM9bnbocJQk0rN2NWOWhEPmKRPqkvmz2z7mgYxmC7whUczECBO3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539482; c=relaxed/simple;
	bh=UTC9u4dTcJ2ISRooLMtm3CiqulpTOj/wI/9IIhbcWxk=;
	h=Date:From:To:Subject:Message-Id; b=iK1Q3vltvYX09r8QwwIto0OIre+2/RoVlusyTmf1kpZKvV+Wc4PuCUOefKrAnPuooayCOeqE7JKpl1au5Du/8eZuyk4PVwpDglY9nDU9N9zbIu+OzaFOpTXc7jmd8xa6dz5WIpHhI8JJaFxsYF/J9ESWJaUKGhg+/VFqZVQFC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C1DC2BBFC
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 01:51:21 +0000 (UTC)
Date: Fri, 28 Jun 2024 03:51:19 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240628015121.C0C1DC2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jun 28 03:00:14 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	57dd8f2f77bc85374fc06962110cad0259a1a495
v4l-utils git hash:	dd7e77c6ce3d123377fda037907c08d004bb2e50
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

date:			Fri Jun 28 03:14:11 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Fri Jun 28 03:50:17 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

