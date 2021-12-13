Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9386F472F2C
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 15:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239180AbhLMO1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 09:27:46 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57004 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239139AbhLMO1q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 09:27:46 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mwmIq-001XRS-ML; Mon, 13 Dec 2021 14:27:44 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mwmIo-00EJN3-Cp; Mon, 13 Dec 2021 14:27:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches (#79352)
Date:   Mon, 13 Dec 2021 14:27:42 +0000
Message-Id: <20211213142742.3411007-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/165075/
Build time: 00:35:23
Link: https://lore.kernel.org/linux-media/YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu

gpg: Signature made Mon 13 Dec 2021 12:05:48 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 3/5 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-max96712-Depend-on-VIDEO_V4L2.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-dt-bindings-Add-Intersil-ISL79987-DT-bindings.patch:

   checkpatch.pl:
	$ cat patches/0004-media-dt-bindings-Add-Intersil-ISL79987-DT-bindings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-media-i2c-isl7998x-Add-driver-for-Intersil-ISL7998x.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0005-media-i2c-isl7998x-Add-driver-for-Intersil-ISL7998x.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:59: WARNING: please write a paragraph that describes the config symbol fully
	-:879: CHECK: Alignment should match open parenthesis
	-:1165: ERROR: Macros with complex values should be enclosed in parentheses
	-:1165: CHECK: Macro argument reuse 'page' - possible side-effects?
	-:1193: ERROR: Macros with complex values should be enclosed in parentheses
	-:1193: CHECK: Macro argument reuse 'page' - possible side-effects?
	-:1227: ERROR: Macros with complex values should be enclosed in parentheses
	-:1227: CHECK: Macro argument reuse 'page' - possible side-effects?


Error #512 when building PDF docs

