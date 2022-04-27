Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0D0511371
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 10:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359373AbiD0I15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 04:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351635AbiD0I14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 04:27:56 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53A951313
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 01:24:45 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1njcyZ-003kSV-RW; Wed, 27 Apr 2022 08:24:43 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1njcyU-005wdU-5v; Wed, 27 Apr 2022 08:24:38 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] Various fixes/enhancements (#82760)
Date:   Wed, 27 Apr 2022 08:24:37 +0000
Message-Id: <20220427082437.1416990-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7b63b250-d1c8-4350-0b3b-5b3be8b06c55@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7b63b250-d1c8-4350-0b3b-5b3be8b06c55@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/202643/
Build time: 00:30:55
Link: https://lore.kernel.org/linux-media/7b63b250-d1c8-4350-0b3b-5b3be8b06c55@xs4all.nl

gpg: Signature made Wed 27 Apr 2022 07:46:08 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 3/36 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-dt-bindings-mtk-vcodec-encoder-Add-power-domai.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2617 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0015-MAINTAINERS-adjust-entries-to-nxp-driver-movement-in.patch:

   checkpatch.pl:
	$ cat patches/0015-MAINTAINERS-adjust-entries-to-nxp-driver-movement-in.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0024-media-av7110-fix-switch-indentation.patch:

   checkpatch.pl:
	$ cat patches/0024-media-av7110-fix-switch-indentation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:39: ERROR: space prohibited before that ':' (ctx:WxE)
	-:40: ERROR: space prohibited before that ':' (ctx:WxE)
	-:41: ERROR: space prohibited before that ':' (ctx:WxE)
	-:42: ERROR: space prohibited before that ':' (ctx:WxE)


Error #512 when building PDF docs

