Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC39764373
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 03:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjG0BkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 21:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjG0BkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 21:40:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4FC1FF5
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 18:40:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F2A861CE7
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED76C433CA
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:40:10 +0000 (UTC)
Date:   Thu, 27 Jul 2023 03:40:08 +0200
Message-ID: <ffa5ae3399b70c536178cef9a817fb1b.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Jul 27 03:00:08 CEST 2023
media-tree git branch:	media_stage/master
media-tree git hash:	7baeedbe2bc6fac7d54f73e44605f6b7b40158ab
v4l-utils git hash:	08e42fb5c8423868a363e860cf1297d79b1dd2ed
edid-decode git hash:	a31e680438789d45207497bf999a20cf6e2c0ec1
gcc version:		i686-linux-gcc (GCC) 13.1.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8428-ga2e6ca07
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 1d0b00f84db0492caa6af4073677f098acbae626
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: WARNINGS
linux-git-x86_64: OK
smatch.config: ERRORS
sparse.config: WARNINGS
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
Check COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
utils: OK
spec-git: OK
virtme: OK: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 5
Check pahole: ABI OK
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
