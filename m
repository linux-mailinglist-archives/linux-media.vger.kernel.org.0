Return-Path: <linux-media+bounces-43821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD2BC0AE4
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 692B44F4777
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A9E2E0B5A;
	Tue,  7 Oct 2025 08:33:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1303D2E093F
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826015; cv=none; b=tElkM7D7pfqF7/ni1MWzOjnpJmr9D1CijMKZJAwE/Y23ttfdJPYbHo2jXzsSu6WQKdnAjYWPh3odzLLqqZFl3KIWapazagwD3PY67wE4bAxwjBl26EW5B965plrAARIPm7hkkgVbpeD2fUjjZDOcb56EOQNL/7F3Z0AP3jmyvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826015; c=relaxed/simple;
	bh=5M5LW6dv+wRQCks/SvizwnLcQgLbqI0XgSF6No+wUPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aR8uups4LmapAU7MSptetq5QBRHq/HGzSrRPSIhJbjJcX6q+Xa8qr2tuq+LKfgu63Vduo3itIpFwoiSbJxRmwFvjfsnaU0myBkf15itotlts+ZhiD/sgiMZQiIAuRtPG3T0eSIkPluXuPnf/9jM3sgucBp50lwiaDYDDVgi0EMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v6380-0002Hb-Op; Tue, 07 Oct 2025 10:33:00 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:09 +0200
Subject: [PATCH 16/16] media: rockchip: rga: add rga3 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
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
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Add support for the RGA3 unit contained in the RK3588.

Only a basic feature set consisting of scaling and color conversion is
implemented. Advanced features like rotation and cropping will just be
ignored. Also the BT601F color space conversion is currently hard coded.

The register address defines were copied from the
vendor Rockchip kernel sources and slightly adjusted to not start at 0
again for the cmd registers.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/Makefile  |   2 +-
 drivers/media/platform/rockchip/rga/rga.c     |   4 +
 drivers/media/platform/rockchip/rga/rga.h     |   2 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c | 490 ++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
 5 files changed, 682 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/Makefile b/drivers/media/platform/rockchip/rga/Makefile
index 1bbecdc3d8df2ce286652f5544c4a3b52a6d28cf..7326a548f3dc7618403e98974b8c60d45f556fef 100644
--- a/drivers/media/platform/rockchip/rga/Makefile
+++ b/drivers/media/platform/rockchip/rga/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-rockchip-rga-objs := rga.o rga-hw.o rga-buf.o
+rockchip-rga-objs := rga.o rga-hw.o rga3-hw.o rga-buf.o
 
 obj-$(CONFIG_VIDEO_ROCKCHIP_RGA) += rockchip-rga.o
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3b5d2eb8e109f44af76dd2240a239b1fa8a78cee..9d15104fcc1a45553af33bfd637bba0a86329c17 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -805,6 +805,10 @@ static const struct of_device_id rockchip_rga_match[] = {
 		.compatible = "rockchip,rk3399-rga",
 		.data = &rga2_hw,
 	},
+	{
+		.compatible = "rockchip,rk3588-rga3",
+		.data = &rga3_hw,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index dc4bb85707d12f5378c4891098cd7ea4a4d75e2d..350a4e07cb2ee237fc3676d594e1e7298a028afb 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -169,6 +169,6 @@ static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)
 	return rga->hw->has_internal_iommu;
 }
 
-extern const struct rga_hw rga2_hw;
+extern const struct rga_hw rga2_hw, rga3_hw;
 
 #endif
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
new file mode 100644
index 0000000000000000000000000000000000000000..6e4cd2f96cf866880316c75924f7a4c339851448
--- /dev/null
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) Pengutronix e.K.
+ * Author: Sven Püschel <s.pueschel@pengutronix.de>
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/printk.h>
+
+#include <media/v4l2-common.h>
+
+#include "rga3-hw.h"
+#include "rga.h"
+
+static unsigned int rga3_get_scaling(unsigned int src, unsigned int dst)
+{
+	if (dst > src) {
+		if (((src - 1) << 16) % (dst - 1) == 0)
+			return ((src - 1) << 16) / (dst - 1) - 1;
+		else
+			return ((src - 1) << 16) / (dst - 1);
+	} else {
+		return ((dst - 1) << 16) / (src - 1) + 1;
+	}
+}
+
+static bool rga3_has_alpha(const struct rga3_fmt *fmt)
+{
+	return fmt->hw_format >= RGA3_COLOR_FMT_FIRST_HAS_ALPHA &&
+	       fmt->fourcc != V4L2_PIX_FMT_BGRX32 &&
+	       fmt->fourcc != V4L2_PIX_FMT_XBGR32 &&
+	       fmt->fourcc != V4L2_PIX_FMT_RGBX32 &&
+	       fmt->fourcc != V4L2_PIX_FMT_XRGB32;
+}
+
+static bool rga3_can_capture(const struct rga3_fmt *fmt)
+{
+	return fmt->hw_format <= RGA3_COLOR_FMT_LAST_OUTPUT;
+}
+
+static void rga3_cmd_set_trans_info(struct rga_ctx *ctx)
+{
+	struct rockchip_rga *rga = ctx->rga;
+	u32 *cmd = rga->cmdbuf_virt;
+	unsigned int src_h, src_w, dst_h, dst_w;
+	unsigned int reg;
+	u16 hor_scl_fac, ver_scl_fac;
+
+	src_h = ctx->in.crop.height;
+	src_w = ctx->in.crop.width;
+	dst_h = ctx->out.crop.height;
+	dst_w = ctx->out.crop.width;
+
+	reg = RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] |= FIELD_PREP(RGA3_WIN_SCALE_HOR_UP, dst_w > src_w)
+		      |  FIELD_PREP(RGA3_WIN_SCALE_HOR_BYPASS, dst_w == src_w)
+		      |  FIELD_PREP(RGA3_WIN_SCALE_VER_UP, dst_h > src_h)
+		      |  FIELD_PREP(RGA3_WIN_SCALE_VER_BYPASS, dst_h == src_h);
+
+	/* stride needs to be in words */
+	reg = RGA3_WIN0_VIR_STRIDE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = ctx->in.pix.plane_fmt[0].bytesperline >> 2;
+	reg = RGA3_WIN0_UV_VIR_STRIDE - RGA3_FIRST_CMD_REG;
+	if (ctx->in.pix.num_planes >= 2)
+		cmd[reg >> 2] = ctx->in.pix.plane_fmt[1].bytesperline >> 2;
+	else
+		cmd[reg >> 2] = ctx->in.pix.plane_fmt[0].bytesperline >> 2;
+	reg = RGA3_WR_VIR_STRIDE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = ctx->out.pix.plane_fmt[0].bytesperline >> 2;
+	reg = RGA3_WR_PL_VIR_STRIDE - RGA3_FIRST_CMD_REG;
+	if (ctx->out.pix.num_planes >= 2)
+		cmd[reg >> 2] = ctx->out.pix.plane_fmt[1].bytesperline >> 2;
+	else
+		cmd[reg >> 2] = ctx->out.pix.plane_fmt[0].bytesperline >> 2;
+
+	reg = RGA3_WIN0_ACT_SIZE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = FIELD_PREP(RGA3_WIDTH, src_w)
+		      | FIELD_PREP(RGA3_HEIGHT, src_h);
+	reg = RGA3_WIN0_SRC_SIZE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = FIELD_PREP(RGA3_WIDTH, src_w)
+		      | FIELD_PREP(RGA3_HEIGHT, src_h);
+
+	reg = RGA3_WIN0_DST_SIZE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = FIELD_PREP(RGA3_WIDTH, dst_w)
+		      | FIELD_PREP(RGA3_HEIGHT, dst_h);
+
+	hor_scl_fac = rga3_get_scaling(src_w, dst_w);
+	ver_scl_fac = rga3_get_scaling(src_h, dst_h);
+	reg = RGA3_WIN0_SCL_FAC - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = FIELD_PREP(RGA3_SCALE_HOR_FAC, hor_scl_fac)
+		      | FIELD_PREP(RGA3_SCALE_VER_FAC, ver_scl_fac);
+
+	if (rga3_has_alpha(ctx->in.fmt)) {
+		/* copy alpha from input */
+		reg = RGA3_OVLP_TOP_ALPHA - RGA3_FIRST_CMD_REG;
+		cmd[reg >> 2] = FIELD_PREP(RGA3_ALPHA_SELECT_MODE, 1)
+			      | FIELD_PREP(RGA3_ALPHA_BLEND_MODE, 1);
+		reg = RGA3_OVLP_BOT_ALPHA - RGA3_FIRST_CMD_REG;
+		cmd[reg >> 2] = FIELD_PREP(RGA3_ALPHA_SELECT_MODE, 1)
+			      | FIELD_PREP(RGA3_ALPHA_BLEND_MODE, 1);
+	} else {
+		/* just use a 255 alpha value */
+		reg = RGA3_OVLP_TOP_CTRL - RGA3_FIRST_CMD_REG;
+		cmd[reg >> 2] = FIELD_PREP(RGA3_OVLP_GLOBAL_ALPHA, 0xff)
+			      | FIELD_PREP(RGA3_OVLP_COLOR_MODE, 1);
+		reg = RGA3_OVLP_BOT_CTRL - RGA3_FIRST_CMD_REG;
+		cmd[reg >> 2] = FIELD_PREP(RGA3_OVLP_GLOBAL_ALPHA, 0xff)
+			      | FIELD_PREP(RGA3_OVLP_COLOR_MODE, 1);
+	}
+}
+
+static void rga3_cmd_set_win0_addr(struct rga_ctx *ctx,
+				   const struct rga_addrs *addrs)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	unsigned int reg;
+
+	reg = RGA3_WIN0_Y_BASE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = addrs->y_addr;
+	reg = RGA3_WIN0_U_BASE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = addrs->u_addr;
+}
+
+static void rga3_cmd_set_wr_addr(struct rga_ctx *ctx,
+				 const struct rga_addrs *addrs)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	unsigned int reg;
+
+	reg = RGA3_WR_Y_BASE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = addrs->y_addr;
+	reg = RGA3_WR_U_BASE - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] = addrs->u_addr;
+}
+
+static void rga3_cmd_set_win0_format(struct rga_ctx *ctx)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	const struct rga3_fmt *in = ctx->in.fmt;
+	const struct rga3_fmt *out = ctx->out.fmt;
+	const struct v4l2_format_info *in_fmt, *out_fmt;
+	unsigned int src_h, src_w, dst_h, dst_w;
+	bool r2y, y2r;
+	u8 rd_format;
+	unsigned int reg;
+
+	src_h = ctx->in.crop.height;
+	src_w = ctx->in.crop.width;
+	dst_h = ctx->out.crop.height;
+	dst_w = ctx->out.crop.width;
+
+	in_fmt = v4l2_format_info(in->fourcc);
+	out_fmt = v4l2_format_info(out->fourcc);
+	r2y = v4l2_is_format_rgb(in_fmt) && v4l2_is_format_yuv(out_fmt);
+	y2r = v4l2_is_format_yuv(in_fmt) && v4l2_is_format_rgb(out_fmt);
+
+	if (in->semi_planar)
+		rd_format = RGA3_RDWR_FORMAT_SEMI_PLANAR;
+	else
+		rd_format = RGA3_RDWR_FORMAT_INTERLEAVED;
+
+	reg = RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] |= FIELD_PREP(RGA3_WIN_PIC_FORMAT, in->hw_format)
+		      |  FIELD_PREP(RGA3_WIN_YC_SWAP, in->yc_swap)
+		      |  FIELD_PREP(RGA3_WIN_RBUV_SWAP, in->rbuv_swap)
+		      |  FIELD_PREP(RGA3_WIN_RD_FORMAT, rd_format)
+		      |  FIELD_PREP(RGA3_WIN_R2Y, r2y)
+		      |  FIELD_PREP(RGA3_WIN_Y2R, y2r)
+		      |  FIELD_PREP(RGA3_WIN_CSC_MODE, RGA3_WIN_CSC_MODE_BT601_F);
+}
+
+static void rga3_cmd_enable_win0(struct rga_ctx *ctx)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	unsigned int reg;
+
+	reg = RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] |= FIELD_PREP(RGA3_WIN_ENABLE, 1);
+}
+
+static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	const struct rga3_fmt *out = ctx->out.fmt;
+	u8 wr_format;
+	unsigned int reg;
+
+	if (out->semi_planar)
+		wr_format = RGA3_RDWR_FORMAT_SEMI_PLANAR;
+	else
+		wr_format = RGA3_RDWR_FORMAT_INTERLEAVED;
+
+	reg = RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] |= FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
+		      |  FIELD_PREP(RGA3_WR_YC_SWAP, out->yc_swap)
+		      |  FIELD_PREP(RGA3_WR_RBUV_SWAP, out->rbuv_swap)
+		      |  FIELD_PREP(RGA3_WR_FORMAT, wr_format);
+}
+
+static void rga3_cmd_disable_wr_limitation(struct rga_ctx *ctx)
+{
+	u32 *cmd = ctx->rga->cmdbuf_virt;
+	unsigned int reg;
+
+	/* Use the max value to avoid limiting the write speed */
+	reg = RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
+	cmd[reg >> 2] |= FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX, 63);
+}
+
+static void rga3_cmd_set(struct rga_ctx *ctx,
+			 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
+{
+	struct rockchip_rga *rga = ctx->rga;
+
+	memset(rga->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE * 4);
+
+	rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
+	rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
+
+	rga3_cmd_set_win0_format(ctx);
+	rga3_cmd_enable_win0(ctx);
+	rga3_cmd_set_trans_info(ctx);
+	rga3_cmd_set_wr_format(ctx);
+	rga3_cmd_disable_wr_limitation(ctx);
+
+	rga_write(rga, RGA3_CMD_ADDR, rga->cmdbuf_phy);
+
+	/* sync CMD buf for RGA */
+	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
+				   PAGE_SIZE, DMA_BIDIRECTIONAL);
+}
+
+static void rga3_hw_start(struct rockchip_rga *rga,
+			  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
+{
+	struct rga_ctx *ctx = rga->curr;
+
+	rga3_cmd_set(ctx, src, dst);
+
+	/* set to master mode and start the conversion */
+	rga_write(rga, RGA3_SYS_CTRL,
+		  FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
+	rga_write(rga, RGA3_INT_EN,
+		  FIELD_PREP(RGA3_INT_FRM_DONE, 1) |
+		  FIELD_PREP(RGA3_INT_DMA_READ_BUS_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_FBC_DEC_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_HOR_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_VER_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WR_VER_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WR_HOR_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WR_BUS_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_IN_FIFO_WR_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_IN_FIFO_RD_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_HOR_FIFO_WR_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_HOR_FIFO_RD_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_VER_FIFO_WR_ERR, 1) |
+		  FIELD_PREP(RGA3_INT_WIN0_VER_FIFO_RD_ERR, 1));
+	rga_write(rga, RGA3_CMD_CTRL,
+		  FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
+}
+
+static void rga3_soft_reset(struct rockchip_rga *rga)
+{
+	u32 i;
+
+	rga_write(rga, RGA3_SYS_CTRL,
+		  FIELD_PREP(RGA3_CCLK_SRESET, 1) |
+		  FIELD_PREP(RGA3_ACLK_SRESET, 1));
+
+	for (i = 0; i < RGA3_RESET_TIMEOUT; i++) {
+		if (FIELD_GET(RGA3_RO_SRST_DONE, rga_read(rga, RGA3_RO_SRST)))
+			break;
+
+		udelay(1);
+	}
+
+	if (i == RGA3_RESET_TIMEOUT)
+		pr_err("Timeout of %d usec reached while waiting for an rga3 soft reset\n", i);
+
+	rga_write(rga, RGA3_SYS_CTRL, 0);
+	rga_iommu_restore(rga);
+}
+
+static enum rga_irq_result rga3_handle_irq(struct rockchip_rga *rga)
+{
+	u32 intr;
+
+	intr = rga_read(rga, RGA3_INT_RAW);
+	/* clear all interrupts */
+	rga_write(rga, RGA3_INT_CLR, intr);
+
+	if (FIELD_GET(RGA3_INT_FRM_DONE, intr))
+		return RGA_IRQ_DONE;
+	if (FIELD_GET(RGA3_INT_DMA_READ_BUS_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_FBC_DEC_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_HOR_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_VER_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WR_VER_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WR_HOR_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WR_BUS_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_IN_FIFO_WR_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_IN_FIFO_RD_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_HOR_FIFO_WR_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_HOR_FIFO_RD_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_VER_FIFO_WR_ERR, intr) ||
+	    FIELD_GET(RGA3_INT_WIN0_VER_FIFO_RD_ERR, intr)) {
+		rga3_soft_reset(rga);
+		return RGA_IRQ_ERROR;
+	}
+
+	return RGA_IRQ_IGNORE;
+}
+
+static void rga3_get_version(struct rockchip_rga *rga)
+{
+	u32 version = rga_read(rga, RGA3_VERSION_NUM);
+
+	rga->version.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
+	rga->version.minor = FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
+}
+
+static struct rga3_fmt rga3_formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.hw_format = RGA3_COLOR_FMT_BGR888,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.hw_format = RGA3_COLOR_FMT_BGR888,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ABGR32,
+		.hw_format = RGA3_COLOR_FMT_BGRA8888,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGBA32,
+		.hw_format = RGA3_COLOR_FMT_BGRA8888,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_XBGR32,
+		.hw_format = RGA3_COLOR_FMT_BGRA8888,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGBX32,
+		.hw_format = RGA3_COLOR_FMT_BGRA8888,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.hw_format = RGA3_COLOR_FMT_BGR565,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.hw_format = RGA3_COLOR_FMT_YUV420,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.hw_format = RGA3_COLOR_FMT_YUV420,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.hw_format = RGA3_COLOR_FMT_YUV420,
+		.rbuv_swap = 1,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.hw_format = RGA3_COLOR_FMT_YUV420,
+		.rbuv_swap = 1,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.rbuv_swap = 1,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.rbuv_swap = 1,
+		.semi_planar = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.yc_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.yc_swap = 1,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.hw_format = RGA3_COLOR_FMT_YUV422,
+		.rbuv_swap = 1,
+	},
+	/* Input only formats last to keep rga3_enum_format simple */
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB32,
+		.hw_format = RGA3_COLOR_FMT_ABGR8888,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGRA32,
+		.hw_format = RGA3_COLOR_FMT_ABGR8888,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_XRGB32,
+		.hw_format = RGA3_COLOR_FMT_ABGR8888,
+		.rbuv_swap = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGRX32,
+		.hw_format = RGA3_COLOR_FMT_ABGR8888,
+	},
+};
+
+static int rga3_enum_format(struct v4l2_fmtdesc *f)
+{
+	struct rga3_fmt *fmt;
+
+	if (f->index >= ARRAY_SIZE(rga3_formats))
+		return -EINVAL;
+
+	fmt = &rga3_formats[f->index];
+	if (V4L2_TYPE_IS_CAPTURE(f->type) && !rga3_can_capture(fmt))
+		return -EINVAL;
+
+	f->pixelformat = fmt->fourcc;
+	return 0;
+}
+
+static void *rga3_try_format(u32 *fourcc, bool is_output)
+{
+	unsigned int i;
+
+	if (!fourcc)
+		return &rga3_formats[0];
+
+	for (i = 0; i < ARRAY_SIZE(rga3_formats); i++) {
+		if (!is_output && !rga3_can_capture(&rga3_formats[i]))
+			continue;
+
+		if (rga3_formats[i].fourcc == *fourcc)
+			return &rga3_formats[i];
+	}
+
+	*fourcc = rga3_formats[0].fourcc;
+	return &rga3_formats[0];
+}
+
+const struct rga_hw rga3_hw = {
+	.card_type = "rga3",
+	.has_internal_iommu = false,
+	.cmdbuf_size = RGA3_CMDBUF_SIZE,
+	.min_width = RGA3_MIN_WIDTH,
+	.min_height = RGA3_MIN_HEIGHT,
+	.max_width = RGA3_MAX_INPUT_WIDTH,
+	.max_height = RGA3_MAX_INPUT_HEIGHT,
+
+	.start = rga3_hw_start,
+	.handle_irq = rga3_handle_irq,
+	.get_version = rga3_get_version,
+	.enum_format = rga3_enum_format,
+	.try_format = rga3_try_format,
+};
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.h b/drivers/media/platform/rockchip/rga/rga3-hw.h
new file mode 100644
index 0000000000000000000000000000000000000000..3829469e310706c11ecc52f40d3d1eb43a61d9c2
--- /dev/null
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) Pengutronix e.K.
+ * Author: Sven Püschel <s.pueschel@pengutronix.de>
+ */
+#ifndef __RGA3_HW_H__
+#define __RGA3_HW_H__
+
+#include <linux/types.h>
+
+#define RGA3_CMDBUF_SIZE 0x2e
+
+#define RGA3_MIN_WIDTH 128
+#define RGA3_MIN_HEIGHT 128
+#define RGA3_MAX_INPUT_WIDTH (8192 - 16)
+#define RGA3_MAX_INPUT_HEIGHT (8192 - 16)
+#define RGA3_RESET_TIMEOUT 1000
+
+/* Registers address */
+/* sys reg */
+#define RGA3_SYS_CTRL				0x000
+#define RGA3_CMD_CTRL				0x004
+#define RGA3_CMD_ADDR				0x008
+#define RGA3_MI_GROUP_CTRL			0x00c
+#define RGA3_ARQOS_CTRL				0x010
+#define RGA3_VERSION_NUM			0x018
+#define RGA3_VERSION_TIM			0x01c
+#define RGA3_INT_EN				0x020
+#define RGA3_INT_RAW				0x024
+#define RGA3_INT_MSK				0x028
+#define RGA3_INT_CLR				0x02c
+#define RGA3_RO_SRST				0x030
+#define RGA3_STATUS0				0x034
+#define RGA3_SCAN_CNT				0x038
+#define RGA3_CMD_STATE				0x040
+
+/* cmd reg */
+#define RGA3_WIN0_RD_CTRL			0x100
+#define RGA3_FIRST_CMD_REG			RGA3_WIN0_RD_CTRL
+#define RGA3_WIN0_Y_BASE			0x110
+#define RGA3_WIN0_U_BASE			0x114
+#define RGA3_WIN0_V_BASE			0x118
+#define RGA3_WIN0_VIR_STRIDE			0x11c
+#define RGA3_WIN0_FBC_OFF			0x120
+#define RGA3_WIN0_SRC_SIZE			0x124
+#define RGA3_WIN0_ACT_OFF			0x128
+#define RGA3_WIN0_ACT_SIZE			0x12c
+#define RGA3_WIN0_DST_SIZE			0x130
+#define RGA3_WIN0_SCL_FAC			0x134
+#define RGA3_WIN0_UV_VIR_STRIDE			0x138
+#define RGA3_WIN1_RD_CTRL			0x140
+#define RGA3_WIN1_Y_BASE			0x150
+#define RGA3_WIN1_U_BASE			0x154
+#define RGA3_WIN1_V_BASE			0x158
+#define RGA3_WIN1_VIR_STRIDE			0x15c
+#define RGA3_WIN1_FBC_OFF			0x160
+#define RGA3_WIN1_SRC_SIZE			0x164
+#define RGA3_WIN1_ACT_OFF			0x168
+#define RGA3_WIN1_ACT_SIZE			0x16c
+#define RGA3_WIN1_DST_SIZE			0x170
+#define RGA3_WIN1_SCL_FAC			0x174
+#define RGA3_WIN1_UV_VIR_STRIDE			0x178
+#define RGA3_OVLP_CTRL				0x180
+#define RGA3_OVLP_OFF				0x184
+#define RGA3_OVLP_TOP_KEY_MIN			0x188
+#define RGA3_OVLP_TOP_KEY_MAX			0x18c
+#define RGA3_OVLP_TOP_CTRL			0x190
+#define RGA3_OVLP_BOT_CTRL			0x194
+#define RGA3_OVLP_TOP_ALPHA			0x198
+#define RGA3_OVLP_BOT_ALPHA			0x19c
+#define RGA3_WR_CTRL				0x1a0
+#define RGA3_WR_FBCE_CTRL			0x1a4
+#define RGA3_WR_VIR_STRIDE			0x1a8
+#define RGA3_WR_PL_VIR_STRIDE			0x1ac
+#define RGA3_WR_Y_BASE				0x1b0
+#define RGA3_WR_U_BASE				0x1b4
+#define RGA3_WR_V_BASE				0x1b8
+
+/* Registers value */
+#define RGA3_COLOR_FMT_YUV420		0x0
+#define RGA3_COLOR_FMT_YUV422		0x1
+#define RGA3_COLOR_FMT_YUV420_10B	0x2
+#define RGA3_COLOR_FMT_YUV422_10B	0x3
+/*
+ * Use memory ordering names
+ * instead of the datasheet naming RGB formats in big endian order
+ */
+#define RGA3_COLOR_FMT_BGR565		0x4
+#define RGA3_COLOR_FMT_BGR888		0x5
+#define RGA3_COLOR_FMT_FIRST_HAS_ALPHA	RGA3_COLOR_FMT_BGRA8888
+#define RGA3_COLOR_FMT_BGRA8888		0x6
+#define RGA3_COLOR_FMT_LAST_OUTPUT	RGA3_COLOR_FMT_BGRA8888
+/* the following are only supported as inputs */
+#define RGA3_COLOR_FMT_ABGR8888		0x7
+/*
+ * the following seem to be unnecessary,
+ * as they can be achieved with RB swaps
+ */
+#define RGA3_COLOR_FMT_RGBA8888		0x8
+#define RGA3_COLOR_FMT_ARGB8888		0x9
+
+#define RGA3_RDWR_FORMAT_SEMI_PLANAR	0x1
+#define RGA3_RDWR_FORMAT_INTERLEAVED	0x2
+
+#define RGA3_CMD_MODE_MASTER 0x1
+
+#define RGA3_WIN_CSC_MODE_BT601_F 0x2
+
+/* RGA masks */
+/* SYS_CTRL */
+#define RGA3_CCLK_SRESET BIT(4)
+#define RGA3_ACLK_SRESET BIT(3)
+#define RGA3_CMD_MODE BIT(1)
+
+/* CMD_CTRL */
+#define RGA3_CMD_LINE_START_PULSE BIT(0)
+
+/* VERSION_NUM */
+#define RGA3_VERSION_NUM_MAJOR GENMASK(31, 28)
+#define RGA3_VERSION_NUM_MINOR GENMASK(27, 20)
+
+/* INT_* */
+#define RGA3_INT_FRM_DONE BIT(0)
+#define RGA3_INT_DMA_READ_BUS_ERR BIT(2)
+#define RGA3_INT_WIN0_FBC_DEC_ERR BIT(5)
+#define RGA3_INT_WIN0_HOR_ERR BIT(6)
+#define RGA3_INT_WIN0_VER_ERR BIT(7)
+#define RGA3_INT_WR_VER_ERR BIT(13)
+#define RGA3_INT_WR_HOR_ERR BIT(14)
+#define RGA3_INT_WR_BUS_ERR BIT(15)
+#define RGA3_INT_WIN0_IN_FIFO_WR_ERR BIT(16)
+#define RGA3_INT_WIN0_IN_FIFO_RD_ERR BIT(17)
+#define RGA3_INT_WIN0_HOR_FIFO_WR_ERR BIT(18)
+#define RGA3_INT_WIN0_HOR_FIFO_RD_ERR BIT(19)
+#define RGA3_INT_WIN0_VER_FIFO_WR_ERR BIT(20)
+#define RGA3_INT_WIN0_VER_FIFO_RD_ERR BIT(21)
+
+/* RO_SRST */
+#define RGA3_RO_SRST_DONE GENMASK(5, 0)
+
+/* *_SIZE */
+#define RGA3_HEIGHT GENMASK(28, 16)
+#define RGA3_WIDTH GENMASK(12, 0)
+
+/* SCL_FAC */
+#define RGA3_SCALE_VER_FAC GENMASK(31, 16)
+#define RGA3_SCALE_HOR_FAC GENMASK(15, 0)
+
+/* WINx_CTRL */
+#define RGA3_WIN_CSC_MODE GENMASK(27, 26)
+#define RGA3_WIN_R2Y BIT(25)
+#define RGA3_WIN_Y2R BIT(24)
+#define RGA3_WIN_SCALE_VER_UP BIT(23)
+#define RGA3_WIN_SCALE_VER_BYPASS BIT(22)
+#define RGA3_WIN_SCALE_HOR_UP BIT(21)
+#define RGA3_WIN_SCALE_HOR_BYPASS BIT(20)
+#define RGA3_WIN_YC_SWAP BIT(13)
+#define RGA3_WIN_RBUV_SWAP BIT(12)
+#define RGA3_WIN_RD_FORMAT GENMASK(9, 8)
+#define RGA3_WIN_PIC_FORMAT GENMASK(7, 4)
+#define RGA3_WIN_ENABLE BIT(0)
+
+/* COLOR_CTRL */
+#define RGA3_OVLP_GLOBAL_ALPHA GENMASK(23, 16)
+#define RGA3_OVLP_COLOR_MODE BIT(0)
+
+/* ALPHA_CTRL */
+#define RGA3_ALPHA_SELECT_MODE BIT(4)
+#define RGA3_ALPHA_BLEND_MODE GENMASK(3, 2)
+
+/* WR_CTRL */
+#define RGA3_WR_YC_SWAP BIT(20)
+#define RGA3_WR_SW_OUTSTANDING_MAX GENMASK(18, 13)
+#define RGA3_WR_RBUV_SWAP BIT(12)
+#define RGA3_WR_FORMAT GENMASK(9, 8)
+#define RGA3_WR_PIC_FORMAT GENMASK(7, 4)
+
+struct rga3_fmt {
+	u32 fourcc;
+	u8 hw_format;
+	bool rbuv_swap;
+	bool yc_swap;
+	bool semi_planar;
+};
+
+#endif

-- 
2.51.0


