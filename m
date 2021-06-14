Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DFA3A5FCC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhFNKQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:16:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39644 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232698AbhFNKQn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:16:43 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lsjc8-00G8JB-GG; Mon, 14 Jun 2021 10:14:40 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lsjga-0004v0-93; Mon, 14 Jun 2021 10:19:16 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] v2: v4l2-subdev: add subdev-wide state struct (#75014)
Date:   Mon, 14 Jun 2021 10:19:15 +0000
Message-Id: <20210614101916.18865-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c54f4d29-23b1-02b0-72b1-3fb4134e1b03@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/c54f4d29-23b1-02b0-72b1-3fb4134e1b03@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/115261/
Build time: 00:15:52
Link: https://lore.kernel.org/linux-media/c54f4d29-23b1-02b0-72b1-3fb4134e1b03@xs4all.nl

gpg: Signature made Mon 14 Jun 2021 09:48:01 AM UTC
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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1971 vivid_create_instance() parse error: turning off implications after 60 seconds
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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:515: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1844: drivers] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0001-media-v4l2-subdev-add-subdev-wide-state-struct.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:37: ERROR: Avoid using diff content in the commit message - patch(1) might not work
	-:9434: CHECK: Comparison to NULL could be written "!sd_state"
	-:13212: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:13338: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:13411: CHECK: Prefer kernel type 'u32' over 'uint32_t'


Error #512 when building PDF docs

