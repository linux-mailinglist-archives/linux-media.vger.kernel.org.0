Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DB339A255
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhFCNjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 09:39:46 -0400
Received: from www.linuxtv.org ([130.149.80.248]:51480 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230116AbhFCNjq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 09:39:46 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lonXs-000AAT-NF; Thu, 03 Jun 2021 13:38:00 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1loncG-00076m-KA; Thu, 03 Jun 2021 13:42:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Add HANTRO G2/HEVC decoder support for IMX8MQ (#74776)
Date:   Thu,  3 Jun 2021 13:42:32 +0000
Message-Id: <20210603134232.27283-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <22b74c83-28af-ff86-0b3e-94e4e48d447a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/22b74c83-28af-ff86-0b3e-94e4e48d447a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/112168/
Build time: 00:42:12
Link: https://lore.kernel.org/linux-media/22b74c83-28af-ff86-0b3e-94e4e48d447a@xs4all.nl

gpg: Signature made Thu 03 Jun 2021 12:14:30 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 6/9 patches with issues, being 3 at build time

Error/warnings:

patches/0001-media-hevc-Add-fields-and-flags-for-hevc-PPS.patch:

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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1929 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-hevc-Add-fields-and-flags-for-hevc-PPS.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:58: CHECK: Prefer using the BIT_ULL macro
	-:59: CHECK: Prefer using the BIT_ULL macro

patches/0002-media-hevc-Add-decode-params-control.patch:

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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1929 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0002-media-hevc-Add-decode-params-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:278: CHECK: Alignment should match open parenthesis
	-:307: WARNING: line length of 117 exceeds 100 columns

patches/0003-media-hantro-change-hantro_codec_ops-run-prototype-t.patch:

   checkpatch.pl:
	$ cat patches/0003-media-hantro-change-hantro_codec_ops-run-prototype-t.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0006-media-uapi-Add-a-control-for-HANTRO-driver.patch:

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
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1929 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2828 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0006-media-uapi-Add-a-control-for-HANTRO-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-media-hantro-Introduce-G2-HEVC-decoder.patch:

   checkpatch.pl:
	$ cat patches/0008-media-hantro-Introduce-G2-HEVC-decoder.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:136: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:348: WARNING: line length of 101 exceeds 100 columns

patches/0009-media-hantro-IMX8M-add-variant-for-G2-HEVC-codec.patch:

   checkpatch.pl:
	$ cat patches/0009-media-hantro-IMX8M-add-variant-for-G2-HEVC-codec.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: WARNING: DT compatible string "nxp,imx8mq-vpu-g2" appears un-documented -- check ./Documentation/devicetree/bindings/

