Return-Path: <linux-media+bounces-22788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F679E68DF
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 496A716AF5C
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CD01FECCB;
	Fri,  6 Dec 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bDntgFnV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515A1FCFC5;
	Fri,  6 Dec 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473659; cv=none; b=S8TgpnADrR5VpgJr3oeuWC2L1mpZRZEG7FshqsrtUPSMY2b7lsT3J6qsxvFLgCmqae82KC0POlum2IY04lUiArfRpMrGFzl3kH/EPKWRwR8uEJumd1pQpkoDjrK9O3KCW8eHN4lU0Wi7Q0w9PTXSQQfESFHw/WwPwUl3eSoBNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473659; c=relaxed/simple;
	bh=NPmRcXS1rgzO9Z3lDRnsWUS6ctcuHylQGatMT0LfE3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbdyxyhJfhcPBAVtydb3w1DazWFo8aJQazL7XvROOqPq6b7zNLD8VHSWbf6t+TUZypBpNb6TiDrvc6EVPz7LpwfGnY490tgWB3OCehaFVwSTEwvAtmbXL7KSBNf8+KiWN6gfj0RahiHWHVfrR4cPlHkgCKmqKIfC8+b/oRmJttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bDntgFnV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91751B98;
	Fri,  6 Dec 2024 09:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473613;
	bh=NPmRcXS1rgzO9Z3lDRnsWUS6ctcuHylQGatMT0LfE3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bDntgFnVHZm4IiNH18rwpfFVZwA/UVrYQd/rAXr7n2OG421doVZnkb6FmhQvadhJa
	 +Ugh1lqdsnNtyLLzkyh3KrWooP4dAGABBdsmiyQOfg9+dukvIJvqrYG7JtMmTySVw+
	 edwzGehADFHbhrxnennsStLNITMOpt/4zGNcqCQE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:50 +0200
Subject: [PATCH v4 14/15] media: i2c: ds90ub953: Add error handling for i2c
 reads/writes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-14-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3608;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NPmRcXS1rgzO9Z3lDRnsWUS6ctcuHylQGatMT0LfE3I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVgETNHgXRmiR66VEiftzy26XkSNzq7YK/6U
 vWJ/mhagVyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1YAAKCRD6PaqMvJYe
 9bLAD/9XW4M2p6SV9pbpI7BQ0t4RNjXr+SSjgLfBY+uqLkIqfu4B6oEe6sSvkyN0beyg0bphTM2
 ixIOLiVrhblDcmtmSon/ESvZEXdSPDykqfN9hm65q4i6o7lqJLchOVzMizXbG4a6Hptl+R2M85T
 /Ai0IMPdb5M8zB91WMam1I7kSDE65aZHBh+undAjBynqrafzMqYFFsDNQkk2cUK1evWnTklF1SO
 fyqrXhEsSSgJzPedYz3NfGlcd5t1TCmYfJBloH0lCOgN6u81RlsnezNXhY3fgWwXA2HDAGvCGQj
 wsrd+hh+AFRXL6g4Hc7D1AZ0O59+Bbbf4fe74wqhxs35Y0nRls1HOb6IiTnSEpICntBslDvIBkA
 5odiKxKPbX/2LRFEOcIf8lKRJZWaLIwpMCzD2ibsbYY3hq+JuThWBfUpfo9wUwWVrqrFEckT5fy
 S1ruFuVelz3wsGBsHNd77uTz+wT04TPO6c56AXPlKD3gQfPnwNROVezuF0J3t1Dje9vSdD04mzT
 ZOwotJNPvsdsguwNnDsxfQtFvxmoP6moAC2ZPHigLO6M4+ULf4t1zT9fzV16KAD8HhoWK6zAKYY
 vSdNf0FRP6wSsrj2HhN7ysZqXLmz9HSdT7yk0bG/WT4HpxLf+AxNAEXTl2MJeazEmBIl4maxkda
 qIeqHGmP20ouTMg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c reads/writes in various places.

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
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


