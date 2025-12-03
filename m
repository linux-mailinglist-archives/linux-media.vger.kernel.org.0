Return-Path: <linux-media+bounces-48174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEAC9FD5B
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 17:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 175C930109AE
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 16:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE74338F23;
	Wed,  3 Dec 2025 15:54:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2444336EF7
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777240; cv=none; b=mKbG/XktrCHFtj74/w3Sxb6JsYwKJThJl/XS9ZQ9O9ntd7jZoGJTvFDW3cUwtJea+i4N8Lscq1xvFX0KtK0OT2H6p2LNINKbS6LIFVMC0vy0E9wUfvmpPRthmsvS3gHnDONFl2OPM2qB/JEHlzuS0Xu1AGuLRP5aBnSRXlT3L6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777240; c=relaxed/simple;
	bh=H7j5GUTtbWcZmKzomIajCTJhuI+yvK5wgbCGABvEgJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7J/5ctx69mQBLEnZwJ4qI/Wgi2lX5z8u2Psq6ym+782eklF5ZVKRlEID+u9N0S4tGoVIJbPBoBeCqr+sSSCWpIPQNHJMghPiZrTZ0tGsur13uvTPHWZcVaVYhqnrNFJpqfG+/qDmB4FUEXOdy8HuK6p7gVdmwFFylm1WS7BmyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAd-0007dW-5P; Wed, 03 Dec 2025 16:53:35 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:29 +0100
Subject: [PATCH v2 07/22] media: rockchip: rga: move hw specific parts to a
 dedicated struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-7-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

In preparation for the RGA3 unit, move RGA2 specific parts from rga.c
to rga-hw.c and create a struct to reference the RGA2 specific functions
and formats. This also allows to remove the rga-hw.h reference from the
include list of the rga driver.

Also document the command finish interrupt with a dedicated define.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 183 ++++++++++++++++++++-
 drivers/media/platform/rockchip/rga/rga-hw.h |   5 +-
 drivers/media/platform/rockchip/rga/rga.c    | 228 +++++----------------------
 drivers/media/platform/rockchip/rga/rga.h    |  23 ++-
 4 files changed, 245 insertions(+), 194 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index f1d5237472941..7419784efc693 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -437,8 +437,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 		PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
-void rga_hw_start(struct rockchip_rga *rga,
-		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
+static void rga_hw_start(struct rockchip_rga *rga,
+			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
 	struct rga_ctx *ctx = rga->curr;
 
@@ -452,3 +452,182 @@ void rga_hw_start(struct rockchip_rga *rga,
 
 	rga_write(rga, RGA_CMD_CTRL, 0x1);
 }
+
+static bool rga_handle_irq(struct rockchip_rga *rga)
+{
+	int intr;
+
+	intr = rga_read(rga, RGA_INT) & 0xf;
+
+	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
+
+	return intr & RGA_INT_COMMAND_FINISHED;
+}
+
+static void rga_get_version(struct rockchip_rga *rga)
+{
+	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
+	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+}
+
+static struct rga_fmt formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB32,
+		.color_swap = RGA_COLOR_ALPHA_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ABGR32,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_XBGR32,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_XBGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_RGB888,
+		.depth = 24,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_RGB888,
+		.depth = 24,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB444,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR4444,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB555,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR1555,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_BGR565,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422SP,
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422SP,
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420P,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422P,
+
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420P,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 2,
+	},
+};
+
+const struct rga_hw rga2_hw = {
+	.formats = formats,
+	.num_formats = ARRAY_SIZE(formats),
+	.cmdbuf_size = RGA_CMDBUF_SIZE,
+	.min_width = MIN_WIDTH,
+	.max_width = MAX_WIDTH,
+	.min_height = MIN_HEIGHT,
+	.max_height = MAX_HEIGHT,
+
+	.start = rga_hw_start,
+	.handle_irq = rga_handle_irq,
+	.get_version = rga_get_version,
+};
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index cc6bd7f5b0300..f4752aa823051 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -15,9 +15,6 @@
 #define MIN_WIDTH 34
 #define MIN_HEIGHT 34
 
-#define DEFAULT_WIDTH 100
-#define DEFAULT_HEIGHT 100
-
 #define RGA_TIMEOUT 500
 
 /* Registers address */
@@ -178,6 +175,8 @@
 #define RGA_ALPHA_COLOR_NORMAL 0
 #define RGA_ALPHA_COLOR_MULTIPLY_CAL 1
 
+#define RGA_INT_COMMAND_FINISHED 4
+
 /* Registers union */
 union rga_mode_ctrl {
 	unsigned int val;
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index f50fbbab0645e..d8b14c2d9f6a4 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -25,7 +25,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static int debug;
@@ -47,7 +46,7 @@ static void device_run(void *prv)
 
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
+	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
 
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 }
@@ -55,13 +54,8 @@ static void device_run(void *prv)
 static irqreturn_t rga_isr(int irq, void *prv)
 {
 	struct rockchip_rga *rga = prv;
-	int intr;
 
-	intr = rga_read(rga, RGA_INT) & 0xf;
-
-	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
-
-	if (intr & 0x04) {
+	if (rga->hw->handle_irq(rga)) {
 		struct vb2_v4l2_buffer *src, *dst;
 		struct rga_ctx *ctx = rga->curr;
 
@@ -184,174 +178,17 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 	return 0;
 }
 
-static struct rga_fmt formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB32,
-		.color_swap = RGA_COLOR_ALPHA_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ABGR32,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_XBGR32,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_XBGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_RGB24,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_BGR24,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB444,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR4444,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB555,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR1555,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_RGB565,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_BGR565,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV21,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV61,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12M,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV16,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUV420,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 2,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUV422P,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422P,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 2,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YVU420,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 2,
-	},
-};
-
-#define NUM_FORMATS ARRAY_SIZE(formats)
-
-static struct rga_fmt *rga_fmt_find(u32 pixelformat)
+static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
 {
 	unsigned int i;
 
-	for (i = 0; i < NUM_FORMATS; i++) {
-		if (formats[i].fourcc == pixelformat)
-			return &formats[i];
+	for (i = 0; i < rga->hw->num_formats; i++) {
+		if (rga->hw->formats[i].fourcc == pixelformat)
+			return &rga->hw->formats[i];
 	}
 	return NULL;
 }
 
-static struct rga_frame def_frame = {
-	.crop.left = 0,
-	.crop.top = 0,
-	.crop.width = DEFAULT_WIDTH,
-	.crop.height = DEFAULT_HEIGHT,
-	.fmt = &formats[0],
-};
-
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type)
 {
 	if (V4L2_TYPE_IS_OUTPUT(type))
@@ -366,6 +203,18 @@ static int rga_open(struct file *file)
 	struct rockchip_rga *rga = video_drvdata(file);
 	struct rga_ctx *ctx = NULL;
 	int ret = 0;
+	u32 def_width = clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max_width);
+	u32 def_height = clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->max_height);
+	struct rga_frame def_frame = {
+		.crop.left = 0,
+		.crop.top = 0,
+		.crop.width = def_width,
+		.crop.height = def_height,
+		.fmt = &rga->hw->formats[0],
+	};
+
+	def_frame.stride = (def_width * def_frame.fmt->depth) >> 3;
+	def_frame.size = def_frame.stride * def_height;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -376,9 +225,9 @@ static int rga_open(struct file *file)
 	ctx->out = def_frame;
 
 	v4l2_fill_pixfmt_mp(&ctx->in.pix,
-			    ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
+			    ctx->in.fmt->fourcc, def_width, def_height);
 	v4l2_fill_pixfmt_mp(&ctx->out.pix,
-			    ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
+			    ctx->out.fmt->fourcc, def_width, def_height);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		kfree(ctx);
@@ -445,12 +294,13 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 
 static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
+	struct rockchip_rga *rga = video_drvdata(file);
 	struct rga_fmt *fmt;
 
-	if (f->index >= NUM_FORMATS)
+	if (f->index >= rga->hw->num_formats)
 		return -EINVAL;
 
-	fmt = &formats[f->index];
+	fmt = &rga->hw->formats[f->index];
 	f->pixelformat = fmt->fourcc;
 
 	return 0;
@@ -475,16 +325,18 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
+	struct rockchip_rga *rga = video_drvdata(file);
+	const struct rga_hw *hw = rga->hw;
 	struct rga_fmt *fmt;
 
-	fmt = rga_fmt_find(pix_fmt->pixelformat);
+	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	if (!fmt)
-		fmt = &formats[0];
+		fmt = &hw->formats[0];
 
 	pix_fmt->width = clamp(pix_fmt->width,
-			       (u32)MIN_WIDTH, (u32)MAX_WIDTH);
+			       hw->min_width, hw->max_width);
 	pix_fmt->height = clamp(pix_fmt->height,
-				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
+				hw->min_height, hw->max_height);
 
 	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
 	pix_fmt->field = V4L2_FIELD_NONE;
@@ -519,7 +371,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->size = 0;
 	for (i = 0; i < pix_fmt->num_planes; i++)
 		frm->size += pix_fmt->plane_fmt[i].sizeimage;
-	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
+	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
 	/* Reset crop settings */
@@ -639,7 +491,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 
 	if (s->r.left + s->r.width > f->pix.width ||
 	    s->r.top + s->r.height > f->pix.height ||
-	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
+	    s->r.width < rga->hw->min_width || s->r.height < rga->hw->min_height) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
 		return -EINVAL;
 	}
@@ -748,6 +600,10 @@ static int rga_probe(struct platform_device *pdev)
 	if (!rga)
 		return -ENOMEM;
 
+	rga->hw = of_device_get_match_data(&pdev->dev);
+	if (!rga->hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
 	rga->dev = &pdev->dev;
 	spin_lock_init(&rga->ctrl_lock);
 	mutex_init(&rga->mutex);
@@ -811,8 +667,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rel_m2m;
 
-	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
-	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+	rga->hw->get_version(rga);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
@@ -820,7 +675,7 @@ static int rga_probe(struct platform_device *pdev)
 	pm_runtime_put(rga->dev);
 
 	/* Create CMD buffer */
-	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
+	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
 					   &rga->cmdbuf_phy, GFP_KERNEL,
 					   DMA_ATTR_WRITE_COMBINE);
 	if (!rga->cmdbuf_virt) {
@@ -828,9 +683,6 @@ static int rga_probe(struct platform_device *pdev)
 		goto rel_m2m;
 	}
 
-	def_frame.stride = (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * DEFAULT_HEIGHT;
-
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
@@ -843,7 +695,7 @@ static int rga_probe(struct platform_device *pdev)
 	return 0;
 
 free_dma:
-	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
 		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_m2m:
 	v4l2_m2m_release(rga->m2m_dev);
@@ -861,7 +713,7 @@ static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
-	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
 		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
@@ -897,9 +749,11 @@ static const struct dev_pm_ops rga_pm = {
 static const struct of_device_id rockchip_rga_match[] = {
 	{
 		.compatible = "rockchip,rk3288-rga",
+		.data = &rga2_hw,
 	},
 	{
 		.compatible = "rockchip,rk3399-rga",
+		.data = &rga2_hw,
 	},
 	{},
 };
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 7ec1fcc03ed32..98635ddd50d7c 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -14,6 +14,9 @@
 
 #define RGA_NAME "rockchip-rga"
 
+#define DEFAULT_WIDTH 100
+#define DEFAULT_HEIGHT 100
+
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
@@ -69,6 +72,8 @@ static inline struct rga_ctx *file_to_rga_ctx(struct file *filp)
 	return container_of(file_to_v4l2_fh(filp), struct rga_ctx, fh);
 }
 
+struct rga_hw;
+
 struct rockchip_rga {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_m2m_dev *m2m_dev;
@@ -88,6 +93,8 @@ struct rockchip_rga {
 	struct rga_ctx *curr;
 	dma_addr_t cmdbuf_phy;
 	void *cmdbuf_virt;
+
+	const struct rga_hw *hw;
 };
 
 struct rga_addr_offset {
@@ -138,7 +145,19 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
-void rga_hw_start(struct rockchip_rga *rga,
-		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
+struct rga_hw {
+	struct rga_fmt *formats;
+	u32 num_formats;
+	size_t cmdbuf_size;
+	u32 min_width, min_height;
+	u32 max_width, max_height;
+
+	void (*start)(struct rockchip_rga *rga,
+		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
+	bool (*handle_irq)(struct rockchip_rga *rga);
+	void (*get_version)(struct rockchip_rga *rga);
+};
+
+extern const struct rga_hw rga2_hw;
 
 #endif

-- 
2.52.0


