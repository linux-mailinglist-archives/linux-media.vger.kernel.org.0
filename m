Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7396C095C
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 04:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCTDiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 23:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCTDiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 23:38:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3476F950
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 20:38:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A9AA6114B
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 03:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273A7C433D2
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 03:38:17 +0000 (UTC)
Date:   Mon, 20 Mar 2023 04:38:16 +0100
Message-ID: <64f9ed9bb1878862c7ff2f61a5b2a316.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Mar 20 03:00:08 CET 2023
media-tree git hash:	ce875a29b1ad5ee54197c0aada74093b6567e36d
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	69968a5e37b54d961553ec268d726dfa4b78d421
edid-decode git hash:	2d44e1b01c7ed7d65b20ecdce62d354841832201
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8298-gcfe12a9b-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: ad510d0d6fd0486d26012f5b269d601ecceaaf9a
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Monday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Monday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Monday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Monday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
