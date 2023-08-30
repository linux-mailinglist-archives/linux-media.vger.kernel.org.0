Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DB378D1CE
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 03:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241614AbjH3BqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 21:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241618AbjH3BqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 21:46:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A33A12D
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 18:46:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B7D6E60B24
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 01:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC19FC433C8
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 01:46:11 +0000 (UTC)
Date:   Wed, 30 Aug 2023 03:46:09 +0200
Message-ID: <13e3a4dba4ef97db8db93d98a5557522.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Aug 30 03:00:17 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	bf01dd96201a9430372c414e2efd6cef5cdc5c51
v4l-utils git hash:	75283d9ec59122ff52e3ccc6d59cdd6f8577ae76
edid-decode git hash:	5f723267e04deb3aa9610483514a02bcee10d9c2
gcc version:		i686-linux-gcc (GCC) 13.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8455-g78e3bddd
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 34cb998aab09b747e0985bd42a56e1619928d05d
host hardware:		x86_64
host os:		6.4.0-3-amd64

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

COMPILE_TEST: WARNINGS: VIDEOBUF_GEN VIDEOBUF_DMA_SG VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: ERRORS:

/usr/include/c++/13/cstdint:38:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/stl_algobase.h:59:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cctype:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cctype:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cctype:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/stl_algobase.h:59:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cstring:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cstring:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cctype:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cctype:41:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/cstdint:38:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/initializer_list:39:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory
/usr/include/c++/13/bits/requires_hosted.h:31:10: fatal error: bits/c++config.h: No such file or directory

spec-git: OK
kerneldoc: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 2

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
