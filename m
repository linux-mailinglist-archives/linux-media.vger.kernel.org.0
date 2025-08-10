Return-Path: <linux-media+bounces-39360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D8B1FC68
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 23:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D1618981FF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCDE28750C;
	Sun, 10 Aug 2025 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="DAG6a+UN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8237E2874F2
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754861172; cv=none; b=lxkeLDFlQj7ZtvJuXyZNVbXvDa5hIVvljWthBgs4iasX99o0DAWPJpfkV54giSbOxwZ7HZQsXPgVsOMg/Z5eQswEvXzbej1lvDdDQGrRUT+hbXyNu7nqD1AJoqbNcXoyJbzecQVouqZN9N3qZUbIesmO3fVMIK5GoHAthvpQKEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754861172; c=relaxed/simple;
	bh=ca7TZL84pkQlUUk0w8WX6/8qkMHUjtCkt3b7BX4YX60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkYTyFp5o5EhjAdL5Z9/w9g9qT4H+OPBTu7xZWZ2vkRiZvAzCkSK19xVBqfu0pPpuDSi31SuFKg45O6PBcONUEM/YdwIAMtFyDmej+ae+VS25H0nHVZrwgiHQ4WjDHBaXKHtOQJdY2eFFFffMfSo4j3tveMwZctZNd3teXsiksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=DAG6a+UN; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754861164; bh=PimwDS8LC37CYWaFf7XT6w/idZMKOZ2fzD26lIMQhVg=;
 b=DAG6a+UNAXjj0V8JIo6ZDnOmc8z3T7DtTNmuJHE1LZuwYPkW5j8c02IAQ+EMRO5cFyqGEfafz
 HQwkBE8CFfBD/km4U5O0KRQdVXSx1BTvbDwjq77gvyw6I16J6JFmXtu2Q0ZPTW+lGq5zCSAwSPw
 Cgl12dJZ8EklhrEIHvDufKdNXxZDKtFd+BokTi6F0wrwk+3gh1W1QG8w/6FhcqkqDyjzo1AUu0z
 4pMubGUuJ95MQu1KUl2Etau27t8/fyVn0EZL8MCDbCIVuBHL9puV1rLLeCcSnyCNtXzHiG4GzFm
 h6CgE7uKwLtZ4SAV7JV+rs3/XxCbKgPg6X1rzGbYIUIA==
X-Forward-Email-ID: 68990e6b797ab8962779245a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
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
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
Date: Sun, 10 Aug 2025 21:24:35 +0000
Message-ID: <20250810212454.3237486-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
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
Changes in v2:
- No change
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 1994ea24f0be..f8bb8c4264f7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
+	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
+		u32 reg;
+
+		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+		reg |= 0xFFFF;
+		reg &= ~BIT(12);
+		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	}
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
index 0e7e16f20eeb..cadb9d592308 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+
+	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
+		u32 reg;
+
+		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+		reg |= 0xFFFF;
+		reg &= ~BIT(12);
+		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	}
+
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index c20e046205fe..d61d4c419992 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1226,6 +1226,13 @@ static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
+static const struct rkvdec_variant rk3328_rkvdec_variant = {
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
@@ -1237,6 +1244,10 @@ static const struct of_device_id of_rkvdec_match[] = {
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
@@ -1267,6 +1278,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rkvdec);
 	rkvdec->dev = &pdev->dev;
 	rkvdec->capabilities = variant->capabilities;
+	rkvdec->quirks = variant->quirks;
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 8e1f8548eae4..e633a879e9bf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -26,6 +26,8 @@
 #define RKVDEC_CAPABILITY_H264		BIT(1)
 #define RKVDEC_CAPABILITY_VP9		BIT(2)
 
+#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -69,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_coded_fmt_ops {
@@ -121,6 +124,7 @@ struct rkvdec_dev {
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


