Return-Path: <linux-media+bounces-27370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5693A4C627
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F55417486D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B179522D7A7;
	Mon,  3 Mar 2025 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hxO7jRtr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3C1214A93;
	Mon,  3 Mar 2025 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017799; cv=none; b=ILqFbUm9lOXOoK+ZRWQ5Gl5FGtsyl8DKDDmHorcBbQDlFF3GBt7I9CwND6rBe7cZ6nX48M18SO+XT0W4NFoh4zKLUj/o6q/hEfoBfiklhYx+wks+FXkXAnx8vn+iNElaVr5+5cfPQwj3wvaHWfHg1russ/t2CcDs5t01wPhoeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017799; c=relaxed/simple;
	bh=qT0me5iVNf3kIvTDXcq8PN3s6ZFmMwgXJJVomJwLVJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTf/9XTAKlGWXaokUfbOXwGxP7MHEXrtO4noTCrmoPO4zrctdhy/T4pz6XQgJSwn7mXVThMDLEZkRpFxopd8dqjx0kAGUYTFhQe+H/VjmxRPUZ3cwmv6tmKRO61GxGKoCcw5812zRMsSnaNdSuYqNj47G82bOcRW8MW2g704rnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hxO7jRtr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67CC922A;
	Mon,  3 Mar 2025 17:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017704;
	bh=qT0me5iVNf3kIvTDXcq8PN3s6ZFmMwgXJJVomJwLVJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hxO7jRtrdZUuSj1rv/wZYjx2kpf2nDXr8FCqC3w4xZaJ2l+5KhVkW4z5rcmAGr2XP
	 WTXnUA19rfO7t3IJTL668xTI4Lxa0FRw3bCeeOCbvZfUpKu7YI0RwIxH4rJ6na0Ltu
	 GGXJRPCJNskRi5HADxsB5rKuLkZajXquk+7KyXy8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:14 +0530
Subject: [PATCH v3 11/19] media: i2c: ds90ub960: Split
 ub960_init_tx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-11-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3935;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=NnmWv2EiSSc1ctQfgNC7cyCxt+VEUaW1p9KFGj4+kBg=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/aItO1MVgnAkqiO8p7XR316WMRH5Vg3I/G
 9L/pZsY0EyJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 RVHYEACMLA3hxnj2aSHLYrwDFvQwb+2MET5A+yzSRESY1f3+kRoCsTzvU9W1EKeyhrx5WbmuMJO
 1mAyEKRMLQtN5/yjLArKVRVS/MSEU9Qn0hxLAFvtUOPHVFwQZWluKI8OzJOv9GnEmuzr1wqZzTy
 ej9q7yROwRlhp56A+tu71CPmrJEBLDH+ocwBZAK/SR/GGWaAvOOOfWIH+u1qaE/C5LodkNx9y6P
 2ifSypXpPHtz7K1lJ1CnK+5YmO88kqhPq8qQCVM/WZbbWD0yDWnO1eG0e5EWvKi1vk1Ctnc0GBv
 2aFNf8Crl+WOMeKxjo9PAzIKN+KJD5sQKpJ/mO/FNJv2OpLCRn9TWcwkz69VMSJ1XwWprYnb3ST
 xr2uAKGbzQhQG1+B/bHwPlOmPMvsOBABV3hxCL+exrmymaJRKq46LdDojTQw+Desm72SEtPOfSX
 Fd/2wVcmEfByBmLOB4fmH4srczcX2I6l/QESgkesIEFKB2yXmn1rbNZfYAGxBpgNsCrCcK+kowt
 fspScPXbDQfQFmtRe8rwAMV/VvgBH9fLuMyXmtGcPdXGArcc7sQaj1yNG615TiCipkS+aW0tlDU
 ZFOF4tfYkXYsCWV3o7hxHr6XyNZeTC1GPz7HEBH1KWb2nEWcxaPtbTRVOuMUJGJZ/BEuqSaGjr4
 Bf9yZxVoOFmVmLw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Split ub960_init_tx_ports() to a UB960 and a UB9702 versions to make it
easier to update the UB9702 version in the following patch.

No funcional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 105 +++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c56398aa895f05029879fb336bc52c932fee494d..579ca570a543a9ee8be8f9d4432a2da8fa09e54d 100644
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
2.48.1


