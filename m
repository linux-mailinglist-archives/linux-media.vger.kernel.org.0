Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62937B6A48
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbjJCNU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 09:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbjJCNUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 09:20:18 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A621BFF
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 06:19:40 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qnfJL-004jQm-8t; Tue, 03 Oct 2023 13:19:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qnfJI-00GI0R-1h;
        Tue, 03 Oct 2023 13:19:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.7] Camera sensor patches, preparation for enabling (#95536)
Date:   Tue,  3 Oct 2023 13:19:35 +0000
Message-Id: <20231003131935.3882454-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZRwJNg5Ez6iSBINf@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZRwJNg5Ez6iSBINf@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/345037/
Build time: 00:45:51
Link: https://lore.kernel.org/linux-media/ZRwJNg5Ez6iSBINf@valkosipuli.retiisi.eu

gpg: Signature made Tue 03 Oct 2023 12:22:28 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 4/46 patches with issues, being 2 at build time

Error/warnings:

patches/0001-media-ov9282-Assign-maintenance-to-Dave.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3003988Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 4 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: OOM: 3014560Kb sm_state_count = 1757213
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 52 seconds
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/mgb4/mgb4_sysfs_out.c: ../drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
	../drivers/media/pci/mgb4/mgb4_sysfs_out.c: ../drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2854 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0007-media-i2c-Add-driver-for-onsemi-MT9M114-camera-senso.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/mt9m114.c: ../drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?

   checkpatch.pl:
	$ cat patches/0007-media-i2c-Add-driver-for-onsemi-MT9M114-camera-senso.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:183: CHECK: Prefer using the BIT macro
	-:188: CHECK: Prefer using the BIT macro
	-:196: CHECK: Prefer using the BIT macro
	-:199: CHECK: Prefer using the BIT macro
	-:225: CHECK: Prefer using the BIT macro
	-:230: CHECK: Prefer using the BIT macro
	-:235: CHECK: Prefer using the BIT macro
	-:245: CHECK: Prefer using the BIT macro
	-:348: CHECK: Prefer using the BIT macro

patches/0036-media-ccs-Use-sub-device-active-state.patch:

   checkpatch.pl:
	$ cat patches/0036-media-ccs-Use-sub-device-active-state.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:416: CHECK: multiple assignments should be avoided

patches/0046-media-Documentation-Split-camera-sensor-documentatio.patch:

   checkpatch.pl:
	$ cat patches/0046-media-Documentation-Split-camera-sensor-documentatio.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:194: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

