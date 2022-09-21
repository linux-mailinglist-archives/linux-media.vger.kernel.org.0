Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C65BF43B
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 05:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiIUDT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 23:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiIUDTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 23:19:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1F757264
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 20:19:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E50A620FD
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 03:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CA5C433C1
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 03:19:22 +0000 (UTC)
Date:   Wed, 21 Sep 2022 05:19:20 +0200
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220921031922.76CA5C433C1@smtp.kernel.org>
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

date:			Wed Sep 21 03:00:10 CEST 2022
media-tree git hash:	f7ec3f62d7736ed14050716943a9562879155fcc
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	7034cb79d853c35f825c9f53056f8ef7fa8c3d27
edid-decode git hash:	791ce31e7dc64f674cf2c24aebdc86f689f86eac
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8146-g91e779fd-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: aea37f0f63c35e4e20a4bd0c7758c33838d6dde0
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
linux-git-x86_64: WARNINGS
linux-git-i686: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 3080, Succeeded: 3069, Failed: 11, Warnings: 0
virtme-32: ERRORS: Final Summary: 3193, Succeeded: 3182, Failed: 11, Warnings: 0
sparse: WARNINGS
smatch: ERRORS
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
