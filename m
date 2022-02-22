Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1675E4BF434
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 09:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiBVI67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 03:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiBVI66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 03:58:58 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7643A10E052
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 00:58:32 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMR0A-00CGf1-R1; Tue, 22 Feb 2022 08:58:30 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMR08-004KuR-F9; Tue, 22 Feb 2022 08:58:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Move tegra-vde out of staging (#80893)
Date:   Tue, 22 Feb 2022 08:58:27 +0000
Message-Id: <20220222085827.1033641-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <19a007e4-e287-145a-1891-ecde68aaa95a@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/19a007e4-e287-145a-1891-ecde68aaa95a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/185096/
Build time: 00:25:30
Link: https://lore.kernel.org/linux-media/19a007e4-e287-145a-1891-ecde68aaa95a@xs4all.nl

gpg: Signature made Tue 22 Feb 2022 08:22:30 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 5/6 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-ctrls-Add-new-V4L2_H264_DECODE_PARAM_FLAG.patch:

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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-staging-tegra-vde-Factor-out-H.264-code.patch:

   checkpatch.pl:
	$ cat patches/0002-media-staging-tegra-vde-Factor-out-H.264-code.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:643: CHECK: Lines should not end with a '('

patches/0003-media-staging-tegra-vde-Support-V4L-stateless-video-.patch:

   checkpatch.pl:
	$ cat patches/0003-media-staging-tegra-vde-Support-V4L-stateless-video-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:381: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1609: CHECK: struct mutex definition without comment

patches/0004-media-staging-tegra-vde-Remove-legacy-UAPI-support.patch:

   checkpatch.pl:
	$ cat patches/0004-media-staging-tegra-vde-Remove-legacy-UAPI-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:138: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0006-media-staging-tegra-vde-De-stage-driver.patch:

   checkpatch.pl:
	$ cat patches/0006-media-staging-tegra-vde-De-stage-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:60: WARNING: please write a help paragraph that fully describes the config symbol
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)
	-:126: CHECK: spaces preferred around that '/' (ctx:VxV)


Error #512 when building PDF docs

