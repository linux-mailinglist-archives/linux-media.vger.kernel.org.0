Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF69383C80
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbhEQSje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQSjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:33 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E3CC061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z17so7462005wrq.7
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdEsts3GmeksCsp4kc3Smg1R34rKcnsE9RxXjG1xDPM=;
        b=UWWeQWMWSfuE2J/C7TLe3IV/exseYdOoePVh/DXxbwhifQ1YadIlYXbPIFNh8kncr6
         Nxs1KJ5gV3r6AwwnSoCsuf4sP3ryjWGsUHzv6JaMKcQGxJNdUYKpJchkB/wZdY4V04nY
         ESaaqXr8X2seWiN/Y6687vdjQ0GNVcbwWoX1sd/0czW1XzrpHi/SkEGwrFvpZ5D91JYx
         TULwJBZ0boQbog4y2s66E7vAarGr01uSsg4MnnXX6xC78TbuawIBSjmiiwAChkCtr8kf
         ncs++AtDPPjZl0WfOT/zXQ6YZkvOfFk6lGclwZ8kMQuJM10gZzm1njU0ALdqlK8B3nua
         PuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdEsts3GmeksCsp4kc3Smg1R34rKcnsE9RxXjG1xDPM=;
        b=bV/uhwH4oL6Zmx2jF/sEBHPFbREdk9MkbJAykkzUsYbSK32FsCAdFm8Wj5SNq8ivhw
         kNOYijhLE2ubeiDYeO3ajdcmzsUAnlHSc4dx3jeki2tOhTvRzI5kS++mEO830N6myaNl
         AuJUh3lMahZMmqTi4Blk/3lZ/IaGIYGiz5DNzjOBYOql0ySBTAmrHsFt6c47cEcRQDPI
         /Q9G0QhBxJ2VipAkDfpN2Gr4/c9kOUnVwEr7GDIWBUmoW9L73iKasy5NUBU4ZdWY4Lc3
         bu6eHUW9DzgKzX0hZYQr5fH4jP68kUmNeLqY7h9NyHr0jfNVl15nBA05j/MxJGyYNmRe
         K1lA==
X-Gm-Message-State: AOAM531+Fu00bek1NDL87l/zyQxPMBCTfXXGZw7owt20pCeboWELsaVH
        tpx8ZWMbYXk02G/MoqkSMFI=
X-Google-Smtp-Source: ABdhPJx8KRTBNH+kbbivTpUDIm25pUQY7asyxLGm6wq/TMmX2g1/nf6LlYCN3jbDypD9Y2/0b0L9Lg==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr1253244wrm.384.1621276695130;
        Mon, 17 May 2021 11:38:15 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:13 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 2/5] media: v4l2: add VIDIOC_S_FMT tracing
Date:   Mon, 17 May 2021 19:37:58 +0100
Message-Id: <20210517183801.1255496-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Add tracing for VIDIOC_S_FMT, which can be correlated to job and buffer
submission traces.

Since we're setting the format itself, we do not have distinct buffer
(index) here. Yet, we can still use the minor/fh/type to link the trace
to the corresponding job.

Co-authored-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c |   2 +
 drivers/media/v4l2-core/v4l2-trace.c |   1 +
 include/trace/events/v4l2.h          | 132 +++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h       |   1 +
 4 files changed, 136 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4b56493a1bae..66a039ed8a43 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1662,6 +1662,8 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		return ret;
 	v4l_sanitize_format(p);
 
+	trace_v4l2_ioctl_s_fmt(file, fh, p);
+
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index 95f3b02e1f84..6df26fc7c39c 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -10,3 +10,4 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_done);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ioctl_s_fmt);
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index e07311cfe5ca..d11e38676e48 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -6,8 +6,10 @@
 #define _TRACE_V4L2_H
 
 #include <linux/tracepoint.h>
+#include <linux/videodev2.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
 
 /* Enums require being exported to userspace, for user tool parsing */
 #undef EM
@@ -264,6 +266,136 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+#ifdef CREATE_TRACE_POINTS
+#define __trace_array_name(a, arr, num) (((unsigned)(a)) < num ? arr[a] : "unknown")
+static inline void __trace_sprint_v4l2_format(char *str, size_t size, struct v4l2_format *p)
+{
+	const struct v4l2_pix_format *pix;
+	const struct v4l2_pix_format_mplane *mp;
+	const struct v4l2_vbi_format *vbi;
+	const struct v4l2_sliced_vbi_format *sliced;
+	const struct v4l2_window *win;
+	const struct v4l2_sdr_format *sdr;
+	const struct v4l2_meta_format *meta;
+
+	switch (p->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		pix = &p->fmt.pix;
+		snprintf(str, size, "width=%u, height=%u, pixelformat=%c%c%c%c, "
+				    "field=%s, bytesperline=%u, sizeimage=%u, "
+				    "colorspace=%d, flags=0x%x, ycbcr_enc=%u, "
+				    "quantization=%u, xfer_func=%u",
+			pix->width, pix->height,
+			(pix->pixelformat & 0xff),
+			(pix->pixelformat >>  8) & 0xff,
+			(pix->pixelformat >> 16) & 0xff,
+			(pix->pixelformat >> 24) & 0xff,
+			__trace_array_name(pix->field, v4l2_field_names, V4L2_FIELD_NUM),
+			pix->bytesperline, pix->sizeimage,
+			pix->colorspace, pix->flags, pix->ycbcr_enc,
+			pix->quantization, pix->xfer_func);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		mp = &p->fmt.pix_mp;
+		snprintf(str, size, "width=%u, height=%u, pixelformat=%c%c%c%c, "
+				    "field=%s, num_planes=%u, "
+				    "colorspace=%d, flags=0x%x, ycbcr_enc=%u, "
+				    "quantization=%u, xfer_func=%u}",
+			mp->width, mp->height,
+			(mp->pixelformat & 0xff),
+			(mp->pixelformat >>  8) & 0xff,
+			(mp->pixelformat >> 16) & 0xff,
+			(mp->pixelformat >> 24) & 0xff,
+			__trace_array_name(mp->field, v4l2_field_names, V4L2_FIELD_NUM),
+			mp->num_planes,
+			mp->colorspace, mp->flags, mp->ycbcr_enc,
+			mp->quantization, mp->xfer_func);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
+		win = &p->fmt.win;
+		/* Note: we can't print the clip list here since the clips
+		 * pointer is a userspace pointer, not a kernelspace
+		 * pointer. */
+		snprintf(str, size, "wxh=%dx%d, x,y=%d,%d, field=%s, "
+				    "chromakey=0x%08x, clipcount=%u, clips=%p, "
+				    "bitmap=%p, global_alpha=0x%02x",
+			win->w.width, win->w.height, win->w.left, win->w.top,
+			__trace_array_name(win->field, v4l2_field_names, V4L2_FIELD_NUM),
+			win->chromakey, win->clipcount, win->clips,
+			win->bitmap, win->global_alpha);
+		break;
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+		vbi = &p->fmt.vbi;
+		pr_cont("sampling_rate=%u, offset=%u, samples_per_line=%u, "
+			"sample_format=%c%c%c%c, start=%u,%u, count=%u,%u",
+			vbi->sampling_rate, vbi->offset,
+			vbi->samples_per_line,
+			(vbi->sample_format & 0xff),
+			(vbi->sample_format >>  8) & 0xff,
+			(vbi->sample_format >> 16) & 0xff,
+			(vbi->sample_format >> 24) & 0xff,
+			vbi->start[0], vbi->start[1],
+			vbi->count[0], vbi->count[1]);
+		break;
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+		sliced = &p->fmt.sliced;
+		snprintf(str, size, "service_set=0x%08x, io_size=%d",
+				sliced->service_set, sliced->io_size);
+		break;
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+		sdr = &p->fmt.sdr;
+		snprintf(str, size, "pixelformat=%c%c%c%c",
+			(sdr->pixelformat >>  0) & 0xff,
+			(sdr->pixelformat >>  8) & 0xff,
+			(sdr->pixelformat >> 16) & 0xff,
+			(sdr->pixelformat >> 24) & 0xff);
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		meta = &p->fmt.meta;
+		snprintf(str, size, "dataformat=%c%c%c%c, buffersize=%u",
+			(meta->dataformat >>  0) & 0xff,
+			(meta->dataformat >>  8) & 0xff,
+			(meta->dataformat >> 16) & 0xff,
+			(meta->dataformat >> 24) & 0xff,
+			meta->buffersize);
+		break;
+	}
+}
+#endif
+
+#define V4L2_FMT_MAX   256
+
+/* v4l2-ioctl trace events */
+TRACE_EVENT(v4l2_ioctl_s_fmt,
+	TP_PROTO(struct file *file, struct v4l2_fh *fh, struct v4l2_format *fmt),
+	TP_ARGS(file, fh, fmt),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+		__field(u32, type)
+		__dynamic_array(char, details, V4L2_FMT_MAX)
+	),
+
+	TP_fast_assign(
+		__entry->minor = video_devdata(file)->minor;
+		__entry->fh = fh;
+		__entry->type = fmt->type;
+		__trace_sprint_v4l2_format(__get_str(details), V4L2_FMT_MAX, fmt);
+	),
+
+	TP_printk("minor = %d, fh = %p, type = %s, %s",
+		__entry->minor, __entry->fh,
+		show_type(__entry->type), __get_str(details))
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..f9f4b63fb50f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -105,6 +105,7 @@ enum v4l2_field {
 	V4L2_FIELD_INTERLACED_BT = 9, /* both fields interlaced, top field
 					 first and the bottom field is
 					 transmitted first */
+	V4L2_FIELD_NUM
 };
 #define V4L2_FIELD_HAS_TOP(field)	\
 	((field) == V4L2_FIELD_TOP	||\
-- 
2.31.1

