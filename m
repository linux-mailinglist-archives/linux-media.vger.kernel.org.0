Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0883C26D139
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 04:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgIQCdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 22:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgIQCdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 22:33:07 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6541FC061756;
        Wed, 16 Sep 2020 19:25:57 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id i17so674444oig.10;
        Wed, 16 Sep 2020 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=R5XYK+FD12SBr+zByKiW7lJ2AXayCleve7wGCw+emfg=;
        b=V9UjUCYOOdeSu2uHFLTg7/KcyyISDs1n0pfeaYK3t4TaGUl8l5NpOAGQCUzEFZ1Ire
         57sYAG3FYfR4OZzOGFq335xtt6YTXKZz0FTqrUrnLL3QDEyWiuwqmNKwAPYgSrQOWMun
         xnV6RqwF7NlC8RNPGk0ub9VhlU6J86rmNN/4YCtbGqmK+n1PFa20qE8wPhxSNVHuSkTr
         Ir31bTJGeNEzfFK2rGRFqp2QCjFAl/B6KM9c+bztlk1Y3ZqD3YMw/6Wzk0/E7b9xk6KM
         iDWBiMIWHDD6+BuT0nGYs7NaBhQT2EjvkvaRhyMmep72hgezTK1lT+qQm1rLWHtcmJQp
         QXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=R5XYK+FD12SBr+zByKiW7lJ2AXayCleve7wGCw+emfg=;
        b=aCyXrqAvvruF/NkUpi9O8leJoGnoe6WdNIst8sCfHUejV0I5NLj2xHHej45dBlZjTE
         Vhy9QeZoAg9UJry6pyKA/FI6t4xc9qqYlk4I8x2qQW3eMwmrqfVt27Xs0sOegk9m5CWz
         jttfiurC/p4pwt04VnG5FcdtNx46BxmI4NjZncFq5OfEhY3PB0xiJB92cFaRhCpa8BRG
         28LEW9K99zcX6fzbjo0r5MH8KIAhCELcfOvrxRlB7AQtkDuep8MDig/+pZN9h5odHMih
         9HvRFVMNBjZZ1O4vu5I5OpOoBmldvaUIXtiZLU1GrKXUo3UNwIsnRRiBbXEG7MzocCe5
         EJmQ==
X-Gm-Message-State: AOAM532amXfPDHMM0JuyikeujNioVnJ9mL0sUFNdqJZxBLoMweHditEj
        /nWq7YyJbYBYyQb9vbxvp+WtNGNibbA=
X-Google-Smtp-Source: ABdhPJzPPJOoGkQ+eWqM+gcoZekSgumJCUcku3YiZ/oKUVcrJKQGqOqnkjl9KwukPmqXoKDf6g5X0g==
X-Received: by 2002:a54:440f:: with SMTP id k15mr1096762oiw.131.1600309556810;
        Wed, 16 Sep 2020 19:25:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16sm9424322otq.31.2020.09.16.19.25.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 19:25:55 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RESEND v3 0/5] media: uvcvideo: Fix race conditions
Date:   Wed, 16 Sep 2020 19:25:42 -0700
Message-Id: <20200917022547.198090-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Something seems to have gone wrong with v3 of this patch series.
I am sure I sent it out, but I don't find it anywhere.
Resending. Sorry for any duplicates.

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

v3:
- In patch 5/5, add missing calls to usb_autopm_put_interface() and kfree()
  to failure code path

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
