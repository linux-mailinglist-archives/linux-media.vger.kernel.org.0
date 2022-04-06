Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B704F576F
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 10:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241869AbiDFH47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 03:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381016AbiDFHpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 03:45:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F034913F2F
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 22:46:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70F09B81FB6
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 05:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96EBC385A1
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 05:46:42 +0000 (UTC)
Date:   Wed, 06 Apr 2022 07:46:40 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20220406054642.B96EBC385A1@smtp.kernel.org>
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

date:			Tue Apr  5 12:50:17 CEST 2022
media-tree git hash:	9f2b88f0d97b30cc8350e1f2b745cf3363d03d42
media_build git hash:	4e29721804ea4e824c776101214389642dccad98
v4l-utils git hash:	52b4b9f26e1f4ee606a4885c117c088d681887fe
edid-decode git hash:	34f9f9c7c1351b59ff6ede7fb693c80a35695f98
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-7874-g280282f9-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 21231e6216084b5681f29e22b1f47f97d59d8dc9
host hardware:		x86_64
host os:		5.16.0-1-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-at91: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
spec-git: OK
sparse: OK
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
