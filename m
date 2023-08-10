Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE492776D9A
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjHJBnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbjHJBnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:43:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE73FD
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:43:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2F7764610
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 01:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CA3C433C8
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 01:43:06 +0000 (UTC)
Date:   Thu, 10 Aug 2023 03:43:04 +0200
Message-ID: <2844688c136c735603b0419cc2e7f434.hverkuil@xs4all.nl>
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

date:			Thu Aug 10 03:00:08 CEST 2023
media-tree git branch:	media_stage/master
media-tree git hash:	c0f209bc6ce60d4662436100a263e82dfae76a8e
v4l-utils git hash:	4a6a3725dd192759c2998311b00440b84c60df57
edid-decode git hash:	5f723267e04deb3aa9610483514a02bcee10d9c2
gcc version:		i686-linux-gcc (GCC) 13.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8446-g178bea2c
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: d6242670a0296c2b72d9f1aff78ad73b8a13cc0b
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: ERRORS:

drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
drivers/media/v4l2-core/videobuf-core.c:66 videobuf_alloc_vb() error: we previously assumed 'q->int_ops' could be null (see line 61)
drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address of NULL pointer 'rules'
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

COMPILE_TEST: WARNINGS: VIDEOBUF_VMALLOC VIDEOBUF_DMA_CONTIG
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 2

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
