Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D58711E18
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 04:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjEZCml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 22:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjEZCml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 22:42:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8EAB2
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 19:42:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB64E64546
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE9DC433EF
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:42:37 +0000 (UTC)
Date:   Fri, 26 May 2023 04:42:35 +0200
Message-ID: <2dd081b49690dee0c996f7de01c1cde3.hverkuil@xs4all.nl>
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

date:			Fri May 26 03:00:11 CEST 2023
media-tree git hash:	11aaa0ec9c1848bb68df9c7e6eedab6d5b0a3cca
v4l-utils git hash:	52926c1f2f03aebe34d96056e8380ab07c8f512d
edid-decode git hash:	2d44e1b01c7ed7d65b20ecdce62d354841832201
gcc version:		i686-linux-gcc (GCC) 12.3.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8371-g475c3cec-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: c6b5ee0c2b818760b6918027287c68c84e147b74
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: WARNINGS
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: WARNINGS
spec-git: OK
virtme: OK: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 0
CONFIG_PM=n: WARNINGS
CONFIG_PM_SLEEP=n: WARNINGS
CONFIG_OF=n: WARNINGS
sparse: WARNINGS
smatch: ERRORS
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
