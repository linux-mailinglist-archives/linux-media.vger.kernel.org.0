Return-Path: <linux-media+bounces-24590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B4A08B28
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0BF1188D3DC
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B90020C473;
	Fri, 10 Jan 2025 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TrxvQDvL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE920C00D;
	Fri, 10 Jan 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500531; cv=none; b=RWc9R0dTPciLEuJ9IMSEBAIAmKjhJukxAtqVOiDY4c0hoX7KTbTcozCqU/JSCbk6+LN7XVQnSu5KirO958Xq4Zxsi1HVG6bJltS9ONxmBIH0wh0dPCL4zxmo9dqOL/aZ7RJukMYC8Bc6Gxg4GWQHbvWcG1cHOAQR9FlwU/LCDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500531; c=relaxed/simple;
	bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bg/7CFUOJkaOdPdAh0DkdSzi7evAN9Th3aH6WWzfD0f/zm0v9/dciMTuGHpSJDHQuSbgBAtlGZyXbgkEVqyztVftE3aZC/A3bGxDet4mAxNWTBPlVPjL0vMCb8RH6dGtE7n2m88nLfvdIR9cGciCcRz8EVWPZYVNKh/UFaQo6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TrxvQDvL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA9261AA6;
	Fri, 10 Jan 2025 10:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500456;
	bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TrxvQDvLI9haji5xoLZRQGPeknVAKyQcL76R0UUM7Ec534OyESFdjD9bygjKh49k/
	 GwrfzidOX2DGPkcFFObQXpk9a7BKoBnmk/n62JXIRMtZvbLJPptMY/EhasJQV1Fp7d
	 YWhnZ3gP/558VnH4A76Evaq0/HYRuURH6Ckg1Ou4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:10 +0200
Subject: [PATCH 10/19] media: i2c: ds90ub960: Split ub960_init_tx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-10-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUUhNp3lugxXn+vd8UqlDRYPd39ZbxwLXhEd
 HDCNi5/HReJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFAAKCRD6PaqMvJYe
 9SBpD/9rmYVCzlmQAWjzaUvjYKhXICqGauyyHBaUFsMTT6wsQIXNyU2NVsaOeKx5nTkafpUJjfv
 JhX1kJ+7rwlMiDHs1ZfFVqXCzUcyciy/kE74xEYI/YK03vK96bCenK0cALJmlRTMgYg6r/wrJjg
 jTqD9TuVDzCg/j+hdYwtjn2YNdjrtvI53T80Med8vnrExGEx9iZa8rEJsHuKkVcP8ztRjKv/clf
 fIgTFzHfNGq3oBLs8h8MTMCwMgZfADe43VvkKQjA2jvrqY0ah0QmD99Lpya7SrY/08DOaUGUwBb
 wksnQD1FukK02qrunC9astH51NarjxzaB+nw1apZh/kzJeGggPRzn9dlKkqyvu2vOVBhrY6VkP1
 r5okiigtWwR8sByDHrZyrSgHHm7N1x7OzsVIvp32hKhDa06EbfoZ8I9xOgSQ6sWv6clmSIXWiF7
 qnoORMJv6xFnnMe/k0dNoj0h4JVLq0EbkRTI1GfZ81a+ZSf6+w+mGUmWvIc52skQ7ihFjFkpqR3
 dG1711j+Ma0yTaBqgmR7JA/KqA+HfjADaORGLnNUCpZBwPoSI2N1j3sfv/S671cpTiqS8TKL9sz
 fxPN4rrw7mtPk0Qz4glfSYcTphQv8e7QSSyjRNS95+noCssZjJMSE8KSIJzTdxmEwOZBCLpz8mz
 P6FgXZzaUqSsgkA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Split ub960_init_tx_ports() to a UB960 and a UB9702 versions to make it
easier to update the UB9702 version in the following patch.

No funcional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 105 +++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index a890097ad105..3b3e756af86b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1992,67 +1992,98 @@ static int ub960_init_tx_port(struct ub960_data *priv,
 	return ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl, NULL);
 }
 
-static int ub960_init_tx_ports(struct ub960_data *priv)
+static int ub960_init_tx_ports_ub960(struct ub960_data *priv)
 {
-	unsigned int nport;
 	u8 speed_select;
-	u8 pll_div;
-	int ret = 0;
-
-	/* TX ports */
 
 	switch (priv->tx_data_rate) {
+	case MHZ(400):
+		speed_select = 3;
+		break;
+	case MHZ(800):
+		speed_select = 2;
+		break;
+	case MHZ(1200):
+		speed_select = 1;
+		break;
 	case MHZ(1600):
 	default:
 		speed_select = 0;
-		pll_div = 0x10;
 		break;
-	case MHZ(1200):
-		speed_select = 1;
-		pll_div = 0x18;
+	}
+
+	return ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, NULL);
+}
+
+static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
+{
+	u8 speed_select;
+	u8 pll_div;
+	int ret = 0;
+
+	switch (priv->tx_data_rate) {
+	case MHZ(400):
+		speed_select = 3;
+		pll_div = 0x10;
 		break;
 	case MHZ(800):
 		speed_select = 2;
 		pll_div = 0x10;
 		break;
-	case MHZ(400):
-		speed_select = 3;
+	case MHZ(1200):
+		speed_select = 1;
+		pll_div = 0x18;
+		break;
+	case MHZ(1600):
+	default:
+		speed_select = 0;
 		pll_div = 0x10;
 		break;
 	}
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
 
-	if (priv->hw_data->is_ub9702) {
-		ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
-
-		switch (priv->tx_data_rate) {
-		case MHZ(1600):
-		default:
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x80, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, &ret);
-			break;
-		case MHZ(800):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x90, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f,
-					0x2a, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, &ret);
-			break;
-		case MHZ(400):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0xa0, &ret);
-			break;
-		}
+	ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
+
+	switch (priv->tx_data_rate) {
+	case MHZ(1600):
+	default:
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
+				&ret);
+		break;
+	case MHZ(800):
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
+				&ret);
+		break;
+	case MHZ(400):
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0,
+				&ret);
+		break;
 	}
 
+	return ret;
+}
+
+static int ub960_init_tx_ports(struct ub960_data *priv)
+{
+	int ret;
+
+	if (priv->hw_data->is_ub9702)
+		ret = ub960_init_tx_ports_ub9702(priv);
+	else
+		ret = ub960_init_tx_ports_ub960(priv);
+
 	if (ret)
 		return ret;
 
-	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+	for (unsigned int nport = 0; nport < priv->hw_data->num_txports;
+	     nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)

-- 
2.43.0


