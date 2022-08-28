Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7810E5A3BDB
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 06:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbiH1Ewm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 00:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH1Ewj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 00:52:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3797C167ED
        for <linux-media@vger.kernel.org>; Sat, 27 Aug 2022 21:52:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C131960F35
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 04:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A00C433D6
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 04:52:36 +0000 (UTC)
Date:   Sun, 28 Aug 2022 06:52:35 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220828045236.D7A00C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Aug 28 05:00:09 CEST 2022
media-tree git hash:	1ff8334f0a4e0be693066aafba195d25629d77aa
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	f50720c40409bfd27056011da1350462b41af9d3
edid-decode git hash:	6816e6a691f40e6fbb64e6d40f012d7727c6315f
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8146-g91e779fd-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 788719112fbb0e9aefa9338293a4ce5e5d3cb602
host hardware:		x86_64
host os:		5.18.0-4-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-multi: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 3077, Succeeded: 3070, Failed: 7, Warnings: 0
virtme-32: ERRORS: Final Summary: 3190, Succeeded: 3180, Failed: 10, Warnings: 0
sparse: OK
smatch: OK
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Sunday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
