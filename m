Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B39256EE3
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgH3PFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgH3PEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:54 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CAAC061236;
        Sun, 30 Aug 2020 08:04:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id i4so270069ota.2;
        Sun, 30 Aug 2020 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pMRtD6tzB0RfchkgrwI0vaPh8EOiJQaXxLNReVAOoxQ=;
        b=oIywOkO7Lkwid5PbB8cZGWceW9jnT9dfHQdi7ZtIXdTVRSXFVnaOMrg7SLMadALZME
         JJ+m1bxfgn+QY3zfwNicERjnkWt2wVP4ZcjkWP/g+jL7r7RoW992yxpcd4vIAIo7Havg
         24o4uXcPGfkIx/d/sgVrMQ50b5THtqJJznnJFtmfzxSDLHutc/7rcL+q5Lb+PTwzGGds
         Pxuq+f/7FylqQR7/SUaoWeuPBfULol4t3p9tgZHjTVFFUekoqC94D1pXDRP3XjnEXbS4
         95XOIWJ3aA1cUqkZJE7WVS2rxkma2E8yl5FJ3tKt5thOBcvoHTQda2oUDGS8d0fZK39z
         mWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=pMRtD6tzB0RfchkgrwI0vaPh8EOiJQaXxLNReVAOoxQ=;
        b=qgnfq8C11aPelUJ0wlIrGNt+ySLeE0G+JhVBhR2hK4LvVusIHCknfL5NvtPkHqGoUs
         lmOteu/c9xUUymFcgh1MNiB2ftNRBsFmraDEF/7X87oO9brMi/n9U8GAcQEIHRPEXsx5
         1Xp7axW4nmxWXKnXdqAy1n5bNAEgfMpx6OXzmTn3kgQ+TPReVVTiKS5fOBNw1wye2gl9
         1jc9pbvYVvMX32kpNm9ODyHDGeXJE8a3bmQtdXimw4SKOecctvxv4we7DeUfxYRaITfC
         8DNcra6ihkVTRbmIMNNAnjH9eA35CbeMGV16PBCPCZirSYfSYHosj/Gal0GvET/48PN/
         27lA==
X-Gm-Message-State: AOAM530kkx8MgkU6R2zPjPOKxRWSJS+rM3rmRpLkORXOkGrH9C3mvOKr
        xWpbBjmz8pePXPG3vCwGRfU=
X-Google-Smtp-Source: ABdhPJzNXaJe84a7D3sO9IMj6DbCTnxSY+tjf3ivhYJjiaQTI++KHW5i280YyO85VME/1Gp3NeJi/g==
X-Received: by 2002:a9d:620d:: with SMTP id g13mr4863159otj.165.1598799892727;
        Sun, 30 Aug 2020 08:04:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z6sm1310838oot.18.2020.08.30.08.04.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:52 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/5] media: uvcvideo: Release stream queue when unregistering video device
Date:   Sun, 30 Aug 2020 08:04:41 -0700
Message-Id: <20200830150443.167286-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
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

