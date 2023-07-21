Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED0875BBDE
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 03:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjGUBjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 21:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjGUBjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 21:39:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC102106
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 18:39:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4ECC161BBB
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 01:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5694CC433C8
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 01:39:42 +0000 (UTC)
Date:   Fri, 21 Jul 2023 03:39:40 +0200
Message-ID: <cd9be76603928a4a25ee9a02ef719b2a.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jul 21 03:00:08 CEST 2023
media-tree git branch:	media_stage/master
media-tree git hash:	28999781d15f94046e6c23a9a7d92ad28a436abf
v4l-utils git hash:	a092f27c5d26835e4c6262213b1af7cc2bf7dd06
edid-decode git hash:	a31e680438789d45207497bf999a20cf6e2c0ec1
gcc version:		i686-linux-gcc (GCC) 13.1.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8420-gf8f5766b
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 1d0b00f84db0492caa6af4073677f098acbae626
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
smatch.config: ERRORS
sparse.config: WARNINGS
no-of.config: WARNINGS
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
utils: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 2
Check pahole: ABI OK
kerneldoc: WARNINGS

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
