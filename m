Return-Path: <linux-media+bounces-25280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367AA1B911
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D17E3B100F
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F52222567;
	Fri, 24 Jan 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="az0zHkHo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9144221D98;
	Fri, 24 Jan 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731917; cv=none; b=i08VO7tV8o0kZXjlUseDLzeLR985bCN6ywaNbyypmkh+99zxzBAUQvclBjWEyEGznrMbX06rSmQkh9hHDd3AQP+ImJJyQv4DK2V12hL4I73rca9LmF5HTEN08cn/Z75PHy+Vsqto8WM5hYnW1SbcLhCNi7NyAjSjMv+xDb1lxMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731917; c=relaxed/simple;
	bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Muh52HTTF/Ua3P4pkKTQPaVplzRoD7dovQTs2Y7fbgN9YPonvHYogmmE4w2OOY05IXs6zTpOL0fEiKGOXd7uhIsvCV2It5jrnWxkUVHar0JjWo8v0Uh9eDE5rpiLS36bKvz/q8bHJ6SqNygBSB0CHvCGRkiYCgxrULnNXpD69EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=az0zHkHo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E564619A6;
	Fri, 24 Jan 2025 16:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731835;
	bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=az0zHkHo8DP6ii8a9eRZTZOuck10UZEIqxqhKnUNIc8v31C0/ajSYgMU8zjtaB0JS
	 Crn2/8Nw6acD7RZb1p40xTaDRewmjzQvG/c0NSjLbkSM+DHIhHB39taPC8vdTfdHkx
	 yNBkRJYmmtu1cxBGOu/k/QuNJPYgU383v83HefeU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:49 +0200
Subject: [PATCH v2 12/22] media: i2c: ds90ub960: Refresh
 ub960_init_tx_ports_ub9702()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-12-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68vDr+OPPRA2tkzOXCwgqaGSYTbQRBg48FEj
 IbBaVkDnSGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLwAKCRD6PaqMvJYe
 9Ur6EACPCUAVNLu9aXxS95jYsSqE69NVN9ZDOazRwMGN4r+8agxIJMl7EMw54cmkZD6yb5uwB8Q
 D2V8YwTdy4DqMUBYS+ifPAum2KijxFVJgF4gJL0ckl/UgFDzDbukJrqYDrC1732us1Bi2+chFvj
 xOm/g4WkttP8gT7GKQHNzq2Spsw9h08TZMqN/lue+dUle2MEPirOS8d43F2QCtM1BdbceqRHoLg
 PgAfUlFUZoqwiqtuDOOmZPjW48vdoCCbjH1Sax9U+kGUGDBpzlms9NodnN4rmwBO+cNPMNCrrCv
 T09sHI0mun+lzgjtW3nxNDPG6MFToKuSOdr5f24d9qaYmBoPPxeVo/x6DRST7rflzS0hNNGytZ7
 o+ytcPklDrA3HNre7P7Cu5/KQ+lSxDPU8WfhnpgXdHpH9kGFQAGELg8QcIkqDhsA/PLyCQUpj9m
 WV7CdVHbDRKe7cRcIBtwHb2vblFqhfM6+oxFOsYXGR6eyLDCrpcFCPf2YeIXm0Lkg1CE9jjmOBt
 43mT3H0IJl60LGhkjq/jZi8x8CA1avCvLYUt0ZZeJqVqOtHuVLuaRiUHClvHo3eFA4mgv1ZOOrB
 +3tPPNDzzk/OOII/dC7xFr0MXaGI9HcaxbwHFjdJhuunJJY2WJWZkIFsYF0epyZFVGMVYwbmKoZ
 bXdaAU2vyD6Ha4w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Refresh the ub960_init_tx_ports_ub9702() using the latest version of the
(non-public) hardware documentation.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 3b3e756af86b..bca858172942 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2018,6 +2018,7 @@ static int ub960_init_tx_ports_ub960(struct ub960_data *priv)
 static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
 {
 	u8 speed_select;
+	u8 ana_pll_div;
 	u8 pll_div;
 	int ret = 0;
 
@@ -2025,47 +2026,40 @@ static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
 	case MHZ(400):
 		speed_select = 3;
 		pll_div = 0x10;
+		ana_pll_div = 0xa2;
 		break;
 	case MHZ(800):
 		speed_select = 2;
 		pll_div = 0x10;
+		ana_pll_div = 0x92;
 		break;
 	case MHZ(1200):
 		speed_select = 1;
 		pll_div = 0x18;
+		ana_pll_div = 0x90;
+		break;
+	case MHZ(1500):
+		speed_select = 0;
+		pll_div = 0x0f;
+		ana_pll_div = 0x82;
 		break;
 	case MHZ(1600):
 	default:
 		speed_select = 0;
 		pll_div = 0x10;
+		ana_pll_div = 0x82;
+		break;
+	case MHZ(2500):
+		speed_select = 0x10;
+		pll_div = 0x19;
+		ana_pll_div = 0x80;
 		break;
 	}
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
-
 	ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
-
-	switch (priv->tx_data_rate) {
-	case MHZ(1600):
-	default:
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
-				&ret);
-		break;
-	case MHZ(800):
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
-				&ret);
-		break;
-	case MHZ(400):
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0,
-				&ret);
-		break;
-	}
+	ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA,
+			UB9702_IR_CSI_ANA_CSIPLL_REG_1, ana_pll_div, &ret);
 
 	return ret;
 }

-- 
2.43.0


