Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D192BEC4
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfE1F5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42110 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbfE1F5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id go2so7848477plb.9
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQX7cJHbDOGy3qbp4R0uiyoHDzieblpMxlf5nPE+1kI=;
        b=edV0Rw6VsNp8oYJ3Dl4lZy5wN59+hfWnriCYwZl9+hyoyfhbXsZVWVuUzz1nLQbjSv
         pUUKbUJsNrn81w0Ly+3KJ/nIidVATG+IpCnMfXSaO5Y6GrwNW0Mz3CHQYO0eCBsO/OB1
         P3ChRYoRGn4LdSThVGpd77SC0gG9dauF2qewc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQX7cJHbDOGy3qbp4R0uiyoHDzieblpMxlf5nPE+1kI=;
        b=kiW3mwsoLM5OUJzOk73QNNlcht8AhXRbZjav8Pv2UHpXMN/Z0dqglzNt7xdQghFE6Q
         GDZCzcMAKOpJQAh1hVlx91jZBoyAISiu8DkyALfgehl85J8/p+rFLmigR+zk0nuJ1hcS
         4ZZvg8k7htQ6TLi5g4ea4KL4PmT/JozAoSn7gwTQ/VoaZtDKJ8ERC5NZJG6rKxiUfxSb
         Aj5ufIoB9wTz9U6OHoRygkTo6Mg7oJ6XxVd/CXnNsKG2FFNbDA+ZT4CqF5Y92Dri10oR
         /42j8/kj5EP1Y1mNAx8yN2b2aFfFkwZl0KrZwLvPELfveqzoxDb7bLCWmtYMR4lcozCX
         GVyQ==
X-Gm-Message-State: APjAAAVwfjtATnLVUdLaetpZpGMj6+Vv3tmunqS3VDSCMd5+G6A5Xo/k
        ZHe7TGcZbRqOUTdDRSz+p6x4SA==
X-Google-Smtp-Source: APXvYqwX6h3pdPPGLbBek6F3fq3R4CGcdFenGdZlESWWcc6QO7Pr3r2/3O/xfa3VSw+xU96R877Kfg==
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr7937401plt.81.1559023036256;
        Mon, 27 May 2019 22:57:16 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:15 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 02/12] media: mtk-vcodec: remove unneeded proxy functions
Date:   Tue, 28 May 2019 14:56:25 +0900
Message-Id: <20190528055635.12109-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We were getting the codec interface through a proxy function that does
not bring anything compared to just accessing the interface definition
directly, so just do that. Also make the decoder interfaces const.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c    |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c      | 12 ++++++------
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c    |  9 +--------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/venc_drv_if.c      |  8 ++++----
 7 files changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 2b29e004575d..185d8e7bdc87 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -493,16 +493,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return 0;
 }
 
-static struct vdec_common_if vdec_h264_if = {
+const struct vdec_common_if vdec_h264_if = {
 	.init		= vdec_h264_init,
 	.decode		= vdec_h264_decode,
 	.get_param	= vdec_h264_get_param,
 	.deinit		= vdec_h264_deinit,
 };
-
-struct vdec_common_if *get_h264_dec_comm_if(void);
-
-struct vdec_common_if *get_h264_dec_comm_if(void)
-{
-	return &vdec_h264_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index a13253242e90..28475b8d27fe 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -618,16 +618,9 @@ static void vdec_vp8_deinit(void *h_vdec)
 	kfree(inst);
 }
 
-static struct vdec_common_if vdec_vp8_if = {
+const struct vdec_common_if vdec_vp8_if = {
 	.init		= vdec_vp8_init,
 	.decode		= vdec_vp8_decode,
 	.get_param	= vdec_vp8_get_param,
 	.deinit		= vdec_vp8_deinit,
 };
-
-struct vdec_common_if *get_vp8_dec_comm_if(void);
-
-struct vdec_common_if *get_vp8_dec_comm_if(void)
-{
-	return &vdec_vp8_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 65b88a2bef4c..f4af69c543ba 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -1008,16 +1008,9 @@ static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return ret;
 }
 
-static struct vdec_common_if vdec_vp9_if = {
+const struct vdec_common_if vdec_vp9_if = {
 	.init		= vdec_vp9_init,
 	.decode		= vdec_vp9_decode,
 	.get_param	= vdec_vp9_get_param,
 	.deinit		= vdec_vp9_deinit,
 };
-
-struct vdec_common_if *get_vp9_dec_comm_if(void);
-
-struct vdec_common_if *get_vp9_dec_comm_if(void)
-{
-	return &vdec_vp9_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 1e3778738f3b..dfe63bb39dbb 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -23,9 +23,9 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vpu.h"
 
-const struct vdec_common_if *get_h264_dec_comm_if(void);
-const struct vdec_common_if *get_vp8_dec_comm_if(void);
-const struct vdec_common_if *get_vp9_dec_comm_if(void);
+extern const struct vdec_common_if vdec_h264_if;
+extern const struct vdec_common_if vdec_vp8_if;
+extern const struct vdec_common_if vdec_vp9_if;
 
 int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
@@ -33,13 +33,13 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_H264:
-		ctx->dec_if = get_h264_dec_comm_if();
+		ctx->dec_if = &vdec_h264_if;
 		break;
 	case V4L2_PIX_FMT_VP8:
-		ctx->dec_if = get_vp8_dec_comm_if();
+		ctx->dec_if = &vdec_vp8_if;
 		break;
 	case V4L2_PIX_FMT_VP9:
-		ctx->dec_if = get_vp9_dec_comm_if();
+		ctx->dec_if = &vdec_vp9_if;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6feb786bebf..eb015ce0fd3e 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -664,16 +664,9 @@ static int h264_enc_deinit(void *handle)
 	return ret;
 }
 
-static const struct venc_common_if venc_h264_if = {
+const struct venc_common_if venc_h264_if = {
 	.init = h264_enc_init,
 	.encode = h264_enc_encode,
 	.set_param = h264_enc_set_param,
 	.deinit = h264_enc_deinit,
 };
-
-const struct venc_common_if *get_h264_enc_comm_if(void);
-
-const struct venc_common_if *get_h264_enc_comm_if(void)
-{
-	return &venc_h264_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8656d89369bc..ad8008c865db 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -469,16 +469,9 @@ static int vp8_enc_deinit(void *handle)
 	return ret;
 }
 
-static const struct venc_common_if venc_vp8_if = {
+const struct venc_common_if venc_vp8_if = {
 	.init = vp8_enc_init,
 	.encode = vp8_enc_encode,
 	.set_param = vp8_enc_set_param,
 	.deinit = vp8_enc_deinit,
 };
-
-const struct venc_common_if *get_vp8_enc_comm_if(void);
-
-const struct venc_common_if *get_vp8_enc_comm_if(void)
-{
-	return &venc_vp8_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 4b04652be6de..94bb530f7d2d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -26,8 +26,8 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vpu.h"
 
-const struct venc_common_if *get_h264_enc_comm_if(void);
-const struct venc_common_if *get_vp8_enc_comm_if(void);
+extern const struct venc_common_if venc_h264_if;
+extern const struct venc_common_if venc_vp8_if;
 
 int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
@@ -35,10 +35,10 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_VP8:
-		ctx->enc_if = get_vp8_enc_comm_if();
+		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = get_h264_enc_comm_if();
+		ctx->enc_if = &venc_h264_if;
 		break;
 	default:
 		return -EINVAL;
-- 
2.22.0.rc1.257.g3120a18244-goog

