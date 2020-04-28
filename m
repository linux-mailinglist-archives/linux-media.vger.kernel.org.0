Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728C71BBE3E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgD1MvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726940AbgD1Mus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:50:48 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDEFC03C1AB
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so2721009wma.4
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJwZdm/27BG35A63f5QLfwSuwxh6v7svpz8baWGJ+rE=;
        b=b0KZlUDCbPr3AGniEFxQ2PAfeUZ9+O09I7oVG1Y0/2PmPOuUg+IOA5fzL7hjognD46
         mF5I8HnLNtnVp/Xwt9M3ow9HxqOG8lPKqx+nqKLEsWdJBEtL674YPRZmqLSth8OQbRgS
         3atuukLZLleeVou50Xsd1VS1b3N7bjGdyGguJGj5q1AI2oT6IKAlwR2iFDW0gk7CBB7G
         eYPqfDjjSto7GqeeUj8Bgmic6SuD4IpNMuHYcO20edQc/XlJB2zjPmHuhNxD4HkulThZ
         r7IGiWPDVdjIsvulhCtc314fTKTMG/6DTE8SeG5D3Fu5hMeMrCbNdFPx9W5e2CPB8Mrx
         AlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJwZdm/27BG35A63f5QLfwSuwxh6v7svpz8baWGJ+rE=;
        b=s9lUtrTOOCdIlrXLj2vNo5OFLDjx659/rcfwt1OWT5VBrPU/DsK08SAJY2UQlsoXSp
         +qQyyEjXuUJOtoDDB2V0G1oEa7vsmCp6sV7fbvz80sjCdlM6YpbAC4+9m0MKgqSbw2Xm
         IcKWubsiRZp0LQ8rI0aCWx2igiyMrGR1VwTk7z4uF8KGmzVKz68lMP1mv/KhFVqh0EhD
         ouUsx7LFRAHsmRxHnaFmJARnOMJ3NmIbxKMaD4gDXWSIxR4Lw32d7q/Y6RnpiM5/Gp3Y
         5hLI7szA7/Mcw1sUz0uidNPYAtnajZLh28WG3Zhqa3r2j/g1PgdE9mDAaiIw6VPy9ij7
         Qywg==
X-Gm-Message-State: AGi0Puajo4kSW7CNSRTOCuVdzLUbbNhNWH7toxUruc47BPiQBwGpTVhu
        P8O9LtsxjEjMY5HQ8hun5dbPYXS49e20Cg==
X-Google-Smtp-Source: APiQypI4GXgVmhhEeQIBGhSJdIMiX55vtNCd8Ptr/2M2oTsu6SjPh/MuDhZHRFXFoTDrvI7aiFMEDA==
X-Received: by 2002:a05:600c:1109:: with SMTP id b9mr4408443wma.116.1588078246765;
        Tue, 28 Apr 2020 05:50:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
        by smtp.gmail.com with ESMTPSA id q184sm3246115wma.25.2020.04.28.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:50:46 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] media: meson: vdec: fix another case of VP9 buffer shortage
Date:   Tue, 28 Apr 2020 14:50:35 +0200
Message-Id: <20200428125036.9401-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200428125036.9401-1-narmstrong@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

- Redo the logic where VP9 gets fresh CAPTURE buffers. The previous code
  could lead to a hardlock.
- Reserve 4 margin buffers instead of 3, as apparently there are corner
  cases where 3 is not enough.

Fixes: e9a3eb4819ca ("media: meson: vdec: add VP9 input support")
Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 41 +++++++++++++-------
 drivers/staging/media/meson/vdec/esparser.c  | 24 ++++++------
 2 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 897f5d7a6aad..28a7e62e7371 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1185,6 +1185,29 @@ static void codec_vp9_set_mc(struct amvdec_session *sess,
 	amvdec_write_dos(core, VP9D_MPP_REF_SCALE_ENBL, scale);
 }
 
+/*
+ * Get a free VB2 buffer that isn't currently used.
+ * VP9 references are held sometimes for so long that it's not really an option
+ * to hold them until they're no longer referenced, as it would delay the
+ * CAPTURE queue too much
+ */
+static struct vb2_v4l2_buffer *get_free_vbuf(struct amvdec_session *sess)
+{
+	struct codec_vp9 *vp9 = sess->priv;
+	struct vb2_v4l2_buffer *vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
+	struct vb2_v4l2_buffer *vbuf2;
+
+	if (!vbuf)
+		return NULL;
+
+	if (!codec_vp9_get_frame_by_idx(vp9, vbuf->vb2_buf.index))
+		return vbuf;
+
+	vbuf2 = get_free_vbuf(sess);
+	v4l2_m2m_buf_queue(sess->m2m_ctx, vbuf);
+	return vbuf2;
+}
+
 static struct vp9_frame *codec_vp9_get_new_frame(struct amvdec_session *sess)
 {
 	struct codec_vp9 *vp9 = sess->priv;
@@ -1196,25 +1219,13 @@ static struct vp9_frame *codec_vp9_get_new_frame(struct amvdec_session *sess)
 	if (!new_frame)
 		return NULL;
 
-	vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
+	vbuf = get_free_vbuf(sess);
 	if (!vbuf) {
 		dev_err(sess->core->dev, "No dst buffer available\n");
 		kfree(new_frame);
 		return NULL;
 	}
 
-	while (codec_vp9_get_frame_by_idx(vp9, vbuf->vb2_buf.index)) {
-		struct vb2_v4l2_buffer *old_vbuf = vbuf;
-
-		vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
-		v4l2_m2m_buf_queue(sess->m2m_ctx, old_vbuf);
-		if (!vbuf) {
-			dev_err(sess->core->dev, "No dst buffer available\n");
-			kfree(new_frame);
-			return NULL;
-		}
-	}
-
 	new_frame->vbuf = vbuf;
 	new_frame->index = vbuf->vb2_buf.index;
 	new_frame->intra_only = param->p.intra_only;
@@ -1267,8 +1278,10 @@ static void codec_vp9_process_frame(struct amvdec_session *sess)
 		codec_vp9_rm_noshow_frame(sess);
 
 	vp9->cur_frame = codec_vp9_get_new_frame(sess);
-	if (!vp9->cur_frame)
+	if (!vp9->cur_frame) {
+		amvdec_abort(sess);
 		return;
+	}
 
 	pr_debug("frame %d: type: %08X; show_exist: %u; show: %u, intra_only: %u\n",
 		 vp9->cur_frame->index,
diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index db7022707ff8..814bb0587e3b 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -301,21 +301,19 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 offset;
 	u32 pad_size;
 
-	/*
-	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
-	 * shortage of CAPTURE buffers on the decoder side.
-	 * For the future, a good enhancement of the way this is handled could
-	 * be to notify new capture buffers to the decoding modules, so that
-	 * they could pause when there is no capture buffer available and
-	 * resume on this notification.
-	 */
-	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
-		if (codec_ops->num_pending_bufs)
-			num_dst_bufs = codec_ops->num_pending_bufs(sess);
-
+	if (codec_ops->num_pending_bufs) {
+		num_dst_bufs = codec_ops->num_pending_bufs(sess);
 		num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
+		/*
+		 * When max ref frame is held by VP9, this should be -= 4
+		 * to prevent a shortage of CAPTURE buffers on the decoder side.
+		 * For the future, a good enhancement of the way this is handled
+		 * could be to notify new capture buffers to the decoding
+		 * modules, so that they could pause when there is no capture
+		 * buffer available and resume on this notification.
+		 */
 		if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
-			num_dst_bufs -= 3;
+			num_dst_bufs -= 4;
 
 		if (esparser_vififo_get_free_space(sess) < payload_size ||
 		    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)
-- 
2.22.0

