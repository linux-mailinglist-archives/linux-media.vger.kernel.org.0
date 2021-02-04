Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223D630F86B
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbhBDQsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:48:52 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45692 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238131AbhBDQo3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 11:44:29 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l7hjL-00CIDS-0X; Thu, 04 Feb 2021 16:43:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l7hmu-0002qg-RK; Thu, 04 Feb 2021 16:47:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v3 for 5.12] More V4L2 patches (#71300)
Date:   Thu,  4 Feb 2021 16:47:24 +0000
Message-Id: <20210204164724.10893-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210204162005.GD3@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210204162005.GD3@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/88791/
Build time: 00:16:22
Link: https://lore.kernel.org/linux-media/20210204162005.GD3@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 04 Feb 2021 04:18:17 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 17/43 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0007-media-v4l2-async-Clean-v4l2_async_notifier_add_fwnod.patch:

   checkpatch.pl:
	$ cat patches/0007-media-v4l2-async-Clean-v4l2_async_notifier_add_fwnod.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:58: CHECK: Lines should not end with a '('
	-:132: CHECK: Lines should not end with a '('
	-:179: CHECK: Lines should not end with a '('
	-:230: CHECK: Alignment should match open parenthesis
	-:313: CHECK: Lines should not end with a '('
	-:384: CHECK: Lines should not end with a '('
	-:424: CHECK: Lines should not end with a '('
	-:467: CHECK: Lines should not end with a '('
	-:499: CHECK: Lines should not end with a '('

patches/0008-media-atmel-Use-v4l2_async_notifier_add_fwnode_remot.patch:

   checkpatch.pl:
	$ cat patches/0008-media-atmel-Use-v4l2_async_notifier_add_fwnode_remot.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:96: CHECK: Lines should not end with a '('
	-:188: CHECK: Lines should not end with a '('

patches/0009-media-stm32-Use-v4l2_async_notifier_add_fwnode_remot.patch:

   checkpatch.pl:
	$ cat patches/0009-media-stm32-Use-v4l2_async_notifier_add_fwnode_remot.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:238: CHECK: Lines should not end with a '('

patches/0010-media-exynos4-is-Use-v4l2_async_notifier_add_fwnode_.patch:

   checkpatch.pl:
	$ cat patches/0010-media-exynos4-is-Use-v4l2_async_notifier_add_fwnode_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:69: CHECK: Lines should not end with a '('

patches/0011-media-st-mipid02-Use-v4l2_async_notifier_add_fwnode_.patch:

   checkpatch.pl:
	$ cat patches/0011-media-st-mipid02-Use-v4l2_async_notifier_add_fwnode_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:53: CHECK: Lines should not end with a '('

patches/0013-media-marvell-ccic-Use-v4l2_async_notifier_add_-_sub.patch:

   checkpatch.pl:
	$ cat patches/0013-media-marvell-ccic-Use-v4l2_async_notifier_add_-_sub.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:51: CHECK: Alignment should match open parenthesis

patches/0014-media-renesas-ceu-Use-v4l2_async_notifier_add_-_subd.patch:

   checkpatch.pl:
	$ cat patches/0014-media-renesas-ceu-Use-v4l2_async_notifier_add_-_subd.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:116: CHECK: Alignment should match open parenthesis
	-:156: CHECK: Lines should not end with a '('

patches/0015-media-pxa-camera-Use-v4l2_async_notifier_add_-_subde.patch:

   checkpatch.pl:
	$ cat patches/0015-media-pxa-camera-Use-v4l2_async_notifier_add_-_subde.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:63: CHECK: Lines should not end with a '('
	-:89: CHECK: Lines should not end with a '('

patches/0017-media-v4l2-async-Discourage-use-of-v4l2_async_notifi.patch:

   checkpatch.pl:
	$ cat patches/0017-media-v4l2-async-Discourage-use-of-v4l2_async_notifi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: CHECK: Alignment should match open parenthesis
	-:104: CHECK: Alignment should match open parenthesis

patches/0018-media-v4l2-async-Improve-v4l2_async_notifier_add_-_s.patch:

   checkpatch.pl:
	$ cat patches/0018-media-v4l2-async-Improve-v4l2_async_notifier_add_-_s.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:124: CHECK: Lines should not end with a '('
	-:263: CHECK: Lines should not end with a '('
	-:280: CHECK: Lines should not end with a '('
	-:326: CHECK: Lines should not end with a '('
	-:410: CHECK: Alignment should match open parenthesis
	-:437: CHECK: Lines should not end with a '('
	-:474: CHECK: Alignment should match open parenthesis
	-:577: CHECK: Lines should not end with a '('
	-:770: CHECK: Alignment should match open parenthesis
	-:790: CHECK: Macro argument '__type' may be better as '(__type)' to avoid precedence issues
	-:806: CHECK: Macro argument '__type' may be better as '(__type)' to avoid precedence issues
	-:822: CHECK: Macro argument '__type' may be better as '(__type)' to avoid precedence issues

patches/0020-dt-bindings-Remove-old-ov5647.yaml-file-update-ovti-.patch:

   checkpatch.pl:
	$ cat patches/0020-dt-bindings-Remove-old-ov5647.yaml-file-update-ovti-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:23: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:101: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0032-media-mach-pxa-Register-the-camera-sensor-fixed-rate.patch:

   checkpatch.pl:
	$ cat patches/0032-media-mach-pxa-Register-the-camera-sensor-fixed-rate.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:41: CHECK: Alignment should match open parenthesis

patches/0034-media-ov9640-Use-the-generic-clock-framework.patch:

   checkpatch.pl:
	$ cat patches/0034-media-ov9640-Use-the-generic-clock-framework.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0036-media-ov6650-Use-the-generic-clock-framework.patch:

   checkpatch.pl:
	$ cat patches/0036-media-ov6650-Use-the-generic-clock-framework.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0037-media-Remove-the-legacy-v4l2-clk-API.patch:

   checkpatch.pl:
	$ cat patches/0037-media-Remove-the-legacy-v4l2-clk-API.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0041-media-ov8856-Configure-sensor-for-GRBG-Bayer-for-all.patch:

   checkpatch.pl:
	$ cat patches/0041-media-ov8856-Configure-sensor-for-GRBG-Bayer-for-all.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: Use a single space after To:
	-:20: ERROR: Unrecognized email address: ''
	-:57: ERROR: Missing Signed-off-by: line by nominal patch author ''

patches/0043-media-i2c-Add-imx334-camera-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0043-media-i2c-Add-imx334-camera-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:228: CHECK: struct mutex definition without comment


Error #512 when building PDF docs

