Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3153576BE4
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 06:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiGPEm6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 00:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiGPEmv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 00:42:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9763C31937
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 21:42:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 659B460A56
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 04:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EECC34114
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 04:42:47 +0000 (UTC)
Date:   Sat, 16 Jul 2022 06:42:45 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220716044247.72EECC34114@smtp.kernel.org>
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

date:			Sat Jul 16 05:00:08 CEST 2022
media-tree git hash:	ca24fef0f2c857b0533f21f9a8a756f9e73d60fb
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	ae7f823bb2ea355bf2ea7039449ed2c71ec879be
edid-decode git hash:	582c935652b0303b87ddad4551e6f97f8bb883ac
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8093-gc82b58a1-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: d4d7757a52e4d94afde49d3080442d11dda83573
host hardware:		x86_64
host os:		5.18.0-2-amd64

linux-git-sh: OK
linux-git-arm-stm32: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: WARNINGS
virtme: ERRORS: Final Summary: 3077, Succeeded: 3076, Failed: 1, Warnings: 0
virtme-32: ERRORS: Final Summary: 3190, Succeeded: 3189, Failed: 1, Warnings: 0
sparse: OK
smatch: WARNINGS
kerneldoc: OK

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
