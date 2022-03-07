Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABBE4D0513
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 18:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbiCGRSf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 12:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbiCGRSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 12:18:34 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBAB6269
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 09:17:37 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nRGzI-00COQc-40; Mon, 07 Mar 2022 17:17:36 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nRGzE-0039Im-SO; Mon, 07 Mar 2022 17:17:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] v3: amphion video decoder/encoder driver (#81315)
Date:   Mon,  7 Mar 2022 17:17:32 +0000
Message-Id: <20220307171732.750694-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <94183ccf-d04b-fda9-863d-3d5f4f6d0be5@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/94183ccf-d04b-fda9-863d-3d5f4f6d0be5@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/188852/
Build time: 00:46:15
Link: https://lore.kernel.org/linux-media/94183ccf-d04b-fda9-863d-3d5f4f6d0be5@xs4all.nl

gpg: Signature made Mon 07 Mar 2022 04:17:23 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 10/12 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-dt-bindings-media-amphion-add-amphion-video-codec-bi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-dt-bindings-media-amphion-add-amphion-video-codec-bi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0002-media-add-nv12m_8l128-and-nv12m_10be_8l128-video-for.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

   checkpatch.pl:
	$ cat patches/0002-media-add-nv12m_8l128-and-nv12m_10be_8l128-video-for.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:86: ERROR: trailing statements should be on next line
	-:87: ERROR: trailing statements should be on next line
	-:100: WARNING: line length of 110 exceeds 100 columns

patches/0003-media-amphion-add-amphion-vpu-device-driver.patch:

   checkpatch.pl:
	$ cat patches/0003-media-amphion-add-amphion-vpu-device-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:38: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:348: CHECK: Macro argument reuse 'inst' - possible side-effects?
	-:348: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:348: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:351: CHECK: Macro argument reuse 'inst' - possible side-effects?
	-:351: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:351: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues

patches/0004-media-amphion-add-vpu-core-driver.patch:

   checkpatch.pl:
	$ cat patches/0004-media-amphion-add-vpu-core-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-media-amphion-implement-vpu-core-communication-based.patch:

   checkpatch.pl:
	$ cat patches/0005-media-amphion-implement-vpu-core-communication-based.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0006-media-amphion-add-vpu-v4l2-m2m-support.patch:

   checkpatch.pl:
	$ cat patches/0006-media-amphion-add-vpu-v4l2-m2m-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0007-media-amphion-add-v4l2-m2m-vpu-encoder-stateful-driv.patch:

   checkpatch.pl:
	$ cat patches/0007-media-amphion-add-v4l2-m2m-vpu-encoder-stateful-driv.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-media-amphion-add-v4l2-m2m-vpu-decoder-stateful-driv.patch:

   checkpatch.pl:
	$ cat patches/0008-media-amphion-add-v4l2-m2m-vpu-decoder-stateful-driv.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-media-amphion-implement-windsor-encoder-rpc-interfac.patch:

   checkpatch.pl:
	$ cat patches/0009-media-amphion-implement-windsor-encoder-rpc-interfac.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0010-media-amphion-implement-malone-decoder-rpc-interface.patch:

   checkpatch.pl:
	$ cat patches/0010-media-amphion-implement-malone-decoder-rpc-interface.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

