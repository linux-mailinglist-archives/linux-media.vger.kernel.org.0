Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7F517CBB
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 07:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiECE6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 00:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbiECE6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 00:58:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8AD3EBAE
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 21:54:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7337C614CF
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 04:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E641C385AF
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 04:54:27 +0000 (UTC)
Date:   Tue, 03 May 2022 06:54:20 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Message-Id: <20220503045427.8E641C385AF@smtp.kernel.org>
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

date:			Tue May  3 05:00:14 CEST 2022
media-tree git hash:	6c1c1eb8c87de221051b9198d40971640060842f
media_build git hash:	4e29721804ea4e824c776101214389642dccad98
v4l-utils git hash:	163144712a46229f3476b04f6c0037c4b7f00299
edid-decode git hash:	8a8d673d738ce010ca32a179032e8f6c0bb5dfb4
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-7905-g3ef4ed38-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: d0fc820c1f699f668ebea38361aebe1a1241fdfc
host hardware:		x86_64
host os:		5.16.0-1-amd64

linux-git-sh: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-at91: OK
linux-git-arm-multi: OK
linux-git-arm-davinci: OK
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
linux-4.9.308-i686: OK
linux-4.9.308-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.275-i686: OK
linux-4.14.275-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.237-i686: OK
linux-4.19.237-x86_64: OK
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
linux-5.10.109-i686: OK
linux-5.10.109-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.19-i686: OK
linux-5.13.19-x86_64: OK
linux-5.14.21-i686: OK
linux-5.14.21-x86_64: OK
linux-5.15.32-i686: OK
linux-5.15.32-x86_64: OK
linux-5.16.9-i686: OK
linux-5.16.9-x86_64: OK
linux-5.17.1-i686: OK
linux-5.17.1-x86_64: OK
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
