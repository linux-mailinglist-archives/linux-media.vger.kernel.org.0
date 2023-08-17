Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58AF77EECF
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 03:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347580AbjHQBoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 21:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242470AbjHQBnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 21:43:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE17E2723
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 18:43:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8974A61701
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 01:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F97C433C7
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 01:43:49 +0000 (UTC)
Date:   Thu, 17 Aug 2023 03:43:47 +0200
Message-ID: <85211f4f233841da24e0f0c2acefb87c.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Aug 17 03:00:07 CEST 2023
media-tree git branch:	media_stage/master
media-tree git hash:	b7ec3212a73abc987e8f33aa42988e6c39c38c92
v4l-utils git hash:	dcbaba173ec7446487fa042902627ad64143eb53
edid-decode git hash:	5f723267e04deb3aa9610483514a02bcee10d9c2
gcc version:		i686-linux-gcc (GCC) 13.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8455-g78e3bddd
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 64b9acdbeb6231921e825acfde310a83dd3ce225
host hardware:		x86_64
host os:		6.1.0-5-amd64

linux-git-arm: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: ERRORS:

drivers/media/pci/intel/ivsc/mei_ace.c: In function 'mei_ace_post_probe_work':
drivers/media/pci/intel/ivsc/mei_ace.c:454:9: error: implicit declaration of function 'acpi_dev_clear_dependencies' [-Werror=implicit-function-declaration]
  454 |         acpi_dev_clear_dependencies(adev);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

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
