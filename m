Return-Path: <linux-media+bounces-21138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E959C1953
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67FE1C22D28
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932DA1EBA00;
	Fri,  8 Nov 2024 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hS09JFuT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575B1EABB6;
	Fri,  8 Nov 2024 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058542; cv=none; b=nK/nQohRI5E2RRGMcEhKcf3apw1e3yT1xNWa+lP6KS064BgedRBGKRwBfykLq36qVFjKmb/8Pr2FK01nmCdMoUrKweQBTLXMTPY+jQJMoQMK/u5ZqrrBAZqVHFjZ44OK5gfpVBm8E16rar+tt6yDMcAZWFrCJtV2FFrcQykA3mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058542; c=relaxed/simple;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HT0HbIFjNtzp9pSs5GJbmYMnLyt3aV40dVWvo8uPsWY8YGt3tyxFLvX/MVayjMKqi6A0uaHQiTpiGg+U6NfKzA6a9pOeUnH5GLZuhXGKus3oax1PghzUrPkUJ1KacxqanwZsuzVrE8e0H81Dr2iINDGEYvumCBn/m5fMdThsnN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hS09JFuT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 366C51A40;
	Fri,  8 Nov 2024 10:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058514;
	bh=h/Wucr0WK1pNJOQNFzwHPdnYZcspI5Mizs3II33asmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hS09JFuTuQF+UDSKkHFJnOAy1sYOLr0r9AxRQEh5or3lcqDBOktCYqKAp8HfnqI+C
	 ID6XcoLeHphZFbIWpBlAzLbLV30UBJsPF91h9qi/PBQE/BWvuqv8V4AcjRGAisbPc9
	 2IFAkVGsDUz/3IsoKTDmD0T2nectT7qp0g4WEWtM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:58 +0200
Subject: [PATCH v2 14/15] media: i2c: ds90ub953: Add error handling for i2c
 reads/writes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-14-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtSA/dvfkIItAqtjXkr9bFlQ3SvqZ6tMpKpr
 xybx66gCzGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUgAKCRD6PaqMvJYe
 9c4CD/0ZlTyV0z15FPvXSmMJqQ1SjmAYFqIOTOf7Ial3UYC98BIhi74TBfg9dcYlyfLCTNbRUIZ
 d+Ndr9u1WxT3MwOyy91gabwYWI+9K4Q8qG4Ux05EBsucmYIuCbzKwq39RqK9nhyzQ3NkEM8p7rv
 rRTsKhec18K6VgW2200vSTlBxagY2kVBvRxipP1/YURzMULvC/PTDPY7KHYJRDDpQ6noIFdV31I
 SqCyrOp1yoSRyJKZL7Tgf30GWH4Q3DvDxTf3C30DuScCUlFaqBfydSwKFkE/drUDZB00rPP0nzv
 jOasqoXhcPEm38CrY3r7XkcBAu15FASnN6tO4QrmWHBBQVLZY4/oY/XDPkCTDUVPwRl3VMrWn7Q
 khGlc2a7lw3nm9JVyOz2voZilbR6sITfW5M/yp2W05swOU3oQ8nqXUhEVY3R6cllBtAYfADb+ha
 lUyTxxMd+5g18m2FJT1rQP11bt0X0QELJVNA6IdZ6a7j38rEx6t+qVpWiulVMPqjRVcVCm8Wt6z
 zZ5TOHE3sCmzTWmqXtArF1FontTi9JhnAfkjR6MnGJqkjcA0fZlw6aYsgNwr3VxulWvGAMHAtlK
 Q3sdoTZu5cfHEADhnw8Vfy8hMhO7bY2oF+Ep61QUHt2NyaFEGGqiNc1uVBbaGLmmW/gOIT1fAEM
 sEwnD7mAlAwUrVA==
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


