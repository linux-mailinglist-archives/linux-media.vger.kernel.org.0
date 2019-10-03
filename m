Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6434CC9CBE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbfJCKzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:55:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33407 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbfJCKzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:55:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so1564173pgb.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DEWTyPNRJrXeTQRHP+8n0YK0Awl7GIVI+0eUKOdtpBM=;
        b=tj3kxE5+RuMkaNTZn1VrsifQDSpZ0Jmz8zlp8NkU7Jgyj1xBSzcYosuUaHAU6fP0kc
         nroCDdWoN553SjhXoKtGY4T8oPdqvSVZZCnPj6GkxaczV+tcbpXnOxmgwG1HPEXcD/dL
         rG8pyXQCCgcTU40cVmByDAFuGMO6kmzhYDCGTS79XI0NFr3h2Y8l7917+UFrFYtIxlFI
         aaVSmIRQmQOyaGdi9HiBfTFdA1YW5Mzn+G6eOCIo3X0oRX/e70YMGo/7v906MdQTSHrM
         V2fK39xgxfvyXSnN0UZ7K2vhCjx5/I+Lq9gJmraQLthSujgeyXuTtfMxOpgVAy/uU7zr
         4ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DEWTyPNRJrXeTQRHP+8n0YK0Awl7GIVI+0eUKOdtpBM=;
        b=IcORq57/Ilii4royTItk2L9NWmsDDxVw+rgyrTeSQdVt6QAW5SPKh/HqQL30nfLW/H
         8fOEzf4zR0lfGfXYvufmSjtBaRXSOlKCWoGzpadyDpleTyCbhGXFza6navO5b/CoKzoV
         M47hVL3ZaUEezAWVYSakB59NZhIBtevrgdC/jtesPe/pZaqdz9MiYzRrVHae1wv6Wpbz
         l8PtuUa/S+O39DC9EoTVhgkjfCRPARl4b2MLo5PjiD0VrpzmKK//MLOQFk1u1oJiV4lC
         vshWj9DqLUq/TffgPC7BYFlCemVisaa4lVpLbjX//9q0MDxVz1SPpiW9TEumm2+glTBz
         F/xQ==
X-Gm-Message-State: APjAAAWqhDL/c4bNPa00eqsa4EPhr8zv9GfjZW0XaYt96dhuXv3D80DI
        aUMXsQditIvJDZ6isWppa8ZoqFHA
X-Google-Smtp-Source: APXvYqybJcIUae44Y/qJeztjuGsC+7v2UHRsz+SBdbTQ3H7PtFsUR0NaikbyyJsqFKIWLhYiuYciRQ==
X-Received: by 2002:a17:90a:178d:: with SMTP id q13mr10009975pja.134.1570100122126;
        Thu, 03 Oct 2019 03:55:22 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id l27sm3136389pgc.53.2019.10.03.03.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 03:55:21 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] v4l2-ctl: support for metadata output
Date:   Thu,  3 Oct 2019 16:24:59 +0530
Message-Id: <20191003105459.6378-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cb0e7771-eba5-979d-e873-d889859a3f83@xs4all.nl>
References: <cb0e7771-eba5-979d-e873-d889859a3f83@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds support to test metadata output format V4L2_META_FMT_VIVID.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 contrib/freebsd/include/linux/videodev2.h |  1 +
 include/linux/videodev2.h                 |  1 +
 utils/v4l2-ctl/v4l2-ctl-meta.cpp          | 35 +++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  9 +++++-
 utils/v4l2-ctl/v4l2-ctl.h                 |  1 +
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 0c12d27f..6c0169be 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -783,6 +783,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index e2847759..107f96d2 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -749,6 +749,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index eae7438f..33e42fcf 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -139,10 +139,18 @@ struct vivid_uvc_meta_buf {
 #define UVC_STREAM_SCR	(1 << 3)
 #define UVC_STREAM_PTS	(1 << 2)
 
+struct vivid_meta_out_buf {
+        __u16	brightness;
+        __u16	contrast;
+        __u16	saturation;
+        __s16	hue;
+};
+
 void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 {
 	struct vivid_uvc_meta_buf *vbuf;
 	int buf_off = 0;
+	struct vivid_meta_out_buf *vbuf_out;
 
 	switch (fmt.g_pixelformat()) {
 	case V4L2_META_FMT_UVC:
@@ -164,5 +172,32 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 				le16toh(*(__u16*)(vbuf->buf + buf_off + 4)));
 		fprintf(f, "\n");
 		break;
+	case V4L2_META_FMT_VIVID:
+		fprintf(f, "VIVID:");
+		vbuf_out = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
+
+		fprintf(f, " brightness: %u contrast: %u saturation: %u  hue: %d\n",
+			vbuf_out->brightness, vbuf_out->contrast,
+			vbuf_out->saturation, vbuf_out->hue);
+		break;
+	}
+}
+
+void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	struct vivid_meta_out_buf *vbuf;
+
+	switch (fmt.g_pixelformat()) {
+		case V4L2_META_FMT_VIVID:
+			vbuf = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
+			vbuf->brightness = buf.g_sequence() <= 255 ?
+				buf.g_sequence() : buf.g_sequence() % 255;
+			vbuf->contrast =  buf.g_sequence() + 10 <= 255 ?
+				buf.g_sequence(): (buf.g_sequence() + 10) % 255;
+			vbuf->saturation = buf.g_sequence() + 20 <= 255 ?
+				buf.g_sequence(): (buf.g_sequence() + 20) % 255;
+			vbuf->hue = (__s16) buf.g_sequence() - 128 <= 128 ?
+				buf.g_sequence() - 128 : buf.g_sequence() % 256 - 128;
+			break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 47b7d3f8..184bfd64 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1146,6 +1146,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 	bool can_fill = false;
 	bool is_video = q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
 			q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
 
 	if (q.obtain_bufs(&fd))
 		return QUEUE_ERROR;
@@ -1241,6 +1242,9 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 					tpg_fillbuffer(&tpg, stream_out_std, j, (u8 *)q.g_dataptr(i, j));
 			}
 		}
+		if (is_meta)
+			meta_fillbuffer(buf, fmt, q);
+
 		if (fin && !fill_buffer_from_file(fd, q, buf, fmt, fin))
 			return QUEUE_STOPPED;
 
@@ -1480,6 +1484,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 			 bool stopped, bool ignore_count_skip)
 {
 	cv4l_buffer buf(q);
+	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
 	int ret = 0;
 
 	if (cap) {
@@ -1542,6 +1547,8 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 			tpg_fillbuffer(&tpg, stream_out_std, j,
 				       (u8 *)q.g_dataptr(buf.g_index(), j));
 	}
+	if (is_meta)
+		meta_fillbuffer(buf, fmt, q);
 
 	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
 		if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_REINIT, NULL)) {
@@ -2039,7 +2046,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 
 	if (!(capabilities & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
 			      V4L2_CAP_VBI_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT |
-			      V4L2_CAP_SDR_OUTPUT |
+			      V4L2_CAP_SDR_OUTPUT | V4L2_CAP_META_OUTPUT |
 			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))) {
 		fprintf(stderr, "unsupported stream type\n");
 		return;
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 2c861d82..b0f65e9b 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -409,6 +409,7 @@ void meta_set(cv4l_fd &fd);
 void meta_get(cv4l_fd &fd);
 void meta_list(cv4l_fd &fd);
 void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
+void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
 // v4l2-ctl-subdev.cpp
 void subdev_usage(void);
-- 
2.17.1

