Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C90A3AA143
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 18:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbhFPQ37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 12:29:59 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45092 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232234AbhFPQ37 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 12:29:59 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ltYOO-001tCs-93; Wed, 16 Jun 2021 16:27:52 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ltYSr-0005Yi-9M; Wed, 16 Jun 2021 16:32:29 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] gmsl: Reliability improvements (#75152)
Date:   Wed, 16 Jun 2021 16:32:29 +0000
Message-Id: <20210616163229.21327-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <26aa3fed-ec7f-fbcc-3f05-5660d12750dd@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/26aa3fed-ec7f-fbcc-3f05-5660d12750dd@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/115851/
Build time: 00:16:45
Link: https://lore.kernel.org/linux-media/26aa3fed-ec7f-fbcc-3f05-5660d12750dd@xs4all.nl

gpg: Signature made Wed 16 Jun 2021 01:07:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/15 patches with issues, being 2 at build time

Error/warnings:

patches/0001-media-i2c-max9286-Adjust-parameters-indent.patch:

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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1969 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0011-media-i2c-rdacm20-Enable-noise-immunity.patch:

    allyesconfig: return code #512:
	../drivers/media/i2c/rdacm20.c:554:36: error: passing argument 1 of ‘max9271_set_high_threshold’ from incompatible pointer type [-Werror=incompatible-pointer-types]
	In file included from ../drivers/media/i2c/rdacm20.c:30:
	../drivers/media/i2c/max9271.h:127:55: note: expected ‘struct max9271_device *’ but argument is of type ‘struct max9271_device **’
	cc1: some warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:272: drivers/media/i2c/rdacm20.o] Error 1
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/i2c/rdacm20.c:554:36: error: passing argument 1 of ‘max9271_set_high_threshold’ from incompatible pointer type [-Werror=incompatible-pointer-types]
	In file included from ../drivers/media/i2c/rdacm20.c:30:
	../drivers/media/i2c/max9271.h:127:55: note: expected ‘struct max9271_device *’ but argument is of type ‘struct max9271_device **’
	cc1: some warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:272: drivers/media/i2c/rdacm20.o] Error 1
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

