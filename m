Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE67258EB13
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbiHJLPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiHJLPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:15:38 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EDA55097
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:15:37 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oLjgV-00C68x-Hl; Wed, 10 Aug 2022 11:15:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oLjgS-00CpM4-Vu; Wed, 10 Aug 2022 11:15:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.1] dw100: Add i.MX8MP dw100 dewarper driver (#85285)
Date:   Wed, 10 Aug 2022 11:15:32 +0000
Message-Id: <20220810111532.3057298-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <507d4249-5061-b6c4-12d9-aa77ec7a4d48@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/507d4249-5061-b6c4-12d9-aa77ec7a4d48@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/232381/
Build time: 00:50:55
Link: https://lore.kernel.org/linux-media/507d4249-5061-b6c4-12d9-aa77ec7a4d48@xs4all.nl

gpg: Signature made Wed 10 Aug 2022 08:13:01 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 11/13 patches with issues, being 7 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-v4l2-ctrls-allocate-space-for-arrays.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5539 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2878 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1725655
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds

patches/0002-v4l2-ctrls-alloc-arrays-in-ctrl_ref.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1725655
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5517 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-v4l2-ctrls-add-v4l2_ctrl_modify_dimensions.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725648
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 51 seconds
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5429 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2846 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-v4l2-ctrls-add-change-flag-for-when-dimensions-chang.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1936 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4593 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000020Kb sm_state_count = 1725648
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 60 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2836 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-v4l2-ctrls-optimize-type_ops-for-arrays.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5077 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2260 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1724849
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 74 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/pci/saa7134/saa7134-dvb.c: ../drivers/media/pci/saa7134/saa7134-dvb.c:1933 dvb_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0007-v4l2-ctrls-Export-default-v4l2_ctrl_type_ops-callbac.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4835 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2128 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1724319
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 76 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2810 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds

patches/0008-media-Documentation-dw100-Add-user-documentation-for.patch:

   checkpatch.pl:
	$ cat patches/0008-media-Documentation-dw100-Add-user-documentation-for.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-media-v4l-uapi-Add-user-control-base-for-DW100-contr.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4857 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:1832 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1722506
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 100 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/pci/saa7134/saa7134-dvb.c: ../drivers/media/pci/saa7134/saa7134-dvb.c:1935 dvb_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2799 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0010-media-uapi-Add-a-control-for-DW100-driver.patch:

   checkpatch.pl:
	$ cat patches/0010-media-uapi-Add-a-control-for-DW100-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:45: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0011-media-dt-bindings-media-Add-i.MX8MP-DW100-binding.patch:

   checkpatch.pl:
	$ cat patches/0011-media-dt-bindings-media-Add-i.MX8MP-DW100-binding.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0012-media-dw100-Add-i.MX8MP-dw100-dewarper-driver.patch:

   checkpatch.pl:
	$ cat patches/0012-media-dw100-Add-i.MX8MP-dw100-dewarper-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:59: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1837: CHECK: Prefer using the BIT macro


Error #512 when building PDF docs

