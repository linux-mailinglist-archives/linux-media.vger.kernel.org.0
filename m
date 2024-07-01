Return-Path: <linux-media+bounces-14431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102E91D5E5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 03:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B39A91C20DC6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 01:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDA16FD3;
	Mon,  1 Jul 2024 01:51:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EADC2D6
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 01:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719798703; cv=none; b=Ve3+El9cTxRj0X7gZArDcAHCOJJLa4Sr36VODvX2zJTVkH9b7dXBaSF8TTFt7FX8zSjyOgOibhzakT0QiCrXqGtHW0Ak5sJSaKyILJ5g+c3Jj39z8f6GsydZgP5rQVYb+hKBPn+irRcjVL66ebg9g1r162VZIU7JtXrSaBgFzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719798703; c=relaxed/simple;
	bh=dYchIza9K4UGDUsmfzPnNRCnCEcWXcX4XW1kJxUihVg=;
	h=Date:From:To:Subject:Message-Id; b=Gk+YBNgxCbRM+C4CWQLu7svI2bSsRgOQK9/SkX1pJVIzxCu8/m6SJmO35zI5nISV1jgeR7lQsgmnT/fMy9JrlkBEEt0bYqh1fzr+L6pKbFln/T9w5LEz64GbQGmzxXfrZCRGStbBAWpv0ovHtaLJhwm2OEPcqzwdEQhpsAv+zEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68515C2BD10
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 01:51:42 +0000 (UTC)
Date: Mon, 01 Jul 2024 03:51:40 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20240701015142.68515C2BD10@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Jul  1 03:00:12 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a0157b5aa34eb43ec4c5510f9c260bbb03be937e
v4l-utils git hash:	a0fd7261492d3ffeb33a3ad2e25e3642a23e01a2
edid-decode git hash:	5d66c548e93acac1ab09675aa424912a4be879a8
gcc version:		i686-linux-gcc (GCC) 14.1.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8660-g2dd6476c
sparse version:		v0.5.0-8660-g2dd6476c
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

date:			Mon Jul  1 03:14:17 CEST 2024
virtme-64: OK: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 0

date:			Mon Jul  1 03:50:35 CEST 2024

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

