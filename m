Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67823477291
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 14:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237178AbhLPNEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 08:04:08 -0500
Received: from www.linuxtv.org ([130.149.80.248]:52370 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237170AbhLPNEI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 08:04:08 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxqQZ-005Tza-2R; Thu, 16 Dec 2021 13:04:07 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxqQW-007qCJ-Ul; Thu, 16 Dec 2021 13:04:04 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 5.17] V4L2 patches (#79518)
Date:   Thu, 16 Dec 2021 13:04:04 +0000
Message-Id: <20211216130404.1868897-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Ybsygi8PTRXngyay@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Ybsygi8PTRXngyay@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/165911/
Build time: 00:22:22
Link: https://lore.kernel.org/linux-media/Ybsygi8PTRXngyay@valkosipuli.retiisi.eu

gpg: Signature made Thu 16 Dec 2021 12:31:01 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 3/11 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-Update-Intel-submitted-camera-sensor-driver-contacts.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2841 ov8865_get_selection() warn: inconsistent indenting
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-ov8865-Disable-only-enabled-regulators-on-error-path.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting

patches/0011-media-i2c-hi846-use-pm_runtime_force_suspend-resume-.patch:

   checkpatch.pl:
	$ cat patches/0011-media-i2c-hi846-use-pm_runtime_force_suspend-resume-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

