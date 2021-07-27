Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197BE3D732D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhG0K0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:26:08 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48460 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236309AbhG0K0H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:26:07 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1m8KHm-007P9S-GY; Tue, 27 Jul 2021 10:26:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1m8KMV-0008Gl-9g; Tue, 27 Jul 2021 10:30:59 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 for 5.15] Camera sensor, async and documentation patches (#76035)
Date:   Tue, 27 Jul 2021 10:30:59 +0000
Message-Id: <20210727103059.31746-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727091551.GF3@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210727091551.GF3@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/127520/
Build time: 00:02:11
Link: https://lore.kernel.org/linux-media/20210727091551.GF3@valkosipuli.retiisi.eu

gpg: Signature made Mon 26 Jul 2021 07:38:57 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 11/43 patches with issues, being 5 at build time

Error/warnings:

patches/0001-media-v4l2-subdev-Fix-documentation-of-the-subdev_no.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]

    allyesconfig: return code #0:
	SPARSE:../drivers/media/cec/core/cec-core.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
	SPARSE:../drivers/media/mc/mc-devnode.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-media-i2c-Add-imx335-camera-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0003-media-i2c-Add-imx335-camera-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:227: CHECK: struct mutex definition without comment
Traceback (most recent call last):
	  File "scripts/spdxcheck.py", line 10, in <module>
	    import git
	ModuleNotFoundError: No module named 'git'

patches/0005-media-i2c-Add-imx412-camera-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0005-media-i2c-Add-imx412-camera-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:231: CHECK: struct mutex definition without comment
Traceback (most recent call last):
	  File "scripts/spdxcheck.py", line 10, in <module>
	    import git
	ModuleNotFoundError: No module named 'git'

patches/0007-media-i2c-Add-ov9282-camera-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0007-media-i2c-Add-ov9282-camera-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:226: CHECK: struct mutex definition without comment
Traceback (most recent call last):
	  File "scripts/spdxcheck.py", line 10, in <module>
	    import git
	ModuleNotFoundError: No module named 'git'

patches/0019-rcar-vin-Move-and-rename-CSI-2-link-notifications.patch:

   checkpatch.pl:
	$ cat patches/0019-rcar-vin-Move-and-rename-CSI-2-link-notifications.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:340: CHECK: Lines should not end with a '('

patches/0027-Documentation-media-Improve-camera-sensor-documentat.patch:

   checkpatch.pl:
	$ cat patches/0027-Documentation-media-Improve-camera-sensor-documentat.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:156: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
Traceback (most recent call last):
	  File "scripts/spdxcheck.py", line 10, in <module>
	    import git
	ModuleNotFoundError: No module named 'git'

patches/0028-Documentation-media-Fix-v4l2-async-kerneldoc-syntax.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0029-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1971 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/rcar-vin/rcar-core.c:1617:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1604:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1604:1: warning: unused label 'error_group_unregister'
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1617:1: warning: unused label 'error_dma_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1604:1:  warning: unused label 'error_group_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1617:1:  warning: unused label 'error_dma_unregister'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #0:
	../drivers/media/platform/rcar-vin/rcar-core.c:1617:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1604:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]

patches/0030-media-rcar-vin-Remove-explicit-device-availability-c.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: unused label 'error_group_unregister'
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: unused label 'error_dma_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1597:1:  warning: unused label 'error_group_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1610:1:  warning: unused label 'error_dma_unregister'

    allmodconfig: return code #0:
	../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]

patches/0031-media-v4l2-fwnode-Simplify-v4l2_async_nf_parse_fwnod.patch:

   checkpatch.pl:
	$ cat patches/0031-media-v4l2-fwnode-Simplify-v4l2_async_nf_parse_fwnod.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0035-v4l-subdev-Add-pre_streamon-and-post_streamoff-callb.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: unused label 'error_group_unregister'
	../drivers/media/platform/rcar-vin/rcar-core.c:../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: unused label 'error_dma_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1597:1:  warning: unused label 'error_group_unregister'
	SPARSE:../drivers/media/platform/rcar-vin/rcar-core.c ../drivers/media/platform/rcar-vin/rcar-core.c:1610:1:  warning: unused label 'error_dma_unregister'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #0:
	../drivers/media/platform/rcar-vin/rcar-core.c:1610:1: warning: label ‘error_dma_unregister’ defined but not used [-Wunused-label]
	../drivers/media/platform/rcar-vin/rcar-core.c:1597:1: warning: label ‘error_group_unregister’ defined but not used [-Wunused-label]

