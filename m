Return-Path: <linux-media+bounces-25357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CCA20FD7
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686F93A7488
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120C31DFE01;
	Tue, 28 Jan 2025 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXNJeVcD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823E1DE8A6;
	Tue, 28 Jan 2025 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086834; cv=none; b=WWL5TEDkuRjUPe/49qbUqOrJzH6ljQLIN8aFHjEGVjZKk5jfrYvMClc9htZCwcdT59GGAoflH5GzdToFeDdDnpwbRtFkmx7rAVVbSL4EZO2RI0q8Ph0EJLrfZG2k5Q3AfJXqox3/5h3ZhsqEbugK7zdKgf9w2IgCfoXitts6e64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086834; c=relaxed/simple;
	bh=0qv+5Ubsd9PZC/w4ggwoSrWO2W958BTArHutbl6rMGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EM7Mlil430cFgLkFrtKOyi4DyW2qnHXqIgnstm/MW2GOsrkJeZn22KCQPzZjhsSD9FwJMb6Banc9IHmJWmoas9u02D09BUfZwi9dVpPzlBzqw1qw8PXmbIsgi0/VTzw8Q+jY5XnOna5EonWzkrK149iZ1oyDao56Z+y6CobSBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXNJeVcD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D8CC4CEE2;
	Tue, 28 Jan 2025 17:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086833;
	bh=0qv+5Ubsd9PZC/w4ggwoSrWO2W958BTArHutbl6rMGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXNJeVcDaG+hnQp3atkOvGqgb/DOJnMYUmhhbQD1wj/pCw9cE//C6DQ8ayVuJ80lN
	 oeUD5vSi8jbxwhyHBsBDDYy3fh9vLMlrZ3DrhalVFY756qGzaCuii0G3AScKcB/TTL
	 zUU17CAsA9qtHAZuz4MMNXCCmh361INobgk7FKSEAERTnyMUSc8FFYZvauq2pMO1Na
	 x+DndmHwvMxB1jXFsAYbreYPvdtOB24bDV7Is2l0W+qHnSSHlcK7dbky9V8ghht6dH
	 BCRFJUJ+zwOtyJqXzOMZFfYK1Axp4w24IuxvU1qdz1K+WaAp/7xeXO0on2dmIl7MWc
	 f7HBseyIYaFIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 04/15] media: i2c: ds90ub953: Add error handling for i2c reads/writes
Date: Tue, 28 Jan 2025 12:53:35 -0500
Message-Id: <20250128175346.1197097-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit 0794c43ea1e451007e80246e1288ebbf44139397 ]

Add error handling for i2c reads/writes in various places.

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Closes: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ds90ub953.c | 46 ++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 725589b3e1c58..9baea95cc204f 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -397,8 +397,13 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
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
@@ -958,10 +963,11 @@ static void ub953_calc_clkout_params(struct ub953_data *priv,
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
@@ -971,8 +977,15 @@ static void ub953_write_clkout_regs(struct ub953_data *priv,
 
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
@@ -1052,9 +1065,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__,
 		clkout_data.rate, rate);
 
-	ub953_write_clkout_regs(priv, &clkout_data);
-
-	return 0;
+	return ub953_write_clkout_regs(priv, &clkout_data);
 }
 
 static const struct clk_ops ub953_clkout_ops = {
@@ -1079,7 +1090,9 @@ static int ub953_register_clkout(struct ub953_data *priv)
 
 	/* Initialize clkout to 25MHz by default */
 	ub953_calc_clkout_params(priv, UB953_DEFAULT_CLKOUT_RATE, &clkout_data);
-	ub953_write_clkout_regs(priv, &clkout_data);
+	ret = ub953_write_clkout_regs(priv, &clkout_data);
+	if (ret)
+		return ret;
 
 	priv->clkout_clk_hw.init = &init;
 
@@ -1226,10 +1239,15 @@ static int ub953_hw_init(struct ub953_data *priv)
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
2.39.5


