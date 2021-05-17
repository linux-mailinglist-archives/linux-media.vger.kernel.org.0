Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDD9383C7F
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235555AbhEQSjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQSjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:32 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EF6C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:14 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q5so7483733wrs.4
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3w59S3cRCL6la/fQ2ihysYOi34FUudTPWCo8KCLDz4=;
        b=dSB4BJMxwbTfX2NJImHipExoMduhsdy/G5qXcUUS3dUsrYQSZsqmivfizw8tkd8Xi5
         dN3yDu8IagJT2p0PDsRElroZ0zsZN5N+JqdFnC6x9sdetBclEsIb8B6bFz8nnU9MnJ8E
         opcD+raSRiKm3Krv6baRecQpdQ+lux+7IxphJYHrjwYkUC2nRsCRjD0VCEZXmY04t8LI
         HBmgO4X7iQyTH48eQJDDoYOKTECGzJ5UCHqX9WOUJAoFhUU0LnkGGo1EKbDXf2M5Tx/m
         PaKrTYejYoNNxUb/lKhJ1nK9JqOSyG+SI2jjlj5u+kMC99DLgzuTdpE8vKeYcf2JKtOV
         b7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3w59S3cRCL6la/fQ2ihysYOi34FUudTPWCo8KCLDz4=;
        b=gF2G/Hx3vIEzt2r8TMMzoAc3bgrrZ07Y9P1WO6/WqFmhmkJKDfls3khA+1XAEgwnel
         sU71a7LdJ8Z7BecX7++eRFcTkrOdtn+VBO7XREJ6MRzwoqHFVKm6FhWaQ09ZNxOcDuQ/
         5q6sCAzXqS/C/Wf60vK6nE4hALDwR5HdGq516XthweukQlGzBe98hNI16AStK1+NiKnD
         09HX7ibD9wI9/bIF46H/9FkOkBGFwbsyn8IuCBEwBl4+6Av1q26/w93DSiU1vfWyXD0t
         60tIQA/QGX4NcyPZC4kg0DnmQ2c06LAuz8Bt0hoEaTp3G9QicZWtOYOdVTzwgp1crGr1
         BbTg==
X-Gm-Message-State: AOAM533zxnnJ6zR71aLtV3NIkZvrL+pRAZi0TirN+Czpz01kBlZyv4UK
        4AzIJ7mtipj9gNx2OqGkhYw=
X-Google-Smtp-Source: ABdhPJwk9wK3xEYeGxuK43/5bkvCQDmvFMbJ2sJ507RgpNwwykFFDWAW0a1X072hZ7f74BICGU/eyQ==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id i7mr1314447wry.380.1621276693147;
        Mon, 17 May 2021 11:38:13 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:12 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/5] media: v4l2: print the fh, during qbuf/dqbuf tracing
Date:   Mon, 17 May 2021 19:37:57 +0100
Message-Id: <20210517183801.1255496-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

To correlate the buffer handling with specific jobs, we need to provide
the file handle (pointer) used.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 10 ++++++++--
 include/trace/events/v4l2.h          | 22 ++++++++++++----------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..4b56493a1bae 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3343,10 +3343,16 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	}
 
 	if (err == 0) {
+		struct video_device *vdev = video_devdata(file);
+		struct v4l2_fh *fh = NULL;
+
+		if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
+			fh = file->private_data;
+
 		if (cmd == VIDIOC_DQBUF)
-			trace_v4l2_dqbuf(video_devdata(file)->minor, parg);
+			trace_v4l2_dqbuf(fh, parg);
 		else if (cmd == VIDIOC_QBUF)
-			trace_v4l2_qbuf(video_devdata(file)->minor, parg);
+			trace_v4l2_qbuf(fh, parg);
 	}
 
 	if (has_array_args) {
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 248bc09bfc99..e07311cfe5ca 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -7,6 +7,7 @@
 
 #include <linux/tracepoint.h>
 #include <media/videobuf2-v4l2.h>
+#include <media/v4l2-device.h>
 
 /* Enums require being exported to userspace, for user tool parsing */
 #undef EM
@@ -98,12 +99,12 @@ SHOW_FIELD
 		{ V4L2_TC_USERBITS_8BITCHARS,	"USERBITS_8BITCHARS" })
 
 DECLARE_EVENT_CLASS(v4l2_event_class,
-	TP_PROTO(int minor, struct v4l2_buffer *buf),
-
-	TP_ARGS(minor, buf),
+	TP_PROTO(struct v4l2_fh *fh, struct v4l2_buffer *buf),
+	TP_ARGS(fh, buf),
 
 	TP_STRUCT__entry(
 		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
 		__field(u32, index)
 		__field(u32, type)
 		__field(u32, bytesused)
@@ -124,7 +125,8 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
 	),
 
 	TP_fast_assign(
-		__entry->minor = minor;
+		__entry->minor = fh ? fh->vdev->minor : -1;
+		__entry->fh = fh;
 		__entry->index = buf->index;
 		__entry->type = buf->type;
 		__entry->bytesused = buf->bytesused;
@@ -144,12 +146,12 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
 		__entry->sequence = buf->sequence;
 	),
 
-	TP_printk("minor = %d, index = %u, type = %s, bytesused = %u, "
+	TP_printk("minor = %d, fh = %p, index = %u, type = %s, bytesused = %u, "
 		  "flags = %s, field = %s, timestamp = %llu, "
 		  "timecode = { type = %s, flags = %s, frames = %u, "
 		  "seconds = %u, minutes = %u, hours = %u, "
 		  "userbits = { %u %u %u %u } }, sequence = %u", __entry->minor,
-		  __entry->index, show_type(__entry->type),
+		  __entry->fh, __entry->index, show_type(__entry->type),
 		  __entry->bytesused,
 		  show_flags(__entry->flags),
 		  show_field(__entry->field),
@@ -169,13 +171,13 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
 )
 
 DEFINE_EVENT(v4l2_event_class, v4l2_dqbuf,
-	TP_PROTO(int minor, struct v4l2_buffer *buf),
-	TP_ARGS(minor, buf)
+	TP_PROTO(struct v4l2_fh *fh, struct v4l2_buffer *buf),
+	TP_ARGS(fh, buf)
 );
 
 DEFINE_EVENT(v4l2_event_class, v4l2_qbuf,
-	TP_PROTO(int minor, struct v4l2_buffer *buf),
-	TP_ARGS(minor, buf)
+	TP_PROTO(struct v4l2_fh *fh, struct v4l2_buffer *buf),
+	TP_ARGS(fh, buf)
 );
 
 DECLARE_EVENT_CLASS(vb2_v4l2_event_class,
-- 
2.31.1

