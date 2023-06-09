Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A62A729BF6
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239495AbjFINub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbjFINu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:50:28 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F7930FE
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:50:24 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7cVT-0008oL-5j; Fri, 09 Jun 2023 13:50:23 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7cVQ-00DnqI-28; Fri, 09 Jun 2023 13:50:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] v2: mediatek: vcodec: Add debugfs file for decode (#92381)
Date:   Fri,  9 Jun 2023 13:50:20 +0000
Message-Id: <20230609135020.3289812-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <8ba16cbc-5ff5-067d-d9d5-c7bd51a6a4f7@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/8ba16cbc-5ff5-067d-d9d5-c7bd51a6a4f7@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/313144/
Build time: 00:20:24
Link: https://lore.kernel.org/linux-media/8ba16cbc-5ff5-067d-d9d5-c7bd51a6a4f7@xs4all.nl

gpg: Signature made Wed 07 Jun 2023 01:45:54 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 7/8 patches with issues, being 6 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mediatek-vcodec-Add-debugfs-interface-to-get-d.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #512:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: In function ‘mtk_vcodec_dbgfs_init’:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:15:17: error: variable ‘vcodec_root’ set but not used [-Werror=unused-but-set-variable]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek/vcodec] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/mediatek] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
	make[4]: *** Waiting for unfinished jobs....
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000012Kb sm_state_count = 1965307
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 56 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2026: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0001-media-mediatek-vcodec-Add-debugfs-interface-to-get-d.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:38: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:74: WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

patches/0002-media-mediatek-vcodec-Add-debug-params-to-control-di.patch:

   checkpatch.pl:
	$ cat patches/0002-media-mediatek-vcodec-Add-debug-params-to-control-di.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:74: CHECK: Macro argument reuse 'h' - possible side-effects?

patches/0003-media-mediatek-vcodec-Add-a-debugfs-file-to-get-diff.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:56 mtk_vcodec_dbgfs_remove() error: we previously assumed 'dbgfs_inst' could be null (see line 57)

   checkpatch.pl:
	$ cat patches/0003-media-mediatek-vcodec-Add-a-debugfs-file-to-get-diff.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:136: CHECK: struct mutex definition without comment

patches/0004-media-mediatek-vcodec-Get-each-context-resolution-in.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:98 mtk_vcodec_dbgfs_remove() error: we previously assumed 'dbgfs_inst' could be null (see line 99)

patches/0005-media-mediatek-vcodec-Get-each-instance-format-type.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:146 mtk_vcodec_dbgfs_remove() error: we previously assumed 'dbgfs_inst' could be null (see line 147)

patches/0006-media-mediatek-vcodec-Change-dbgfs-interface-to-supp.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:146 mtk_vcodec_dbgfs_remove() error: we previously assumed 'dbgfs_inst' could be null (see line 147)

patches/0008-media-mediatek-vcodec-Add-dbgfs-help-function.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c:168 mtk_vcodec_dbgfs_remove() error: we previously assumed 'dbgfs_inst' could be null (see line 169)


Error #512 when building PDF docs

