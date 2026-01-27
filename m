Return-Path: <linux-media+bounces-51676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ1VKkfPeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:44:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750595EB5
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 031D43046366
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10031361676;
	Tue, 27 Jan 2026 14:40:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087CA35D5EE
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524829; cv=none; b=ndBB+bERmHRPJqCxe8lv2FRDXhkZ8D1+pDni27TJtnduBh7Jza9lw7fMobL1opiagXevEFWS0YQLUjCdlFniF/SO/pux25rKIj9pQPVoo3m4hJ2ke5EGXcUPUQtOWvRdFJrHehM8Av3Y66UrYb/bcKCH7ZtP6dGT2ZA41ggo0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524829; c=relaxed/simple;
	bh=BD49zYnjni/1LXL3mM8Ds27rZ141elFgjYeaJs61og0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mK/JpMUd9xRCCEicUD9TXjTBDQrWYjpv3YfLLHHooeqrspcOkcCeBqo35ClD7jTvL17J3yntpVhD5bKUNhyBi5y2nC+bCbM4NwiUjOJy2rWjbrJCBOk9PewaLzertHrg69tgdCUe0P5e9JYma/L8bL+WmM8QwmZzGaumhNr3qIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEt-0007YT-F1; Tue, 27 Jan 2026 15:40:19 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:21 +0100
Subject: [PATCH v3 12/27] media: rockchip: rga: calculate x_div/y_div using
 v4l2_format_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-12-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51676-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 8750595EB5
X-Rspamd-Action: no action

Calculate the x_div and y_div variables with the information from
v4l2_format_info instead of storing these in the rga_fmt struct.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 45 +++++++---------------------
 drivers/media/platform/rockchip/rga/rga.h    |  2 --
 2 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index c0218a71fee04..7405355c334ad 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -42,6 +42,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 {
 	struct rga_corners_addr_offset offsets;
 	struct rga_addr_offset *lt, *lb, *rt, *rb;
+	const struct v4l2_format_info *format_info;
 	unsigned int x_div = 0,
 		     y_div = 0, uv_stride = 0, pixel_width = 0;
 
@@ -50,8 +51,16 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	rt = &offsets.right_top;
 	rb = &offsets.right_bottom;
 
-	x_div = frm->fmt->x_div;
-	y_div = frm->fmt->y_div;
+	format_info = v4l2_format_info(frm->pix.pixelformat);
+	/* x_div is only used for the u/v planes.
+	 * When the format doesn't have these, use 1 to avoid a division by zero.
+	 */
+	if (format_info->bpp[1])
+		x_div = format_info->hdiv * format_info->bpp_div[1] /
+			format_info->bpp[1];
+	else
+		x_div = 1;
+	y_div = format_info->vdiv;
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->pix.width;
 
@@ -476,128 +485,96 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ABGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_XBGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_BGR24,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB444,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB555,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB565,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV61,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV420,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 2,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 2,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 2,
 	},
 };
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 640e510285341..27b3c9b4f220c 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -20,8 +20,6 @@
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
-	u8 y_div;
-	u8 x_div;
 	u8 color_swap;
 	u8 hw_format;
 };

-- 
2.52.0


