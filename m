Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459C56B8815
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 03:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjCNCJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 22:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCNCJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 22:09:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D1972B0B
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 19:09:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA761B8169D
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 02:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34874C433EF
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 02:09:06 +0000 (UTC)
Date:   Tue, 14 Mar 2023 03:09:04 +0100
Message-ID: <13c7e70b702967402c55186e442287ad.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Mar 14 03:00:09 CET 2023
media-tree git hash:	eeac8ede17557680855031c6f305ece2378af326
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	cb77676c3a25db34180f76541f0ab353327e94be
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
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: WARNINGS: VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
virtme-32: ERRORS
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
