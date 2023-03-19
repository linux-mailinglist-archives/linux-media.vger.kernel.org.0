Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48306C01BE
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 13:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjCSMrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 08:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjCSMrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 08:47:20 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3741DB85
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 05:47:16 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pdsRP-003Hia-9F; Sun, 19 Mar 2023 12:47:15 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pdsRM-005c0p-F5; Sun, 19 Mar 2023 12:47:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.4] Various fixes and enhancements (#90443)
Date:   Sun, 19 Mar 2023 12:47:12 +0000
Message-Id: <20230319124712.1337713-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <a5d6312b-1129-2369-6acf-4d1cce4ee403@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/a5d6312b-1129-2369-6acf-4d1cce4ee403@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/290890/
Build time: 00:30:51
Link: https://lore.kernel.org/linux-media/a5d6312b-1129-2369-6acf-4d1cce4ee403@xs4all.nl

gpg: Signature made Mon 13 Mar 2023 03:11:17 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 9/24 patches with issues, being 3 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-tc358746-Remove-unneeded-semicolon.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3357 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3456 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2485 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1939314
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/i2c/ov5670.c: ../drivers/media/i2c/ov5670.c:2670 ov5670_probe() warn: passing zero to 'PTR_ERR'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2878 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0001-media-tc358746-Remove-unneeded-semicolon.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Reported-by: should be immediately followed by Link: with a URL to the report

patches/0003-media-dt-bindings-silabs-si470x-Convert-to-DT-schema.patch:

   checkpatch.pl:
	$ cat patches/0003-media-dt-bindings-silabs-si470x-Convert-to-DT-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:51: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0004-media-dvb-frontends-Fix-a-typo-Unknow-sleep-mode.patch:

   checkpatch.pl:
	$ cat patches/0004-media-dvb-frontends-Fix-a-typo-Unknow-sleep-mode.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: 'Unknow' may be misspelled - perhaps 'Unknown'?

patches/0005-media-drop-unnecessary-networking-includes.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1973361
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 54 seconds

patches/0006-media-mxl5005s-Bounds-check-size-used-for-max-array-.patch:

   checkpatch.pl:
	$ cat patches/0006-media-mxl5005s-Bounds-check-size-used-for-max-array-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:38: CHECK: Avoid CamelCase: <Init_Ctrl>
	-:52: CHECK: Avoid CamelCase: <CH_Ctrl>

patches/0007-media-imx-jpeg-Bounds-check-sizeimage-access.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2490 mxc_jpeg_probe() warn: missing unwind goto?

   checkpatch.pl:
	$ cat patches/0007-media-imx-jpeg-Bounds-check-sizeimage-access.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-media-cx23885-Fix-a-null-ptr-deref-bug-in-buffer_pre.patch:

   checkpatch.pl:
	$ cat patches/0015-media-cx23885-Fix-a-null-ptr-deref-bug-in-buffer_pre.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:58: CHECK: Alignment should match open parenthesis
	-:64: CHECK: Alignment should match open parenthesis
	-:73: CHECK: Alignment should match open parenthesis
	-:81: CHECK: Alignment should match open parenthesis
	-:89: CHECK: Alignment should match open parenthesis

patches/0018-media-pci-tw68-Fix-null-ptr-deref-bug-in-buf-prepare.patch:

   checkpatch.pl:
	$ cat patches/0018-media-pci-tw68-Fix-null-ptr-deref-bug-in-buf-prepare.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:42: CHECK: Alignment should match open parenthesis
	-:47: CHECK: Alignment should match open parenthesis
	-:52: CHECK: Alignment should match open parenthesis
	-:58: CHECK: Alignment should match open parenthesis
	-:65: CHECK: Alignment should match open parenthesis

patches/0020-mtk-jpegenc-Fix-a-compilation-issue.patch:

   checkpatch.pl:
	$ cat patches/0020-mtk-jpegenc-Fix-a-compilation-issue.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

