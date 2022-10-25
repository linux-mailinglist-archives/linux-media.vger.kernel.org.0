Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F4B60C228
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 05:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiJYDQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 23:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiJYDQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 23:16:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2971229807
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 20:16:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA076B819B8
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A53C433D6
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:16:18 +0000 (UTC)
Date:   Tue, 25 Oct 2022 05:16:17 +0200
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20221025031619.26A53C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Oct 25 03:00:13 CEST 2022
media-tree git hash:	247f34f7b80357943234f93f247a1ae6b6c3a740
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	f86484524f326bbf5c16d4bb485bfb8bd22cb6d0
edid-decode git hash:	f1ff7ad7bcb2fbb85017bbb2baa6bed37c412895
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8162-g696da5a8-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 94af8c625f6730ceef6e3713c61217c31ee868dd
host hardware:		x86_64
host os:		5.19.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-pxa: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm64: WARNINGS
linux-git-arm-multi: WARNINGS
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 0
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
