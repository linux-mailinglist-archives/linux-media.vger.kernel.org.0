Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37354560110
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 15:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiF2NMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 09:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiF2NMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 09:12:14 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F941DA75
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 06:12:10 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o6XUH-007Klw-6v; Wed, 29 Jun 2022 13:12:09 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o6XUF-00621G-0O; Wed, 29 Jun 2022 13:12:07 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] Various fixes, Allwinner A31/A83T CSI driver (#84435)
Date:   Wed, 29 Jun 2022 13:12:06 +0000
Message-Id: <20220629131206.1437684-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c894bf0f-d61a-13ea-82a0-c078286d702a@xs4all.nl>
References: 
MIME-Version: 1.0
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/c894bf0f-d61a-13ea-82a0-c078286d702a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/220626/
Build time: 00:33:15
Link: https://lore.kernel.org/linux-media/c894bf0f-d61a-13ea-82a0-c078286d702a@xs4all.nl

gpg: Signature made Wed 29 Jun 2022 12:33:21 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 9/17 patches with issues, being 3 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-cx18-Fix-typo-in-comments.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000008Kb sm_state_count = 543759
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 13 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5143 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2344 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1724941
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 68 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-gspca-drop-unexpected-word-is-in-the-comments.patch:

   checkpatch.pl:
	$ cat patches/0002-media-gspca-drop-unexpected-word-is-in-the-comments.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible repeated word: 'is'

patches/0004-media-pvrusb2-drop-unexpected-word-a-in-comments.patch:

   checkpatch.pl:
	$ cat patches/0004-media-pvrusb2-drop-unexpected-word-a-in-comments.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: WARNING: Block comments use a trailing */ on a separate line

patches/0005-media-platform-mtk-mdp-Fix-mdp_ipi_comm-structure-al.patch:

   checkpatch.pl:
	$ cat patches/0005-media-platform-mtk-mdp-Fix-mdp_ipi_comm-structure-al.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:45: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0008-media-Fix-incorrect-P010-chroma-order-description.patch:

   checkpatch.pl:
	$ cat patches/0008-media-Fix-incorrect-P010-chroma-order-description.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: ERROR: trailing statements should be on next line

patches/0013-dt-bindings-media-Add-Allwinner-A31-MIPI-CSI-2-bindi.patch:

   checkpatch.pl:
	$ cat patches/0013-dt-bindings-media-Add-Allwinner-A31-MIPI-CSI-2-bindi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0014-media-sunxi-Add-support-for-the-A31-MIPI-CSI-2-contr.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'

   checkpatch.pl:
	$ cat patches/0014-media-sunxi-Add-support-for-the-A31-MIPI-CSI-2-contr.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:63: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:69: WARNING: please write a help paragraph that fully describes the config symbol

patches/0016-dt-bindings-media-Add-Allwinner-A83T-MIPI-CSI-2-bind.patch:

   checkpatch.pl:
	$ cat patches/0016-dt-bindings-media-Add-Allwinner-A83T-MIPI-CSI-2-bind.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0017-media-sunxi-Add-support-for-the-A83T-MIPI-CSI-2-cont.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'

   checkpatch.pl:
	$ cat patches/0017-media-sunxi-Add-support-for-the-A83T-MIPI-CSI-2-cont.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:83: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:89: WARNING: please write a help paragraph that fully describes the config symbol


Error #512 when building PDF docs

