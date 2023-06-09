Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3FC72941E
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240868AbjFIJFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240988AbjFIJFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:05:30 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CB91BF0
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:05:25 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7Y3f-0001xy-S4; Fri, 09 Jun 2023 09:05:24 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7Y3c-007ku9-2T; Fri, 09 Jun 2023 09:05:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] Venus updates (#92280)
Date:   Fri,  9 Jun 2023 09:05:19 +0000
Message-Id: <20230609090519.1848551-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230530214033.293439-1-stanimir.k.varbanov@gmail.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230530214033.293439-1-stanimir.k.varbanov@gmail.com/
Build log: https://builder.linuxtv.org/job/patchwork/313143/
Build time: 00:48:34
Link: https://lore.kernel.org/linux-media/20230530214033.293439-1-stanimir.k.varbanov@gmail.com

gpg: Signature made Tue 30 May 2023 09:29:43 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 16/16 patches with issues, being 16 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-venus-simplify-the-return-expression-of-sessio.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #512:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5539 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2344 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2579 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1743)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() parse error: OOM: 3003332Kb sm_state_count = 1951368
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 75 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/saa7134/saa7134-dvb.c: ../drivers/media/pci/saa7134/saa7134-dvb.c:1935 dvb_init() parse error: turning off implications after 60 seconds
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0002-media-venus-simplify-the-return-expression-of-venus_.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0003-media-venus-helpers-Fix-ALIGN-of-non-power-of-two.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0004-media-venus-hfi_cmds-Replace-fake-flex-array-with-fl.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0005-media-venus-Replace-one-element-arrays-with-flexible.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0006-media-venus-hfi_cmds-Replace-one-element-array-with-.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0007-media-venus-hfi_cmds-Use-struct_size-helper.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0008-venus-add-firmware-version-based-check.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: ../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:347 vdec_msg_queue_init() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0009-venus-enable-sufficient-sequence-change-support-for-.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0010-venus-fix-EOS-handling-in-decoder-stop-command.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0011-venus-replace-arrary-index-with-enum-for-supported-f.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0012-venus-add-support-for-V4L2_PIX_FMT_P010-color-format.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0013-venus-update-calculation-for-dpb-buffers.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0014-venus-add-handling-of-bit-depth-change-from-firmwar.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0015-venus-return-P010-as-preferred-format-for-10-bit-dec.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0016-media-venus-provide-ctx-queue-lock-for-ioctl-synchro.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	../drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:32: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0016-media-venus-provide-ctx-queue-lock-for-ioctl-synchro.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: CHECK: struct mutex definition without comment


Error #512 when building PDF docs

