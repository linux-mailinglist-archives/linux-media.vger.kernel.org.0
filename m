Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F2422E31C
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgGZW21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZW21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:28:27 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D776CC0619D2;
        Sun, 26 Jul 2020 15:28:26 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id s16so10904902qtn.7;
        Sun, 26 Jul 2020 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HNVE8+pAZSpeQxmP3tSg/BQyhP/rZ6/36SGQbiLTu10=;
        b=DTjrlCc1aaT47CyiCirs8x37QjuaaCyUvqYQxlAI4joQjoihgH45exIk7sFyfMNL5K
         Pw2+ArAw3sF1/iA8mfH0ZZcpeCLgvYtRgj1Qg5iy/kV9z58HvEEOwG6SK9/FKBc2UY0a
         IZid2Hl7q5oWdIRLcPYOVRDgjK+D/nAxozO0ZY4wpOb5HADvXU+4IcJEf1YkBVYjJhcu
         P+jYmCPpS3j62awxakOMD0egTjkVlMGObcj4JVgLuj/ON1JUThB3k4j0X2CsKALrdGxx
         usgwDcdVclIno51K0gUmkd6ExGj2ixZeE+Q3Z7o0XrCMpvLPgFlw4i0yHuOFIZXCp8Zg
         V8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNVE8+pAZSpeQxmP3tSg/BQyhP/rZ6/36SGQbiLTu10=;
        b=ljOzeJ+zqeLvkS5s+E6OBfwa9SLx/g40yYOxKdqsDVbEY1lMmd11bhgb+sRtRTfGWQ
         4iL4YElIeM/fqrVOUuMBWGRyTGTnLSTlgsb0/S5CddN9Io9oYH4Z71MHvorobb6PZ19K
         9JkLaBji9j0kZp9m8tv1XogXcVW9kBsj5qHp3d0Ik0HaSssGXp0MLFEyqAmEqg5oJM+j
         DNK1uCrv6w1rxsPovn6Q691H4wEjg9vEx35eXZJdf/Rpup2Rq6Rvn59QNCQxFlzAb7pg
         XgX+u5xsswchin5GvHz6PRefrtPcZqk4jyfRMuBApHANVv/przRg6nXortstXbSLTOcR
         L9Pg==
X-Gm-Message-State: AOAM530gHlZl7W/OIH8I/BeYsu+eG76kZTFhI7CRGhteVWzgJbC3AD4f
        ntSTdkhsV+9EkDgEZwINzQ==
X-Google-Smtp-Source: ABdhPJxDmohnMKBdybckNP/0ftXHuIYM6ruvF1XPpe7KtytStFqJzmZc2OAjVU394YJU+GUM5f4Epg==
X-Received: by 2002:ac8:794f:: with SMTP id r15mr10880075qtt.383.1595802506053;
        Sun, 26 Jul 2020 15:28:26 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id h16sm15592243qkg.8.2020.07.26.15.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:28:25 -0700 (PDT)
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
Subject: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix kernel-infoleak in video_put_user()
Date:   Sun, 26 Jul 2020 18:27:03 -0400
Message-Id: <20200726222703.102701-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726220557.102300-1-yepeilin.cs@gmail.com>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

video_put_user() is copying uninitialized stack memory to userspace due
to the compiler not initializing holes in the structures declared on the
stack. Fix it by initializing `ev32` and `vb32` using memset().

Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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

