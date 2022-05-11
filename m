Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4FE522D7F
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 09:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbiEKHjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 03:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiEKHjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 03:39:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B2D224A40
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 00:39:14 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nogwD-006RH3-4G; Wed, 11 May 2022 07:39:13 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nogw9-001wug-6v; Wed, 11 May 2022 07:39:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] Various CEC fixes for 5.19 (#83098)
Date:   Wed, 11 May 2022 07:39:09 +0000
Message-Id: <20220511073909.464744-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <334ab2d5-7de3-b596-077a-26c21b96650c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/334ab2d5-7de3-b596-077a-26c21b96650c@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/206638/
Build time: 00:21:01
Link: https://lore.kernel.org/linux-media/334ab2d5-7de3-b596-077a-26c21b96650c@xs4all.nl

gpg: Signature made Wed 11 May 2022 07:09:10 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 2/7 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-cec-pin.c-disabling-the-adapter-cannot-call-kthread_.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0005-cec-adap.c-fix-is_configuring-state.patch:

   checkpatch.pl:
	$ cat patches/0005-cec-adap.c-fix-is_configuring-state.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: Possible repeated word: 'the'


Error #512 when building PDF docs

