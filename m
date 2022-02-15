Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E204B6A9A
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 12:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbiBOLXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 06:23:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237049AbiBOLXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 06:23:17 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E39108199
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 03:23:07 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nJvvF-002QlA-RO; Tue, 15 Feb 2022 11:23:05 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nJvvD-00EEQY-Hj; Tue, 15 Feb 2022 11:23:03 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Misc V4L2 driver changes (#80745)
Date:   Tue, 15 Feb 2022 11:23:03 +0000
Message-Id: <20220215112303.3392004-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/183132/
Build time: 00:23:09
Link: https://lore.kernel.org/linux-media/YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com

gpg: Signature made Tue 15 Feb 2022 10:52:38 AM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 2/10 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-dt-binding-media-hynix-hi846-use-defs-port-base-port.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-dt-binding-media-hynix-hi846-use-defs-port-base-port.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0007-media-Define-MIPI-CSI-2-data-types-in-a-shared-heade.patch:

   checkpatch.pl:
	$ cat patches/0007-media-Define-MIPI-CSI-2-data-types-in-a-shared-heade.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

