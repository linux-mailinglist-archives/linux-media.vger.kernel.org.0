Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC37256EE8
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgH3PFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgH3PEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:51 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE3C061573;
        Sun, 30 Aug 2020 08:04:50 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id j7so4986886oij.9;
        Sun, 30 Aug 2020 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OYzNNlQnqbfdrR5BIEiLRBleJJxXkTs1ZX+qGsGLh84=;
        b=h8YR4hedSi8kp7nYNZN7j/BPhMClAEoyXxVj33nY231jl6DtXzhAWk52ftw1kGvj4H
         l2TFZ0egurTwgfPeAXv4ySlV4KmK7W7TeY/2Yb+cQAJlERF63uPSGz5XDLUwK3S/mMMu
         5Ud3oIHE6GTv3eKFqVTtE0Kmpq9ty2AYAg4qItPaf4kvYZZQv3r5gwqq5oHo0K3rgHBN
         suJz8sVzirqw6yBCJp1Nci0/suOKUYEAl0thM+5EN216NX6sbktHP5HWFV4LpIYvxvP5
         mX0jNA/idyX6Paq8l6YtOW0v6NFQx5GPVP5lxjGn2IKI7awLa3DYZl6q6tMjVTm+8tM7
         gBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OYzNNlQnqbfdrR5BIEiLRBleJJxXkTs1ZX+qGsGLh84=;
        b=INryj1UCUcIC8t7G4w4Gv/+77hLWXLapUAhkVe/s11/HHRL5RKAbthazPWpdf0QAe7
         Q68KwyxP3uaDvf9iNm7VZ/SiJjqvt+EsRXLfQAdu9rpF9f0LFixpA+QBItSjExPyAq3I
         ntS/DsenK6AzWdSixbFqa3QmEqsDOMAgKLrvb3j+IZaiFO+Q/iQzIog2PkMpjwQyNOPD
         0XVPkZH7qej6FSjjPFxUiBCP0e4mS2tjhiZLPuFCgNQlm3NZ60LnZmew+pq+iNMxTxu6
         OUjicN++RqpKzzw4K62DusVHdfeA7tyUO3e0aw5ebn3JIp3e68YER0Wkfjs+Bs+4YTic
         tg9w==
X-Gm-Message-State: AOAM530C99QwJKYcqdBLzpGlaRzmBn8jRRFlAAAgfveV3NU6rIc0v9jX
        iwqVeu6aRKtMNfwaMYHtVRk=
X-Google-Smtp-Source: ABdhPJwOfWD7+aGHr0WUHi0M8wt0arY6aznSeE7vZseyiAI0QaYuT0UPhOeyhcOIY3epqg3aPohAVA==
X-Received: by 2002:a05:6808:7c8:: with SMTP id f8mr1242699oij.119.1598799889315;
        Sun, 30 Aug 2020 08:04:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q9sm882356ooe.33.2020.08.30.08.04.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:48 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/5] media: uvcvideo: Cancel async worker earlier
Date:   Sun, 30 Aug 2020 08:04:39 -0700
Message-Id: <20200830150443.167286-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

So far the asynchronous control worker was canceled only in
uvc_ctrl_cleanup_device. This is much later than the call to
uvc_disconnect. However, after the call to uvc_disconnect returns,
there must be no more USB activity. This can result in all kinds
of problems in the USB code. One observed example:

URB ffff993e83d0bc00 submitted while active
WARNING: CPU: 0 PID: 4046 at drivers/usb/core/urb.c:364 usb_submit_urb+0x4ba/0x55e
Modules linked in: <...>
CPU: 0 PID: 4046 Comm: kworker/0:35 Not tainted 4.19.139 #18
Hardware name: Google Phaser/Phaser, BIOS Google_Phaser.10952.0.0 08/09/2018
Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
RIP: 0010:usb_submit_urb+0x4ba/0x55e
Code: <...>
RSP: 0018:ffffb08d471ebde8 EFLAGS: 00010246
RAX: a6da85d923ea5d00 RBX: ffff993e71985928 RCX: 0000000000000000
RDX: ffff993f37a1de90 RSI: ffff993f37a153d0 RDI: ffff993f37a153d0
RBP: ffffb08d471ebe28 R08: 000000000000003b R09: 001424bf85822e96
R10: 0000001000000000 R11: ffffffff975a4398 R12: ffff993e83d0b000
R13: ffff993e83d0bc00 R14: 0000000000000000 R15: 00000000fffffff0
FS:  0000000000000000(0000) GS:ffff993f37a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000ec9c0000 CR3: 000000025b160000 CR4: 0000000000340ef0
Call Trace:
 uvc_ctrl_status_event_work+0xd6/0x107 [uvcvideo]
 process_one_work+0x19b/0x4c5
 worker_thread+0x10d/0x286
 kthread+0x138/0x140
 ? process_one_work+0x4c5/0x4c5
 ? kthread_associate_blkcg+0xc1/0xc1
 ret_from_fork+0x1f/0x40

Introduce new function uvc_ctrl_stop_device() to cancel the worker
and call it from uvc_unregister_video() to solve the problem.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++----
 drivers/media/usb/uvc/uvc_driver.c |  1 +
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e399b9fad757..130c56e0063d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2340,14 +2340,17 @@ static void uvc_ctrl_cleanup_mappings(struct uvc_device *dev,
 	}
 }
 
-void uvc_ctrl_cleanup_device(struct uvc_device *dev)
+void uvc_ctrl_stop_device(struct uvc_device *dev)
 {
-	struct uvc_entity *entity;
-	unsigned int i;
-
 	/* Can be uninitialized if we are aborting on probe error. */
 	if (dev->async_ctrl.work.func)
 		cancel_work_sync(&dev->async_ctrl.work);
+}
+
+void uvc_ctrl_cleanup_device(struct uvc_device *dev)
+{
+	struct uvc_entity *entity;
+	unsigned int i;
 
 	/* Free controls and control mappings for all entities. */
 	list_for_each_entry(entity, &dev->entities, list) {
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..bfba67a69185 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1952,6 +1952,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	}
 
 	uvc_status_unregister(dev);
+	uvc_ctrl_stop_device(dev);
 
 	if (dev->vdev.dev)
 		v4l2_device_unregister(&dev->vdev);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..543afcd9fd26 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -830,6 +830,7 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 			 const struct uvc_control_mapping *mapping);
 int uvc_ctrl_init_device(struct uvc_device *dev);
+void uvc_ctrl_stop_device(struct uvc_device *dev);
 void uvc_ctrl_cleanup_device(struct uvc_device *dev);
 int uvc_ctrl_restore_values(struct uvc_device *dev);
 bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
-- 
2.17.1

