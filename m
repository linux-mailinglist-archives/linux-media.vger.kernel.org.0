Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BBC22E16D
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgGZQpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 12:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGZQpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 12:45:50 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5C0C0619D2;
        Sun, 26 Jul 2020 09:45:50 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id h7so13184690qkk.7;
        Sun, 26 Jul 2020 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VstsWsuszeDs/Ba17q7YPVCn+c+6MrMb7LlHyKqYOXU=;
        b=tOmSm+RRcV6MQ8x7hTydZPK9FsbIxOHIMPBtiC5PsGUyevVexWsoXt5QeFLCHdyqAa
         CisSERxERrTF9vIkoJ7rt583HLP5bU9VvyZqY335YRenqyQBcwYeBVSciysqGw1ZtLSm
         LD4lSxp2/CZt3VQO85MEacHh9J6atqvmOxdeC4ec9xxqKUCelp3y0TnvbXz1s0gq5cGi
         G7ZUcrWSLy7vB4/UHiab58qksdZar/FzBv3DuzcAGfJshQ4J2ZW4NaC8hrK4QAkviq4Z
         kpxdA/01Htz6SBXTHq2ioDeUtqrwsCrzwn3jwIxk+IGjDBXzrgRBN6tXheX0xxkpPDcM
         DgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VstsWsuszeDs/Ba17q7YPVCn+c+6MrMb7LlHyKqYOXU=;
        b=NIJkJGtsoVaOnZJHseY9k5WYYIXiZtopCim8FtTq/LZnn1rjUO34WBlZQR7MIkMeMd
         +RbXASHhVFU1WwGpx4hmexMeoHCUmRdGcVlqlMbpUMH3Z/SE3PYcu2YWy7SyHVv3Lvnv
         qak8RYMoKOk2Il08fzsgDnJFSHt4W+5dqLO1HLnGrxjePtolhbh+0CHHa2jgKq/2lapV
         XkcoYlWCCJWuu4D5YxonMOaTsG/llYtpQo9tRUlNRQvNN9LjiBFGSyW+4BlAu6pLklFk
         x/5z0qbZWcU+O2gWQ3gdz194brXNJ4r8VZAw0AYmtgFf6N+TEHEEb6ztRK6Set1v4xq8
         B/Hw==
X-Gm-Message-State: AOAM533Z8KNpAsKa0W/TNcXog8hx+2wt9A0Qi+2neHyCAJwjacLaZx6W
        xyV+P7n0phHrvidnGuSzKg==
X-Google-Smtp-Source: ABdhPJzNfFJ9to/VAePZ22kYRFlaHIRlTx1GFxnaCQeilL7udWxDuxSik1Ew75mPm4QkJJBld+xQFg==
X-Received: by 2002:ae9:ee06:: with SMTP id i6mr18927939qkg.132.1595781949854;
        Sun, 26 Jul 2020 09:45:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id j16sm11644233qke.87.2020.07.26.09.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 09:45:49 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix kernel-infoleak in video_put_user()
Date:   Sun, 26 Jul 2020 12:44:39 -0400
Message-Id: <20200726164439.48973-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

video_put_user() is copying uninitialized stack memory to userspace. Fix
it by initializing `vb32` using memset().

Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 32 +++++++++++++++-------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a556880f225a..08909f58dc80 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3210,21 +3210,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_DQBUF_TIME32:
 	case VIDIOC_PREPARE_BUF_TIME32: {
 		struct v4l2_buffer *vb = parg;
-		struct v4l2_buffer_time32 vb32 = {
-			.index		= vb->index,
-			.type		= vb->type,
-			.bytesused	= vb->bytesused,
-			.flags		= vb->flags,
-			.field		= vb->field,
-			.timestamp.tv_sec	= vb->timestamp.tv_sec,
-			.timestamp.tv_usec	= vb->timestamp.tv_usec,
-			.timecode	= vb->timecode,
-			.sequence	= vb->sequence,
-			.memory		= vb->memory,
-			.m.userptr	= vb->m.userptr,
-			.length		= vb->length,
-			.request_fd	= vb->request_fd,
-		};
+		struct v4l2_buffer_time32 vb32;
+
+		memset(&vb32, 0, sizeof(vb32));
+
+		vb32.index	= vb->index;
+		vb32.type	= vb->type;
+		vb32.bytesused	= vb->bytesused;
+		vb32.flags	= vb->flags;
+		vb32.field	= vb->field;
+		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec;
+		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec;
+		vb32.timecode	= vb->timecode;
+		vb32.sequence	= vb->sequence;
+		vb32.memory	= vb->memory;
+		vb32.m.userptr	= vb->m.userptr;
+		vb32.length	= vb->length;
+		vb32.request_fd	= vb->request_fd;
 
 		if (copy_to_user(arg, &vb32, sizeof(vb32)))
 			return -EFAULT;
-- 
2.25.1

