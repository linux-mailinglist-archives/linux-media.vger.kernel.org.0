Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8940A3E59F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 14:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbhHJMco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 08:32:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52302 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhHJMcn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 08:32:43 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mDQvb-009jG0-P6; Tue, 10 Aug 2021 12:32:19 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mDQvZ-0006IY-KL; Tue, 10 Aug 2021 12:32:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.15] mtk-vcodec: support for MT8183 decoder (#76235)
Date:   Tue, 10 Aug 2021 12:32:17 +0000
Message-Id: <20210810123217.24168-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <97ed8ac5-32ce-0603-f7a1-e9763016b71f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/97ed8ac5-32ce-0603-f7a1-e9763016b71f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/129979/
Build time: 00:37:49
Link: https://lore.kernel.org/linux-media/97ed8ac5-32ce-0603-f7a1-e9763016b71f@xs4all.nl

gpg: Signature made Mon 09 Aug 2021 12:26:08 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 9/14 patches with issues, being 7 at build time

Error/warnings:

patches/0001-media-mtk-vcodec-vdec-Support-H264-profile-control.patch:

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
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1425 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1979 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-media-mtk-vcodec-vdec-move-stateful-ops-into-their-o.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0006-media-mtk-vcodec-vdec-move-stateful-ops-into-their-o.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:1072: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0007-media-mtk-vcodec-vdec-handle-firmware-version-field.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0007-media-mtk-vcodec-vdec-handle-firmware-version-field.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:78: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0008-media-mtk-vcodec-support-version-2-of-decoder-firmwa.patch:

   checkpatch.pl:
	$ cat patches/0008-media-mtk-vcodec-support-version-2-of-decoder-firmwa.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:37: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:58: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:59: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:76: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:160: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:161: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0009-media-add-Mediatek-s-MM21-format.patch:

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
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1426 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1979 vivid_create_instance() parse error: turning off implications after 60 seconds
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0009-media-add-Mediatek-s-MM21-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:46: ERROR: trailing statements should be on next line
	-:58: WARNING: line length of 120 exceeds 100 columns

patches/0010-media-mtk-vcodec-vdec-support-stateless-API.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35:  warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0010-media-mtk-vcodec-vdec-support-stateless-API.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:180: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0011-media-mtk-vcodec-vdec-support-stateless-H.264-decodi.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35:  warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0011-media-mtk-vcodec-vdec-support-stateless-H.264-decodi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:52: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:76: CHECK: Macro argument 'cond' may be better as '(cond)' to avoid precedence issues
	-:78: CHECK: Macro argument reuse 'param' - possible side-effects?
	-:78: CHECK: Macro argument 'param' may be better as '(param)' to avoid precedence issues

patches/0012-media-mtk-vcodec-vdec-add-media-device-if-using-stat.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35:  warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
	SPARSE:../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c ../drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35:  warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?

patches/0014-media-mtk-vcodec-enable-MT8183-decoder.patch:

   checkpatch.pl:
	$ cat patches/0014-media-mtk-vcodec-enable-MT8183-decoder.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: externs should be avoided in .c files

