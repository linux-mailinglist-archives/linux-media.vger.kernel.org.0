Return-Path: <linux-media+bounces-25274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A305CA1B8F6
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195D016E9FB
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA7221D581;
	Fri, 24 Jan 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YWZ/5HHn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3121A8F61;
	Fri, 24 Jan 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731908; cv=none; b=nOdZyymDM9dfftZeyGS28SV2yeuHX25c1dvSU1HkNi++Vjwt2zNhXQGoolgLjk33DkRsSul8M3mo32JD71NH5RNFNc4lS6JtH4maDJ/QCSbSgZ7GTXOy3UjmN4hKC4a971CVCG00A28biki7n066iQcJw9duLDTtOtmsEnhkWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731908; c=relaxed/simple;
	bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBnH6QxLn/UliCzzGcdi5IhkeFsQwD9hdL9KnV3afW+VY0hl8nmBHCN0xvL6JU+u8GX2P1rFrs1zmuI30FJ7n4BnyZf17RJKraV6SNgTi1B+KfJCL6DIoZTedNJW3gJeuqvwoLk63pl/612jwwmOXbmM3o6jFZ/3lLLiX/2ayW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YWZ/5HHn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8DCF11EF;
	Fri, 24 Jan 2025 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731832;
	bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YWZ/5HHnwErdZ8iEXVHnA9Wqdu8ESVA2TnKbxU+lBcwDXXdowpG2n32LJitqwfzPF
	 XF2zWpF4R1l1ZAxgId9O7WWeI/IIXqmmLKDmn35fauX69zmy9CFb99/DrldIfkK25+
	 4Wrot3hg8k9GUyzhqXApzoeMfaVGSckKNTS41B8c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:43 +0200
Subject: [PATCH v2 06/22] media: i2c: ds90ub953: Add error handling to
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-6-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oU3ePgr/rIaYG1LxgNeQUpAlpKSeD1foBMdXF/ULxtI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68tNZo46KbOb4xC2tkqktF8BDu5CLugNjoLq
 5ODZzX6aFiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLQAKCRD6PaqMvJYe
 9T6/D/4icZLAZLRsd0nlr+1tkVIlZAggC1Gw14K7TTtoL36MOZOzVzMDUW/1psletKvurT5MRFp
 uUgsFHfyuWYAo/yx9QcQLVRIXuEhvwUZcVz9Pk1A1spd+UEu/ndAWEnhdgBbYBdO7ow1/Q9XA1h
 oHPSrgpmU8TXQUOu/6oPMGHt1MbKB+FmE2CvUiVPplY/WbT8hQX1IrZW1kGUlHykInoYVdLazpo
 krHUDqitdleh9UfiyPiUwnSVGSJ1f8SIDps4c9vT3fr7oVtSqtMrrHebln/A80PiGMVXHGpFSLk
 0jOLr7KYo2u3cOHr72nxMT+1y+eSgaSyKon/w0+W4MmyYjMe35HJEbrT//leIdklhGIgZ8dVxsY
 fPAhuH49KWZqVcOWgbkmslycpF9Ix2ZJW2oFhJIKBkAENvzc9/m7pPxw3222bQn9gwjC+jH/XrO
 iYKiwFxGX8zxlQ53IBwE+5fyp1+MkUdoj03x3Z7Nd4PTemalbdXcoJ+HRtxv1KiA0ZPj9rEfkSF
 X6usArDmCfxgYCGU/FzoGIGAhjg3xOHwQuyLwzucqlPpvHNf0gNfC6wYMrA8zDYsOC0mJ1HL47F
 Oc7PkTQPQizJZwCinzYSWdHgiXmzEUVcIaONqQJWySrAc+qz5Am0H3p29whOXHiqnIVRsZQrQd9
 wezcaMXBW3K4vXg==
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


