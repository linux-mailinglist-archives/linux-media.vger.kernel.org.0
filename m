Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9BE563E84
	for <lists+linux-media@lfdr.de>; Sat,  2 Jul 2022 06:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiGBEmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jul 2022 00:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiGBEmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jul 2022 00:42:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925EC2409F
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 21:42:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4897EB83200
        for <linux-media@vger.kernel.org>; Sat,  2 Jul 2022 04:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43E9C34114
        for <linux-media@vger.kernel.org>; Sat,  2 Jul 2022 04:42:18 +0000 (UTC)
Date:   Sat, 02 Jul 2022 06:42:16 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220702044218.A43E9C34114@smtp.kernel.org>
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

date:			Sat Jul  2 05:00:17 CEST 2022
media-tree git hash:	d8e8aa866ed8636fd6c1017c3d9453eab2922496
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	33ad0c66db3aac8a9d72864ac84a2fb65d7a6878
edid-decode git hash:	582c935652b0303b87ddad4551e6f97f8bb883ac
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-30-g92122700-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8015-g1a0af070-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 91f84ece3e3913f585d616d95c62decf7ca58e1f
host hardware:		x86_64
host os:		5.18.0-2-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.302-i686: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.9.315-i686: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.14.280-i686: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.19.244-i686: ERRORS
linux-4.20.17-i686: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.4.195-i686: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.8.18-i686: ERRORS
linux-5.9.16-i686: ERRORS
linux-5.10.117-i686: ERRORS
linux-5.11.22-i686: ERRORS
linux-5.12.19-i686: ERRORS
linux-5.13.19-i686: ERRORS
linux-5.14.21-i686: ERRORS
linux-5.15.41-i686: ERRORS
linux-5.16.20-i686: ERRORS
linux-5.17.9-i686: ERRORS
linux-5.18.1-i686: ERRORS
linux-5.19-rc1-i686: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: OK
smatch: OK
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
