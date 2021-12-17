Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A666478CF1
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhLQN72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:59:28 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35684 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231337AbhLQN71 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:59:27 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1myDle-006sNj-Gb; Fri, 17 Dec 2021 13:59:26 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1myDlb-00FB1V-4v; Fri, 17 Dec 2021 13:59:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.17] zoran: merge into one module, many fixes (#79583)
Date:   Fri, 17 Dec 2021 13:59:22 +0000
Message-Id: <20211217135922.3617247-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <73e71dca-fc28-6bb8-09b0-dcdd0f4974cf@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/73e71dca-fc28-6bb8-09b0-dcdd0f4974cf@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/166186/
Build time: 00:25:10
Link: https://lore.kernel.org/linux-media/73e71dca-fc28-6bb8-09b0-dcdd0f4974cf@xs4all.nl

gpg: Signature made Fri 17 Dec 2021 01:17:50 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 5/18 patches with issues, being 5 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-staging-media-zoran-move-module-parameter-checks-to-.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2889 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-staging-media-zoran-merge-all-modules.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1412:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1412:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0007-staging-media-zoran-remove-vidmem.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1397:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1397:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0008-staging-media-zoran-move-videodev-alloc.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1417:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1417:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0009-staging-media-zoran-move-config-select-on-primary-kc.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1417:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/zoran/zoran_card.c:1417:1: error: label ‘zr_unreg_videocodec’ defined but not used [-Werror=unused-label]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:287: drivers/staging/media/zoran/zoran_card.o] Error 1
	make[4]: *** [../scripts/Makefile.build:549: drivers/staging/media/zoran] Error 2
	make[3]: *** [../scripts/Makefile.build:549: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:549: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1846: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

