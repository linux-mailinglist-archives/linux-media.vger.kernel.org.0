Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BCD5A5A16
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 05:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiH3Det (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 23:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiH3Dek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 23:34:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D1174CF1
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 20:34:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2864B81619
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 03:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F7DC433C1
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 03:34:35 +0000 (UTC)
Date:   Tue, 30 Aug 2022 05:34:33 +0200
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220830033435.D2F7DC433C1@smtp.kernel.org>
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

date:			Tue Aug 30 03:00:07 CEST 2022
media-tree git hash:	3e9ad662e34eb2d42ddef5a2883abd34461dfd9a
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	bddb4428e7e693786a3780b450efe0d95c3ff5d1
edid-decode git hash:	6816e6a691f40e6fbb64e6d40f012d7727c6315f
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8146-g91e779fd-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 58e8c0c5c672f481658251305fa6056ffb1d376b
host hardware:		x86_64
host os:		5.18.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: WARNINGS
linux-git-arm64: WARNINGS
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: ERRORS
spec-git: OK
virtme: ERRORS: Final Summary: 3080, Succeeded: 3069, Failed: 11, Warnings: 1
virtme-32: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: OK

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
