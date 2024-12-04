Return-Path: <linux-media+bounces-22605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE849E3860
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502442827F1
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526931F7567;
	Wed,  4 Dec 2024 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SS5F1O7f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C931F7061;
	Wed,  4 Dec 2024 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310369; cv=none; b=Z5lqZNtHJHMND9kEZZdnEDWYh4YehycUP9so3UBXNn+rmexaIAOKp1iz0qjMDusWNU+hWh5isucvEXK9c2LMKj0baFz3XDG9vmxOoBJxPpvP9+NG2BPr45Izu7+/zErzj7v0yIPE/14y5vZJecXJDVU5zfs/xPH+yTDoxiQwquI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310369; c=relaxed/simple;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOkVV7eF8PdYQjihewL4npGgFaQLo/H5xTTxtq42JOgYmdpsYFQPxgwpppGgHY/hLvHyu2jiaOALRHeQrdpA+0zhecZCI0vaJCL+y6lV5BVU+AyzOq6eOTwzcD3eftBK6/i24Y7i1C3TpyAwe1lToC1yFK6yMxTEXx2ozGxvtHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SS5F1O7f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67E43B2B;
	Wed,  4 Dec 2024 12:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310324;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SS5F1O7f86sQAp3f39ULcd+DLu5J11aiUTNv8JW3ts51KEpH1xEOWUQFzM9Huymiy
	 +al5pAcmLGZLNlwwoLAQdt5RWcXcTSU76rhMGVudFgvxWsZbT+lVwZzQJPzVvjTaiu
	 gM5ilqHX0ZiVzcbeIo5utMlSGqNkE8RjWDZARAN4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:28 +0200
Subject: [PATCH v3 14/15] media: i2c: ds90ub953: Add error handling for i2c
 reads/writes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-14-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeGk/Dq4BHcqF4yxTfZcSNdZmUp6VN91Hi9S
 RGl9RjA8oaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hgAKCRD6PaqMvJYe
 9RRlD/9Y4nGs1k0Zozw4lFGWJnt1103CIYNlZB5IXt+vV7E+p9M0uTmv5DIB4jJQyqBDjuSrvye
 mTf85RbIJGlVuCYIlMu+myKxVh6IehJLspTp7rOsX5E6gAkjK8N2x4xLpJXpy/iLDrTAT6jxJY2
 kYHgOlx/SMY3bckit2dNqMyLBvVa1UxdmrziliUTVDeTD70RfPPHE6ot/eIUq4B7/bXooAH52Ux
 3P4WwuLZTvSCiX+zrg3XHlpVu9iJqiN3f0EbvqJdcH73ugUBOL6fn7zmpi2DyF5dVq7cp5buYU6
 26OhyMt7G2l2xXiEU/kBUIINfCiyTwvFiSjR5dbqylDvVTZDAYlgRyjiwBx4J1lo9NZPtuULeOG
 YddngP9nw0SB1LH18Jal/Upyv2VCF7AqhYGnK1Lhchg9rxCle9JkbJbuARNJQZEsw2gpd5ISPzg
 JRovXCqWbfWAbjt/+QohnLHToBgiKqixB5zUNIwzbwwIYaEBy8gDMJwyn6i+Rj+y6+zQeT5rFkh
 /nubblFynGkfFzfcnkeBwEPHdLGjQ208oNa/JD2VFB3zh4Cp9TsM3oj24XQfKuMQpsNZdzdqQUt
 ZJ3VKpqyGSapDmtjgV6Hs2GeoeuyYyJwtMz8gR1HNakSFcGBhSRU77nFe8OmHZAJDMMRhrzCdmo
 v6KH5n+gmMGp+3w==
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


