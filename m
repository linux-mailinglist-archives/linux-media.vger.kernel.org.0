Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EE84F2237
	for <lists+linux-media@lfdr.de>; Tue,  5 Apr 2022 06:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiDEEs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 00:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiDEEst (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 00:48:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E556C913
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 21:44:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48B04B80DA1
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 04:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C42C340EE
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 04:44:48 +0000 (UTC)
Date:   Tue, 05 Apr 2022 06:44:46 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20220405044448.A5C42C340EE@smtp.kernel.org>
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

date:			Tue Apr  5 05:00:13 CEST 2022
media-tree git hash:	2afc1933fbc688f4ffbbdfc85126ac9b68c7e0b6
media_build git hash:	47e6d5a60b5da94db0118fa795dd0fcba646a0c7
v4l-utils git hash:	52b4b9f26e1f4ee606a4885c117c088d681887fe
edid-decode git hash:	85e8c9c70167030c1367493e0c2f15a903acf21f
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-7843-g5397282c-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 4b73e0f50a123901c96ab376be40a340da0b4439
host hardware:		x86_64
host os:		5.16.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: ERRORS
linux-4.4.283-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.308-i686: ERRORS
linux-4.9.308-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.273-i686: ERRORS
linux-4.14.273-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.236-i686: ERRORS
linux-4.19.236-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.144-i686: ERRORS
linux-5.4.144-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.18-i686: ERRORS
linux-5.8.18-x86_64: ERRORS
linux-5.9.16-i686: ERRORS
linux-5.9.16-x86_64: ERRORS
linux-5.10.62-i686: ERRORS
linux-5.10.62-x86_64: ERRORS
linux-5.11.22-i686: ERRORS
linux-5.11.22-x86_64: ERRORS
linux-5.12.19-i686: ERRORS
linux-5.12.19-x86_64: ERRORS
linux-5.13.14-i686: ERRORS
linux-5.13.14-x86_64: ERRORS
linux-5.14.1-i686: ERRORS
linux-5.14.1-x86_64: ERRORS
linux-5.15.1-i686: ERRORS
linux-5.15.1-x86_64: ERRORS
linux-5.16.1-i686: ERRORS
linux-5.16.1-x86_64: ERRORS
linux-5.17.1-i686: ERRORS
linux-5.17.1-x86_64: ERRORS
linux-5.18-rc1-i686: OK
linux-5.18-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
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
