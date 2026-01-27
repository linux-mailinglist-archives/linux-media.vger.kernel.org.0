Return-Path: <linux-media+bounces-51671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MNbOF3PeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:44:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E195ED2
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A45D302336A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5B35F8C1;
	Tue, 27 Jan 2026 14:40:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936A35EDCA
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524817; cv=none; b=j4uWm4LuZ4w3UlFqxJguJfQc0PpPOXGxkKvatXrxojsg9uc+a+igIvabbx8IOm/vdWallvkXNfbx6ncvJIyEuSPIyxAR9tePM+2wrmvfwxbtyJJ/1DuJ1nUjbrjtRdtt0pSkphv/Tjt1eg0A0qhJHNDBsUftXRY2U7T3KjwkeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524817; c=relaxed/simple;
	bh=JOwvDeJCyzrvK5jl/gxmF1CyRNmJLl778mr+and9tyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s60KWeJywCt+SSxbL8O7/ESOo16qTyJT78qoY+V1eISVGEOug+1DleBTYk/X1O53YGR5Ji17667zzHR/uPzvL3U2iw8bIyqNxtfGJJ3EF/aEGu+HhP9qME4gUOgHjET6rU+xrJ9rFeWZBHZNts1WWRvCKPIJTBHU6WevgQsh8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEi-0007YT-FO; Tue, 27 Jan 2026 15:40:08 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:16 +0100
Subject: [PATCH v3 07/27] media: rockchip: rga: use stride for offset
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-7-77b273067beb@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51671-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 065E195ED2
X-Rspamd-Action: no action

Use the stride instead of the width for the offset calculation. This
ensures that the bytesperline value doesn't need to match the width
value of the image.

Furthermore this patch removes the dependency on the uv_factor property
and instead reuses the v4l2_format_info to determine the correct
division factor.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
 drivers/media/platform/rockchip/rga/rga.c     | 16 ----------------
 drivers/media/platform/rockchip/rga/rga.h     |  1 -
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index bb575873f2b24..65fc0d5b4aa10 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -14,7 +14,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
@@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static int get_plane_offset(struct rga_frame *f, int plane)
+static int get_plane_offset(struct rga_frame *f,
+			    const struct v4l2_format_info *info,
+			    int plane)
 {
+	u32 stride = f->pix.plane_fmt[0].bytesperline;
+
 	if (plane == 0)
 		return 0;
 	if (plane == 1)
-		return f->width * f->height;
+		return stride * f->height;
 	if (plane == 2)
-		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
+		return stride * f->height +
+		       (stride * f->height / info->hdiv / info->vdiv);
 
 	return -EINVAL;
 }
@@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, i);
+		offsets[i] = get_plane_offset(f, info, i);
 
 	rbuf->offset.y_off = offsets[0];
 	rbuf->offset.u_off = offsets[1];
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 338c7796490bc..da4d5bec7a0a5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -190,7 +190,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -199,7 +198,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -208,7 +206,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -217,7 +214,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -226,7 +222,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -235,7 +230,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -244,7 +238,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -253,7 +246,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -262,7 +254,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -271,7 +262,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -280,7 +270,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -289,7 +278,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -298,7 +286,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -307,7 +294,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
@@ -316,7 +302,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 2,
 	},
@@ -325,7 +310,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 2db10acecb405..477cf5b62bbb2 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,7 +17,6 @@
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
-	u8 uv_factor;
 	u8 y_div;
 	u8 x_div;
 	u8 color_swap;

-- 
2.52.0


