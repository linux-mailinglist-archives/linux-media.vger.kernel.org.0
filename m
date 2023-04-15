Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797816E32AD
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 19:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjDORAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 13:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjDORAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 13:00:45 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4075F44B8
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 10:00:13 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pnjFq-001sby-R6; Sat, 15 Apr 2023 17:00:02 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pnjFo-009u7F-IB; Sat, 15 Apr 2023 17:00:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.4] NXP i.MX8 ISI driver (#91323)
Date:   Sat, 15 Apr 2023 17:00:00 +0000
Message-Id: <20230415170000.2360615-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230415163404.GA31708@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230415163404.GA31708@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/297965/
Build time: 00:21:42
Link: https://lore.kernel.org/linux-media/20230415163404.GA31708@pendragon.ideasonboard.com

gpg: Signature made Sat 15 Apr 2023 04:10:56 PM UTC
gpg:                using EDDSA key C09EF871B3827B413F971CA9CC3F2D800327DE64
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 2/5 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-dt-bindings-media-Add-i.MX8-ISI-DT-bindings.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000020Kb sm_state_count = 1974589
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 56 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0001-dt-bindings-media-Add-i.MX8-ISI-DT-bindings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch:

   checkpatch.pl:
	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:98: WARNING: please write a help paragraph that fully describes the config symbol
	-:112: WARNING: please write a help paragraph that fully describes the config symbol
	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst


Error #512 when building PDF docs

