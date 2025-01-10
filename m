Return-Path: <linux-media+bounces-24585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DABA08B1C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0642D3A0486
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4149620ADC7;
	Fri, 10 Jan 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jKBI3ICT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433A209F57;
	Fri, 10 Jan 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500523; cv=none; b=JN6Tm0Z+OlM0RIPMDyly2fzsxemvOPGUNBimXhJBsHQX4FTPeBwcCIBAxB2adSLb40qmpoaTUMjqT3+bFdN5E7UdJvdKvdoUrtzndROylJj9eznDkrfc2yydlZDOubToEEbNeouOPP3XN2N1/x7ecO4aBsZ0UaTwEX/ZM863joc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500523; c=relaxed/simple;
	bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxwBEK5yAn/50V2mO/Ze4ygBzzOOomS0Gca2fh951kbm8aPBHGBqI0f57d+i6aII1T0pV5prWv5B2BplaP78IHqydo9fu1PSwOtxiD1rOInokDLit39Zq36S7CkKVVFT2hoxXl/9x38lBcKL2T1wjbgxrjXEaKPlJprgNq5kVok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jKBI3ICT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F77EB63;
	Fri, 10 Jan 2025 10:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500453;
	bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jKBI3ICTFlt0ZMnTjO7ytqc09dgwEygzVUlC1OHrBJoU2Fpy5Htqm7vWPl1K6iaP0
	 Ds+KLFKW2yQ7bksPecAZhfXNH31nW50UvI/JDmODGZpUreE3GDqwaRnyKAOWL6uG6f
	 h+ebX6Gj6tlMZenzX7wUX5pvPCQ9JZ/Er62DTxr0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:05 +0200
Subject: [PATCH 05/19] media: i2c: ds90ub953: Add error handling to
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-5-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUSeMSjoQKitI8C8qh17ev8ak34QRB9TJOI8
 rXZYlWxEyOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEgAKCRD6PaqMvJYe
 9ZEhD/9GDL+jNW8bgCkR/WvlU3l7nBC5Zm/R2PMn90JCvjPjMVU2SmFyemdiNssFxvvefc2vE+n
 4CC6A/UbanDyrEijruz+7WqQB5RPeW5dpmboCPad6vgh4cRKMjk5VWOCKSi5GK5Qg95Y0oVtC1I
 WNLgYaUJOg02BHKxrMB1gXcvoX1e8j4rlqlte4fUhFPaxAYqi62X/1ZD28OY6mMWOEFULkshq9q
 an1E3YbQrOGaTVPLvUhWTE9ABeLQkMUxZn0YtSoyTrJEtck1iPP/r7VJPMALEU+CUTCT/jJ5YAA
 +k4SLxJRqp3gy93FnGwkNhbe+5O3G11Qz/71f6THtD2haPR7ygP7EV8eu9dw5it2Z3MhcuL2XiB
 yiwu2nF+tOzccmOuOameRvNpn7x5ubkpgd+OJkvf+5gYAo7V+O43uqj38YFiYx+84EcaFozhZ6Q
 /siW1hmfphfZA8BF6b+rgaqoCSJ0We7eLHsMn1SAmmfXA/ezcBz9FTH3o4HEnIT1zs0ITAO00Vk
 LSeLtSn1aX1ET4joQH+5/79guSL7VrAQUyGfLfBr7Tr+FB8imR0ggs3uvFLtYwDx+F7YgXyQD37
 tSEObHk/4MIJc9WifPpZkvkmELRDRCtoyLS+rfC4dA5cglMfquVO1b3ticBdrVrc/YkxN2d2k9o
 tPcIxJKu82dt9cw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub953_log_status().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 80 +++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 07d451816855..99a4852b9381 100644
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
2.43.0


