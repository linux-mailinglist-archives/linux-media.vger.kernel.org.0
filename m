Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7793A9D04
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 16:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbhFPOKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 10:10:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:57072 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233828AbhFPOKx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 10:10:53 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ltWDm-001kFc-3i; Wed, 16 Jun 2021 14:08:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ltWIF-0000EL-9o; Wed, 16 Jun 2021 14:13:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Venus updates part2 (#74989)
Date:   Wed, 16 Jun 2021 14:13:23 +0000
Message-Id: <20210616141323.844-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210611121601.330645-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210611121601.330645-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/115849/
Build time: 00:14:06
Link: https://lore.kernel.org/linux-media/20210611121601.330645-1-stanimir.varbanov@linaro.org

gpg: Signature made Fri 11 Jun 2021 12:08:27 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 2/2 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-venus-hfi_cmds-Fix-packet-size-calculation.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]

    allyesconfig: return code #512:
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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/usb/em28xx/em28xx-video.o] Error 1
	make[5]: *** Deleting file 'drivers/media/usb/em28xx/em28xx-video.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/usb/em28xx] Error 2
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/usb] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0002-media-venus-hfi_msgs.h-Replace-one-element-arrays-wi.patch:

    allyesconfig: return code #512:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1969 vivid_create_instance() parse error: turning off implications after 60 seconds
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/test-drivers/vivid/vivid-core.o] Error 1
	make[5]: *** Deleting file 'drivers/media/test-drivers/vivid/vivid-core.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/test-drivers/vivid] Error 2
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/test-drivers] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/usb/em28xx/em28xx-video.o] Error 1
	make[5]: *** Deleting file 'drivers/media/usb/em28xx/em28xx-video.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/usb/em28xx] Error 2
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/usb] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0002-media-venus-hfi_msgs.h-Replace-one-element-arrays-wi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

