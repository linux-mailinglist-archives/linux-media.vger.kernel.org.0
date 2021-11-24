Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F3945C91D
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 16:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241950AbhKXPst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 10:48:49 -0500
Received: from www.linuxtv.org ([130.149.80.248]:40182 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231555AbhKXPss (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 10:48:48 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mpuSn-009bB9-OG; Wed, 24 Nov 2021 15:45:37 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mpuSk-001T2h-Fr; Wed, 24 Nov 2021 15:45:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches (#78752)
Date:   Wed, 24 Nov 2021 15:45:34 +0000
Message-Id: <20211124154534.349921-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YZ5WGhErn1kv4vlX@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YZ5WGhErn1kv4vlX@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/159659/
Build time: 00:28:12
Link: https://lore.kernel.org/linux-media/YZ5WGhErn1kv4vlX@valkosipuli.retiisi.eu

gpg: Signature made Wed 24 Nov 2021 09:15:47 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 14/28 patches with issues, being 11 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-i2c-max9286-Depend-on-VIDEO_V4L2.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-i2c-imx274-fix-s_frame_interval-runtime-resume.patch:

   checkpatch.pl:
	$ cat patches/0002-media-i2c-imx274-fix-s_frame_interval-runtime-resume.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0007-media-i2c-Add-support-for-ov5693-sensor.patch:

   checkpatch.pl:
	$ cat patches/0007-media-i2c-Add-support-for-ov5693-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:1365: CHECK: Lines should not end with a '('
	-:1368: CHECK: spaces preferred around that '-' (ctx:VxV)

patches/0015-media-i2c-Add-.get_selection-support-to-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2799 ov8865_get_selection() warn: inconsistent indenting

patches/0016-media-i2c-Switch-control-to-V4L2_CID_ANALOGUE_GAIN.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2800 ov8865_get_selection() warn: inconsistent indenting

patches/0017-media-i2c-Add-vblank-control-to-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2832 ov8865_get_selection() warn: inconsistent indenting

patches/0018-media-i2c-Add-hblank-control-to-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2846 ov8865_get_selection() warn: inconsistent indenting

patches/0019-media-i2c-Update-HTS-values-in-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2804 ov8865_get_selection() warn: inconsistent indenting

patches/0020-media-i2c-cap-exposure-at-height-vblank-in-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2828 ov8865_get_selection() warn: inconsistent indenting

patches/0021-media-i2c-Add-controls-from-fwnode-to-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2838 ov8865_get_selection() warn: inconsistent indenting

patches/0022-media-i2c-Switch-exposure-control-unit-to-lines.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting

patches/0023-media-i2c-Use-dev_err_probe-in-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting

patches/0024-media-i2c-Fix-max-gain-in-ov8865.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting

patches/0028-dt-bindings-media-renesas-jpu-Convert-to-json-schema.patch:

   checkpatch.pl:
	$ cat patches/0028-dt-bindings-media-renesas-jpu-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:28: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:55: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

