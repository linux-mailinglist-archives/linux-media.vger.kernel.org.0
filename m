Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6154E571A8F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 14:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiGLMyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 08:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiGLMyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 08:54:39 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449C37172E
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 05:54:37 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBFPP-007h8H-DO; Tue, 12 Jul 2022 12:54:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBFPN-006wkC-7o; Tue, 12 Jul 2022 12:54:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] hantro/cedrus/vb2 updates (#84790)
Date:   Tue, 12 Jul 2022 12:54:33 +0000
Message-Id: <20220712125433.1655734-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <55858df1-6d8a-befe-5301-809665b9f2e3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/55858df1-6d8a-befe-5301-809665b9f2e3@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/224254/
Build time: 00:55:46
Link: https://lore.kernel.org/linux-media/55858df1-6d8a-befe-5301-809665b9f2e3@xs4all.nl

gpg: Signature made Tue 12 Jul 2022 11:42:41 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 12/19 patches with issues, being 12 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-Add-P010-tiled-format.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5539 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2854 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-Add-P010-tiled-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:73: WARNING: line length of 165 exceeds 100 columns
	-:85: ERROR: trailing statements should be on next line
	-:97: WARNING: line length of 107 exceeds 100 columns

patches/0009-media-cedrus-h265-Fix-logic-for-not-low-delay-flag.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0010-media-cedrus-Improve-error-messages-for-controls.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0011-media-cedrus-Add-error-handling-for-failed-setup.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0012-videobuf2-Introduce-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0013-mediatek-vcodec-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0014-tegra-vde-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0015-vicodec-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0016-hantro-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0017-rkvdec-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0017-rkvdec-Use-vb2_find_buffer.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: CHECK: Comparison to NULL could be written "run->ref_buf[ref->index]"

patches/0018-cedrus-Use-vb2_find_buffer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0018-cedrus-Use-vb2_find_buffer.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:50: WARNING: please, no spaces at the start of a line
	-:51: WARNING: please, no spaces at the start of a line
	-:54: WARNING: please, no spaces at the start of a line
	-:55: WARNING: please, no spaces at the start of a line

patches/0019-videobuf2-Remove-vb2_find_timestamp.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #512:
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:316:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	../drivers/staging/media/sunxi/cedrus/cedrus_h265.c:323:40: error: ‘const struct v4l2_hevc_dpb_entry’ has no member named ‘pic_order_cnt_val’; did you mean ‘pic_order_cnt’?
	make[6]: *** [../scripts/Makefile.build:249: drivers/staging/media/sunxi/cedrus/cedrus_h265.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi/cedrus] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/sunxi] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

