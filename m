Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CDB6C9F36
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 11:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbjC0JTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 05:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjC0JTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 05:19:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C70212E
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 02:19:14 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pgj0S-007uLI-VW; Mon, 27 Mar 2023 09:19:12 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pgj0Q-0037I7-Nf; Mon, 27 Mar 2023 09:19:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.4] mtk-mdp3: Add support for multiple chips (#90836)
Date:   Mon, 27 Mar 2023 09:19:10 +0000
Message-Id: <20230327091910.742965-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <27b81968-54ad-0203-9ea5-3f2615dba02e@xs4all.nl>
References: 
MIME-Version: 1.0
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/27b81968-54ad-0203-9ea5-3f2615dba02e@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/292760/
Build time: 00:22:38
Link: https://lore.kernel.org/linux-media/27b81968-54ad-0203-9ea5-3f2615dba02e@xs4all.nl

gpg: Signature made Mon 27 Mar 2023 07:47:12 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 4/12 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-platform-mtk-mdp3-fix-potential-frame-size-ove.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3357 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3456 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2490 mxc_jpeg_probe() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000020Kb sm_state_count = 1974898
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-platform-mtk-mdp3-add-files-for-chip-configura.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c ../drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c:34:34: warning: symbol 'mt8183_mdp_driver_data' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0002-media-platform-mtk-mdp3-add-files-for-chip-configura.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0010-media-platform-mtk-mdp3-Split-general-definitions-us.patch:

   checkpatch.pl:
	$ cat patches/0010-media-platform-mtk-mdp3-Split-general-definitions-us.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:103: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0011-media-platform-mtk-mdp3-decompose-hardware-related-i.patch:

   checkpatch.pl:
	$ cat patches/0011-media-platform-mtk-mdp3-decompose-hardware-related-i.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:78: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:279: CHECK: Macro argument reuse 'cfg' - possible side-effects?
	-:284: CHECK: Macro argument reuse 'cfg' - possible side-effects?
	-:295: CHECK: Macro argument reuse 'cfg' - possible side-effects?
	-:312: CHECK: Macro argument reuse 'comp' - possible side-effects?


Error #512 when building PDF docs

