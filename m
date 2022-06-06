Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D5653E9A6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiFFJze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 05:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbiFFJzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 05:55:31 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E542113A14
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 02:55:27 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ny9SI-00948o-BO; Mon, 06 Jun 2022 09:55:26 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ny9SG-0052lQ-5f; Mon, 06 Jun 2022 09:55:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] Various fixes/enhancements (#83484)
Date:   Mon,  6 Jun 2022 09:55:23 +0000
Message-Id: <20220606095523.1202218-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <8c59ebc3-6279-b085-0d51-35cc4db3ec19@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/8c59ebc3-6279-b085-0d51-35cc4db3ec19@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/214003/
Build time: 00:00:50
Link: https://lore.kernel.org/linux-media/8c59ebc3-6279-b085-0d51-35cc4db3ec19@xs4all.nl

error: FETCH_HEAD: cannot verify a non-tag object of type commit.

Summary: got 6/27 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-imx-jpeg-Don-t-fill-the-description-field-in-s.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000008Kb sm_state_count = 543891
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 9 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5473 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725876
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-atmel-atmel-sama7g5-isc-fix-warning-in-configs.patch:

   checkpatch.pl:
	$ cat patches/0002-media-atmel-atmel-sama7g5-isc-fix-warning-in-configs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0008-media-dt-bindings-qcom-sdm660-camss-document-interco.patch:

   checkpatch.pl:
	$ cat patches/0008-media-dt-bindings-qcom-sdm660-camss-document-interco.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0016-media-cx88-Fix-PAL-Nc-standard.patch:

   checkpatch.pl:
	$ cat patches/0016-media-cx88-Fix-PAL-Nc-standard.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0022-media-stkwebcam-deprecate-driver-move-to-staging.patch:

   checkpatch.pl:
	$ cat patches/0022-media-stkwebcam-deprecate-driver-move-to-staging.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:120: WARNING: please write a help paragraph that fully describes the config symbol

patches/0026-media-Add-P010-video-format.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000004Kb sm_state_count = 543764
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 9 seconds

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5495 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725876
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 51 seconds

   checkpatch.pl:
	$ cat patches/0026-media-Add-P010-video-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:105: WARNING: line length of 164 exceeds 100 columns
	-:117: ERROR: trailing statements should be on next line
	-:129: WARNING: line length of 104 exceeds 100 columns


Error #512 when building PDF docs

