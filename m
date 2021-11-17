Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505784546E1
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhKQNJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbhKQNJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B3C061764;
        Wed, 17 Nov 2021 05:06:57 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F11221F45D0A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154416; bh=WrZFRJgosj8fXeCgZOypKOsxmSubLEsYuflu3+uxlJs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=elNBWQorW3hIx6mwp2URppQhCyKR2rVRynaFhMibqCmp4aQKnybKhXdeJv5kZhxgv
         AGAroByy0hDkGvTu+X6BGWdXLhGx7EA/skNIeaiJ42f4/CvbEUtEOXKoKn5aw0bBEx
         LnGPhAl8UAkOzpwrLJO3v4sD4xEU8oCE/MQWJiJLyAZH5tNVQASq9twg8IugUENzNq
         HEDw4GPOWEA4FwulhQudr9AV1uXwgZ3DpE2hwTIg7iIx5ERlEZUZUs1oaHVfWThtDZ
         /D+PQN+4mkcUypPN79eWWcqpADfIScgIjEhGBjrrECtRlOqxuKDMOSkcK8x95AB054
         qWTEjT/u1Y10g==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 4/7] media: mtk-vcodec: fix debugging defines
Date:   Wed, 17 Nov 2021 15:06:32 +0200
Message-Id: <20211117130635.11633-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mtk-vcodec uses some internal defined debug formats for
printing. This patch fixes some things in those defines:

1. use the 'pr_fmt' define to print function name and line.

2. remove 'if(DEBUG)' condition for the defines. This condition
prevents the debugs from being shown in case of dynamic debugs.
Instead replace 'pr_info' with 'pr_debug'

3. remove module parameters that enable/disable debug.
There is no reason for the driver to have those params. Having
those params require the user to explicitly set them when user
wants to see debug prints instead of using the global debugs
setting as expected by drivers to conform.

In addition to that, fix some warnings about debug formatting

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 10 -----
 .../platform/mtk-vcodec/mtk_vcodec_util.h     | 45 +++++--------------
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  4 +-
 5 files changed, 12 insertions(+), 53 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..f3610a338a01 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -28,9 +28,6 @@
 #define VDEC_IRQ_CLR	0x10
 #define VDEC_IRQ_CFG_REG	0xa4
 
-module_param(mtk_v4l2_dbg_level, int, 0644);
-module_param(mtk_vcodec_dbg, bool, 0644);
-
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index f898226fc53e..ec5ee337c1fd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -23,9 +23,6 @@
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_fw.h"
 
-module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
-module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
-
 static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index ac5973b6735f..5bac820a47fc 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -10,16 +10,6 @@
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
 
-/* For encoder, this will enable logs in venc/*/
-bool mtk_vcodec_dbg;
-EXPORT_SYMBOL(mtk_vcodec_dbg);
-
-/* The log level of v4l2 encoder or decoder driver.
- * That is, files under mtk-vcodec/.
- */
-int mtk_v4l2_dbg_level;
-EXPORT_SYMBOL(mtk_v4l2_dbg_level);
-
 void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
 					unsigned int reg_idx)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index b999d7b84ed1..87c3d6d4bfa7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -25,54 +25,29 @@ struct mtk_vcodec_fb {
 struct mtk_vcodec_ctx;
 struct mtk_vcodec_dev;
 
-extern int mtk_v4l2_dbg_level;
-extern bool mtk_vcodec_dbg;
-
+#undef pr_fmt
+#define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
 
 #define mtk_v4l2_err(fmt, args...)                \
-	pr_err("[MTK_V4L2][ERROR] %s:%d: " fmt "\n", __func__, __LINE__, \
-	       ##args)
-
-#define mtk_vcodec_err(h, fmt, args...)					\
-	pr_err("[MTK_VCODEC][ERROR][%d]: %s() " fmt "\n",		\
-	       ((struct mtk_vcodec_ctx *)h->ctx)->id, __func__, ##args)
+	pr_err("[MTK_V4L2][ERROR] " fmt "\n", ##args)
 
+#define mtk_vcodec_err(h, fmt, args...)				\
+	pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n",		\
+	       ((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
 
-#if defined(DEBUG)
 
-#define mtk_v4l2_debug(level, fmt, args...)				 \
-	do {								 \
-		if (mtk_v4l2_dbg_level >= level)			 \
-			pr_info("[MTK_V4L2] level=%d %s(),%d: " fmt "\n",\
-				level, __func__, __LINE__, ##args);	 \
-	} while (0)
+#define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##args)
 
 #define mtk_v4l2_debug_enter()  mtk_v4l2_debug(3, "+")
 #define mtk_v4l2_debug_leave()  mtk_v4l2_debug(3, "-")
 
-#define mtk_vcodec_debug(h, fmt, args...)				\
-	do {								\
-		if (mtk_vcodec_dbg)					\
-			pr_info("[MTK_VCODEC][%d]: %s() " fmt "\n",	\
-				((struct mtk_vcodec_ctx *)h->ctx)->id, \
-				__func__, ##args);			\
-	} while (0)
+#define mtk_vcodec_debug(h, fmt, args...)			\
+	pr_debug("[MTK_VCODEC][%d]: " fmt "\n",			\
+		((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
 
 #define mtk_vcodec_debug_enter(h)  mtk_vcodec_debug(h, "+")
 #define mtk_vcodec_debug_leave(h)  mtk_vcodec_debug(h, "-")
 
-#else
-
-#define mtk_v4l2_debug(level, fmt, args...) {}
-#define mtk_v4l2_debug_enter() {}
-#define mtk_v4l2_debug_leave() {}
-
-#define mtk_vcodec_debug(h, fmt, args...) {}
-#define mtk_vcodec_debug_enter(h) {}
-#define mtk_vcodec_debug_leave(h) {}
-
-#endif
-
 void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
 				unsigned int reg_idx);
 int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index 946c23088308..88f2e8f9bfe1 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -527,7 +527,7 @@ static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 	struct mtk_vcodec_mem *mem = NULL;
 	unsigned int buf_sz = get_mv_buf_size(pic->buf_w, pic->buf_h);
 
-	mtk_v4l2_debug(3, "size = 0x%lx", buf_sz);
+	mtk_v4l2_debug(3, "size = 0x%x", buf_sz);
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
 		if (mem->va)
@@ -637,7 +637,7 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 	if (err)
 		goto error_deinit;
 
-	mtk_vcodec_debug(inst, "struct size = %d,%d,%d,%d\n",
+	mtk_vcodec_debug(inst, "struct size = %lu,%lu,%lu,%lu\n",
 			 sizeof(struct mtk_h264_sps_param),
 			 sizeof(struct mtk_h264_pps_param),
 			 sizeof(struct mtk_h264_dec_slice_param),
-- 
2.17.1

