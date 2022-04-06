Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6104F6607
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 18:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238063AbiDFQqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 12:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbiDFQp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 12:45:57 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2261921CC40
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 08:01:43 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nc7AE-0064t9-71; Wed, 06 Apr 2022 15:01:42 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nc7AB-008RmX-Nq; Wed, 06 Apr 2022 15:01:39 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] cec: various fixes and enhancements (#82257)
Date:   Wed,  6 Apr 2022 15:01:39 +0000
Message-Id: <20220406150139.2013371-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <3f54b8d2-9c26-1775-0cc9-688a677776eb@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/3f54b8d2-9c26-1775-0cc9-688a677776eb@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/197361/
Build time: 00:24:12
Link: https://lore.kernel.org/linux-media/3f54b8d2-9c26-1775-0cc9-688a677776eb@xs4all.nl

gpg: Signature made Wed 06 Apr 2022 10:52:37 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 2/7 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-cec-call-enable_adap-on-s_log_addrs.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1983 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0005-cec-use-call_op-and-check-for-unregistered.patch:

   checkpatch.pl:
	$ cat patches/0005-cec-use-call_op-and-check-for-unregistered.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:173: CHECK: Macro argument reuse 'pin' - possible side-effects?
	-:173: CHECK: Macro argument 'pin' may be better as '(pin)' to avoid precedence issues
	-:173: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:173: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:177: CHECK: Macro argument reuse 'pin' - possible side-effects?
	-:177: CHECK: Macro argument 'pin' may be better as '(pin)' to avoid precedence issues
	-:177: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:177: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:290: CHECK: Macro argument reuse 'adap' - possible side-effects?
	-:290: CHECK: Macro argument 'adap' may be better as '(adap)' to avoid precedence issues
	-:290: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:290: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:294: CHECK: Macro argument reuse 'adap' - possible side-effects?
	-:294: CHECK: Macro argument 'adap' may be better as '(adap)' to avoid precedence issues
	-:294: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:294: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues


Error #512 when building PDF docs

