Return-Path: <linux-media+bounces-41861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72665B45E00
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3D66BA1BC6
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B02230B537;
	Fri,  5 Sep 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="QeYANtmf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2130B529
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089223; cv=none; b=AUg0SJbWuYAFSBLr+pJ/9RGQF2+VKaSBdjPNRgU+YoX9do+yUMCii9Uvn84PJFD+EUl2RzdQuDZs22DucpmDy8AqcZTyD6tpb0a96uln8CsQ9wqy3PETRnXSOU3UWkoz8NwqB4nzj0B8GTKzM9StV1W8jcl+5kAj5+tbXYTkQl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089223; c=relaxed/simple;
	bh=AmHLufNMcsuxu9d60SAXN1uJb4bXUElgPa1BqWI93KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pK5CUjqQ9nAA3Ci1gXprlGByw5AgF1ZEtqj4Mm2fEhmb+8NqaaQauwD9skJUHidc2qbeg0w3hrR8GIprIGYS5C7/4uL58bVWmab1/9hNOxCUXtK8ok1T0Kg/nEENHXYp/saKCmxr9PjOifgdQQx/9gORrcHers+lPI9GEFhwc10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=QeYANtmf; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089221; bh=ZhaC+ulaf1xOTD0OmHuMFDx2uPJN7rg7I4X0/WJ2j0s=;
 b=QeYANtmfpv/dBu9qTxtOi+r+OJssVxPa9QClysQ+tK7z/2ayXGrMGmYhK0Y9UYI96pDw39mKw
 Okmq0AIPv4D8oO+Txiiwve3XJdANiEeCK/MNTwq6OGiQLthsfowc6HC+03h++4F50uXPLI3Ai7n
 gw4CgeHxEH5OPhc+cYwD0/I5tji6qz3flcxc/Wd0lUVF5iG3E59VyBQWH5cm3VddRGMGtOROWbg
 5+Ubg8sdMX5WjavTuhtp/lEhVIcjVINaN5EvPZm7z0oCuWZe7mzoiy1DaSD6F35tp55l7SiFtmF
 cjqXQONYpePOJHa7Xy4rSdsy+X7+RqhbCM3RHkYb631g==
X-Forward-Email-ID: 68bb0dc290d039a4fd84d663
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
Date: Fri,  5 Sep 2025 16:19:23 +0000
Message-ID: <20250905161942.3759717-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Bee <knaerzche@gmail.com>

The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
or VP9 is decoded, otherwise the decoded picture may become corrupted.

Add a RK3328 variant with a quirk flag to disable QoS when before
decoding is started.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Add rkvdec_quirks_disable_qos() helper to apply qos quirk
- Use quirks from rkvdec_variant
- Add num_regs field

Changes in v2:
- No change
---
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  3 +++
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  2 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  4 ++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 24 +++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  5 ++++
 5 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 9b5cf70188db..fc7e6a260b0a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -789,6 +789,9 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
+	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
+		rkvdec_quirks_disable_qos(ctx);
+
 	/* Start decoding! */
 	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
 		0 : RKVDEC_WR_DDR_ALIGN_EN;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
index 540c8bdf24e4..c627b6b6f53a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
@@ -219,6 +219,8 @@
 #define RKVDEC_REG_H264_ERR_E				0x134
 #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
 
+#define RKVDEC_REG_QOS_CTRL				0x18C
+
 #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
 #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 0e7e16f20eeb..b4bf01e839ef 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -824,6 +824,10 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+
+	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
+		rkvdec_quirks_disable_qos(ctx);
+
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index f8cbc7bcfa15..2d7d20653e4c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -903,6 +903,18 @@ void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
 		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
 }
 
+void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	u32 reg;
+
+	/* Set undocumented swreg_block_gating_e field */
+	reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	reg &= GENMASK(31, 16);
+	reg |= 0xEFFF;
+	writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1226,6 +1238,14 @@ static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
+static const struct rkvdec_variant rk3328_rkvdec_variant = {
+	.num_regs = 109,
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
@@ -1238,6 +1258,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3288-vdec",
 		.data = &rk3288_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3328-vdec",
+		.data = &rk3328_rkvdec_variant,
+	},
 	{
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index c47457c954e5..566e06fa2b1e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -26,6 +26,8 @@
 #define RKVDEC_CAPABILITY_H264		BIT(1)
 #define RKVDEC_CAPABILITY_VP9		BIT(2)
 
+#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -70,6 +72,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 struct rkvdec_variant {
 	unsigned int num_regs;
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_coded_fmt_ops {
@@ -149,6 +152,8 @@ struct rkvdec_aux_buf {
 void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 
+void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
+
 extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
 extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
 extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
-- 
2.51.0


