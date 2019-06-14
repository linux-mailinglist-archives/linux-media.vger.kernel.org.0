Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3730E456D6
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfFNH4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:56:47 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35974 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfFNH4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:56:47 -0400
Received: by mail-pl1-f193.google.com with SMTP id w10so487208plz.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUe0EsfPK7WobnMDoqwxZ5A8cbWc1pQqqXQ4s7xzzNE=;
        b=IDJpDQ6ICIrk//XXoQHGmBnCzA7kLbwgTcW9n/66M3LSLVUb/jQBjAYmCXvMYUqZq+
         FT4x57m3dI3QSqrUdHsWO2c5kvmnJVMGqI33D4O8VRr8fzCsno2eOUSubR5bgPYQ10eX
         E/KaekFbmcwgJH/iGnvT68nvT68UtiVbFqmQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUe0EsfPK7WobnMDoqwxZ5A8cbWc1pQqqXQ4s7xzzNE=;
        b=KfgHKX9UwwBl2G+JsMQQIL863kUaHFsJy0l2lziw+zPZMGP4eJi5G8g8+IfjDKnr2K
         TFRunskvEVwohLEidh5GcdT1EzwavhkpVN8mnnknc9oT1BH5jtqREvnnG2GNwjb+DrLM
         IZjH9UvR7MT/KraRt/GHIXLAb0SZ3QI5rmEv3z/hjvjGg6EOHAp4jqrrwjjV5B0B8D7g
         9jd6vcfrz7DNvEMS4s6MEW5yBDtmyYxqt9JN8sfe1Q3lT3ItNOEBdYqfhSLttvHuq6rt
         KRdWDqgaKXOnRzCNyeYLHPZlfMXuzwEeQciWK/w92NWNFtpnxTSS36jVh/MERMjKaHwg
         rWGg==
X-Gm-Message-State: APjAAAUM8zJfxd/bt9trhW+fOxFqseW5SM7Qq576zBCILWlbIf2I1TuC
        6Ba18a9m6x0NXcrT313RsVpO5A==
X-Google-Smtp-Source: APXvYqwqW/T4Lqap0ZHSnu0gIKcR91q9naNgHyS5/oXC+wwRf1BPu6mHNjAT/uhApLrTMh5HeGXZtg==
X-Received: by 2002:a17:902:bc43:: with SMTP id t3mr26108872plz.250.1560499006748;
        Fri, 14 Jun 2019 00:56:46 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id q7sm2156947pfb.32.2019.06.14.00.56.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 00:56:46 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2] media: mtk-vcodec: remove unneeded proxy functions
Date:   Fri, 14 Jun 2019 16:56:40 +0900
Message-Id: <20190614075640.106709-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
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
Changes since v1:

* Fix checkpatch warnings.

 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c  |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c  |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c       | 10 +++-------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h       |  4 ++++
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  |  9 +--------
 drivers/media/platform/mtk-vcodec/venc_drv_if.c       |  7 ++-----
 drivers/media/platform/mtk-vcodec/venc_drv_if.h       |  3 +++
 9 files changed, 17 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 67a7d4f813d5..c5f8f1fca44c 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -485,16 +485,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
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
index 42e302650e69..63a8708ce682 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -610,16 +610,9 @@ static void vdec_vp8_deinit(void *h_vdec)
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
index bed452ac9d13..c179204f97ec 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -1000,16 +1000,9 @@ static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
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
index 8354404a7fc9..2e43dd4486e0 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -15,23 +15,19 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vpu.h"
 
-const struct vdec_common_if *get_h264_dec_comm_if(void);
-const struct vdec_common_if *get_vp8_dec_comm_if(void);
-const struct vdec_common_if *get_vp9_dec_comm_if(void);
-
 int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
 
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
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index c5bd8b0dbe13..270d8dc9984b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -54,6 +54,10 @@ struct vdec_fb_node {
 	struct vdec_fb *fb;
 };
 
+extern const struct vdec_common_if vdec_h264_if;
+extern const struct vdec_common_if vdec_vp8_if;
+extern const struct vdec_common_if vdec_vp9_if;
+
 /**
  * vdec_if_init() - initialize decode driver
  * @ctx	: [in] v4l2 context
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index 0183dd395d44..b9624f8df0e9 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -655,16 +655,9 @@ static int h264_enc_deinit(void *handle)
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
index 3787e75ca902..8d36f0362efe 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -460,16 +460,9 @@ static int vp8_enc_deinit(void *handle)
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
index b5cc645f7c68..c6bb82ac2dcd 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -17,19 +17,16 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vpu.h"
 
-const struct venc_common_if *get_h264_enc_comm_if(void);
-const struct venc_common_if *get_vp8_enc_comm_if(void);
-
 int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
 
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
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
index cc5bb36c2735..52fc9cc812fc 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
@@ -110,6 +110,9 @@ struct venc_done_result {
 	bool is_key_frm;
 };
 
+extern const struct venc_common_if venc_h264_if;
+extern const struct venc_common_if venc_vp8_if;
+
 /*
  * venc_if_init - Create the driver handle
  * @ctx: device context
-- 
2.22.0.410.gd8fdbe21b5-goog

