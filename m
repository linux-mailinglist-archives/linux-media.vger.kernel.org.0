Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B110500AEB
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 12:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiDNKUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 06:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbiDNKUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 06:20:19 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F2F73067
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 03:17:52 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1newXu-000Emi-Pk; Thu, 14 Apr 2022 10:17:51 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1newXs-000XNZ-8R; Thu, 14 Apr 2022 10:17:48 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.19] V4L2 patches (#82431)
Date:   Thu, 14 Apr 2022 10:17:48 +0000
Message-Id: <20220414101748.128263-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yle+VQoHTl2iTQbf@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Yle+VQoHTl2iTQbf@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/199562/
Build time: 00:45:29
Link: https://lore.kernel.org/linux-media/Yle+VQoHTl2iTQbf@valkosipuli.retiisi.eu

gpg: Signature made Thu 14 Apr 2022 06:21:19 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193

Summary: got 28/33 patches with issues, being 28 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-imx-imx-mipi-csis-Add-support-for-JPEG_1X8.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-media-media.h-Add-new-media-link-type.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0005-media-entity-Add-support-for-ancillary-links.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0009-mc-Remove-redundant-documentation.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0010-mc-media_device_init-initialises-a-media_device-not-.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0011-mc-Provide-a-helper-for-setting-bus_info-field.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2869 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0011-mc-Provide-a-helper-for-setting-bus_info-field.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:49: CHECK: Please don't use multiple blank lines

patches/0012-mc-Set-bus_info-in-media_device_init.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0013-v4l-ioctl-Set-bus_info-in-v4l_querycap.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0014-media-i2c-max9286-fix-kernel-oops-when-removing-modu.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0014-media-i2c-max9286-fix-kernel-oops-when-removing-modu.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-staging-media-ipu3-Fix-AF-x_start-position-when-righ.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0016-staging-media-ipu3-imgu-Request-specific-firmware-bi.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0017-media-v4l2-async-Use-endpoints-in-__v4l2_async_nf_ad.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0018-media-staging-intel-ipu3-Reset-imgu_video_device-seq.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0019-media-staging-intel-ipu3-Cleanup-dummy-buffers-via-h.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0020-media-isl7998x-select-V4L2_FWNODE-to-fix-build-error.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0020-media-isl7998x-select-V4L2_FWNODE-to-fix-build-error.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0021-media-mc-delete-redundant-code-in-__media_device_unr.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0022-media-i2c-ov5645-Fix-media-bus-format.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2.c:375:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:767:19: error: unused variable ‘solo_dev’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/solo6x10] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0023-media-v4l2-subdev-fix-endif-comments.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0024-media-v4l2-subdev-drop-extra-ifdef.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0025-media-subdev-rename-subdev-state-alloc-free.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0026-media-subdev-add-active-state-to-struct-v4l2_subdev.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0027-media-subdev-rename-v4l2_subdev_get_pad_-helpers.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0028-media-subdev-pass-also-the-active-state-to-subdevs-f.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0029-media-subdev-add-subdev-state-locking.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0029-media-subdev-add-subdev-state-locking.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:286: CHECK: struct mutex definition without comment
	-:304: CHECK: struct mutex definition without comment
	-:455: CHECK: Macro argument reuse 'sd' - possible side-effects?

patches/0030-media-subdev-add-locking-wrappers-to-subdev-op-wrapp.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0030-media-subdev-add-locking-wrappers-to-subdev-op-wrapp.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:46: CHECK: Macro argument 'arg_type' may be better as '(arg_type)' to avoid precedence issues
	-:49: CHECK: spaces preferred around that '*' (ctx:WxV)
	-:63: CHECK: Macro argument 'arg_type' may be better as '(arg_type)' to avoid precedence issues
	-:66: CHECK: spaces preferred around that '*' (ctx:WxV)

patches/0031-media-subdev-add-v4l2_subdev_get_fmt-helper-function.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2889 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0032-media-Documentation-add-documentation-about-subdev-s.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0033-Revert-media-dw9768-activate-runtime-PM-and-turn-off.patch:

    allyesconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/pci/sta2x11/sta2x11_vip.c:404:22: error: unused variable ‘vip’ [-Werror=unused-variable]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/pci/sta2x11/sta2x11_vip.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/pci/sta2x11] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/pci] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

