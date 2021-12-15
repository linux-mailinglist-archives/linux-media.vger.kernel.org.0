Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679EA476617
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 23:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhLOWob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 17:44:31 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46458 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229919AbhLOWob (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 17:44:31 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxd0e-004iP6-TQ; Wed, 15 Dec 2021 22:44:28 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxd0c-004r7M-8j; Wed, 15 Dec 2021 22:44:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] Immutable branch with INT3472 ACPI/i2c + pdx86 patches (#79459)
Date:   Wed, 15 Dec 2021 22:44:26 +0000
Message-Id: <20211215224426.1157450-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215215212.321235-1-hdegoede@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20211215215212.321235-1-hdegoede@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/165742/
Build time: 00:43:45
Link: https://lore.kernel.org/linux-media/20211215215212.321235-1-hdegoede@redhat.com

gpg: Signature made Wed 15 Dec 2021 09:40:04 PM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC

Summary: got 5/9 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ACPI-delay-enumeration-of-devices-with-a-_DEP-pointi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

patches/0003-i2c-acpi-Add-i2c_acpi_new_device_by_fwnode-function.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0003-i2c-acpi-Add-i2c_acpi_new_device_by_fwnode-function.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:95: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:95: CHECK: Lines should not end with a '('

patches/0004-platform_data-Add-linux-platform_data-tps68470.h-fil.patch:

   checkpatch.pl:
	$ cat patches/0004-platform_data-Add-linux-platform_data-tps68470.h-fil.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-platform-x86-int3472-Split-into-2-drivers.patch:

   checkpatch.pl:
	$ cat patches/0005-platform-x86-int3472-Split-into-2-drivers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-platform-x86-int3472-Pass-tps68470_regulator_platfor.patch:

   checkpatch.pl:
	$ cat patches/0008-platform-x86-int3472-Pass-tps68470_regulator_platfor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:75: WARNING: line length of 108 exceeds 100 columns
	-:128: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

