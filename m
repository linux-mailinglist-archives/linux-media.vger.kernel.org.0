Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5355261E29
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732436AbgIHTqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732428AbgIHTqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 15:46:00 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10233C061573;
        Tue,  8 Sep 2020 12:45:59 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g96so216469otb.12;
        Tue, 08 Sep 2020 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=STrKbBps3DyxZyvt/4q1Iuhb/wWwFI7ORLwwIxZU2dg=;
        b=sl0F+ukcpzaeyrX4C0ymA8ZwbmQPE3oGtce3+TXWuHwzZpMDiSxfGH5dxB9AdwaSxC
         s0qvu2twIM4mz5i3MPvcv/E2L2mKVyq02c6HoeBJ8q2N4a2prtNZudtMcBVLkGsoWoOJ
         8yJhszXb4l/NWIgcE7WtygdjwG1OLHIgdmwraSaS/xVerRUk/zLU8wJp0yzWJ4e8QQY7
         Zsm6fcrPCwVO2k5/LvEfSteWPm/h36noISjc4K5dG5KjimC251QWR0JB8rnbnbaol4hL
         /uwu0VupgYNgpAKYEHgG+keSlPAyB7XsfE6kAEuGReW1frElJ2FcXFY3eWIWzt806MEL
         IdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=STrKbBps3DyxZyvt/4q1Iuhb/wWwFI7ORLwwIxZU2dg=;
        b=HAGfzCZ6S0kO0ZFX04Vrric64Y7bG5AN/ByTJr/Sazf08emXW/Zotz2EyoNsFRyzAZ
         erHtRELxTTDW5mFfrkdat9Qel6jCbpbyxUi0WO+ILSP+I2QgVyE2uANGUBhq0JONNIib
         uyHeAPSl5MG3RGSXq/VzvpC1uVbqWgRItP1Tkr46caF7tXEAizU0N2tnmG1ujNVhnR4i
         J3XLWH1pYlJgKyxnHcGY/MHel/3dpUB1LQrYJwgfdv1geuNxgDp3AnREfXruY1zObfoU
         owZ9gubrQMgKqwH/PxZWx6Oa2eqWscGStHMm6hr3+a7gJHTyduGOSXTpPTMmT24ks7BA
         dM8w==
X-Gm-Message-State: AOAM533eUhuNkP5h1KPw9zmKGztcw3GbvInU6oq5Lhkk7/47SqG6R/VW
        H/IN+uE8ZGXbWG7Az3OeHD8=
X-Google-Smtp-Source: ABdhPJyQDQWWSlyN4K8nA51FYJx72ZXKQ6pb2zWYc3v4dNDZCng9zwqDWmEHwYNn0HsrT4vQjdVPWQ==
X-Received: by 2002:a9d:65ce:: with SMTP id z14mr541320oth.280.1599594359145;
        Tue, 08 Sep 2020 12:45:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18sm34133otr.12.2020.09.08.12.45.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 12:45:58 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] media: uvcvideo: Fix race conditions
Date:   Tue,  8 Sep 2020 12:45:52 -0700
Message-Id: <20200908194557.198335-1-linux@roeck-us.net>
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

While there are not many references to this problem on mailing lists, it is
reported on a regular basis on various Chromebooks (roughly 300 reports
per month). The problem is relatively easy to reproduce by adding msleep()
calls into the code.

I tried to reproduce the problem with non-uvcvideo webcams, but was
unsuccessful. I was unable to get Philips (pwc) webcams to work. gspca
based webcams don't experience the problem, or at least I was unable to
reproduce it (The gspa driver does not trigger sending USB messages in the
open function, and otherwise uses the locking mechanism provided by the
v4l2/vb2 core).

I don't presume to claim that I found every issue, but this patch series
should fix at least the major problems.

The patch series was tested exensively on a Chromebook running chromeos-4.19
and on a Linux system running a v5.8.y based kernel.

v2:
- Added details about problem frequency and testing with non-uvc webcams
  to summary
- In patch 4/5, return EPOLLERR instead of -ENODEV on poll errors
- Fix description in patch 5/5

----------------------------------------------------------------
Guenter Roeck (5):
      media: uvcvideo: Cancel async worker earlier
      media: uvcvideo: Lock video streams and queues while unregistering
      media: uvcvideo: Release stream queue when unregistering video device
      media: uvcvideo: Protect uvc queue file operations against disconnect
      media: uvcvideo: Abort uvc_v4l2_open if video device is unregistered

 drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
 drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 5 files changed, 93 insertions(+), 8 deletions(-)
