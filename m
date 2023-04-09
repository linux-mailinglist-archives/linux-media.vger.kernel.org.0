Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1323C6DC048
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 16:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjDIOKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 10:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjDIOKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 10:10:41 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BD5448D
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 07:10:31 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1plVkT-00Fq0e-7B; Sun, 09 Apr 2023 14:10:29 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1plVkP-0066k1-SR; Sun, 09 Apr 2023 14:10:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.4-1 (#91152)
Date:   Sun,  9 Apr 2023 14:10:25 +0000
Message-Id: <20230409141025.1455835-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <bf274a09-a823-c547-4284-603e8c6da794@redhat.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/bf274a09-a823-c547-4284-603e8c6da794@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/296238/
Build time: 00:52:43
Link: https://lore.kernel.org/linux-media/bf274a09-a823-c547-4284-603e8c6da794@redhat.com

gpg: Signature made Sun 09 Apr 2023 01:06:41 PM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC

Summary: got 27/39 patches with issues, being 26 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-atomisp-Remove-depth-mode-support.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3335 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3434 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2490 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1974630
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0002-media-atomisp-Remove-continuous-mode-support.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3139 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3238 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0003-media-atomisp-Remove-delayed_init-related-code.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3104 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3203 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0004-media-atomisp-Remove-crop_needs_override-from-atomis.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3104 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3203 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0005-media-atomisp-Remove-atomisp_css_enable_raw_binning.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3104 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3203 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0006-media-atomisp-Remove-atomisp_get_metadata_type.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3097 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3196 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0007-media-atomisp-Remove-unused-SOC_CAMERA-XENON_FLASH-a.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3095 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3194 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0008-media-atomisp-Remove-ATOMISP_USE_YUVPP.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3090 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3189 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0009-media-atomisp-Remove-yuvpp_mode.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3090 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3189 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0010-media-atomisp-Remove-online_process-setting.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0011-media-atomisp-Remove-remaining-instance-of-call-to-t.patch:

   checkpatch.pl:
	$ cat patches/0011-media-atomisp-Remove-remaining-instance-of-call-to-t.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0012-media-atomisp-Add-v4l2_get_acpi_sensor_info-helper.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0013-media-atomisp-ov2680-Use-v4l2_get_acpi_sensor_info-f.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'

patches/0014-media-atomisp-ov2680-Error-handling-fixes.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'

patches/0021-media-atomisp-gc0310-Remove-read-only-exposure-contr.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:169:35: error: ‘ctrl_ops’ defined but not used [-Werror=unused-const-variable=]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:252: drivers/staging/media/atomisp/i2c/atomisp-gc0310.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/staging/media/atomisp/i2c] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/staging/media/atomisp] Error 2
	make[4]: *** [../scripts/Makefile.build:494: drivers/staging/media] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/staging] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2028: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0022-media-atomisp-gc0310-Drop-custom-ATOMISP_IOC_S_EXPOS.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:71:35: error: ‘ctrl_ops’ defined but not used [-Werror=unused-const-variable=]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:252: drivers/staging/media/atomisp/i2c/atomisp-gc0310.o] Error 1
	make[6]: *** [../scripts/Makefile.build:494: drivers/staging/media/atomisp/i2c] Error 2
	make[5]: *** [../scripts/Makefile.build:494: drivers/staging/media/atomisp] Error 2
	make[4]: *** [../scripts/Makefile.build:494: drivers/staging/media] Error 2
	make[3]: *** [../scripts/Makefile.build:494: drivers/staging] Error 2
	make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2028: .] Error 2
	make: *** [Makefile:226: __sub-make] Error 2

patches/0027-media-atomisp-gc0310-Add-runtime-pm-support.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:339 gc0310_s_stream() warn: missing error code 'ret'

patches/0028-media-atomisp-gc0310-Use-devm_kzalloc-for-data-struc.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:339 gc0310_s_stream() warn: missing error code 'ret'

patches/0029-media-atomisp-gc0310-Switch-over-to-ACPI-powermanage.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'

patches/0030-media-atomisp-Remove-duplicate-atomisp_-start-stop-_.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0031-media-atomisp-Remove-continuous-mode-related-code-fr.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0032-media-atomisp-Remove-custom-V4L2_CID_FMT_AUTO-contro.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0033-media-atomisp-Remove-snr_mbus_fmt-local-var-from-ato.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0034-media-atomisp-Remove-unused-ATOM_ISP_MAX_WIDTH_TMP-a.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0035-media-atomisp-Remove-atomisp_try_fmt-call-from-atomi.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3085 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3184 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0036-media-atomisp-Drop-support-for-streaming-from-2-sens.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3015 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3114 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0037-media-atomisp-Remove-struct-atomisp_sub_device-index.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?


Error #512 when building PDF docs

