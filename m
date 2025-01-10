Return-Path: <linux-media+bounces-24596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F3A08B3E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D9807A47A2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E9320E008;
	Fri, 10 Jan 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OZ0bcZ4k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200720DD60;
	Fri, 10 Jan 2025 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500542; cv=none; b=pSu/Gs6ATavM0ZhEEKMWWnzRRFQEE/QsrKRkotTVh+xIlTivHJtqHOEOwVc0YppJuPja/szYH7lx8hfKq+5WFzuG7ATIMVcCYDq9KTgMceBhpb/L8rT/mjtfVpxozYCqiE2YqjLLFz2c6+a8OuD6a7ZFjcREe9YvjIW/2qs5sR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500542; c=relaxed/simple;
	bh=BgxP5q3nFf0C/jvErBc553TL/VBiEqjyGqdvT8yt7rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFKMLJvQywdGeapUyTEuDZ3ygM/r6a2whO317HOXH5qYDaduaI0A6hXb8FbSaCtk616aZaP4O8CcicIOQ3KDAleVtIbGq/MeKyCxLGMPgZk+dkNeRpg6wPVPXmogSz1GsjuQq7CiIpwrvROc2ewtTqVSJDN4xacN+PaSZQKu1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OZ0bcZ4k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E06C8FA;
	Fri, 10 Jan 2025 10:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500459;
	bh=BgxP5q3nFf0C/jvErBc553TL/VBiEqjyGqdvT8yt7rM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OZ0bcZ4k/fKDBTVp3Na63SVsC0Iby6CAVE6kdYeXcp2nO4LAoLOmtazjyOCMDxr84
	 no3x3AQrj6c5JmHkwfNYTdndF/Aaj6LOfByku2cu3WoqfV2p9Ip/vTXCoQZZBmIxcc
	 Xz9gjAQRqFBdm6FqV+z3Hh47bHdqgBn0ggzYQeeI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:16 +0200
Subject: [PATCH 16/19] media: i2c: ds90ub960: Enable SSCG for UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-16-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5570;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BESZ/HsALuJYRTDP8fgQp5zYdub3KJloOdj8y9w91JI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUW4Jfbm5HN0lBCL1mwKqWpqCn2CzcQr4Txj
 nVBrPxLwwaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFgAKCRD6PaqMvJYe
 9YDeD/9yPMFspV5PFvUBHMwfMEJmQTTh1SUbaq9SuEuyOOuKm6pUGHYLANP0G1EswqK1f2eTvKo
 TWhBaOM93J10RWvftbFkrA5WtcMH01CmDP+aQnJTiF4/ZpfLDSa95RcZoV8UGVS1sNYtaf2VKgN
 SqKsVCj2xDbdvdrBveVYBuxNUU12ItuXMqukINp1pfUl35jnI1aegTrIRmDq06i9k+Rj0iWmiLO
 yDZDQezjcuTJE8t5KFZopoPcsMCCM4BPUiViFJME6g9aDelFCYhAS78VppHOOhgDLdVEM35neSQ
 8tkl9aaOTYzkzx0NphWwO9WMs6Mkr7WJTFo69vfUr0jVhrX4kpn1oJOK0q1bS/HD025zJ7NG8CH
 uYmskCxS8PIwh/WK8luzRreW8gCjfYvVakqCoWT1y2yAz2QMoD3cNknQVvKB+nPqjYSLF0vNWg5
 EQx5VNzAtcfxGxy4xxEDdT7tvnXvqW4y2eJm0xvNEQ/CZXoCo2DHuqm6ZWaXDLH5yKDvUVDXMYn
 tIuDP38HX9GZyC8nHBGyTZcuCMxktwwTv6bGRpBmUq3v0aJSkE4fTxnaqP81nLHKvpnDm8tJlOu
 3/nWeK1A2gMQO43GdtWP+ywNGLtvX+l1mEc7D3D5/GoaxCpofDQ9G7zzMvZwlNhG7lo3qCCoohO
 vzrtRFjf+XuxeWw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

UB9702 supports spread-spectrum clock generation for the back-channel
clock, which is futher used by serializers in synchronous mode to
generate the forward-channel clock, which can help reduce peak EMI
energy. The SSCG is common to all RX ports, so it can only be used if
all the ports are in the same mode.

Add basic support for SSCG by adding a module parameter to enable the
SSCG. The SSCG uses hardcoded configurationg, with 0.5% center-spread at
33kHz modulation rate. See datasheet if different configuration is
required.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 102 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index f6d6c2fe12cd..a534d077f045 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -52,6 +52,10 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+static bool ub960_enable_sscg;
+module_param_named(enable_sscg, ub960_enable_sscg, bool, 0644);
+MODULE_PARM_DESC(enable_sscg, "Enable SSCG (if available)");
+
 #define MHZ(v) ((u32)((v) * HZ_PER_MHZ))
 
 /*
@@ -359,6 +363,7 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
+#define UB960_IND_TARGET_PLL_CTRL		0x05
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */
@@ -382,6 +387,22 @@
 #define UB960_IR_PGEN_VFP			0x0f
 #define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
 
+#define UB960_IR_PLL_DEN_MASH2			0x80
+#define UB960_IR_PLL_DEN_MASH1			0x81
+#define UB960_IR_PLL_DEN_MASH0			0x82
+#define UB960_IR_PLL_NUM_MASH2			0x83
+#define UB960_IR_PLL_NUM_MASH1			0x84
+#define UB960_IR_PLL_NUM_MASH0			0x85
+#define UB960_IR_PLL_NCOUNT1			0x86
+#define UB960_IR_PLL_NCOUNT0			0x87
+#define UB960_IR_PLL_SSCG_CTRL1			0x88
+#define UB960_IR_PLL_MASH_ORDER			0x8a
+#define UB960_IR_PLL_SSCG_CTRL2			0x8b
+#define UB960_IR_PLL_SSCG_CTRL3			0x8c
+#define UB960_IR_PLL_SSCG_CTRL4			0x8d
+#define UB960_IR_PLL_SSCG_CTRL5			0x8e
+#define UB960_IR_PLL_SSCG_MASH_CTRL		0x8f
+
 #define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
 #define UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
@@ -2837,6 +2858,81 @@ static int ub960_enable_dfe_lms_ub9702(struct ub960_data *priv,
 	return 0;
 }
 
+/*
+ * Configures back-channel spread-spectrum clocking with 0.5% center-spread at
+ * 33kHz modulation rate. See datasheet if different configuration is required.
+ */
+static int ub960_enable_sscg_ub9702(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret = 0;
+
+	/*
+	 * The configuration is hard-coded with FPD4 and BC frequency
+	 * 47.1875Mbps, so make sure all RX ports are configured with
+	 * synchronous clocking mode.
+	 */
+	for_each_active_rxport(priv) {
+		if (it.rxport->cdr_mode != RXPORT_CDR_FPD4 ||
+		    it.rxport->rx_mode != RXPORT_MODE_CSI2_SYNC) {
+			dev_warn(dev,
+				 "rx%u: Not in FPD4 SYNC mode, skipping SSCG\n",
+				 it.nport);
+			return 0;
+		}
+	}
+
+	/* Disable MASH */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_MASH_CTRL, 0x40, &ret);
+
+	/* Set MASH denominator */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH2,
+			0x7f, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH1,
+			0xff, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH0,
+			0xf8, &ret);
+
+	/* Set MASH numerator */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH2,
+			0x7f, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH1,
+			0xff, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH0,
+			0xf8, &ret);
+
+	/* Set NCOUNT */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NCOUNT1,
+			0x00, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NCOUNT0,
+			0x96, &ret);
+
+	/* Set MASH order */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_MASH_ORDER, 0x20, &ret);
+
+	/* Set rampx increment and stop */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL2, 0xbd, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL4, 0x73, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL5, 0x41, &ret);
+
+	/* Enable SSCG */
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_PLL_CTRL,
+			      UB960_IR_PLL_SSCG_CTRL1, BIT(7), BIT(7), &ret);
+
+	/* Enable MASH */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_MASH_CTRL, 0x0, &ret);
+
+	dev_dbg(dev, "SSCG enabled\n");
+
+	return ret;
+}
+
 static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -2860,6 +2956,12 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	if (ret)
 		return ret;
 
+	if (ub960_enable_sscg) {
+		ret = ub960_enable_sscg_ub9702(priv);
+		if (ret)
+			return ret;
+	}
+
 	for_each_active_rxport_fpd4(priv) {
 		/* Hold state machine in reset */
 		ub960_rxport_write(priv, it.nport, UB9702_RR_RX_SM_SEL_2, 0x10,

-- 
2.43.0


