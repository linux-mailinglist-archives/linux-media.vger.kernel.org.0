Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5957512F10
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 10:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344170AbiD1I4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 04:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236555AbiD1I4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 04:56:32 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE302E093
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 01:53:17 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1njztk-005B52-6l; Thu, 28 Apr 2022 08:53:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1njzth-00A9rB-Mg; Thu, 28 Apr 2022 08:53:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] More fixes/enhancements (#82791)
Date:   Thu, 28 Apr 2022 08:53:13 +0000
Message-Id: <20220428085313.2421123-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <db9b2a4f-7074-b609-2e1f-717932067f95@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/db9b2a4f-7074-b609-2e1f-717932067f95@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/202934/
Build time: 00:21:10
Link: https://lore.kernel.org/linux-media/db9b2a4f-7074-b609-2e1f-717932067f95@xs4all.nl

gpg: Signature made Thu 28 Apr 2022 08:16:39 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 4/17 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-pvrusb2-fix-array-index-out-of-bounds-in-pvr2_.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-pvrusb2-fix-array-index-out-of-bounds-in-pvr2_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0002-media-make-RADIO_ADAPTERS-tristate.patch:

   checkpatch.pl:
	$ cat patches/0002-media-make-RADIO_ADAPTERS-tristate.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0014-media-coda-fix-default-JPEG-colorimetry.patch:

   checkpatch.pl:
	$ cat patches/0014-media-coda-fix-default-JPEG-colorimetry.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-media-coda-limit-frame-interval-enumeration-to-suppo.patch:

   checkpatch.pl:
	$ cat patches/0015-media-coda-limit-frame-interval-enumeration-to-suppo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

