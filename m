Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5093AB491
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhFQNXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:23:40 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35922 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232488AbhFQNXk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:23:40 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ltrxb-0039RI-Ot; Thu, 17 Jun 2021 13:21:31 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lts24-0007mY-Vc; Thu, 17 Jun 2021 13:26:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] ti-vpe: cal: improvements towards multistream (#75189)
Date:   Thu, 17 Jun 2021 13:26:08 +0000
Message-Id: <20210617132608.29873-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <df45f248-fe1e-4dc7-b26a-51a36bba90bb@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/df45f248-fe1e-4dc7-b26a-51a36bba90bb@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/116092/
Build time: 00:29:09
Link: https://lore.kernel.org/linux-media/df45f248-fe1e-4dc7-b26a-51a36bba90bb@xs4all.nl

gpg: Signature made Thu 17 Jun 2021 12:42:15 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/35 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ti-vpe-cal-add-g-s_parm-for-legacy-API.patch:

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


Error #512 when building PDF docs

