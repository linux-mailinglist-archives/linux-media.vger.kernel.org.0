Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 609C77BB027
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 03:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjJFBqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 21:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjJFBqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 21:46:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D382D8
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 18:46:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598B0C433C7
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 01:46:40 +0000 (UTC)
Date:   Fri, 06 Oct 2023 03:46:38 +0200
Message-ID: <29ad458051092daa8cbef0dc73c76afe.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
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

date:			Fri Oct  6 03:00:09 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	135b40f46aa67e7655cea124ce1ce624e5d1a093
v4l-utils git hash:	99c4f6dd80613c7bd1fe02bd34492bbd4c999fea
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8471-g6f3cce86
sparse version:		v0.5.0-8471-g6f3cce86
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: ce72105881befed252121ffc203e7c155e655c05
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
drivers/media/common/siano/smscoreapi.c:650 smscore_register_device() warn: use 'gfp_buf_flags' here instead of GFP_KERNEL?
drivers/media/common/siano/smscoreapi.c:689 smscore_register_device() warn: use 'gfp_buf_flags' here instead of GFP_KERNEL?
drivers/media/i2c/s5c73m3/s5c73m3-core.c:1412 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1412.
drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
drivers/media/i2c/ar0521.c:913 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 913.
drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
  Locked on  : 326,387
  Unlocked on: 465,467
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get() warn: passing zero to 'PTR_ERR'
drivers/staging/media/ipu3/ipu3-dmamap.c:42 imgu_dmamap_alloc_buffer() warn: use 'gfp' here instead of GFP_KERNEL?
drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
drivers/media/i2c/tc358746.c:790 tc358746_set_fmt() error: 'fmt' dereferencing possible ERR_PTR()
drivers/media/i2c/tc358746.c:1624 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1624.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri Oct  6 03:17:16 CEST 2023
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 2

date:			Fri Oct  6 03:44:54 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
