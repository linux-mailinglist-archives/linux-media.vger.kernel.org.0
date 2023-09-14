Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D2479F679
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 03:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbjINBnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 21:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjINBnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 21:43:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F17E1BD0
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 18:43:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8220DC433C8
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 01:43:06 +0000 (UTC)
Date:   Thu, 14 Sep 2023 03:43:04 +0200
Message-ID: <1678187c669127469ab12178b8571e28.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Sep 14 03:00:09 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	0835b195d034ab98b148b8e9c81a862c0c557bb7
v4l-utils git hash:	b79e00a74fde35d0c0bb801b78b15664d3f10309
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8463-g52e9a454
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6914effe706a1aae6c1b80c34dd03990ef343dbd
host hardware:		x86_64
host os:		6.4.13-cobaltpc1

linux-git-arm: WARNINGS:
linux-git-arm64: WARNINGS:
linux-git-powerpc64: WARNINGS:
linux-git-i686: OK
linux-git-x86_64: WARNINGS:
no-acpi.config: WARNINGS:
no-of.config: WARNINGS:
no-pm.config: WARNINGS:
no-pm-sleep.config: WARNINGS:
no-debug-fs.config: WARNINGS:
sparse: WARNINGS:
smatch: WARNINGS:
COMPILE_TEST: WARNINGS: VIDEOBUF_GEN VIDEOBUF_DMA_SG VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 5
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 6

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
