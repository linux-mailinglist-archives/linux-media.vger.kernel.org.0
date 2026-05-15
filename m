Return-Path: <linux-media+bounces-61753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCdcI5g9B2oCuwIAu9opvQ
	(envelope-from <linux-media+bounces-61753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:36:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44284552420
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B12E2300E2AA
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F364E3788;
	Fri, 15 May 2026 15:33:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879EB4DA559
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859201; cv=none; b=uc80H8rQxK2fZcoG9sOzxah+BRKmX492wPGdAp5zTaloLCpkWgSUq3se3UFaT8eGKLMldA+mseqIvqXMyOCWlQnbNsbhT6/fpnUDXe7aNsf3goee64N0ixdPnkgMT/K95fEIiooWFNTQ2MrpiEAlRhUVCfgKlFkSheCEWy8lLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859201; c=relaxed/simple;
	bh=/DTaYDsA+TMPhJGGyTvYk1BiuYuzXvhfHTuKv+ceg88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7vgKbaS7dOui9e0yQYS9988J4Pxy46iI6ed7iDqWwhuq7697/m0esfJnaTb5rBvB391iis3M6/IXOhREvwMWYvbxIjk2USlWXDG/V4umg4hJaUmHrJKFPm4MqGXBuMVt0ZidG2hs0H9x3PofnQkhmRzlhnGnjAaGAZD71GSrXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuXK-0005OF-7C; Fri, 15 May 2026 17:33:14 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:51 +0200
Subject: [PATCH v6 25/28] media: rockchip: rga: add feature flags
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-25-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 44284552420
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61753-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,pengutronix.de:email,pengutronix.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Action: no action

In preparation to the RGA3 addition add feature flags, which can limit
the exposed feature set of the video device, like rotating or selection
support. This is necessary as the RGA3 doesn't initially implement the
full feature set currently exposed by the driver.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Dropped selection feature, as the RGA3 also has basic support for the
  seleciton API. Flagged by Sashiko
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=28
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  3 +++
 drivers/media/platform/rockchip/rga/rga.c    | 20 ++++++++++++--------
 drivers/media/platform/rockchip/rga/rga.h    |  6 ++++++
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 616ea1bc11311..be1bc8ddbd03b 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -602,6 +602,9 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.max_scaling_factor = MAX_SCALING_FACTOR,
 	.stride_alignment = 4,
+	.features = RGA_FEATURE_FLIP
+		  | RGA_FEATURE_ROTATE
+		  | RGA_FEATURE_BG_COLOR,
 
 	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 1878b4e26360b..8d60e94da32d8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -177,17 +177,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_FLIP) {
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_HFLIP, 0, 1, 1, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+	if (rga->hw->features & RGA_FEATURE_ROTATE)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_ROTATE, 0, 270, 90, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_BG_COLOR)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
 
 	if (ctx->ctrl_handler.error) {
 		int err = ctx->ctrl_handler.error;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index effe364a86b02..feaf40acd4ee4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -6,6 +6,7 @@
 #ifndef __RGA_H__
 #define __RGA_H__
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <media/videobuf2-v4l2.h>
@@ -137,6 +138,10 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
+#define RGA_FEATURE_FLIP	BIT(0)
+#define RGA_FEATURE_ROTATE	BIT(1)
+#define RGA_FEATURE_BG_COLOR	BIT(2)
+
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
@@ -145,6 +150,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 max_scaling_factor;
 	u8 stride_alignment;
+	u8 features;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,

-- 
2.54.0


