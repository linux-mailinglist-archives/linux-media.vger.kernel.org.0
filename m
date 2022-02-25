Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D114C3E33
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 07:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbiBYGHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 01:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237633AbiBYGHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 01:07:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8D97C796
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 22:07:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9333A61A02
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 06:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FC3C340E7
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 06:07:10 +0000 (UTC)
Date:   Fri, 25 Feb 2022 07:07:08 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20220225060710.A9FC3C340E7@smtp.kernel.org>
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

date:			Fri Feb 25 05:00:13 CET 2022
media-tree git hash:	2881ca629984b949ec9ac2e8ba1e64a2f0b66e8b
media_build git hash:	d5d4c1ff328b8464bd0f55aea299ab5f2a7856ec
v4l-utils git hash:	40a51ea5538182d7c3856ece1c75c7ebca967a84
edid-decode git hash:	2e51bef7a835028251aa8ae5f2c31a7a9758ac63
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5a84266d391eb878f83b081540507f76650111aa
host hardware:		x86_64
host os:		5.15.0-3-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: OK
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15.1-i686: OK
linux-5.15.1-x86_64: OK
linux-5.16.1-i686: OK
linux-5.16.1-x86_64: OK
linux-5.17-rc1-i686: OK
linux-5.17-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: Warnings: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 1
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

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
