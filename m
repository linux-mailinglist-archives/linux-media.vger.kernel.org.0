Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029F372A887
	for <lists+linux-media@lfdr.de>; Sat, 10 Jun 2023 04:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbjFJCnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 22:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjFJCnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 22:43:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5DA30F1
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 19:43:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B4E260BBB
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 02:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01734C433D2
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 02:43:42 +0000 (UTC)
Date:   Sat, 10 Jun 2023 04:43:40 +0200
Message-ID: <59e8ac6b3f1d8fd07375620e809824ba.hverkuil@xs4all.nl>
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

date:			Sat Jun 10 03:00:11 CEST 2023
media-tree git hash:	d78b9d6671decdaedb539635b1d0a34f8f5934f8
v4l-utils git hash:	57b6b2492f4ab472325eea6bfc75795e71181c2e
edid-decode git hash:	e48fb384fff4a86ccf81b6293c0358575fb9f092
gcc version:		i686-linux-gcc (GCC) 13.1.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8371-g475c3cec-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 7a744dc9cad9c3f99a9946a1027df30d84d663fb
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: WARNINGS
linux-git-arm-multi: WARNINGS
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: WARNINGS
spec-git: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 1
CONFIG_PM=n: OK
CONFIG_PM_SLEEP=n: WARNINGS
CONFIG_OF=n: WARNINGS
CONFIG_DEBUG_FS=n: WARNINGS
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
