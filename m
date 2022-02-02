Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8434A74EA
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 16:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbiBBPsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 10:48:20 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35914 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233239AbiBBPsT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 10:48:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nFHrl-001pWZ-UQ; Wed, 02 Feb 2022 15:48:17 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nFHri-009eS7-Uz; Wed, 02 Feb 2022 15:48:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v3 FOR 5.18] V4L2 patches (#80454)
Date:   Wed,  2 Feb 2022 15:48:14 +0000
Message-Id: <20220202154814.2300405-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YfqTl5GBCDRDLXl1@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YfqTl5GBCDRDLXl1@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/179449/
Build time: 00:13:11
Link: https://lore.kernel.org/linux-media/YfqTl5GBCDRDLXl1@valkosipuli.retiisi.eu

gpg: Signature made Wed 02 Feb 2022 01:49:23 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 7/10 patches with issues, being 5 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-microchip-csi2dc-Remove-VC-support-for-now.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-v4l2-mediabus-Use-structures-to-describe-bus-c.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-media-v4l2-mediabus-Drop-legacy-V4L2_MBUS_CSI2_-_LAN.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-v4l2-mediabus-Drop-legacy-V4L2_MBUS_CSI2_CHANN.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0005-media-v4l2-mediabus-Drop-V4L2_MBUS_CSI2_CONTINUOUS_C.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-media-omap3isp-Use-struct_group-for-memcpy-region.patch:

   checkpatch.pl:
	$ cat patches/0006-media-omap3isp-Use-struct_group-for-memcpy-region.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:30: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:105: CHECK: Alignment should match open parenthesis
	-:122: CHECK: Alignment should match open parenthesis

patches/0007-dt-binding-media-hynix-hi846-use-defs-port-base-port.patch:

   checkpatch.pl:
	$ cat patches/0007-dt-binding-media-hynix-hi846-use-defs-port-base-port.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

