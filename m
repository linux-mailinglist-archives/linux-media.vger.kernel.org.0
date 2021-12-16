Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8411747797C
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 17:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbhLPQmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 11:42:12 -0500
Received: from www.linuxtv.org ([130.149.80.248]:42842 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232052AbhLPQmM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 11:42:12 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxtpb-005gsb-2G; Thu, 16 Dec 2021 16:42:11 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxtpZ-00A5nQ-0P; Thu, 16 Dec 2021 16:42:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.17] Ipu3-cio2 VCM on Windows BIOS (#79523)
Date:   Thu, 16 Dec 2021 16:42:08 +0000
Message-Id: <20211216164208.2405514-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YbtkGLF1cNN6d2cC@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YbtkGLF1cNN6d2cC@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/165936/
Build time: 00:30:10
Link: https://lore.kernel.org/linux-media/YbtkGLF1cNN6d2cC@valkosipuli.retiisi.eu

gpg: Signature made Thu 16 Dec 2021 03:43:38 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 6/12 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ACPI-delay-enumeration-of-devices-with-a-_DEP-pointi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

patches/0003-i2c-acpi-Add-i2c_acpi_new_device_by_fwnode-function.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

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

patches/0012-media-ipu3-cio2-Add-support-for-instantiating-i2c-cl.patch:

   checkpatch.pl:
	$ cat patches/0012-media-ipu3-cio2-Add-support-for-instantiating-i2c-cl.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:151: ERROR: Macros with complex values should be enclosed in parentheses


Error #512 when building PDF docs

