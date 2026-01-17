Return-Path: <linux-media+bounces-50948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D239D38F6D
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6AFA73008C4E
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A5624169D;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUK+tRQR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8221139579;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664181; cv=none; b=eR/6fJiR7aNjJbZ7lkcDDzd02J8P9IZVc4pe1XM6tMVhDtDpXTRIJqkbloi09qQRQ0Nm57LXihFKSHau10gsbYyqVxLgAwOc50Foctxh5oigU/GQczUk2EFbDVJMiyhEEjJpfzq2Icai9Wv5VWDsMSFEiIFb14lPiP3dFw9em9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664181; c=relaxed/simple;
	bh=0hCEg3mKHxeJ0lIQKGfIPrJ4/x6ERCjO0bYXHeEA3o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDB34HnWla1XN7Qs/VaFv4PNX8W7BT6Lvx5bu2O2PBD2eFfPRA16yvhE/T5WcXx4LRuxX1DWH1R+Ol97NVNU6g6eaSuYiTCoax6OiyjQ/lxBiZyL74CnRVkAjCCnFt9elP+b87orZa60Ui4KaOGritCWmQ6fdpsHzduFGfq+egE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUK+tRQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC46AC19421;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664181;
	bh=0hCEg3mKHxeJ0lIQKGfIPrJ4/x6ERCjO0bYXHeEA3o8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QUK+tRQRqpIkWRqCJwqvYFY63dSGiyw7ul4NDpqnE60FPYqQznJhLtkQjaYyQIpQk
	 xLT5R2nynlmZMINpepmsv+9SxzJ6SoQGp0LdthhJq81h4ypEoLC3XMNLEK/YBErPNM
	 t/QJjcHLXk/mNHWthS+Xj3x/MAB1v5t+i97eaRih3PVcWLuunRIp0IVH4/zoYoGj50
	 ZvSMD6oSjvXlVDu/YexGMUs38F/v4t67+lFn9qvFoUKvpyOXR2Yc6Zhv2NfVj9Sxt/
	 HQR4i2ouNXGMe8o0shbRRE6i8uRXuSOiQGXDOI/4K0Fgr3n6bjQMRkveV8zy+O6OIV
	 Qd2ezEwmiJwsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E380C98316;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:17 +0100
Subject: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
In-Reply-To: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Py+ahC8+QgtZhaEyxSnmQ4ggve0to/vdi/NPYJPgPjU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzkeqxPfoPvfQNSlRy35pNpn6GzYk/l+1Iw
 rpbFRRNniiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 cguFD/9Jscq5HuwYUTFSnYxmXsRZmR2JgZmSUmdtOgoHmYLjWqPJ1NiNczdHUsEGQSQpKlYdQ8A
 khqUAPktuwV7lH81wGsijrLCsucFats1lslH2AURPJS4e3kuMMtwgKPZDCsyA+X+BWO/yqrxp6P
 eppzY0mRbO/75BeRJKDcwwgzwftRpauP3vivVU1/YpUxu6npWMm+JOpWSnznOPH54gAc73J176A
 ZUDcMfAUJ1UoH7dmgaoySnzaeIHo52Gr1tWKT8SDcbRyPP4KYYDNY6Z+R98O70FGd+Fy13f/gw3
 lca6QgpuEsMwpCgXTI1RFrDuWSUB22NqUpgpqQV9nqKuBZRFYNhZFjgxiV26ZHX6G5K6/5h9DmG
 e8vRnSJ7B3UuVmwtVUczJE5WmiysrZFkJXF/7hyNqVtGcwb5DJYPUtJCZd6mLrDkMBb4yN4lxSc
 1ZoHdwWG6nCm7mcAnTWaQaTupE6VfsSdIL2g/DsexMFkn3cN/Yqv9B23g5n82CIkndfEM3V9XLR
 ZFyRLPT4vrHHHNDPQ6qmbka45o+LRm0fAgruWUwnwvAlKZGhzmg3z4Q40a2YH7OH/LY+1boCjMY
 XbqEESdyzeYKalU9dVRQ6Flqjq8sLlFKpiY1/aVK69LBtEdRP9mssWOZCfztbt+Lh1Y9Www+JyI
 oVj2LVSh2g3b9LA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Since there can be unrecognized configuration allow returning failure.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
 4 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 9d67e7fa6366a..bb4b91f69616b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 	return settle_cnt;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				s64 link_freq, u8 lane_mask)
+static int csiphy_lanes_enable(struct csiphy_device *csiphy,
+			       struct csiphy_config *cfg,
+			       s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
@@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		writel_relaxed(0x3f, csiphy->base +
 			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
 	}
+
+	return 0;
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 4154832745525..f3a8625511e1e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 
 #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
@@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
-	u8 lane_mask;
-	int i;
+	u8 lane_mask = 0;
 
-	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	switch (lane_cfg->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		for (int i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+		for (int i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= 1 << lane_cfg->data[i].pos;
+		break;
+	default:
+		break;
+	}
 
 	return lane_mask;
 }
@@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
 	return ret;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				s64 link_freq, u8 lane_mask)
+static int csiphy_lanes_enable(struct csiphy_device *csiphy,
+			       struct csiphy_config *cfg,
+			       s64 link_freq, u8 lane_mask)
 {
+	struct device *dev = csiphy->camss->dev;
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
@@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
+	val = 0;
+
+	switch (c->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT((c->data[i].pos * 2) + 1);
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT(c->data[i].pos * 2);
+		break;
+	default:
+		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
+		return -EINVAL;
+	}
 
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
@@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		writel_relaxed(0, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
 	}
+
+	return 0;
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f4144..08dd238e52799 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		wmb();
 	}
 
-	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
-
-	return 0;
+	return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index d198171700e73..21cf2ce931c1d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -73,9 +73,9 @@ struct csiphy_hw_ops {
 	void (*hw_version_read)(struct csiphy_device *csiphy,
 				struct device *dev);
 	void (*reset)(struct csiphy_device *csiphy);
-	void (*lanes_enable)(struct csiphy_device *csiphy,
-			     struct csiphy_config *cfg,
-			     s64 link_freq, u8 lane_mask);
+	int (*lanes_enable)(struct csiphy_device *csiphy,
+			    struct csiphy_config *cfg,
+			    s64 link_freq, u8 lane_mask);
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);

-- 
2.51.0



