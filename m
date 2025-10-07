Return-Path: <linux-media+bounces-43814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACABC0A96
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F19FF34DD1C
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C092DF15E;
	Tue,  7 Oct 2025 08:33:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F932DE6F9
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825997; cv=none; b=Ubjkp+QrzKncPmtwjmgqRzKuWwK1+lPTk7ugSK6rS32k72KjaEVS7t/EYQb4283IEgfGVTMB8y8lK1Y3RinKnupBGTol8WTvEDuoB1+Kus/N+AdirOfvDPHFQRK6NlzbF9frR+qLKGhVsnnpXF3tsCNJPq/SS/9Q8befqEQjWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825997; c=relaxed/simple;
	bh=uvBMgTCFe4PduWSyenflQ21dSqz1Y+X/m+6gHFwcchY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDUZ6QXA4S5oSVCAClPHH6xiRNycp/QfG/+mfFd3Bb/dFtsGK0vGKB8XjEcGCiKRisnUZb95d13LEWj3UFXqseHuaZoliS37qCoI8r/dCQc9PNkd43R9LSqW/JARN7u5LYuu3uKxGAIglSbac4Nks/XmZmxvPPJvSWj+ZxYZm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637v-0002Hb-8G; Tue, 07 Oct 2025 10:32:55 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:02 +0200
Subject: [PATCH 09/16] media: rockchip: rga: remove stride from rga_frame
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-9-36ad85570402@pengutronix.de>
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

Remove the stride variable from rga_frame. Despite the comment it
didn't involve any calculation and is just a copy of the
plane_fmt[0].bytesperline value. Therefore avoid this struct member
and use the bytesperline value directly in the places where it is
required.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 20 ++++++++++++--------
 drivers/media/platform/rockchip/rga/rga.c    |  5 +----
 drivers/media/platform/rockchip/rga/rga.h    |  3 ---
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 04d72ecce7cdd47df8457b97c5ec4cff9cd7430b..66b23c4a4cf1488ce42a7ab1901daaaa55b28fe0 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -43,7 +43,7 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 	struct rga_corners_addrs corner_addrs;
 	struct rga_addrs *lt, *lb, *rt, *rb;
 	unsigned int x_div = 0,
-		     y_div = 0, uv_stride = 0, pixel_width = 0;
+		     y_div = 0, y_stride = 0, uv_stride = 0, pixel_width = 0;
 
 	lt = &corner_addrs.left_top;
 	lb = &corner_addrs.left_bottom;
@@ -52,14 +52,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 
 	x_div = frm->fmt->x_div;
 	y_div = frm->fmt->y_div;
-	uv_stride = frm->stride / x_div;
-	pixel_width = frm->stride / frm->width;
+	y_stride = frm->pix.plane_fmt[0].bytesperline;
+	uv_stride = y_stride / x_div;
+	pixel_width = y_stride / frm->width;
 
-	lt->y_addr = addrs->y_addr + y * frm->stride + x * pixel_width;
+	lt->y_addr = addrs->y_addr + y * y_stride + x * pixel_width;
 	lt->u_addr = addrs->u_addr + (y / y_div) * uv_stride + x / x_div;
 	lt->v_addr = addrs->v_addr + (y / y_div) * uv_stride + x / x_div;
 
-	lb->y_addr = lt->y_addr + (h - 1) * frm->stride;
+	lb->y_addr = lt->y_addr + (h - 1) * y_stride;
 	lb->u_addr = lt->u_addr + (h / y_div - 1) * uv_stride;
 	lb->v_addr = lt->v_addr + (h / y_div - 1) * uv_stride;
 
@@ -163,6 +164,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_src_act_info src_act_info;
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
+	u32 in_stride, out_stride;
 
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
@@ -285,13 +287,15 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	 * Calculate the framebuffer virtual strides and active size,
 	 * note that the step of vir_stride / vir_width is 4 byte words
 	 */
-	src_vir_info.data.vir_stride = ctx->in.stride >> 2;
-	src_vir_info.data.vir_width = ctx->in.stride >> 2;
+	in_stride = ctx->in.pix.plane_fmt[0].bytesperline;
+	src_vir_info.data.vir_stride = in_stride >> 2;
+	src_vir_info.data.vir_width = in_stride >> 2;
 
 	src_act_info.data.act_height = src_h - 1;
 	src_act_info.data.act_width = src_w - 1;
 
-	dst_vir_info.data.vir_stride = ctx->out.stride >> 2;
+	out_stride = ctx->out.pix.plane_fmt[0].bytesperline;
+	dst_vir_info.data.vir_stride = out_stride >> 2;
 	dst_act_info.data.act_height = dst_h - 1;
 	dst_act_info.data.act_width = dst_w - 1;
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index c5f25869d0cd08a794330954ec414f0428b647d8..6e1a4a6dc6309a6d6d9a3aac0fe982e7200c96de 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -221,8 +221,6 @@ static int rga_open(struct file *file)
 		.fmt = &rga->hw->formats[0],
 	};
 
-	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
@@ -407,7 +405,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->width = pix_fmt->width;
 	frm->height = pix_fmt->height;
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
-	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 	frm->colorspace = pix_fmt->colorspace;
 
 	/* Reset crop settings */
@@ -422,7 +419,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
 		  &frm->fmt->fourcc, frm->width, frm->height,
-		  frm->stride);
+		  pix_fmt->plane_fmt[0].bytesperline);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 5aedda2f187e4bfef42c8755c4fc4b1ee5453e8e..d5ec873adc280bc2238b227d2f0c649ca345b836 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -39,9 +39,6 @@ struct rga_frame {
 	/* Image format */
 	struct rga_fmt *fmt;
 	struct v4l2_pix_format_mplane pix;
-
-	/* Variables that can calculated once and reused */
-	u32 stride;
 };
 
 struct rga_dma_desc {

-- 
2.51.0


