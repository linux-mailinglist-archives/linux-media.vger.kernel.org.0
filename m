Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9063F6B1A09
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 04:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCIDlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 22:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjCIDlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 22:41:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04B91ABEC
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 19:41:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 870AF61A02
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 03:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FABC433EF
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 03:41:33 +0000 (UTC)
Date:   Thu, 09 Mar 2023 04:41:31 +0100
Message-ID: <41421bee9b06a7d92342588320dac066.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
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

date:			Thu Mar  9 03:00:06 CET 2023
media-tree git hash:	3e62aba8284de0994a669d07983299242e68fe72
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	ebbeb59ba888293718b61ece0f89b244fee2d605
edid-decode git hash:	d740dde3540a257a8974d2250b76049c119a473b
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8250-g3ed42e4c-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 7118b386b41c7ddc9937a707027b16ff8308b5aa
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
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 3080, Succeeded: 3069, Failed: 11, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 1
sparse: OK
smatch: WARNINGS
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
