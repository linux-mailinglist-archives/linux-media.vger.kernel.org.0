Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561704BA059
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 13:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbiBQMtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 07:49:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239479AbiBQMtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 07:49:47 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7D82A82D7
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 04:49:32 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nKgDy-005Ovi-Jz; Thu, 17 Feb 2022 12:49:30 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nKgDv-003T8b-Cg; Thu, 17 Feb 2022 12:49:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Venus updates (#80806)
Date:   Thu, 17 Feb 2022 12:49:26 +0000
Message-Id: <20220217124927.826943-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217121913.1556254-1-stanimir.varbanov@linaro.org>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220217121913.1556254-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/183720/
Build time: 00:18:29
Link: https://lore.kernel.org/linux-media/20220217121913.1556254-1-stanimir.varbanov@linaro.org

gpg: Signature made Thu 17 Feb 2022 12:13:14 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 3/4 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-venus-core-Fix-kerneldoc-warnings.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-venus-vdec-fixed-possible-memory-leak-issue.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

patches/0004-venus-hfi_cmds-List-HDR10-property-as-unsupported-fo.patch:

   checkpatch.pl:
	$ cat patches/0004-venus-hfi_cmds-List-HDR10-property-as-unsupported-fo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP


Error #512 when building PDF docs

