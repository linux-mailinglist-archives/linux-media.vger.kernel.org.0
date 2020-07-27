Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD7322E73A
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 10:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgG0ICs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 04:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgG0ICs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 04:02:48 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EE8C0619D2;
        Mon, 27 Jul 2020 01:02:48 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id j10so358389qvo.13;
        Mon, 27 Jul 2020 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J3cQXzpZBg3Vtk5bdGvdVAHaa0sFWRNtivX5Db04OBA=;
        b=dbO4DzeJoT4j/TG1g7aRqmAN97/rmvbXCgY0YIU+CKb91Nf2TrIJR0nnw1SpeI4Us3
         8LT+osFW8Hg45Zhs9ffuzPawoTve2Buq0CelaGklZTuUecawIWX9rdUIGP7bZkKwj1mY
         r/vf2FL+CNrfHec3DM8auarsv2yyXhY831G+200uHV0Au8aiEaYxd2WC0NF2l5R0+6t9
         xh/tRtP+x5LRl2sgUsXEhnP3RvpHg02OA2SXbEOUHUb7R9HkjeBkQqXHiw8jtb1RNEgm
         cPek2E6EtSE7T64GAhal8elJmXCTELnGUIxdACayGdK0sYUgNLOsHmyIyb+1LaJ2XgVN
         dtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J3cQXzpZBg3Vtk5bdGvdVAHaa0sFWRNtivX5Db04OBA=;
        b=CuLLqNe1uSsajVdRexiwmE7JPdHmGhHc7xdWp5kzI7izdF2YOL8G8pxXMnAhP8B3/p
         UMXP+j9PVHeMJUNx/Fnb6rVH4ANO2sSoHk7Tw7Iv5CW4ad9E85bOJjgH9aPkNFhxjqoS
         XdnL8G1idlBr8JXg9jRb8m8mu4qn/3U/MDiWTwwfCiAHIsxaH0ozpBryLVfDwOyWHsQ7
         o0AjWbee4mJwZc/3kXLg9uVO6QqjwoUl6UAd7+ihYYL0AxYoYes0Pj74IldrQKQVFreP
         GH4RQKFnEPFasABHznfvscLNC9oQ3ZbHbh2W2GFgmveyeKCO+Zv2JMGufLlt+7nvXyao
         9eJA==
X-Gm-Message-State: AOAM533U2AWnyVCV/Nu9Mn+KLJJhKgNXS7fj6GpVdiYzyIq4posE2yjZ
        unc9uaKNFYRRTFWIVgcgbsyUWRfMLg==
X-Google-Smtp-Source: ABdhPJwvxrtKoMtBAPuC4VlZNTYeK4YEu4Wojy+ZJZ2qlzy3urGbyD2J2QlSRJJ01NqjCRiDc/OKyA==
X-Received: by 2002:a0c:e789:: with SMTP id x9mr20072948qvn.135.1595836967417;
        Mon, 27 Jul 2020 01:02:47 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id 130sm16105123qkf.61.2020.07.27.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:02:46 -0700 (PDT)
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
Subject: [Linux-kernel-mentees] [PATCH v4] media/v4l2-core: Fix kernel-infoleak in video_put_user()
Date:   Mon, 27 Jul 2020 04:00:02 -0400
Message-Id: <20200727080002.208829-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726222703.102701-1-yepeilin.cs@gmail.com>
References: <20200726222703.102701-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

video_put_user() is copying uninitialized stack memory to userspace due
to the compiler not initializing holes in the structures declared on the
stack. Fix it by initializing `ev32` and `vb32` using memset().

Cc: stable@vger.kernel.org
Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for time64 ABI")
Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v4:
    - Add `Cc:` and `Fixes:` tags. (Suggested by Arnd Bergmann <arnd@arndb.de>)

Change in v3:
    - Improve the commit description. (Suggested by Laurent Pinchart
      <laurent.pinchart@ideasonboard.com>)

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

