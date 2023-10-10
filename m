Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE147BF075
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 03:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379372AbjJJBpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 21:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379327AbjJJBps (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 21:45:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787ED8F
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 18:45:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD258C433C8
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:45:45 +0000 (UTC)
Date:   Tue, 10 Oct 2023 03:45:43 +0200
Message-ID: <c3906ca48ba2f9f8dcffb1829e236f8d.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Oct 10 03:00:07 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
v4l-utils git hash:	99c4f6dd80613c7bd1fe02bd34492bbd4c999fea
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8471-g6f3cce86
sparse version:		v0.5.0-8471-g6f3cce86
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 842db433707b21980cbfcc82837152be22752510
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
drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
  Locked on  : 326,387
  Unlocked on: 465,467
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get() warn: passing zero to 'PTR_ERR'
drivers/media/i2c/tc358746.c:790 tc358746_set_fmt() error: 'fmt' dereferencing possible ERR_PTR()

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Oct 10 03:16:59 CEST 2023
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 5

date:			Tue Oct 10 03:44:28 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
