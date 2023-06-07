Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5159725DF4
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 14:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbjFGMFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 08:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236481AbjFGMFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 08:05:39 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4F51BDD
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 05:05:28 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q6run-00GnGG-2b; Wed, 07 Jun 2023 12:05:25 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q6ruj-000jGr-RY; Wed, 07 Jun 2023 12:05:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.5-1 (#92375)
Date:   Wed,  7 Jun 2023 12:05:21 +0000
Message-Id: <20230607120521.173975-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/312678/
Build time: 00:32:55
Link: https://lore.kernel.org/linux-media/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com

gpg: Signature made Wed 07 Jun 2023 10:20:25 AM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC

Summary: got 69/87 patches with issues, being 68 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-atomisp-sh_css-Remove-ifdef-ISP2401.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000020Kb sm_state_count = 1963868
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0001-media-atomisp-sh_css-Remove-ifdef-ISP2401.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:397: WARNING: Too many leading tabs - consider code refactoring

patches/0005-media-atomisp-sh_css_mipi-Remove-ifdef-ISP2401.patch:

   checkpatch.pl:
	$ cat patches/0005-media-atomisp-sh_css_mipi-Remove-ifdef-ISP2401.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:120: WARNING: line length of 114 exceeds 100 columns
	-:120: WARNING: Prefer using '"%s...", __func__' to using 'free_mipi_frames', this function's name, in a string

patches/0006-media-atomisp-Remove-res_overflow-parameter-from-ato.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0007-media-atomisp-Remove-Continuous-capture-and-SDV-run-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0008-media-atomisp-Remove-isp-need_gfx_throttle-field.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0010-media-atomisp-Replace-source-pad-checks-with-run-mod.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0011-media-atomisp-Register-only-1-dev-video-node.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3008 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3107 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0012-media-atomisp-Drop-atomisp_is_vf_pipe.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3008 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3107 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0013-media-atomisp-Rename-video_out_preview-to-video_out.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3008 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3107 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0014-media-atomisp-Remove-source_pad-parameter-from-funct.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3007 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3106 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0015-media-atomisp-Remove-1-line-atomisp_flush_bufs_and_w.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3001 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3100 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0016-media-atomisp-Remove-atomisp_subdev_register_video_n.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3001 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3100 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0017-media-atomisp-Remove-a-bunch-of-unused-atomisp_css_-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3001 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3100 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0018-media-atomisp-Remove-unused-mipi_frame_size-field-fr.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3001 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3100 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0019-media-atomisp-Remove-isp_timeout-flag.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2999 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3098 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0023-media-atomisp-Simplify-atomisp_open-and-atomisp_rele.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?

patches/0025-media-atomisp-Turn-asd-streaming-state-tracker-into-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2994 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3093 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0026-media-atomisp-Remove-no-longer-used-atomisp_css_flus.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2981 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3080 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0027-media-atomisp-Remove-atomisp_streaming_count.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2981 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3080 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0028-media-atomisp-Simplify-atomisp_isr-and-recovery_work.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2953 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3052 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0029-media-atomisp-Rename-atomisp_destroy_pipes_stream_fo.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2953 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3052 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0030-media-atomisp-Allow-system-suspend-to-continue-with-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2953 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3052 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0031-media-atomisp-Remove-atomisp_-sub-dev_users.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:522 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2953 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3052 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0032-media-atomisp-Remove-unused-css_pipe_id-argument-fro.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:522 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2950 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3049 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0033-media-atomisp-Remove-unused-atomisp_get_css_pipe_id-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:522 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2950 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3049 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0034-media-atomisp-Remove-in_reset-argument-from-atomisp_.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:522 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0035-media-atomisp-Set-asd.subdev.devnode-once-from-isp_s.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?

patches/0036-media-atomisp-gc0310-Drop-XXGC0310-ACPI-hardware-id.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'

patches/0037-media-atomisp-gc0310-Fix-double-free-in-gc0310_remov.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'

patches/0038-media-atomisp-gc0310-Cleanup-includes.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:205 gc0310_s_stream() warn: missing error code 'ret'

patches/0039-media-atomisp-gc0310-Remove-gc0310_s_config-function.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:208 gc0310_s_stream() warn: missing error code 'ret'

patches/0040-media-atomisp-gc0310-Remove-gc0310.h.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:448 gc0310_s_stream() warn: missing error code 'ret'

   checkpatch.pl:
	$ cat patches/0040-media-atomisp-gc0310-Remove-gc0310.h.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:279: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0041-media-atomisp-Drop-MRFLD_PORT_NUM-define.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0042-media-atomisp-Remove-unused-fields-from-struct-atomi.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0043-media-atomisp-Remove-atomisp_video_init-parametrizat.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0044-media-atomisp-Rename-__get_mipi_port-to-atomisp_port.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0045-media-atomisp-Store-number-of-sensor-lanes-per-port-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:448 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0046-media-atomisp-Delay-mapping-sensors-to-inputs-till-a.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0047-media-atomisp-Move-pad-linking-to-atomisp_register_d.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0048-media-atomisp-Allow-camera_mipi_info-to-be-NULL.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0049-media-atomisp-Switch-i2c-drivers-back-to-use-.probe.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:448 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'

patches/0052-media-atomisp-Add-support-for-v4l2-async-sensor-regi.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c: ../drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:623 atomisp_csi2_connect_sensors() warn: we never enter this loop
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2956 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3055 atomisp_cp_morph_table() warn: missing unwind goto?

   checkpatch.pl:
	$ cat patches/0052-media-atomisp-Add-support-for-v4l2-async-sensor-regi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:181: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:578: WARNING: line length of 116 exceeds 100 columns
	-:758: WARNING: line length of 102 exceeds 100 columns

patches/0053-media-atomisp-ov2680-Turn-into-standard-v4l2-sensor-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:401 ov2680_s_stream() warn: missing error code 'ret'

patches/0054-media-atomisp-gc0310-Turn-into-standard-v4l2-sensor-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'

   checkpatch.pl:
	$ cat patches/0054-media-atomisp-gc0310-Turn-into-standard-v4l2-sensor-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:67: WARNING: line length of 105 exceeds 100 columns

patches/0059-media-atomisp-ov2680-s-ov2680_device-ov2680_dev.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:401 ov2680_s_stream() warn: missing error code 'ret'

patches/0060-media-atomisp-ov2680-s-input_lock-lock.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:401 ov2680_s_stream() warn: missing error code 'ret'

patches/0061-media-atomisp-ov2680-Add-missing-ov2680_calc_mode-ca.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:403 ov2680_s_stream() warn: missing error code 'ret'

patches/0062-media-atomisp-ov2680-Add-init_cfg-pad-op.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:418 ov2680_s_stream() warn: missing error code 'ret'

patches/0063-media-atomisp-ov2680-Implement-selection-support.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:478 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 470)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:526 ov2680_s_stream() warn: missing error code 'ret'

patches/0064-media-atomisp-Remove-a-bunch-of-sensor-related-custo.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0065-media-atomisp-Remove-redundant-atomisp_subdev_set_se.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0066-media-atomisp-Simplify-atomisp_subdev_set_selection-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0068-media-atomisp-Remove-bogus-fh-use-from-atomisp_set_f.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0069-media-atomisp-Add-input-helper-variable-for-isp-asd-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4141 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4125)

patches/0070-media-atomisp-Add-ia_css_frame_pad_width-helper-func.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4141 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4125)

patches/0071-media-atomisp-Refactor-atomisp_try_fmt-atomisp_set_f.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4180 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4164)

patches/0072-media-atomisp-Add-support-for-sensors-which-implemen.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4178 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4163)

patches/0073-media-atomisp-Pass-MEDIA_BUS_FMT_-code-when-calling-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4178 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4163)

patches/0074-media-atomisp-Make-atomisp_init_sensor-check-if-the-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4178 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4163)

patches/0075-media-atomisp-Use-selection-API-info-to-determine-se.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4206 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4191)

   checkpatch.pl:
	$ cat patches/0075-media-atomisp-Use-selection-API-info-to-determine-se.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:49: CHECK: Alignment should match open parenthesis

patches/0076-media-atomisp-Set-crop-before-setting-fmt.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4251 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4236)

   checkpatch.pl:
	$ cat patches/0076-media-atomisp-Set-crop-before-setting-fmt.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:51: CHECK: Alignment should match open parenthesis

patches/0079-media-atomisp-Take-minimum-padding-requirement-on-BY.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4284 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4269)

patches/0080-media-atomisp-Make-atomisp_enum_framesizes_crop-chec.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:520 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

patches/0081-media-atomisp-Fix-binning-check-in-atomisp_set_crop.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

   checkpatch.pl:
	$ cat patches/0081-media-atomisp-Fix-binning-check-in-atomisp_set_crop.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: CHECK: Alignment should match open parenthesis

patches/0082-media-atomisp-Stop-resetting-selected-input-to-0-bet.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?

patches/0083-media-atomisp-ov2680-Stop-using-half-pixelclock-for-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:472 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 464)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:520 ov2680_s_stream() warn: missing error code 'ret'

patches/0084-media-atomisp-ov2680-Remove-unnecessary-registers-fr.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'

   checkpatch.pl:
	$ cat patches/0084-media-atomisp-ov2680-Remove-unnecessary-registers-fr.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:61: WARNING: line length of 102 exceeds 100 columns

patches/0085-media-atomisp-ov2680-Rename-unknown-0x370a-to-sensor.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'

patches/0087-media-atomisp-csi2-bridge-Add-support-for-setting-cl.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)


Error #512 when building PDF docs

