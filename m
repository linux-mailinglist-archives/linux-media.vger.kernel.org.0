Return-Path: <linux-media+bounces-25356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E58AAA20FD3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B67B16320F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC971DF96E;
	Tue, 28 Jan 2025 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzioVO1x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A041DEFFC;
	Tue, 28 Jan 2025 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086834; cv=none; b=u4ftEQFSUcDnetEnL1k5eMEuoFl8oc/838w61vW81ixTpQoyADWVLW2wAosnbX62o3lOBtZgkxa6PYs9L/56EDqd5SsLjtuMA4wZ2Rb+OowgbcwthabDvy3txi9hYyrGeN77dBBOAOT6W8ZG/bv4wsxp7Q4wlIOdCRRb8/buH5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086834; c=relaxed/simple;
	bh=ERFH2H++ppHidXVCUyHS8gWdXHU07AbQozk92/HoXyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ml07CC4ZuUFFxiuRWCXqR75Pl6aes+yD5MaGqWTjl31QRgwkoe0TvOGBWT66/dp7XJQuTQ6BP25uIDmnoGj56FEVoHYJRlWlvttdB2B8xswOuON39qpAC5oiw1mP6hHdQWdd0x6IlX54qZI8+lLH2iy+YGf5oY2FUpokke0yt9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzioVO1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431ECC4CEE4;
	Tue, 28 Jan 2025 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086832;
	bh=ERFH2H++ppHidXVCUyHS8gWdXHU07AbQozk92/HoXyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EzioVO1xhLrRydlE5UBSR+qSSiC+8aQ9mrObzMjMA1TvUKdVIoii53A8aQrPO9whf
	 9AEFGaxd5v1pzheUlIJLKz6nqCBYgAQX2uVTh8iuq5fw95+H4tCK/whtR87LumV2I3
	 uhiQjv7oargUkkzPcb3KjhBtL98ynbDfQD1W8KrmWrmXvIXYvXzxGl/jcJMTyseR3F
	 n8CwXQJU9Wb/qGI+KdjfxmvCUXLIHuMMMu4Xr0BRarScW5rchRzYf1Xj1wJUVoK7lM
	 ZjzZv33EHmIJj/+JffzC5yJDB8Vo97Oz3+c1zBfrO/WfBZpffivt4uF+2Y9NUQWP++
	 V33jCDfXsEJaA==
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
Subject: [PATCH AUTOSEL 6.13 03/15] media: i2c: ds90ub913: Add error handling to ub913_hw_init()
Date: Tue, 28 Jan 2025 12:53:34 -0500
Message-Id: <20250128175346.1197097-3-sashal@kernel.org>
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

[ Upstream commit acd8f58d7a3bce0fbd3263961cd09555c00464ba ]

Add error handling to ub913_hw_init() using a new helper function,
ub913_update_bits().

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Closes: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ds90ub913.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 79bddfee2e2ec..abfeff5c86068 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -146,6 +147,19 @@ static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)
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
@@ -733,10 +747,13 @@ static int ub913_hw_init(struct ub913_data *priv)
 	if (ret)
 		return dev_err_probe(dev, ret, "i2c master init failed\n");
 
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
-	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
-	v |= priv->pclk_polarity_rising ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
+				UB913_REG_GENERAL_CFG_PCLK_RISING,
+				FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
+					   priv->pclk_polarity_rising));
+
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.39.5


