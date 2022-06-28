Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E367A55D603
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiF1El2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 00:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiF1El1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 00:41:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B7417E35
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 21:41:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D92B61712
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BC7C3411D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:41:24 +0000 (UTC)
Date:   Tue, 28 Jun 2022 06:41:22 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
Message-Id: <20220628044124.96BC7C3411D@smtp.kernel.org>
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

date:			Tue Jun 28 05:00:07 CEST 2022
media-tree git hash:	d8e8aa866ed8636fd6c1017c3d9453eab2922496
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	ef8c5223b4a5b2610e0dfbdff5257cf96c124f96
edid-decode git hash:	582c935652b0303b87ddad4551e6f97f8bb883ac
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-31-g4880bd19-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8015-g1a0af070-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 91f84ece3e3913f585d616d95c62decf7ca58e1f
host hardware:		x86_64
host os:		5.18.0-1-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-multi: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: OK
smatch: OK
kerneldoc: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
