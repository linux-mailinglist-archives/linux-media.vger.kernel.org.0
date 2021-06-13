Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECBB3A5774
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 11:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFMKBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 06:01:45 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38388 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhFMKBp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 06:01:45 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lsMu7-00EWzJ-Hl; Sun, 13 Jun 2021 09:59:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lsMyZ-0007TQ-8V; Sun, 13 Jun 2021 10:04:19 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] v4l2-subdev: add subdev-wide state struct (#75003)
Date:   Sun, 13 Jun 2021 10:04:18 +0000
Message-Id: <20210613100419.28687-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e2098236-6b6d-4fbc-3493-4132a0cbb9d7@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/e2098236-6b6d-4fbc-3493-4132a0cbb9d7@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/114972/
Build time: 00:19:48
Link: https://lore.kernel.org/linux-media/e2098236-6b6d-4fbc-3493-4132a0cbb9d7@xs4all.nl

gpg: Signature made Sun 13 Jun 2021 09:26:10 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-subdev-add-subdev-wide-state-struct.patch:

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
	make[4]: *** [../scripts/Makefile.build:515: drivers/media/platform/atmel] Error 2
	make[3]: *** [../scripts/Makefile.build:515: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0001-media-v4l2-subdev-add-subdev-wide-state-struct.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:37: ERROR: Avoid using diff content in the commit message - patch(1) might not work
	-:9431: CHECK: Comparison to NULL could be written "!sd_state"
	-:13209: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:13335: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:13408: CHECK: Prefer kernel type 'u32' over 'uint32_t'


Error #512 when building PDF docs

