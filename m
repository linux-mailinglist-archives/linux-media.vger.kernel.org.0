Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA95B49884C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 19:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241830AbiAXS1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 13:27:33 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44148 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241827AbiAXS1c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 13:27:32 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nC43u-006YiP-1E; Mon, 24 Jan 2022 18:27:30 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nC43q-00EyQI-R9; Mon, 24 Jan 2022 18:27:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 5.18] V4L2 patches (#80275)
Date:   Mon, 24 Jan 2022 18:27:26 +0000
Message-Id: <20220124182726.3568812-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/176915/
Build time: 00:00:33
Link: https://lore.kernel.org/linux-media/Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu

gpg: Signature made Mon 24 Jan 2022 03:31:27 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193

Summary: got 23/25 patches with issues, being 23 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-dt-bindings-media-camss-Remove-clock-lane-prop.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-v4l2-subdev-Drop-.set_mbus_config-operation.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0005-media-v4l2-fwnode-Move-bus-config-structure-to-v4l2_.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-media-v4l2-mediabus-Use-structures-to-describe-bus-c.patch:

    allyesconfig: return code #512:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0007-media-v4l2-mediabus-Drop-legacy-V4L2_MBUS_CSI2_-_LAN.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0008-media-v4l2-mediabus-Drop-legacy-V4L2_MBUS_CSI2_CHANN.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0009-media-v4l2-mediabus-Drop-V4L2_MBUS_CSI2_CONTINUOUS_C.patch:

    allyesconfig: return code #512:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0010-media-ov6650-Fix-set-format-try-processing-path.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0011-media-ov6650-Add-try-support-to-selection-API-operat.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0012-media-ov6650-Fix-crop-rectangle-affected-by-set-form.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0013-media-ov6650-Fix-missing-frame-interval-enumeration-.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0013-media-ov6650-Fix-missing-frame-interval-enumeration-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:37: CHECK: Alignment should match open parenthesis

patches/0014-v4l-Avoid-unaligned-access-warnings-when-printing-4c.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0014-v4l-Avoid-unaligned-access-warnings-when-printing-4c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:53: WARNING: Avoid logging continuation uses where feasible

patches/0015-ov5648-Don-t-pack-controls-struct.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0016-ov8865-Fix-indentation-in-set_selection-callback.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0017-media-hi847-Add-support-for-Hi-847-sensor.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0017-media-hi847-Add-support-for-Hi-847-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:2703: CHECK: Alignment should match open parenthesis

patches/0018-media-i2c-Add-ov08d10-camera-sensor-driver.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0019-media-ov5693-fix-boolconv.cocci-warnings.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0020-media-ov5693-fix-returnvar.cocci-warnings.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0021-media-i2c-max9286-Implement-media-entity-.link_valid.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0022-MAINTAINERS-Update-Benjamin-Gaignard-maintainer-stat.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0023-MAINTAINERS-update-drm-stm-drm-sti-and-cec-sti-maint.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0024-media-ov2740-identify-module-after-subdev-initialisa.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0025-media-i2c-dw9714-add-optional-regulator-support.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	../drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
	../drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

