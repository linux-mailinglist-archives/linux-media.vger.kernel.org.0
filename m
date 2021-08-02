Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676CE3DD14F
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhHBHkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 03:40:05 -0400
Received: from www.linuxtv.org ([130.149.80.248]:60006 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232173AbhHBHkE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 03:40:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mASYD-00FN1J-NF; Mon, 02 Aug 2021 07:39:54 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mAScy-00050R-Dj; Mon, 02 Aug 2021 07:44:48 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.15] rcar improvements, V4L2 async notifier and (#76130)
Date:   Mon,  2 Aug 2021 07:44:48 +0000
Message-Id: <20210802074448.19202-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802065138.GI3@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210802065138.GI3@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/129188/
Build time: 00:36:51
Link: https://lore.kernel.org/linux-media/20210802065138.GI3@valkosipuli.retiisi.eu

gpg: Signature made Mon 02 Aug 2021 06:34:57 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 11/22 patches with issues, being 10 at build time

Error/warnings:

patches/0001-media-dt-bindings-media-renesas-csi2-Add-r8a779a0-su.patch:

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
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0012-rcar-vin-Move-and-rename-CSI-2-link-notifications.patch:

   checkpatch.pl:
	$ cat patches/0012-rcar-vin-Move-and-rename-CSI-2-link-notifications.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:340: CHECK: Lines should not end with a '('

patches/0014-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allyesconfig: return code #0:
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
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

patches/0015-media-rcar-vin-Remove-explicit-device-availability-c.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

patches/0016-media-v4l2-fwnode-Simplify-v4l2_async_nf_parse_fwnod.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0016-media-v4l2-fwnode-Simplify-v4l2_async_nf_parse_fwnod.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0017-media-mt9p031-Read-back-the-real-clock-rate.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

patches/0018-media-mt9p031-Make-pixel-clock-polarity-configurable.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0018-media-mt9p031-Make-pixel-clock-polarity-configurable.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:48: CHECK: Alignment should match open parenthesis

patches/0019-media-mt9p031-Fix-corrupted-frame-after-restarting-s.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0019-media-mt9p031-Fix-corrupted-frame-after-restarting-s.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: CHECK: Prefer using the BIT macro
	-:36: CHECK: Prefer using the BIT macro

patches/0020-media-mt9p031-Use-BIT-macro.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

patches/0021-media-dt-bindings-mt9p031-Convert-bindings-to-yaml.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0021-media-dt-bindings-mt9p031-Convert-bindings-to-yaml.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:121: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0022-media-dt-bindings-mt9p031-Add-missing-required-prope.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:646:2: error: implicit declaration of function ‘v4l2_async_notifier_init’; did you mean ‘v4l2_async_nf_init’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:672:8: error: implicit declaration of function ‘v4l2_async_notifier_add_fwnode_remote_subdev’; did you mean ‘v4l2_async_nf_add_fwnode_remote’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:673:15: error: expected expression before ‘struct’
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:683:8: error: implicit declaration of function ‘v4l2_async_subdev_notifier_register’; did you mean ‘v4l2_async_subdev_nf_register’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:940:2: error: implicit declaration of function ‘v4l2_async_notifier_unregister’; did you mean ‘v4l2_async_nf_unregister’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx8mq-mipi-csi2.c:941:2: error: implicit declaration of function ‘v4l2_async_notifier_cleanup’; did you mean ‘v4l2_async_nf_cleanup’? [-Werror=implicit-function-declaration]
	cc1: some warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:271: drivers/staging/media/imx/imx8mq-mipi-csi2.o] Error 1
	make[4]: *** [../scripts/Makefile.build:514: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:514: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:514: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1841: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

