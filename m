Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287A122E2FF
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGZWIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgGZWIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:08:11 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDEFC0619D2;
        Sun, 26 Jul 2020 15:08:10 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o22so10647738qtt.13;
        Sun, 26 Jul 2020 15:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+IzmjsuAtBmpLPphNE+utP0izhzv97da99bo9QPRTa8=;
        b=s3rUecFptAUZaHB3Xk+eloq3DPiKZHLpXt+olhKQJ7TAmIcaIjh7cVY+JTy5N2Fvu0
         /HxuTGCJ/tAC+1eOawjIKV6SFsoN5j007Kn1m6ENLuetD/PX+2sn4isHYGSnA/U/XFmZ
         +6AW71YqE8aMeDRaDoAr/mumK6omYAwIuL4uIPc2a5uFg/oppGXZnMkTnwyNgxeszCkx
         F8EYzKZldSs3Svnp1YIyDslppkXb1c0vpFCy2V9tjACfQjDRr/NJh0kYzvy3k3vOOX69
         mSxDi9j9sJ8vSpdrz9lpRy6dVJG663W4TAKMU63NNiPdcTDvPOWnijKwk2vRSfW7ndaG
         gS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+IzmjsuAtBmpLPphNE+utP0izhzv97da99bo9QPRTa8=;
        b=IHvbZRNVOpXXNfb6E5f4MCYsbJVJFPk+b8c+s3eN72azINyXzCdCyL2fHCfKUNb5gs
         eNw3EB03GBlZFg+7M1LNlolIaZ0ju87z8Ya7tGUxlxfWHxa9b5A76MVtArUlLp3X3q82
         oD6TnBKMRyVRYvdN0h/YbLlK4IGnvdO9zX/c0J/t8OPbIdtAICFTpxoHFw4M/gH4HRJO
         mecl2XA2jmoGv5TNO1IEnhipBFEMG9Pcol05mzW/4GyG+mv0zAEq27qIYYFcqkSIE2gG
         7wrEeoN8CLIjM/NVJ1Lv/ZMnLvMxozgB56CMVUmv5zSOgWBcf0jY70zwPZIEpj0PwJhR
         6pTg==
X-Gm-Message-State: AOAM530CH2m56NBRsWga9xvE5KsDi1XE+Q81Dx24rdOW5i40EhV994W4
        SwQSYjCUQWAuDaHIo0Wl+A==
X-Google-Smtp-Source: ABdhPJz8DyBX5pU/BKClttIdS9+l98ZmJ8tCV+3vvPNBY2m8csw8hH0dVNUVIYI0H17hh3eUpyytyw==
X-Received: by 2002:ac8:6992:: with SMTP id o18mr9704010qtq.277.1595801290142;
        Sun, 26 Jul 2020 15:08:10 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id f31sm9561215qte.35.2020.07.26.15.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:08:09 -0700 (PDT)
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
Subject: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix kernel-infoleak in video_put_user()
Date:   Sun, 26 Jul 2020 18:05:57 -0400
Message-Id: <20200726220557.102300-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726164439.48973-1-yepeilin.cs@gmail.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

video_put_user() is copying uninitialized stack memory to userspace. Fix
it by initializing `ev32` and `vb32` using memset().

Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Do the same thing for `case VIDIOC_DQEVENT_TIME32`.

 drivers/media/v4l2-core/v4l2-ioctl.c | 50 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a556880f225a..e3a25ea913ac 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3189,14 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event *ev = parg;
-		struct v4l2_event_time32 ev32 = {
-			.type		= ev->type,
-			.pending	= ev->pending,
-			.sequence	= ev->sequence,
-			.timestamp.tv_sec  = ev->timestamp.tv_sec,
-			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
-			.id		= ev->id,
-		};
+		struct v4l2_event_time32 ev32;
+
+		memset(&ev32, 0, sizeof(ev32));
+
+		ev32.type	= ev->type;
+		ev32.pending	= ev->pending;
+		ev32.sequence	= ev->sequence;
+		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
+		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
+		ev32.id		= ev->id;
 
 		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
 		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
@@ -3210,21 +3212,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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

