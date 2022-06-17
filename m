Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DB954F060
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 06:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379861AbiFQEnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 00:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379952AbiFQEnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 00:43:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB4D2FE5A
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 21:43:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A8BDB826F9
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 04:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57929C3411B
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 04:43:04 +0000 (UTC)
Date:   Fri, 17 Jun 2022 06:43:02 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20220617044304.57929C3411B@smtp.kernel.org>
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

date:			Fri Jun 17 05:00:11 CEST 2022
media-tree git hash:	83916ec5a8c7faaeb8209f2d0763ce2e08f61f65
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	b9054747fdf0ba6c98085d4e4b96f49847787a6f
edid-decode git hash:	582c935652b0303b87ddad4551e6f97f8bb883ac
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-30-g92122700-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8015-g1a0af070-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 1a541cf873a0024fd0b9f1fa5dc9806fd65e3ead
host hardware:		x86_64
host os:		5.17.0-1-rt-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-powerpc64: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: OK
smatch: OK
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
