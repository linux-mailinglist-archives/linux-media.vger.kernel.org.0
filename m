Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E22256A8F7
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 19:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbiGGRDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 13:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235809AbiGGRDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 13:03:11 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8874D14E
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 10:03:10 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o9UuD-0013pM-5g; Thu, 07 Jul 2022 17:03:09 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o9UuB-000o8O-1j; Thu, 07 Jul 2022 17:03:07 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] Linux Media vimc update for 5.20-rc1 (#84630)
Date:   Thu,  7 Jul 2022 17:03:06 +0000
Message-Id: <20220707170306.192670-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7e719640-80e6-b3ab-751a-156b8e74d87b@linuxfoundation.org>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7e719640-80e6-b3ab-751a-156b8e74d87b@linuxfoundation.org/
Build log: https://builder.linuxtv.org/job/patchwork/222946/
Build time: 00:27:01
Link: https://lore.kernel.org/linux-media/7e719640-80e6-b3ab-751a-156b8e74d87b@linuxfoundation.org

gpg: Signature made Thu 07 Jul 2022 04:16:22 PM UTC
gpg:                using RSA key 3D92B29BF459B8E086780FE40B0244C40D0D431C
gpg: Good signature from "Shuah Khan <shuah@gonehiking.org>" [full]
gpg:                 aka "Shuah Khan <shuah@kernel.org>" [unknown]
gpg:                 aka "Shuah Khan (gmail) <shuahkhan@gmail.com>" [full]
gpg:                 aka "Shuah Khan (Linux Foundation work address) <skhan@linuxfoundation.org>" [unknown]

Summary: got 4/5 patches with issues, being 4 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-vimc-add-ancillary-lens.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000012Kb sm_state_count = 543759
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 8 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5077 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 51 seconds
	../drivers/media/test-drivers/vimc/vimc-core.c: ../drivers/media/test-drivers/vimc/vimc-core.c:194 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2818 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1961 vivid_create_instance() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-vimc-add-ancillary-lens.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:209: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0002-media-vimc-expand-the-names-of-vimc-entity-types.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vimc/vimc-core.c: ../drivers/media/test-drivers/vimc/vimc-core.c:194 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'

   checkpatch.pl:
	$ cat patches/0002-media-vimc-expand-the-names-of-vimc-entity-types.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:53: CHECK: Alignment should match open parenthesis
	-:62: CHECK: Alignment should match open parenthesis
	-:74: CHECK: Alignment should match open parenthesis
	-:87: CHECK: Alignment should match open parenthesis
	-:96: CHECK: Alignment should match open parenthesis
	-:116: WARNING: quoted string split across lines
	-:140: CHECK: Alignment should match open parenthesis
	-:149: CHECK: Alignment should match open parenthesis
	-:189: CHECK: Alignment should match open parenthesis
	-:280: CHECK: Alignment should match open parenthesis
	-:367: CHECK: Alignment should match open parenthesis
	-:417: CHECK: Alignment should match open parenthesis
	-:976: WARNING: quoted string split across lines
	-:1602: CHECK: Alignment should match open parenthesis
	-:1618: CHECK: Alignment should match open parenthesis
	-:1627: CHECK: Alignment should match open parenthesis
	-:1636: CHECK: Alignment should match open parenthesis
	-:1650: CHECK: Alignment should match open parenthesis
	-:1665: CHECK: Alignment should match open parenthesis
	-:1679: CHECK: Alignment should match open parenthesis
	-:1721: CHECK: Alignment should match open parenthesis
	-:1730: CHECK: Alignment should match open parenthesis
	-:1748: CHECK: Alignment should match open parenthesis
	-:1760: CHECK: Alignment should match open parenthesis
	-:1773: CHECK: Alignment should match open parenthesis
	-:1793: CHECK: Alignment should match open parenthesis
	-:1884: CHECK: Alignment should match open parenthesis
	-:1921: CHECK: Alignment should match open parenthesis
	-:1955: CHECK: Alignment should match open parenthesis
	-:2174: WARNING: quoted string split across lines

patches/0003-media-vimc-enumerate-data-link-entities-for-clarity.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vimc/vimc-core.c: ../drivers/media/test-drivers/vimc/vimc-core.c:214 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'

patches/0004-media-vimc-use-data-link-entities-enum-to-index-the-.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vimc/vimc-core.c: ../drivers/media/test-drivers/vimc/vimc-core.c:214 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'


Error #512 when building PDF docs

