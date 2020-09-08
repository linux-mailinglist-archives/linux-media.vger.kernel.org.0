Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39B4261E22
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732453AbgIHTqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731669AbgIHTqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 15:46:09 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6828AC061756;
        Tue,  8 Sep 2020 12:46:08 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 60so264900otw.3;
        Tue, 08 Sep 2020 12:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R4o90DJRIMo4vx0ZN35Oj1htaD4YzPST5CK/AWBPOL4=;
        b=GzwxbpfuITLqbrgw/jqq6v0Rb5gAwJa+PReXvCUY6TKa0ltHRZrwDDJFXDE7hai7EM
         37xGkwEZsS5NFq7q5TeeMMhHBcRy+9CDkKg+UOxqhVxBKRHdqnbHsFrO0ETpLmYHT/RE
         75COCCfjaK7x5Tj1eH7+c37m5mkLa8TPcLnAzWLNoeeLO8JuOhj2ItXEm1sBO1Os3fVc
         oTuOqNjtG/DL15Q0VKJemPTupCPBYAA8XLqTP5bKMFZVmwXJwWwrjiG6hBEApKE0a8aE
         aPXOO+sf5q/Wj0RNfgG1usajNo4Y/IN7c317LM+rf/0EgfkhRUzXJZhSJ8/JWzn47EjE
         vzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=R4o90DJRIMo4vx0ZN35Oj1htaD4YzPST5CK/AWBPOL4=;
        b=O97X27xP+RmQr7KMkG1lTkvHvoJSl76k3bS0+i9e2gkJHcHiRwvr3snMs2pnnY0gDv
         P/sf+7doDvx2kArWHhPXQ0dQXUK8Wa83BO+pR4A2y2FdaGPKcWsILH3HaCMDdYQ4HNSM
         0usJaMXdYZp1lR0CUwJrSta6bze8kQJZM0G9Dq+h0ZKY47qe2V0fib4Ul1Re/4iUU4Om
         S0I9pqs8lX81DtYg6cOJbcZdB2tEGAYA3XCK8mdr13ycrDSezqF3+rhV3vKXEJKsviGF
         cmY09HM3BqzP6VyOsfsc0nenkellBDHy5K+J/Qgi0XiUy5ONrRGXxEiSu2dwZmMYRP0s
         tDOw==
X-Gm-Message-State: AOAM5331BWegJC1pdC52JSkWW0CQqYQoNJYpffUruIuHiS3TBeZGOZmh
        jQF+zbUj5nTiO2P+D1G8/cc=
X-Google-Smtp-Source: ABdhPJzf8VAeeueLEtTfYJnUxfyRGYu2KTfv7tpSaefRvJ77/lBojaemGZkVIYETMnNEvCvBHXhOwA==
X-Received: by 2002:a9d:67d0:: with SMTP id c16mr451629otn.347.1599594367765;
        Tue, 08 Sep 2020 12:46:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k19sm32216otb.45.2020.09.08.12.46.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 12:46:07 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 3/5] media: uvcvideo: Release stream queue when unregistering video device
Date:   Tue,  8 Sep 2020 12:45:55 -0700
Message-Id: <20200908194557.198335-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908194557.198335-1-linux@roeck-us.net>
References: <20200908194557.198335-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following traceback was observed when stress testing the uvcvideo
driver.

config->interface[0] is NULL
WARNING: CPU: 0 PID: 2757 at drivers/usb/core/usb.c:285 usb_ifnum_to_if+0x81/0x85
^^^ added log message and WARN() to prevent crash
Modules linked in: <...>
CPU: 0 PID: 2757 Comm: inotify_reader Not tainted 4.19.139 #20
Hardware name: Google Phaser/Phaser, BIOS Google_Phaser.10952.0.0 08/09/2018
RIP: 0010:usb_ifnum_to_if+0x81/0x85
Code: <...>
RSP: 0018:ffff9ee20141fa58 EFLAGS: 00010246
RAX: 438a0e5a525f1800 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff975477a1de90 RSI: ffff975477a153d0 RDI: ffff975477a153d0
RBP: ffff9ee20141fa70 R08: 000000000000002c R09: 002daec189138d78
R10: 0000001000000000 R11: ffffffffa7da42e6 R12: ffff975459594800
R13: 0000000000000001 R14: 0000000000000001 R15: ffff975465376400
FS:  00007ddebffd6700(0000) GS:ffff975477a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000012c83000 CR3: 00000001bbaf8000 CR4: 0000000000340ef0
Call Trace:
 usb_set_interface+0x3b/0x2f3
 uvc_video_stop_streaming+0x38/0x81 [uvcvideo]
 uvc_stop_streaming+0x21/0x49 [uvcvideo]
 __vb2_queue_cancel+0x33/0x249 [videobuf2_common]
 vb2_core_queue_release+0x1c/0x45 [videobuf2_common]
 uvc_queue_release+0x26/0x32 [uvcvideo]
 uvc_v4l2_release+0x41/0xdd [uvcvideo]
 v4l2_release+0x99/0xed
 __fput+0xf0/0x1ea
 task_work_run+0x7f/0xa7
 do_exit+0x1d1/0x6eb
 do_group_exit+0x9d/0xac
 get_signal+0x135/0x482
 do_signal+0x4a/0x63c
 exit_to_usermode_loop+0x86/0xa5
 do_syscall_64+0x171/0x269
 ? __do_page_fault+0x272/0x474
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7ddec156dc26
Code: Bad RIP value.
RSP: 002b:00007ddebffd5c10 EFLAGS: 00000293 ORIG_RAX: 0000000000000017
RAX: fffffffffffffdfe RBX: 000000000000000a RCX: 00007ddec156dc26
RDX: 0000000000000000 RSI: 00007ddebffd5d28 RDI: 000000000000000a
RBP: 00007ddebffd5c50 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00007ddebffd5d28
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

When this was observed, a USB disconnect was in progress, uvc_disconnect()
had returned, but usb_disable_device() was still running.
Drivers are not supposed to call any USB functions after the driver
disconnect function has been called. The uvcvideo driver does not follow
that convention and tries to write to the disconnected USB interface
anyway. This results in a variety of race conditions.

To solve this specific problem, release the uvc queue from
uvc_unregister_video() after the associated video devices have been
unregistered. Since the function already holds the uvc queue mutex,
bypass uvc_queue_release() and call vb2_queue_release() directly.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/media/usb/uvc/uvc_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index a5808305f1e3..27b72806b9b9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1955,6 +1955,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 		uvc_debugfs_cleanup_stream(stream);
 
+		vb2_queue_release(&stream->queue.queue);
+
 		mutex_unlock(&stream->queue.mutex);
 		mutex_unlock(&stream->mutex);
 	}
-- 
2.17.1

