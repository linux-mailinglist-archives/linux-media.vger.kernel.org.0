Return-Path: <linux-media+bounces-9647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8518A7A41
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 03:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EDB11C20DC3
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 01:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613101C02;
	Wed, 17 Apr 2024 01:51:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EB1860
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713318665; cv=none; b=XY1HG03QGnub5uqKVANWfU2VwBtw19lTmdmlhIicX80Bt3H4Zh1o86dcjNLZTACeDMqDJHv5mdV+4fkkAxNXrcAcnsyA2geSn1Nyqim6hyoFxlctUPeYdtpaAYqGnHTTNQ+c6C7M9fk09J+stU0LKxKFXwb3CcvX/Df3Z6AJByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713318665; c=relaxed/simple;
	bh=BQEltcexsdiziaTcUvRKrRCanpzYWssWfodj/elvc7o=;
	h=Date:From:To:Subject:Message-Id; b=rC/OlquUtNU0mqvgevxTDPNpqUExu3RYvy0dMP1wZ0Cvj9YhWl+U2xnwM+SorhK1nCRNwjZ/8FpuhsrFwb60LAr9VNZvGIBtaSrPH8rO5Yj4e5a2jaeAUJzmJ6HcxyQuTBHm1nKPsHs0cD2GdggSDWFvsz0qbiQce5fKsEAWDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA8DC113CE
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 01:51:03 +0000 (UTC)
Date: Wed, 17 Apr 2024 03:51:02 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240417015104.2FA8DC113CE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Apr 17 03:00:14 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	836e2548524d2dfcb5acaf3be78f203b6b4bde6f
v4l-utils git hash:	7997d8076c07c33ab5324e4d52092451598d9d40
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8635-g375ffc07
sparse version:		v0.5.0-8635-g375ffc07
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

date:			Wed Apr 17 03:13:41 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Wed Apr 17 03:49:47 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

