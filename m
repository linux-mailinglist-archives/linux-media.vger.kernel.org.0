Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE6C7C4766
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 03:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344546AbjJKBqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 21:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344487AbjJKBqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 21:46:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4269D
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 18:46:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB41C433C8
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 01:46:05 +0000 (UTC)
Date:   Wed, 11 Oct 2023 03:46:03 +0200
Message-ID: <60be161e12a5675b0b218fc4eeb77077.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Oct 11 03:00:07 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
v4l-utils git hash:	8bf6cba8c0ef601a63fe160bd4750196991b65ac
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8471-g6f3cce86
sparse version:		v0.5.0-8471-g6f3cce86
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 76ba8c4dc9dc358fea09859cf91badee97c50b4a
host hardware:		x86_64
host os:		6.5.0-1-amd64

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

drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'
drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
  Locked on  : 326,387
  Unlocked on: 465,467
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get() warn: passing zero to 'PTR_ERR'
drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
drivers/media/i2c/tc358746.c:790 tc358746_set_fmt() error: 'fmt' dereferencing possible ERR_PTR()

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Wed Oct 11 03:17:12 CEST 2023
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 4

date:			Wed Oct 11 03:44:43 CEST 2023

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
