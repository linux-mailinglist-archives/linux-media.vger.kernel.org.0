Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFD0525468
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 20:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356288AbiELSDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 14:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238781AbiELSDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 14:03:07 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40600703C7
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 11:03:06 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npD9U-008ivn-81; Thu, 12 May 2022 18:03:04 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npD9R-008f4H-V6; Thu, 12 May 2022 18:03:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.19] More V4L2 patches (#83170)
Date:   Thu, 12 May 2022 18:03:01 +0000
Message-Id: <20220512180301.2064443-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yn0z8Tjj53FBd09R@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Yn0z8Tjj53FBd09R@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/207033/
Build time: 00:35:29
Link: https://lore.kernel.org/linux-media/Yn0z8Tjj53FBd09R@valkosipuli.retiisi.eu

gpg: Signature made Thu 12 May 2022 04:13:16 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193

Summary: got 14/38 patches with issues, being 11 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-i2c-imx412-Fix-reset-GPIO-polarity.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds

patches/0005-dt-bindings-Convert-Dongwoon-dw9807-vcm-bindings-to-.patch:

   checkpatch.pl:
	$ cat patches/0005-dt-bindings-Convert-Dongwoon-dw9807-vcm-bindings-to-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:21: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:32: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0008-media-v4l2-core-Add-enum-V4L2_FWNODE_BUS_TYPE_DPI.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0010-media-Add-bus-type-to-frame-descriptors.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0010-media-Add-bus-type-to-frame-descriptors.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: Duplicate signature

patches/0011-media-Add-CSI-2-bus-configuration-to-frame-descripto.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0011-media-Add-CSI-2-bus-configuration-to-frame-descripto.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: Duplicate signature

patches/0013-media-i2c-adv7180-Add-support-for-the-test-patterns.patch:

   checkpatch.pl:
	$ cat patches/0013-media-i2c-adv7180-Add-support-for-the-test-patterns.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:97: CHECK: Alignment should match open parenthesis

patches/0014-media-exynos4-is-Fix-compile-warning.patch:

   checkpatch.pl:
	$ cat patches/0014-media-exynos4-is-Fix-compile-warning.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: CHECK: Alignment should match open parenthesis

patches/0024-media-uapi-Add-IPU3-packed-Y10-format.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0024-media-uapi-Add-IPU3-packed-Y10-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: ERROR: trailing statements should be on next line
	-:69: WARNING: line length of 106 exceeds 100 columns

patches/0032-media-i2c-Add-pm_runtime-support-to-ov7251.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1338 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1338
	  Unlocked on: 1334

patches/0033-media-i2c-Remove-.s_power-from-ov7251.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1310 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1310
	  Unlocked on: 1306

patches/0035-media-i2c-Extend-.get_selection-for-ov7251.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1333 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1333
	  Unlocked on: 1329

patches/0036-media-i2c-add-ov7251_init_ctrls.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1333 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1333
	  Unlocked on: 1329

patches/0037-media-i2c-Add-hblank-control-to-ov7251.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1336 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1336
	  Unlocked on: 1332

patches/0038-media-i2c-Add-vblank-control-to-ov7251-driver.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov7251.c: ../drivers/media/i2c/ov7251.c:1381 ov7251_s_stream() warn: inconsistent returns '&ov7251->lock'.
	  Locked on  : 1381
	  Unlocked on: 1377


Error #512 when building PDF docs

