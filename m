Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0295C3ACA85
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhFRMDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:03:35 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38240 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231536AbhFRMDd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:03:33 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1luDBZ-004nsP-Pc; Fri, 18 Jun 2021 12:01:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1luDG2-0001n4-1H; Fri, 18 Jun 2021 12:05:58 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Various fixes (#75237)
Date:   Fri, 18 Jun 2021 12:05:57 +0000
Message-Id: <20210618120557.6840-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <56e1093d-34e9-491d-01d8-2401b58a6465@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/56e1093d-34e9-491d-01d8-2401b58a6465@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/116358/
Build time: 00:23:36
Link: https://lore.kernel.org/linux-media/56e1093d-34e9-491d-01d8-2401b58a6465@xs4all.nl

gpg: Signature made Fri 18 Jun 2021 11:30:47 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/16 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-hevc-Add-segment-address-field.patch:

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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-drivers-media-usb-gspca-fix-typo-Fliker-Flicker.patch:

   checkpatch.pl:
	$ cat patches/0004-drivers-media-usb-gspca-fix-typo-Fliker-Flicker.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:48: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:48: CHECK: Avoid CamelCase: <adcm2700_NoFlicker>
	-:57: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:57: CHECK: Avoid CamelCase: <cs2102_NoFlickerScale>
	-:66: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:66: CHECK: Avoid CamelCase: <cs2102_NoFlicker>
	-:75: CHECK: Avoid CamelCase: <gc0305_NoFlicker>
	-:84: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:84: CHECK: Avoid CamelCase: <hdcs2020_NoFlicker>
	-:93: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:93: CHECK: Avoid CamelCase: <hv7131b_NoFlicker>
	-:102: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:102: CHECK: Avoid CamelCase: <hv7131b_NoFlickerScale>
	-:111: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:111: CHECK: Avoid CamelCase: <hv7131r_NoFlicker>
	-:120: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:120: CHECK: Avoid CamelCase: <hv7131r_NoFlickerScale>
	-:129: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:129: CHECK: Avoid CamelCase: <icm105a_NoFlickerScale>
	-:138: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:138: CHECK: Avoid CamelCase: <icm105a_NoFlicker>
	-:147: CHECK: Avoid CamelCase: <mc501cb_NoFlicker>
	-:156: CHECK: Avoid CamelCase: <mc501cb_NoFlickerScale>
	-:165: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:165: CHECK: Avoid CamelCase: <ov7620_NoFlicker>
	-:174: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:174: CHECK: Avoid CamelCase: <pas106b_NoFlicker>
	-:183: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:183: CHECK: Avoid CamelCase: <pas202b_NoFlicker>
	-:192: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:192: CHECK: Avoid CamelCase: <pas202b_NoFlickerScale>
	-:201: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:201: CHECK: Avoid CamelCase: <mt9v111_1_AENoFlicker>
	-:210: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:210: CHECK: Avoid CamelCase: <mt9v111_1_AENoFlickerScale>
	-:219: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:219: CHECK: Avoid CamelCase: <mt9v111_3_AENoFlicker>
	-:228: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:228: CHECK: Avoid CamelCase: <mt9v111_3_AENoFlickerScale>
	-:237: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:237: CHECK: Avoid CamelCase: <pb0330_NoFlicker>
	-:246: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:246: CHECK: Avoid CamelCase: <pb0330_NoFlickerScale>
	-:255: CHECK: Avoid CamelCase: <po2030_NoFlicker>
	-:264: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:264: CHECK: Avoid CamelCase: <tas5130c_NoFlicker>
	-:273: CHECK: Avoid CamelCase: <tas5130c_NoFlickerScale>
	-:282: CHECK: Avoid CamelCase: <gc0303_NoFlicker>
	-:291: CHECK: Avoid CamelCase: <gc0303_NoFlickerScale>


Error #512 when building PDF docs

