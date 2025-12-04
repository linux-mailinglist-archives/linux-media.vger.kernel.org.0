Return-Path: <linux-media+bounces-48238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19731CA483D
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1F0F3009617
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84982FD7AC;
	Thu,  4 Dec 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPEfwr2P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1D2F691E;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865967; cv=none; b=qxAyDNh3G05+kNISEoPn2V/tZZN7PL0LaV75kIipI2BSMNPs0Wf31ap9ZFvjPZpDs2mtVyrO70P884gCp20XuB6YhqxRydR8QdljwATevSDhnXQKwlWm/EsC3/vwOC3D1+DX8eznJhPHmP+J0WUSCcsGT4IjvwBQeCuIln5pK7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865967; c=relaxed/simple;
	bh=BTlZmuklBExAv5kGBfKsL36HY9AlLOG1zR+iZ1YxUJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrGJIUVhZ35ZZOSX1KStcU5RUrY8+MiN6+zwDzjKl4K8KG/KXZgoakNMTthnjVeKJd3OtrsU192cptbqpXOTMB8GNnFPByDxZ4HSbmHUOra3rWbpxFnyaAWXM+3KF/1oBnJ8ZzuIiKTCJHdTapfzL3iQfsByJKjf8joNatXOBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPEfwr2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A311C19422;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=BTlZmuklBExAv5kGBfKsL36HY9AlLOG1zR+iZ1YxUJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rPEfwr2Pf0dwnopZ+qsjJoItzPdV53D4iltJbGnenBJbBwEt1LqF867PgdTK781oc
	 Rw9JpuKXDLSHcjXB0qFc4OA4A8G0r6Lj0HqMSLxtxnfQZbpqmCiUbUZ+reDyvuz3RK
	 Ar/YNWi8zDqpLnXRm1juYLeihnp9h5u4IY0ua8PUHYV3aLgfBdfTkzEDCtaiT67NvA
	 bmEjxv+GREUFuvMldne2r0MKV6CrJ8AaMgy5WyHku8Wbp5Sg08pUfRixJjyiZlyL2U
	 8dar2iPuKgUbeFwICCociRcPWb69TXRwvpvW/Xl/1MORgZ7r9bZVo8IFzUSZifFQjW
	 hdxE8Pu8GV1lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15D0D216B2;
	Thu,  4 Dec 2025 16:32:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:36 +0100
Subject: [PATCH WIP v2 2/8] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
In-Reply-To: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zMHCyEJPdxX9cis7L+GGrY7/CXmo0Mx11zOGySF6/qI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbesUfOFn4Vy+wbIv2D+YGLZke2bctd6Vo1AA
 YwOJC2tbp6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 cqOKEACp5uzdPKtSfwWGzBCqJ+JHTo0Al2kmtIfTe3mrR/Rj5CKSfbNsQcO/4hjL6mUfYVBlq+E
 sd5aR3VO8N0Y6Geuo1tusyac0Fd3YDwSJv/AIXaV4qRHQiF/6dg+KI4jZNsxL4GuK6FzNkSGLdz
 1RnbTlJlOwEEE6Fw7Ujbj3yXqfP7FgZPa1EKGKSLSsW7koEOnRHDmFEaOJ4VkMrU7tvaVuWbF7s
 PLl3ZrDVlVMCIv3VPMSiVDrPUM7a4ycgejo/4U22o8SUZSum7HeQjviLLQ94fEY3PYFJCqTPdRA
 lN6DOuQzapeEpHWqj/GtOf2ccgVIiHzclWuUQbJKpdWAiTaJaNEnYTKuNSkjWdsx01JKCrviVvN
 qFQBk5jTwQzHFQEiIQqhLzKxbqPztNxLIjKU6vZl8NLgEdK7L85pYbq0QMM2WQKdck3ZMS784U2
 POkiv18fYHIJDJeBC8Q1X0mV3TKIcfgmF/5a9P5VT5sYoxGTEmMuCyXjgpdUcJiXwesAHWxnpy9
 KDh9mkoVNNVqT6yh6KPcbNQnyJMGpV16HBeuyee6Lv5MnZZFvcGuv/w9YKFRDtukwb8NU4Cf9E1
 w1IXZL7JF34M26COddoN4izdNeALsU3d+b6cCf3+POaKjLl/WhpoNo6ZkY5+I0jvOK1L5aQtX7J
 gM+EVELMa7hsL/A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 41 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf607813..9ff79f789fa06 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 
 #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
@@ -987,13 +988,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 
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
@@ -1024,6 +1034,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
 				s64 link_freq, u8 lane_mask)
 {
+	struct device *dev = csiphy->camss->dev;
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
@@ -1032,9 +1043,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
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
+		break;
+	}
 
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));

-- 
2.51.0



