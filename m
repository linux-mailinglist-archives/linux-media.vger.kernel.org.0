Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7707376DA
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 23:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjFTV4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 17:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjFTV4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 17:56:20 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0421730
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 14:56:18 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qBjKi-005uAO-86; Tue, 20 Jun 2023 21:56:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qBjKe-00Gf7B-JA; Tue, 20 Jun 2023 21:56:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.6] V4L2 patches of all kind plus more (#92655)
Date:   Tue, 20 Jun 2023 21:56:12 +0000
Message-Id: <20230620215612.3971247-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZJIVvXtDlP2OtS3X@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZJIVvXtDlP2OtS3X@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/316365/
Build time: 00:39:06
Link: https://lore.kernel.org/linux-media/ZJIVvXtDlP2OtS3X@valkosipuli.retiisi.eu

gpg: Signature made Tue 20 Jun 2023 08:55:21 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 13/56 patches with issues, being 4 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-cec-ch7322-drop-of_match_ptr-for-ID-table.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: ../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:347 vdec_msg_queue_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1963540
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 54 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2878 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0026-media-dt-bindings-cadence-csi2rx-Convert-to-DT-schem.patch:

   checkpatch.pl:
	$ cat patches/0026-media-dt-bindings-cadence-csi2rx-Convert-to-DT-schem.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:131: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0031-media-ipu3-cio2-rename-cio2-bridge-to-ipu-bridge-and.patch:

   checkpatch.pl:
	$ cat patches/0031-media-ipu3-cio2-rename-cio2-bridge-to-ipu-bridge-and.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:188: CHECK: Lines should not end with a '('
	-:213: CHECK: Lines should not end with a '('
	-:218: CHECK: Lines should not end with a '('
	-:270: CHECK: Lines should not end with a '('

patches/0033-media-ipu3-cio2-rename-ipu3-cio2-main.c-back-to-ipu3.patch:

   checkpatch.pl:
	$ cat patches/0033-media-ipu3-cio2-rename-ipu3-cio2-main.c-back-to-ipu3.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0034-media-MAINTAINERS-Assign-Shawn-Tu-s-sensor-drivers-t.patch:

   checkpatch.pl:
	$ cat patches/0034-media-MAINTAINERS-Assign-Shawn-Tu-s-sensor-drivers-t.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

patches/0035-media-MAINTAINERS-Add-an-entry-for-V4L2-sensor-and-l.patch:

   checkpatch.pl:
	$ cat patches/0035-media-MAINTAINERS-Add-an-entry-for-V4L2-sensor-and-l.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
	-:36: WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order

patches/0048-dt-bindings-i2c-Add-I2C-Address-Translator-ATR.patch:

   checkpatch.pl:
	$ cat patches/0048-dt-bindings-i2c-Add-I2C-Address-Translator-ATR.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0050-dt-bindings-media-add-TI-DS90UB913-FPD-Link-III-Seri.patch:

   checkpatch.pl:
	$ cat patches/0050-dt-bindings-media-add-TI-DS90UB913-FPD-Link-III-Seri.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0051-dt-bindings-media-add-TI-DS90UB953-FPD-Link-III-Seri.patch:

   checkpatch.pl:
	$ cat patches/0051-dt-bindings-media-add-TI-DS90UB953-FPD-Link-III-Seri.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0052-dt-bindings-media-add-TI-DS90UB960-FPD-Link-III-Dese.patch:

   checkpatch.pl:
	$ cat patches/0052-dt-bindings-media-add-TI-DS90UB960-FPD-Link-III-Dese.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0053-media-i2c-add-DS90UB960-driver.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1671 ub960_rxport_add_serializer() error: 'rxport->ser.client' dereferencing possible ERR_PTR()
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

   checkpatch.pl:
	$ cat patches/0053-media-i2c-add-DS90UB960-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:54: WARNING: please write a help paragraph that fully describes the config symbol
	-:1949: CHECK: Alignment should match open parenthesis
	-:2575: CHECK: Alignment should match open parenthesis
	-:2578: CHECK: Alignment should match open parenthesis
	-:2579: WARNING: line length of 101 exceeds 100 columns
	-:2694: CHECK: Lines should not end with a '('
	-:2721: CHECK: Lines should not end with a '('
	-:2777: CHECK: Lines should not end with a '('

patches/0054-media-i2c-add-DS90UB913-driver.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:475 ub913_log_status() error: uninitialized symbol 'v'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.

   checkpatch.pl:
	$ cat patches/0054-media-i2c-add-DS90UB913-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:27: WARNING: please write a help paragraph that fully describes the config symbol
	-:56: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:673: CHECK: Alignment should match open parenthesis

patches/0055-media-i2c-add-DS90UB953-driver.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

   checkpatch.pl:
	$ cat patches/0055-media-i2c-add-DS90UB953-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:27: WARNING: please write a help paragraph that fully describes the config symbol
	-:56: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

