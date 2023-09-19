Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39387A646D
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjISNJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 09:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjISNJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 09:09:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB49F0
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 06:09:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE9AC433C8
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:09:03 +0000 (UTC)
Date:   Tue, 19 Sep 2023 15:09:01 +0200
Message-ID: <834142f4f77399965452891188b63fc4.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Sep 15 03:19:41 CEST 2023
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
build-scripts git hash: 92d01fef7a3c5282ea710b84ad337c0944e3d549
host hardware:		x86_64
host os:		6.4.13-cobaltpc1

linux-git-arm: (18 string truncate warnings) OK
linux-git-arm64: (16 string truncate warnings) OK
linux-git-powerpc64: (30 string truncate warnings) OK
linux-git-i686: OK
linux-git-x86_64: (54 string truncate warnings) OK
no-acpi.config: (38 string truncate warnings) OK
no-of.config: (39 string truncate warnings) OK
no-pm.config: (41 string truncate warnings) OK
no-pm-sleep.config: (41 string truncate warnings) OK
no-debug-fs.config: (40 string truncate warnings) OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: (41 string truncate warnings) WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

COMPILE_TEST: WARNINGS: VIDEOBUF_GEN VIDEOBUF_DMA_SG VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri Sep 15 03:35:32 CEST 2023
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 5
virtme-32: OK: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 0

date:			Fri Sep 15 04:04:24 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
