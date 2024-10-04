Return-Path: <linux-media+bounces-19103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18079906D3
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAA14B247AE
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152481CACDD;
	Fri,  4 Oct 2024 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PFHTP/PH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A21C877F;
	Fri,  4 Oct 2024 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053259; cv=none; b=Bw04srtsD3tdVBBA4xLH/VQkzNzwo/bWlf1o5+ZBjWsdOKOx+QPa0KNZ6AxbO5ON7G9oO1khE33csGs9GwKcSCTkW2Z+hntKbjgLviQIZB79qurDsDo7VHEBR6S52DWxLbkOfALxxsiNrDdl3nngSEw9LPAZbxLSo0zlgDJ82CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053259; c=relaxed/simple;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIJcdVeAs0xuEsyOOja7g/0irhWMGq4MNAbfyhe0hgIHn8CVpvTdvR9pc83jFMM+p4ttmNtkeTBO5qPBs1KlmjXlycgCeSBL1EtLyyFWB8oaOeCDEnFJwb/dSLf0FcmaXESpL+wQR4irrN/o/ZKVQ5EG8BK1OwlZfkWOH0acuOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PFHTP/PH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007CB182C;
	Fri,  4 Oct 2024 16:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053147;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PFHTP/PHEIvwRYoNQV12iADtZoOr6b59TbPIT6LrTw4tr9qhZ/qHJKF9HZmrv8pxH
	 VFNnD2PojyCLwh+Y8a8UiGSAERAEYq0sVfHmXZIeE2R2Yy91xKZuwgY1wB7KjpfUa8
	 M2+rU7o9cyvHEXThYDLEUEHvXeZ1Cf9obqxuaIV8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:44 +0300
Subject: [PATCH 13/13] media: i2c: ds90ub953: Add error handling for i2c
 reads/writes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-13-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///w/p5A9tBK89OCs4dP21pfQLBqO7ah1tMbp
 0zPmu/HoCSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//8AAKCRD6PaqMvJYe
 9bGgD/0VLLRgDAwwiOXAdxs/0NTOI5qUPxEAL+0mQy2F2F+4UrrNG+rbJqZMncYtkJWUHvKuZt2
 ut0sn/J6hTDxHU/gbI4KaVtnvmaUSioH72cTZlYSfp1hY2GH36sRYcAS6k62QA+B7Mvpfyzdx3m
 u2ZRodhIQX4H7CMGxPjROpoKrHKOXD4KHFzkjQfLJn582F+MU5mv9oUzIRErj86MSeiBC2CzFdc
 d7P/fUDtyW+yyyOjlwlvnTI/0V4IjReJ4/1NB9/v3S31BAqgCzB+V8JmXUkeiWrx6fZY0Zh/PjK
 nNm8DBQOVYQY7wt2sIspAGY5f+KK6NQZuhOIgcD8iPVBjTLwxyamuevwuyoEvdS4DhYGbIBmDve
 uR8GuDuybUCwct+KqINvKJhy5/Yv9VsEKDfygzWoqAt1AAZB6IoI/jV0XkrIkWuUOzBB8JmNS6h
 sk2GPqZ2dfMXSpohBqPnneQTTSOYpRI8LIGvFbknhqWY8yaa6sy64wI4HwCWFEFIC+NebpPZP2F
 2vb7RmK+KTEssPS+OrjiwkYa0prZ2J/BPJwShQGyyaY1g53edB0Zw8BnRjKW9bJhWnjSp4dG1kp
 bDRTULpyLtusd78RoGNZKwy2i/W26BUKmCMnZlQWe1xK52ms9Wr/3MNwNENZlBWDiRTC8JzFXdl
 imnI9PYA7R3VLmg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c reads/writes in various places.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 46 ++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index b6451811f906..f8f3e31f0077 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -401,8 +401,13 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	int ret;
 
 	/* Set all GPIOs to local input mode */
-	ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
-	ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
+	ret = ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
+	if (ret)
+		return ret;
+
+	ret = ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
+	if (ret)
+		return ret;
 
 	gc->label = dev_name(dev);
 	gc->parent = dev;
@@ -970,10 +975,11 @@ static void ub953_calc_clkout_params(struct ub953_data *priv,
 	clkout_data->rate = clkout_rate;
 }
 
-static void ub953_write_clkout_regs(struct ub953_data *priv,
-				    const struct ub953_clkout_data *clkout_data)
+static int ub953_write_clkout_regs(struct ub953_data *priv,
+				   const struct ub953_clkout_data *clkout_data)
 {
 	u8 clkout_ctrl0, clkout_ctrl1;
+	int ret;
 
 	if (priv->hw_data->is_ub971)
 		clkout_ctrl0 = clkout_data->m;
@@ -983,8 +989,15 @@ static void ub953_write_clkout_regs(struct ub953_data *priv,
 
 	clkout_ctrl1 = clkout_data->n;
 
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, clkout_ctrl0);
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1);
+	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL0, clkout_ctrl0);
+	if (ret)
+		return ret;
+
+	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
@@ -1064,9 +1077,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__,
 		clkout_data.rate, rate);
 
-	ub953_write_clkout_regs(priv, &clkout_data);
-
-	return 0;
+	return ub953_write_clkout_regs(priv, &clkout_data);
 }
 
 static const struct clk_ops ub953_clkout_ops = {
@@ -1091,7 +1102,9 @@ static int ub953_register_clkout(struct ub953_data *priv)
 
 	/* Initialize clkout to 25MHz by default */
 	ub953_calc_clkout_params(priv, UB953_DEFAULT_CLKOUT_RATE, &clkout_data);
-	ub953_write_clkout_regs(priv, &clkout_data);
+	ret = ub953_write_clkout_regs(priv, &clkout_data);
+	if (ret)
+		return ret;
 
 	priv->clkout_clk_hw.init = &init;
 
@@ -1238,10 +1251,15 @@ static int ub953_hw_init(struct ub953_data *priv)
 	if (ret)
 		return dev_err_probe(dev, ret, "i2c init failed\n");
 
-	ub953_write(priv, UB953_REG_GENERAL_CFG,
-		    (priv->non_continous_clk ? 0 : UB953_REG_GENERAL_CFG_CONT_CLK) |
-		    ((priv->num_data_lanes - 1) << UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT) |
-		    UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE);
+	v = 0;
+	v |= priv->non_continous_clk ? 0 : UB953_REG_GENERAL_CFG_CONT_CLK;
+	v |= (priv->num_data_lanes - 1) <<
+		UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT;
+	v |= UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE;
+
+	ret = ub953_write(priv, UB953_REG_GENERAL_CFG, v);
+	if (ret)
+		return ret;
 
 	return 0;
 }

-- 
2.43.0


