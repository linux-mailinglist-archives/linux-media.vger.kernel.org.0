Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526AC560E13
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 02:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiF3Adx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 20:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiF3Adw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 20:33:52 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0168222B26
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 17:33:50 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o6i7x-0082CQ-9s; Thu, 30 Jun 2022 00:33:49 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o6i7u-00989x-S1; Thu, 30 Jun 2022 00:33:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.20] Ar0521 driver, ov5640 driver improvements (#84446)
Date:   Thu, 30 Jun 2022 00:33:46 +0000
Message-Id: <20220630003346.2176271-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YrziQwGBS9CWAcpQ@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YrziQwGBS9CWAcpQ@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/220753/
Build time: 00:50:10
Link: https://lore.kernel.org/linux-media/YrziQwGBS9CWAcpQ@valkosipuli.retiisi.eu

gpg: Signature made Wed 29 Jun 2022 11:25:15 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 4/35 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ov7251-Fix-multiple-problems-in-s_stream-callback.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000008Kb sm_state_count = 543759
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 10 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4901 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/dvb-frontends/mb86a16.c: ../drivers/media/dvb-frontends/mb86a16.c:1394 mb86a16_set_fe() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:1935 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1723290
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 93 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/pci/saa7134/saa7134-dvb.c: ../drivers/media/pci/saa7134/saa7134-dvb.c:1935 dvb_init() parse error: turning off implications after 60 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2799 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0010-media-ov5640-Add-LINK_FREQ-control.patch:

   checkpatch.pl:
	$ cat patches/0010-media-ov5640-Add-LINK_FREQ-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:58: CHECK: Alignment should match open parenthesis

patches/0034-dt-bindings-Add-bindings-for-On-Semi-AR0521-camera-s.patch:

   checkpatch.pl:
	$ cat patches/0034-dt-bindings-Add-bindings-for-On-Semi-AR0521-camera-s.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0035-On-Semi-AR0521-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0035-On-Semi-AR0521-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:611: CHECK: Alignment should match open parenthesis
	-:628: CHECK: Macro argument reuse 'a' - possible side-effects?
	-:897: CHECK: Alignment should match open parenthesis
	-:1123: CHECK: Please use a blank line after function/struct/union/enum declarations


Error #512 when building PDF docs

