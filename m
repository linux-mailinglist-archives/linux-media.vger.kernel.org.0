Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C46C256EDE
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgH3PEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgH3PEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:49 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04068C061573;
        Sun, 30 Aug 2020 08:04:49 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id k13so523583oor.2;
        Sun, 30 Aug 2020 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=BuCpEw+EZ23rQm56+0nKrPRHRJlGh2aurjyoqcnesH8=;
        b=OB5COtSUNnP5PJ4wdVP/6+MrypbDCHdoNk54WOKjOPRe/jAHZqhBbTLdyqE5+G4dOz
         cxDb/yKwEOlG873h7CtUAkUOWV9nzABG5nAwCVRoouk8+fjlXe2vuP74P/7S8wBXHFmY
         mf1qakKt1kLlqfWIL5jVZcwA3AXheyfX8EQmwCWOu7ImiXR46tywdmWTuR3BSSVxluNd
         BvTzP3+4yFZDbd1mkscO2ZEc8J4oVtLHl4wChY0mEgjsTSNItqFKATdRs1D2feWtdXbA
         Yd6jjbtlbeTMV1sQCpJY5KDSR1bivwG9G/ZZLA+PQhc34iket8l5wPtb6vB2/ojAe0F4
         PZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=BuCpEw+EZ23rQm56+0nKrPRHRJlGh2aurjyoqcnesH8=;
        b=ktxgReDOdoU6p/k19N8sAJyXFR1wOrW1QeQuZjvF7vvE6fqcgNP2abrBH2rcKwPAPB
         hrDi89zmxpJ5k01y/nAAFTDX984MoyKfiOEpK325tjD2XHgSVbLVWa11r5ExxjyRTdwh
         9dM23FNZQxAvpOH8e+RNQSvIRipSnvgSkSQ1AimboRcIWa1u3qknxvVcyeh9SKZ5NrP9
         lbBAKAvD5fmyxQblB7pmZEwdDCUjyot566vQ3HduBxmiSExEOcise8GLrjtwT+9tQdm5
         jZXQji9G6TcPrjm8QFlcVVDrHpd8+SZOOwYL7s1q0yNE62aR1sgXxzMNQUhmzXvE0MFR
         xdkQ==
X-Gm-Message-State: AOAM532B0oPdkG/gyGFnXE/Po8uaIsnyXJFWfpksI5ljRk9j7MuuOsbW
        5xy5eRKpTFcSAf7PgEw4QMw=
X-Google-Smtp-Source: ABdhPJyjV//48S9aVDUGtC9l8bZgiGM0RCaQxnsJ2nXVgCgjgQFTsA5rGb7yXz5svqlsJhhpYWHtdQ==
X-Received: by 2002:a4a:e98e:: with SMTP id s14mr5092375ood.28.1598799887541;
        Sun, 30 Aug 2020 08:04:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm661387oih.55.2020.08.30.08.04.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:46 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] media: uvcvideo: Fix race conditions
Date:   Sun, 30 Aug 2020 08:04:38 -0700
Message-Id: <20200830150443.167286-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvcvideo code has no lock protection against USB disconnects
while video operations are ongoing. This has resulted in random
error reports, typically pointing to a crash in usb_ifnum_to_if(),
called from usb_hcd_alloc_bandwidth(). A typical traceback is as
follows.

usb 1-4: USB disconnect, device number 3
BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
RIP: 0010:usb_ifnum_to_if+0x29/0x40
Code: <...>
RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
Call Trace:
 usb_hcd_alloc_bandwidth+0x1ee/0x30f
 usb_set_interface+0x1a3/0x2b7
 uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
 uvc_video_start_streaming+0x91/0xdd [uvcvideo]
 uvc_start_streaming+0x28/0x5d [uvcvideo]
 vb2_start_streaming+0x61/0x143 [videobuf2_common]
 vb2_core_streamon+0xf7/0x10f [videobuf2_common]
 uvc_queue_streamon+0x2e/0x41 [uvcvideo]
 uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
 __video_do_ioctl+0x33d/0x42a
 video_usercopy+0x34e/0x5ff
 ? video_ioctl2+0x16/0x16
 v4l2_ioctl+0x46/0x53
 do_vfs_ioctl+0x50a/0x76f
 ksys_ioctl+0x58/0x83
 __x64_sys_ioctl+0x1a/0x1e
 do_syscall_64+0x54/0xde

While this is problem rarely observed in the field, it is relatively easy
to reproduce by adding msleep() calls into the code.

I don't presume to claim that I found every issue, but this patch series
should fix at least the major problems.

The patch series was tested exensively on a Chromebook running chromeos-4.19
and on a Linux system running a v5.8.y based kernel.

----------------------------------------------------------------
Guenter Roeck (5):
      media: uvcvideo: Cancel async worker earlier
      media: uvcvideo: Lock video streams and queues while unregistering
      media: uvcvideo: Release stream queue when unregistering video device
      media: uvcvideo: Protect uvc queue file operations against disconnect
      media: uvcvideo: In uvc_v4l2_open, check if video device is registered

 drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
 drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 5 files changed, 93 insertions(+), 8 deletions(-)
