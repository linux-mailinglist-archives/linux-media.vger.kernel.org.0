Return-Path: <linux-media+bounces-19102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F79906CE
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964961C21E92
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CE11C8776;
	Fri,  4 Oct 2024 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K3+Wm7b9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD521C761A;
	Fri,  4 Oct 2024 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053257; cv=none; b=KMzXTjmoaitLEfXeNHt9OqFexWj0BcdnueGbNm+J77owNvL0ElJk7bFrSmgqMz8bhi2yInlAmpf/xjVenN/2O5x5pv1mZjfm5Y7q2W+wlke61EPOfkw+HBhOVBGXJ14X8i4+gJJZr/yG0v492OBDV6H5eiI/wy6NP+S2Q5BbU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053257; c=relaxed/simple;
	bh=+ZxOAztOuJeE3hYoiQ1EiplfA7HJJP/spI/ixKxrsf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcDkJ8w+Q1Ru/FGVErd1fiDoV/rmB4J2h6S4TvuhYMEoMeuEnOjy3gaIXU5U1v/OLmXxWwjurq24BtxkNI6NSA+teWidnylvpyVVQsA87Huwuu/ZcHm37UqPsAvV7wDmi2F+CYD97ublBYQxOINvp+JfI3oCugi48Fz1HzFOLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K3+Wm7b9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6781317D6;
	Fri,  4 Oct 2024 16:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053146;
	bh=+ZxOAztOuJeE3hYoiQ1EiplfA7HJJP/spI/ixKxrsf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K3+Wm7b9vjtgRf+yCSZjrmf6gdInIfX6b/pXpMXfkQJApwzxmjZNQ9yKImWgKGWlh
	 1EcESIROatqZE2Gs8ZSOQ0vMB7/K1tGMKFR+syOVlj9GMNZF0X9X+t5LbF4qLRbV4H
	 YXOOIV9DwatGwsCkOZvhiXGfTiOmpb2GmheQ8h/Y=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:43 +0300
Subject: [PATCH 12/13] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-12-e30a4633c786@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+ZxOAztOuJeE3hYoiQ1EiplfA7HJJP/spI/ixKxrsf0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///wpKrNi5tRqkM405PXKPOQ1epABh3DRq2m8
 adne70l3qyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//8AAKCRD6PaqMvJYe
 9ZTED/4yO6+8OpikFMHTLXfHuiZnvx+z8P4fjp1ey5atbQXxjCkfXusChh4npDWEyahHg73CI8b
 VILe+PVBsWHzIBvBmbJtkoa8eVG1xuuIYHX1gCwyRJ2R5nVk6lerzEAbA1pBVm2Uwi/IqysOQDy
 coyFTqj0oBOfmsJuXrDAU2B4r6zVwQKJp//gGlWESCRLmf7JvT/bC87uWgqM6Fp4zlAGn94M8sE
 V6wm2KefkSTB5nFlWpEtFvR2tEi+KIqcbazudeojevpw6PTCWen7nEr0gNNlLooG/EkWRxgxeJ8
 RC5mw/ZDY9Ezt5A2LwUL9VJX6rZjYhSsLZjow9Ev35jvXxbhYkvLXiJD1idcU/0Fgf34t87or+U
 p2O6GmoUZNIx2SPNwmbzj+cygl2uMzQx0rpOWqoypSaISmHrwIjL3tE0yvOLNAb2ejkjAyHn3j3
 jYakdR4gQ9Z5iM9Pzy3RO6b+dFWxdVe7OwmIzagl5IM01e4guTJqxFJ4Ml6HqOpg1oDXsTG8x7D
 eqvDaSeZYGX6ShYQ3d5puQ7P1OICJrml/o/3yItGOxD+g5WCRP6MaUwd6y9PCYNyC58dsrjV+GO
 jRO87zR3uxpaLHaKBmys9gqTBXl8A75pZVOwjbQdHrjaQNLfczLU3+OXjXKlCm/dledVVsQKcNE
 TnnKxvMgESnCQJA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_hw_init() using a new helper function,
ub913_update_bits().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 150d6641516f..8b540b360e79 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -146,6 +146,19 @@ static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)
 	return ret;
 }
 
+static int ub913_update_bits(const struct ub913_data *priv, u8 reg, u8 mask,
+			     u8 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret < 0)
+		dev_err(&priv->client->dev,
+			"Cannot update register 0x%02x %d!\n", reg, ret);
+
+	return ret;
+}
+
 /*
  * GPIO chip
  */
@@ -733,10 +746,13 @@ static int ub913_hw_init(struct ub913_data *priv)
 	if (ret)
 		return dev_err_probe(dev, ret, "i2c master init failed\n");
 
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
-	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
-	v |= priv->pclk_polarity_rising ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
+				UB913_REG_GENERAL_CFG_PCLK_RISING,
+				priv->pclk_polarity_rising ?
+					UB913_REG_GENERAL_CFG_PCLK_RISING :
+					0);
+	if (ret)
+		return ret;
 
 	return 0;
 }

-- 
2.43.0


