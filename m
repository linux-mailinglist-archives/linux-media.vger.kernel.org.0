Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B67925756
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 20:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfEUSQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 14:16:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42712 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUSQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 14:16:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id go2so291879plb.9;
        Tue, 21 May 2019 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Y/MYMhrU1tjyFi5FjnHoCnJ6B3pMDuL+caZmJS6iXvc=;
        b=hC3NzunQtTacilbhVcY+YFbxqEcQa7u2d4uxOn6mm8U3vBSyR8govzXKG4chhNrcRA
         wHqe/oPMYGsy7eymiKvAciIePZj1f94FfWgD7qI7eEiNhGMyNwlz/RUdusmaicIsKFjG
         Og4d1f9RMsLBqyFpUOi1GzmCAdfvJxL782vKeAAEvGAMOaAewamcuUPjJQSZLxZr2q8H
         M5QbbfP7CQS5mwa3rtANt0wV+w1ALdpzJrWFRgsnWe2wDDyT8yQvjX/vMVJ+GB3k2hlX
         RYlPw1YHcImnxJh5jKM/YeETpxv9xMJSEk4ety0d/RZwDyc6S5c8W7BdzoVAVn8NlVr3
         UlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y/MYMhrU1tjyFi5FjnHoCnJ6B3pMDuL+caZmJS6iXvc=;
        b=IOAwhdEnVdJvZ7Iw0noYc8Kyb1Vy1148rXkMOW5w56Q4MTgmeuk4u3fr6hTgAPQ8y9
         lO8DcRZMPj6UVwdgHbmZPoPz0usDUJoRaTXOp8ysEeIoZnm593wlUxgKRvm5bpeRIKOW
         lq3FPqvGMqzE8BG3T/4jHipwq9M856NhVXQaigx7P2K4fP1agYw2P/Sc4sbofCj+7M8w
         BtZwD5yPGCF0LzlNypT0EpaxysATeCJWhh9X/uu3yoS7pAaDg8sQcK8Fvv2aLV4T4e4d
         rc0URM02iRuX0bv8klG5lwbyOzJuy1yFTwN5v43+P/xj8HQ3/M0AjcqVT6iSgNeJO3Zh
         be/w==
X-Gm-Message-State: APjAAAUEht9ymeAPUjzrJDMoDfNBJmOjDceONA2taqU4UW8syE90cg5h
        lL/DD+zM1A/Tx8HDW4gOwrk=
X-Google-Smtp-Source: APXvYqxAfd+J7HIHw5JyCAQwtUv73KL+sISPMY7Pc7gfBzn8OOfnEfEILHYYQdJXY1Y2bECtz1qIxg==
X-Received: by 2002:a17:902:6b:: with SMTP id 98mr84476086pla.271.1558462562160;
        Tue, 21 May 2019 11:16:02 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.200.143])
        by smtp.gmail.com with ESMTPSA id y17sm24090105pfn.79.2019.05.21.11.15.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 11:16:01 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     hverkuil@xs4all.nl, royale@zerezo.com, mchehab@kernel.org,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] media:usb:zr364xx:Fix KASAN:null-ptr-deref Read in zr364xx_vidioc_querycap
Date:   Tue, 21 May 2019 23:45:35 +0530
Message-Id: <20190521181535.7974-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SyzKaller hit the null pointer deref while reading from uninitialized
udev->product in zr364xx_vidioc_querycap().
==================================================================
BUG: KASAN: null-ptr-deref in read_word_at_a_time+0xe/0x20
include/linux/compiler.h:274
Read of size 1 at addr 0000000000000000 by task v4l_id/5287

CPU: 1 PID: 5287 Comm: v4l_id Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  kasan_report.cold+0x5/0x3c mm/kasan/report.c:321
  read_word_at_a_time+0xe/0x20 include/linux/compiler.h:274
  strscpy+0x8a/0x280 lib/string.c:207
  zr364xx_vidioc_querycap+0xb5/0x210 drivers/media/usb/zr364xx/zr364xx.c:706
  v4l_querycap+0x12b/0x340 drivers/media/v4l2-core/v4l2-ioctl.c:1062
  __video_do_ioctl+0x5bb/0xb40 drivers/media/v4l2-core/v4l2-ioctl.c:2874
  video_usercopy+0x44e/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3056
  v4l2_ioctl+0x14e/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:364
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xced/0x12f0 fs/ioctl.c:696
  ksys_ioctl+0xa0/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x74/0xb0 fs/ioctl.c:718
  do_syscall_64+0xcf/0x4f0 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f3b56d8b347
Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff
ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff
ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
RSP: 002b:00007ffe005d5d68 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f3b56d8b347
RDX: 00007ffe005d5d70 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000400884
R13: 00007ffe005d5ec0 R14: 0000000000000000 R15: 0000000000000000
==================================================================

For this device udev->product is not initialized and accessing it causes a NULL pointer deref.

The fix is to check for NULL before strscpy() and copy empty string, if
product is NULL

Reported-by: syzbot+66010012fd4c531a1a96@syzkaller.appspotmail.com

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/usb/zr364xx/zr364xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 96fee8d5b865..401a1e55dbe1 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -703,7 +703,10 @@ static int zr364xx_vidioc_querycap(struct file *file, void *priv,
 	struct zr364xx_camera *cam = video_drvdata(file);
 
 	strscpy(cap->driver, DRIVER_DESC, sizeof(cap->driver));
-	strscpy(cap->card, cam->udev->product, sizeof(cap->card));
+	if (cam->udev->product)
+		strscpy(cap->card, cam->udev->product, sizeof(cap->card));
+	else
+		strscpy(cap->card, "", sizeof(cap->card));
 	strscpy(cap->bus_info, dev_name(&cam->udev->dev),
 		sizeof(cap->bus_info));
 	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-- 
2.17.1

