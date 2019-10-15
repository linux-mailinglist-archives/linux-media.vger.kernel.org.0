Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04BCD7689
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 14:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbfJOMaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 08:30:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44892 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfJOMaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 08:30:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id e10so8071168pgd.11
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pd9rCBSTnGZyy1BFRZ2uJCIf9n2WaWvGG1wWt38gQok=;
        b=KKeolNcpT37ApBfNvSLtWWobXaqcI7+HMVT/tzJWuq3cV0a8NPFqsW+dccvAtoNZQl
         +1fV+qzfZ+XfxHVC+gg2N6KMC6VKWaTVdvvKdGuZFQLf2tqMm5jhUJcsHmQX0HNWdmGl
         3H6CXqoDFYWp1fuLDQTtolfSORwK+Z9hnH1DFfdQE2vJ9NrRUjw7ln/tJuXorygL67Qg
         hVhQapgFsb0NLrz8yY0R6oIiz2S1J2lF7bS7j5S9CMn1HWDO06rRD8TfX0iASzMc+7Y0
         6YS3QgoNFKvuzoHdKweT93BOpinbn1SUcOo6MNMIvOgh4fyyzuOaXCXYXqHCefk+SbNA
         U1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pd9rCBSTnGZyy1BFRZ2uJCIf9n2WaWvGG1wWt38gQok=;
        b=ZdQ0SkWIDUP+ZkxgsLxxc9rFz0TdrBTTN4lqQbZ4FGsd0ZEPSq3IDsf93SOeIVin9F
         1VpOMdQUL9TAHrMIhrDJpyPrPy19i5cxyRLq2AAv+NGKZHKxMe3VDHmJLTPmN8Oy6XI0
         8jD4YQ2BL+u3i15swtiBNN96RmjKGq+4ta+aiPgnCrUJdf+dra8XX6dH7a1PdPDgR7f7
         9uIA7ILS0iDybWS4RhtlIdYHUPhNDWGJ7c+2EUYmybN9dOv5yoecOi6R7ngX4l41+3uE
         DGxh63gLxfqU7wGd71oi8cKYGnEqMkpGMSd4JauivAJPMOGRyyaSLRxkCatUVx8rFLtv
         yyPQ==
X-Gm-Message-State: APjAAAXkHCI2piug7mN1926GxeVAXqV3WCltJY7Q22834ECZuDjktvNw
        wn/9WaBZre88f0q1pmkQ+rshGhko
X-Google-Smtp-Source: APXvYqw08X4hPPXf3L40o81S9tYEbgc79yyw2l++iGFOcTtKtaOdG0EL7o+K1pLkvB/3OgcqK5e0Hg==
X-Received: by 2002:a63:f908:: with SMTP id h8mr37381391pgi.244.1571142610599;
        Tue, 15 Oct 2019 05:30:10 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.198.230])
        by smtp.gmail.com with ESMTPSA id c1sm32012420pfb.135.2019.10.15.05.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 05:30:09 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3] v4l2-ctl: support for metadata output
Date:   Tue, 15 Oct 2019 18:00:02 +0530
Message-Id: <20191015123002.17323-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6d9d58ad-597c-f58d-c6d9-bef06e639b4c@xs4all.nl>
References: <6d9d58ad-597c-f58d-c6d9-bef06e639b4c@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds support to test metadata output format V4L2_META_FMT_VIVID.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes in V3:
	simplified meta_fillbuffer(), also ensure the brightness and
contrast values are in range 64-255.
---
 contrib/freebsd/include/linux/videodev2.h |  1 +
 include/linux/videodev2.h                 |  1 +
 utils/v4l2-ctl/v4l2-ctl-meta.cpp          | 31 +++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  9 ++++++-
 utils/v4l2-ctl/v4l2-ctl.h                 |  1 +
 5 files changed, 42 insertions(+), 1 deletion(-)

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
index eae7438f..b1288297 100644
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
@@ -164,5 +172,28 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
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
+			vbuf->brightness = buf.g_sequence() % 192 + 64;
+			vbuf->contrast = (buf.g_sequence() + 10) % 192 + 64;
+			vbuf->saturation = (buf.g_sequence() + 20) % 256;
+			vbuf->hue = buf.g_sequence() % 257 - 128;
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

