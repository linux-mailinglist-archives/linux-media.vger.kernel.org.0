Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE104C28EE
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 11:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbiBXKMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 05:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232995AbiBXKMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 05:12:07 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7D0193F8
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 02:11:36 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nNB5y-00Eyxu-KH; Thu, 24 Feb 2022 10:11:34 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nNB5w-001gCY-92; Thu, 24 Feb 2022 10:11:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.18] More V4L2 patches (#81025)
Date:   Thu, 24 Feb 2022 10:11:32 +0000
Message-Id: <20220224101132.400504-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YhdGXZL3xpfld/JQ@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YhdGXZL3xpfld/JQ@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/185642/
Build time: 00:19:23
Link: https://lore.kernel.org/linux-media/YhdGXZL3xpfld/JQ@valkosipuli.retiisi.eu

gpg: Signature made Thu 24 Feb 2022 08:42:09 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 6/12 patches with issues, being 4 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ov5640-Fix-set-format-v4l2_mbus_pixelcode-not-.patch:

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

patches/0005-media-media-entity-Add-media_pad_is_streaming-helper.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-media-media-entity-Simplify-media_pipeline_start.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

patches/0007-v4l-fwnode-Drop-redunant-ENODATA-check-in-property-r.patch:

   checkpatch.pl:
	$ cat patches/0007-v4l-fwnode-Drop-redunant-ENODATA-check-in-property-r.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit c343bc2ce2c6 ("ACPI: properties: Align return codes of __acpi_node_get_property_reference()")'

patches/0009-media-dt-bindings-Add-Intersil-ISL79987-DT-bindings.patch:

   checkpatch.pl:
	$ cat patches/0009-media-dt-bindings-Add-Intersil-ISL79987-DT-bindings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:24: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0010-media-i2c-isl7998x-Add-driver-for-Intersil-ISL7998x.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/isl7998x.c: ../drivers/media/i2c/isl7998x.c:561 isl7998x_norm_to_val() error: buffer overflow 'isl7998x_std_res' 9 <= 9 (assuming for loop doesn't break)
	../drivers/media/i2c/isl7998x.c: ../drivers/media/i2c/isl7998x.c:576 isl7998x_norm_to_mode() error: buffer overflow 'isl7998x_std_res' 9 <= 9 (assuming for loop doesn't break)
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0010-media-i2c-isl7998x-Add-driver-for-Intersil-ISL7998x.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:61: WARNING: please write a help paragraph that fully describes the config symbol
	-:1252: ERROR: Macros with complex values should be enclosed in parentheses
	-:1252: CHECK: Macro argument reuse 'page' - possible side-effects?
	-:1280: ERROR: Macros with complex values should be enclosed in parentheses
	-:1280: CHECK: Macro argument reuse 'page' - possible side-effects?
	-:1314: ERROR: Macros with complex values should be enclosed in parentheses
	-:1314: CHECK: Macro argument reuse 'page' - possible side-effects?


Error #512 when building PDF docs

