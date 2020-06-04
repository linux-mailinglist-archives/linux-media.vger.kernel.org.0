Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5251EE5F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgFDNxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728896AbgFDNxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 09:53:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87334C08C5C1
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 06:53:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r9so5325149wmh.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WTN9hKVRvS3SB3HTMfGE7UGBs+9KNxbyg3Yusfgv+rE=;
        b=XyuF7akhxZYqkjEdda9jL2OlbN0kGPXJPHJ0ss5AJZFIm7yaqkJ70UFt397DKdBTTy
         LkysXfSu9XsXPGq1ID7H1auU1t3o5k0fJr+9ipc5zC1uDNIVS9a6lO7HiJSMM5ke/Vyh
         U4IPCGpq3r09LTUCHE/F46tvaQJWRMqsdWCzlzPW6KYO/505VDb/T7Q42z23eGQE7z6Z
         72ekSvLROK+9p6ZCe38kEP+yGRvhGpOsD8lrv4WBaqHrAnYrxmr2Tn9T2oRvMg/H8LnU
         igUmQBOWOMLCuTbzTJ8RUUrZiJqr3vm3VVIfo/NiZePI42xwckDiJmy4cK4CdbrEplxc
         4BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WTN9hKVRvS3SB3HTMfGE7UGBs+9KNxbyg3Yusfgv+rE=;
        b=UDEopkjMc87mgCvS3zegZKB6Kbe1OchkdTqTd4EB95NTZ5LJVQwa6Ztf4m4IyMvT1P
         cuMusIwv7VlDRWZqlpW1wecfWCBeR4wQLhkVmLJ1ks5KQHytmr0p6V+L9H8VGgmxjmpr
         dxl1f/WEjf+7wQYfN6oIbePMcpEmIuNGUAUsS7ZCDch3wi5Ti45vbWT44BJRpGQG1zEm
         5XIvMche25mXc9T9hWJa3Mflx/BF/gn6eiKOERw1mGlN/Dl2HFyogMt1CUdtJ70QvsEp
         PsqM4CC6CzNfZJkp9ECOMUprHdPSh7gi4QgCR1SvrwJMQ7BkimvPy6sWdm8h5589wyAz
         VHRQ==
X-Gm-Message-State: AOAM531Y6I+TdeFwgI4V82dezsI9UplxFaDujG6hmhO1gudY206zQZMH
        DtHXMedb/nH+l+VSfDOU9n6wJw==
X-Google-Smtp-Source: ABdhPJwd9WGnr6Q/FV1RFyKfSIpbxLo2wXPQ8ohJw62dgXc/LSq0+CrfVHbTBTa4n1Fkmh1H7CwwIg==
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr4410607wme.13.1591278811002;
        Thu, 04 Jun 2020 06:53:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id i74sm8185599wri.49.2020.06.04.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:53:30 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/5] media: meson: vdec: handle bitdepth on source change
Date:   Thu,  4 Jun 2020 15:53:14 +0200
Message-Id: <20200604135317.9235-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200604135317.9235-1-narmstrong@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

In order to handle Compressed Framebuffer support, we need to handle
the switch between 8bit and 10bit frame output.

This handles the bitdepth in the codec amvdec_src_change() call to handle
a source change/decode resume when the stream bitdepth changes.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   |  3 ++-
 drivers/staging/media/meson/vdec/codec_vp9.c    |  3 ++-
 drivers/staging/media/meson/vdec/vdec.h         |  1 +
 drivers/staging/media/meson/vdec/vdec_helpers.c | 10 ++++++----
 drivers/staging/media/meson/vdec/vdec_helpers.h |  3 ++-
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..d53c9a464bde 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -353,7 +353,8 @@ static void codec_h264_src_change(struct amvdec_session *sess)
 		frame_width, frame_height, crop_right, crop_bottom);
 
 	codec_h264_set_par(sess);
-	amvdec_src_change(sess, frame_width, frame_height, h264->max_refs + 5);
+	amvdec_src_change(sess, frame_width, frame_height,
+			  h264->max_refs + 5, 8);
 }
 
 /*
diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 897f5d7a6aad..4c6a644ab1a7 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -2132,7 +2132,8 @@ static irqreturn_t codec_vp9_threaded_isr(struct amvdec_session *sess)
 
 	codec_vp9_fetch_rpm(sess);
 	if (codec_vp9_process_rpm(vp9)) {
-		amvdec_src_change(sess, vp9->width, vp9->height, 16);
+		amvdec_src_change(sess, vp9->width, vp9->height, 16,
+				  vp9->is_10bit ? 10 : 8);
 
 		/* No frame is actually processed */
 		vp9->cur_frame = NULL;
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index f95445ac0658..e3e4af73447a 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -234,6 +234,7 @@ struct amvdec_session {
 	u32 width;
 	u32 height;
 	u32 colorspace;
+	u32 bitdepth;
 	u8 ycbcr_enc;
 	u8 quantization;
 	u8 xfer_func;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..eed7a929c5d0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -436,7 +436,7 @@ void amvdec_set_par_from_dar(struct amvdec_session *sess,
 EXPORT_SYMBOL_GPL(amvdec_set_par_from_dar);
 
 void amvdec_src_change(struct amvdec_session *sess, u32 width,
-		       u32 height, u32 dpb_size)
+		       u32 height, u32 dpb_size, u32 bitdepth)
 {
 	static const struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
@@ -451,7 +451,8 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 	if (sess->streamon_cap &&
 	    sess->width == width &&
 	    sess->height == height &&
-	    dpb_size <= sess->num_dst_bufs) {
+	    dpb_size <= sess->num_dst_bufs &&
+	    sess->bitdepth == bitdepth) {
 		sess->fmt_out->codec_ops->resume(sess);
 		return;
 	}
@@ -460,9 +461,10 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 	sess->width = width;
 	sess->height = height;
 	sess->status = STATUS_NEEDS_RESUME;
+	sess->bitdepth = bitdepth;
 
-	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB size %u\n",
-		width, height, dpb_size);
+	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB %u, bitdepth %u\n",
+		width, height, dpb_size, bitdepth);
 	v4l2_event_queue_fh(&sess->fh, &ev);
 }
 EXPORT_SYMBOL_GPL(amvdec_src_change);
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..f059cf195cca 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -76,9 +76,10 @@ void amvdec_set_par_from_dar(struct amvdec_session *sess,
  * @width: picture width detected by the hardware
  * @height: picture height detected by the hardware
  * @dpb_size: Decoded Picture Buffer size (= amount of buffers for decoding)
+ * @bitdepth: Bit depth (usually 10 or 8) of the coded content
  */
 void amvdec_src_change(struct amvdec_session *sess, u32 width,
-		       u32 height, u32 dpb_size);
+		       u32 height, u32 dpb_size, u32 bitdepth);
 
 /**
  * amvdec_abort() - Abort the current decoding session
-- 
2.22.0

