Return-Path: <linux-media+bounces-27364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A64A4C616
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F58E16ED8F
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D8A2206AF;
	Mon,  3 Mar 2025 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dR+6F9li"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101521D00D;
	Mon,  3 Mar 2025 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017771; cv=none; b=F1lCBxcx6IWYtvINon+IIy0kCmfcyVdmLS9faGBgY8wVjY4LN17eb/3tL2GZGAxcSMePaLJmAPT2SGoXF+wzPlUqzwYPHpFCHbJCtESxkwU0AgK+mijoWwHAfiOcsjKn01rVYiBP8J6cxt7dtBWZ/CcSWyq9si26K8UTFJHC7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017771; c=relaxed/simple;
	bh=lwQcPFmb2dq2hmAi8n62qWMLz3ktzs7x1sphfUEvTdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUT8UES4oSCJDYJQswaCsNNJR+c05ncZ6MyLkl2LCIk141Az6vAFpw5uK1Dl5Ll6ecy7oNOTpP5BbiDceFFitvQ+QOzSty0XRf0KgGg9XUMvuS108L7cwm6iClW1mw4T5cOXvt/hNMXjavxh4i1rhmigXfSR/6Msa2XYkPgCdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dR+6F9li; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7CB11189;
	Mon,  3 Mar 2025 17:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017677;
	bh=lwQcPFmb2dq2hmAi8n62qWMLz3ktzs7x1sphfUEvTdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dR+6F9li+KkeMK+n//eyMWIpUsNVM2SCwe+w+vak7KsS4SVBUPCDql4rSNsQln6/P
	 1KaHtx0CE41s2PsI9YfZLc9k/ajor/uSHk6JrtPBqkwDL6/SV85bn8T+GitTOMPKQw
	 wQnUYeNn9obHTfN1rZYN8XvcizN8rdEkGS6ZITgY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:09 +0530
Subject: [PATCH v3 06/19] media: i2c: ds90ub953: Add error handling to
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-6-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4286;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=t0xF7Xgcnsn89th/lDheR6Oc6gbB12SJ1Pi/G226hAo=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/T4oI8qyGXVOYqozHKPpzm5jaU2o9fdfGe
 yfB/ROSMeqJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 RfN1EAC/uReYJluFgc/6PKJxVDYmrYuZoGhD4RsuP3B9UtxsDphRLqB8rSn3SuirrkYORasoqD8
 NloK+6OIGLXXZpRKmXiOXK71BLbdkaeJsC0v8iZR49eOYkBVXmxgEzagnxLIWdioM+kQVUEUp77
 4wZ8A7Xb7RhJr3NC6Jj6Ue5lhEOeBgeH4PngO1HKZy+qWH1FcR8dprDvRB2wSMqUpLhMdn9HSmB
 IgJM75T5pPaXN2Yj5ghiHKdIEO3J+CLiWhE+BeJhr+qvGLFytUzPvAqF/elR00xI4srBW8VUgeG
 yIEIpJucsVs37ewVC/XATnAl7AGeRca9wCc5h/X3IXVh7CvVWyZFxgJEP3LswCECE4KSp5SMnbq
 PqhXKGtGnAP/01puou3mhhzHClHqPRU/IyGg8ZO3b/oWDUVGh/0On5oDs48Lm39mNhHgOzE4shC
 h4vWTiHPwth4wMRHnTD5S1ICBs7r0M8P1RfxlINPvA9Msa3jgB+tTD8B5O8QUNNOkAJmRSdvGGX
 8TagZrm10+cY/K9Mh4I7hhU0SuqRdPwJ+1OHcj82282X0oAEqE+fX3ADzlsZyGtYjgkZuuHG+OL
 wr80cmjtH7tV/s4po0j4EqMQY26g/bnNqJhCQs55KGDDRDsClSOU6y9GN7YrWXgLK03/NNdx/Vw
 n5ddIzcPhbhq+tQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Add error handling to ub953_log_status().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 80 +++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index fbd977760c6b1ccdec90b90bced4dc29932f3893..a08aad3f7fe09f7b396da9c720ed9993d392410c 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -633,23 +633,33 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
 	struct device *dev = &priv->client->dev;
-	u8 v = 0, v1 = 0, v2 = 0;
-	unsigned int i;
 	char id[UB953_REG_FPD3_RX_ID_LEN];
-	u8 gpio_local_data = 0;
-	u8 gpio_input_ctrl = 0;
-	u8 gpio_pin_sts = 0;
+	u8 gpio_local_data;
+	u8 gpio_input_ctrl;
+	u8 gpio_pin_sts;
+	unsigned int i;
+	u8 v, v1, v2;
+	int ret;
 
-	for (i = 0; i < sizeof(id); i++)
-		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i], NULL);
+	for (i = 0; i < sizeof(id); i++) {
+		ret = ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i], NULL);
+		if (ret)
+			return ret;
+	}
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
-	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_GENERAL_STATUS, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1, NULL);
-	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2, NULL);
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1, &ret);
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2, &ret);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
 
 	/* Clear CRC error counter */
@@ -658,34 +668,60 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 				   UB953_REG_BC_CTRL_CRC_ERR_CLR,
 				   UB953_REG_BC_CTRL_CRC_ERR_CLR);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI error count %u\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
 
-	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1, NULL);
-	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2, NULL);
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1, &ret);
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2, &ret);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
 
-	ub953_read(priv, UB953_REG_CSI_ECC, &v, NULL);
+	ret = ub953_read(priv, UB953_REG_CSI_ECC, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CSI ECC %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data, NULL);
-	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl, NULL);
-	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts, NULL);
+	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data, &ret);
+	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl, &ret);
+	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts, &ret);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < UB953_NUM_GPIOS; i++) {
 		dev_info(dev,

-- 
2.48.1


