Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6415674E469
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 04:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjGKCmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 22:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjGKCmv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 22:42:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367E1188
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 19:42:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8332612D8
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 02:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AC7C433C7
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 02:42:48 +0000 (UTC)
Date:   Tue, 11 Jul 2023 04:42:46 +0200
Message-ID: <ce4c9210baae3d81d1c953faf8995b59.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
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

date:			Tue Jul 11 03:00:07 CEST 2023
media-tree git hash:	06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
v4l-utils git hash:	16e70e28584c3462b4a0745266cecc39d1fbb945
edid-decode git hash:	a31e680438789d45207497bf999a20cf6e2c0ec1
gcc version:		i686-linux-gcc (GCC) 13.1.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		0.6.4 (Debian: 0.6.4-3)
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: bcd4e5dee79033a35bb5249cb87d4e71a6929448
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-sh: ERRORS
linux-git-arm: WARNINGS
linux-git-powerpc64: WARNINGS
linux-git-arm64: WARNINGS
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: WARNINGS
spec-git: OK
virtme: OK: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 0
CONFIG_PM=n: OK
CONFIG_PM_SLEEP=n: WARNINGS
CONFIG_DEBUG_FS=n: WARNINGS
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
