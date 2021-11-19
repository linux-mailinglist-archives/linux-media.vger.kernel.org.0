Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3E9456B15
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 08:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhKSHuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 02:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhKSHuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 02:50:00 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38454C06173E
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 23:46:59 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b13so7528543plg.2
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBNCtCfqZurLfKPQYW4MDFzz8IQkjaKhoSv1g1++xxc=;
        b=jqpginvm/vLrNZxTGFU4ndyCA+Jy+2RIfESFUWEQqcEBVweBM32Ekf8kfLeNOV5u0p
         7pOkviWwOlxUELyU5MJJo0iLXUffbfWtEkqGQgU+8vXF5KHBqnIQxjdgYeEbPihIRYCs
         6Wce0sbJzAdfCCX4i+JujESBrn6/W1Mvfvcf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBNCtCfqZurLfKPQYW4MDFzz8IQkjaKhoSv1g1++xxc=;
        b=sgLIdyNQdU/mXl1bJhU5/b1ZD6dsVAAswDSyXyhjVRs1dKnfKFZcwIoTjsqNyafb0L
         azFnnCy15/LnwOkeZTalHmEkdeUDrwbd5OEefYiqjpMqUTmrC8EW+OuNBTlAOqgAapQr
         ZOj7LqqoO+qi71aOLJavN/pKmJFePwkoU/VnmE+aqRdMjn6F2uumtGBXeNtV+tZP5hv2
         SM5DklcnLA6OU9qw4GUg3uFkMveW51LJt6Zh4+c7PUp92t42zBFU0gsV59V41v4Xm81O
         C4NnLOdQTn89wlaE0FJO6zNilIieYDZDRszDoAIZGetS5UgxiSq7fW8g5TGKhiS8Wtvx
         JXgQ==
X-Gm-Message-State: AOAM533qIu6OBgClk5wiCd3chYRSckyHzY/w5990VIHSyIO8LOPOLvQe
        pdy95fjJ/qwPDybYyuWk4ojjxkg6/V+DQg==
X-Google-Smtp-Source: ABdhPJyFmPMYwHPxr+FyJ3stDNWysKqief+fvUPuIW24yLnrFAjmZiZUA23UfnYdhPzXTT1lpcoTXw==
X-Received: by 2002:a17:90a:e012:: with SMTP id u18mr2272529pjy.103.1637308018800;
        Thu, 18 Nov 2021 23:46:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1e9e:88c0:7cad:9b21])
        by smtp.gmail.com with ESMTPSA id t4sm1919051pfg.155.2021.11.18.23.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 23:46:58 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
Date:   Fri, 19 Nov 2021 15:46:54 +0800
Message-Id: <20211119074654.470729-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The JPEG encoder found in the Hantro H1 encoder block only produces a
raw entropy-encoded scan. The driver is responsible for building a JPEG
compliant bitstream and placing the entropy-encoded scan in it. Right
now the driver uses a bounce buffer for the hardware to output the raw
scan to.

In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
codec_ops.done"), the code that copies the raw scan from the bounce
buffer to the capture buffer was moved, but was only hooked up for the
Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
producing a JPEG bitstream without the scan, and the capture buffer's
.bytesused field unset.

Fix this by duplicating the code that is executed when the JPEG encoder
finishes encoding a frame. As the encoded length is read back from
hardware, and the variants having different register layouts, the
code is duplicated rather than shared.

Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was developed on the downstream ChromeOS 5.10 kernel (with a hack
for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).

This was then forward-ported to mainline (name and filename changes) and
compile tested only.

---
 .../staging/media/hantro/hantro_h1_jpeg_enc.c   |  2 +-
 drivers/staging/media/hantro/hantro_hw.h        |  3 ++-
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c    | 17 +++++++++++++++++
 drivers/staging/media/hantro/rockchip_vpu_hw.c  |  5 +++--
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 56cf261a8e95..9cd713c02a45 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -140,7 +140,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	return 0;
 }
 
-void hantro_jpeg_enc_done(struct hantro_ctx *ctx)
+void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	u32 bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 267a6d33a47b..60d4602d33ed 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -239,7 +239,8 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
 int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
-void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
+void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx);
+void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx);
 
 dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx);
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
index 991213ce1610..5d9ff420f0b5 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
@@ -171,3 +171,20 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 
 	return 0;
 }
+
+void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	u32 bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
+	struct vb2_v4l2_buffer *dst_buf = hantro_get_dst_buf(ctx);
+
+	/*
+	 * TODO: Rework the JPEG encoder to eliminate the need
+	 * for a bounce buffer.
+	 */
+	memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0) +
+	       ctx->vpu_dst_fmt->header_size,
+	       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+			      ctx->vpu_dst_fmt->header_size + bytesused);
+}
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index d4f52957cc53..0c22039162a0 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -343,7 +343,7 @@ static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
 		.run = hantro_h1_jpeg_enc_run,
 		.reset = rockchip_vpu1_enc_reset,
 		.init = hantro_jpeg_enc_init,
-		.done = hantro_jpeg_enc_done,
+		.done = hantro_h1_jpeg_enc_done,
 		.exit = hantro_jpeg_enc_exit,
 	},
 	[HANTRO_MODE_H264_DEC] = {
@@ -371,7 +371,7 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 		.run = hantro_h1_jpeg_enc_run,
 		.reset = rockchip_vpu1_enc_reset,
 		.init = hantro_jpeg_enc_init,
-		.done = hantro_jpeg_enc_done,
+		.done = hantro_h1_jpeg_enc_done,
 		.exit = hantro_jpeg_enc_exit,
 	},
 	[HANTRO_MODE_H264_DEC] = {
@@ -399,6 +399,7 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
 		.run = rockchip_vpu2_jpeg_enc_run,
 		.reset = rockchip_vpu2_enc_reset,
 		.init = hantro_jpeg_enc_init,
+		.done = rockchip_vpu2_jpeg_enc_done,
 		.exit = hantro_jpeg_enc_exit,
 	},
 	[HANTRO_MODE_H264_DEC] = {
-- 
2.34.0.rc2.393.gf8c9666880-goog

