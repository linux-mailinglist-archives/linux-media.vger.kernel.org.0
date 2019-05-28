Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D122CD01
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfE1RED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:04:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfE1REC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:04:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1A232284AFA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 12/16] rockchip/vpu: Add support for non-standard controls
Date:   Tue, 28 May 2019 14:02:28 -0300
Message-Id: <20190528170232.2091-13-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the way controls are registered by the driver,
so it can support non-standard controls, such as those
used by stateless codecs.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
--
Changes from v4:
* Remove unused var in rockchip_vpu_ctrls_setup()

Changes from v3:
* None

Changes from v2:
* Got rid of unused ctrls related fields.
* Removed unndeeded is_std internal field.

 .../media/rockchip/vpu/rk3288_vpu_hw.c        |  2 +-
 .../media/rockchip/vpu/rk3399_vpu_hw.c        |  2 +-
 .../staging/media/rockchip/vpu/rockchip_vpu.h | 17 ++++++-
 .../media/rockchip/vpu/rockchip_vpu_drv.c     | 51 +++++++++++++++----
 4 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
index a874a0d83c2d..da19f1cad957 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
+++ b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
@@ -112,7 +112,7 @@ const struct rockchip_vpu_variant rk3288_vpu_variant = {
 	.enc_fmts = rk3288_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
 	.codec_ops = rk3288_vpu_codec_ops,
-	.codec = RK_VPU_CODEC_JPEG,
+	.codec = RK_VPU_JPEG_ENCODER,
 	.vepu_irq = rk3288_vepu_irq,
 	.init = rk3288_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
index f4effad00605..5c6c1e8b36d6 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
+++ b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
@@ -111,7 +111,7 @@ const struct rockchip_vpu_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3399_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rk3399_vpu_enc_fmts),
-	.codec = RK_VPU_CODEC_JPEG,
+	.codec = RK_VPU_JPEG_ENCODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.vepu_irq = rk3399_vepu_irq,
 	.init = rk3399_vpu_hw_init,
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
index 3d64f3e95c9b..ec7557a98583 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
@@ -34,7 +34,10 @@
 struct rockchip_vpu_ctx;
 struct rockchip_vpu_codec_ops;
 
-#define RK_VPU_CODEC_JPEG BIT(0)
+#define RK_VPU_JPEG_ENCODER	BIT(0)
+#define RK_VPU_ENCODERS		0x0000ffff
+
+#define RK_VPU_DECODERS		0xffff0000
 
 /**
  * struct rockchip_vpu_variant - information about VPU hardware variant
@@ -79,6 +82,18 @@ enum rockchip_vpu_codec_mode {
 	RK_VPU_MODE_JPEG_ENC,
 };
 
+/*
+ * struct rockchip_vpu_ctrl - helper type to declare supported controls
+ * @id:		V4L2 control ID (V4L2_CID_xxx)
+ * @codec:	codec id this control belong to (RK_VPU_JPEG_ENCODER, etc.)
+ * @cfg:	control configuration
+ */
+struct rockchip_vpu_ctrl {
+	unsigned int id;
+	unsigned int codec;
+	struct v4l2_ctrl_config cfg;
+};
+
 /*
  * struct rockchip_vpu_func - rockchip VPU functionality
  *
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index 0a8d7fb8903a..75104174640b 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -245,22 +245,51 @@ static const struct v4l2_ctrl_ops rockchip_vpu_ctrl_ops = {
 	.s_ctrl = rockchip_vpu_s_ctrl,
 };
 
+static struct rockchip_vpu_ctrl controls[] = {
+	{
+		.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
+		.codec = RK_VPU_JPEG_ENCODER,
+		.cfg = {
+			.min = 5,
+			.max = 100,
+			.step = 1,
+			.def = 50,
+		},
+	},
+};
+
 static int rockchip_vpu_ctrls_setup(struct rockchip_vpu_dev *vpu,
-				    struct rockchip_vpu_ctx *ctx)
+				    struct rockchip_vpu_ctx *ctx,
+				    int allowed_codecs)
 {
-	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 1);
-	if (vpu->variant->codec & RK_VPU_CODEC_JPEG) {
-		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rockchip_vpu_ctrl_ops,
-				  V4L2_CID_JPEG_COMPRESSION_QUALITY,
-				  5, 100, 1, 50);
+	int i, num_ctrls = ARRAY_SIZE(controls);
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, num_ctrls);
+
+	for (i = 0; i < num_ctrls; i++) {
+		if (!(allowed_codecs & controls[i].codec))
+			continue;
+		if (!controls[i].cfg.elem_size) {
+			v4l2_ctrl_new_std(&ctx->ctrl_handler,
+					  &rockchip_vpu_ctrl_ops,
+					  controls[i].id, controls[i].cfg.min,
+					  controls[i].cfg.max,
+					  controls[i].cfg.step,
+					  controls[i].cfg.def);
+		} else {
+			controls[i].cfg.id = controls[i].id;
+			v4l2_ctrl_new_custom(&ctx->ctrl_handler,
+					     &controls[i].cfg, NULL);
+		}
+
 		if (ctx->ctrl_handler.error) {
-			vpu_err("Adding JPEG control failed %d\n",
+			vpu_err("Adding control (%d) failed %d\n",
+				controls[i].id,
 				ctx->ctrl_handler.error);
 			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 			return ctx->ctrl_handler.error;
 		}
 	}
-
 	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
 }
 
@@ -274,7 +303,7 @@ static int rockchip_vpu_open(struct file *filp)
 	struct video_device *vdev = video_devdata(filp);
 	struct rockchip_vpu_func *func = rockchip_vpu_vdev_to_func(vdev);
 	struct rockchip_vpu_ctx *ctx;
-	int ret;
+	int allowed_codecs, ret;
 
 	/*
 	 * We do not need any extra locking here, because we operate only
@@ -291,10 +320,12 @@ static int rockchip_vpu_open(struct file *filp)
 
 	ctx->dev = vpu;
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
+		allowed_codecs = vpu->variant->codec & RK_VPU_ENCODERS;
 		ctx->buf_finish = rockchip_vpu_enc_buf_finish;
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
 						    queue_init);
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
+		allowed_codecs = vpu->variant->codec & RK_VPU_DECODERS;
 		ctx->buf_finish = rockchip_vpu_dec_buf_finish;
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
 						    queue_init);
@@ -313,7 +344,7 @@ static int rockchip_vpu_open(struct file *filp)
 
 	rockchip_vpu_reset_fmts(ctx);
 
-	ret = rockchip_vpu_ctrls_setup(vpu, ctx);
+	ret = rockchip_vpu_ctrls_setup(vpu, ctx, allowed_codecs);
 	if (ret) {
 		vpu_err("Failed to set up controls\n");
 		goto err_fh_free;
-- 
2.20.1

