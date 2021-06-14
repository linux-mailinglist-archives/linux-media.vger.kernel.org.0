Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E423A624E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhFNK6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:58:55 -0400
Received: from www.linuxtv.org ([130.149.80.248]:43902 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234315AbhFNK4t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:56:49 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lskEt-00GAwn-LP; Mon, 14 Jun 2021 10:54:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lskJL-0008Vn-Hq; Mon, 14 Jun 2021 10:59:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Support H264 4K on MT8192 (#75015)
Date:   Mon, 14 Jun 2021 10:59:16 +0000
Message-Id: <20210614105916.32678-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f0d85b90-4fd1-50f6-632f-02d5fec120b2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f0d85b90-4fd1-50f6-632f-02d5fec120b2@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/115267/
Build time: 00:16:43
Link: https://lore.kernel.org/linux-media/f0d85b90-4fd1-50f6-632f-02d5fec120b2@xs4all.nl

gpg: Signature made Mon 14 Jun 2021 10:30:00 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 6/6 patches with issues, being 6 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mtk-vcodec-venc-remove-redundant-code.patch:

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
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0002-dt-bindings-media-mtk-vcodec-Add-dma-ranges-property.patch:

    allyesconfig: return code #512:
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0003-media-mtk-vcodec-Support-34bits-dma-address-for-venc.patch:

    allyesconfig: return code #512:
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0004-dt-bindings-media-mtk-vcodec-Add-binding-for-MT8192-.patch:

    allyesconfig: return code #512:
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0005-media-mtk-vcodec-Add-MT8192-H264-venc-driver.patch:

    allyesconfig: return code #512:
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0006-media-mtk-vcodec-Support-MT8192-H264-4K-encoding.patch:

    allyesconfig: return code #512:
	(null):builtin:2:0: error: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	SPARSE:(null) builtin:2:0:  warning: missing terminating " character
	No such file: drivers/media/platform/atmel/atmel-xisc"
	make[5]: *** [../scripts/Makefile.build:272: drivers/media/platform/atmel/atmel-isc-base.o] Error 1
	make[5]: *** Deleting file 'drivers/media/platform/atmel/atmel-isc-base.o'
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2


Error #512 when building PDF docs

