Return-Path: <linux-media+bounces-25372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B0A21018
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF917A1627
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859DE1F9F47;
	Tue, 28 Jan 2025 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooYzn8T1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42691E00BE;
	Tue, 28 Jan 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086879; cv=none; b=P4ZJXVPqiB+IOlcrum3oYi/qnkFDKOt+kEOUhuu98e5K6Ny1STN7dNCdYlondRHYV+4MxHbW2fehZHyqlSRkXZZBue6wDSqbavX1ZACTCTeC16uVv0UmqnaxdCdKusjrdGC4W2kK0qXHID9ogqFYCSM4dE/Bpm9/H7KOeTdy6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086879; c=relaxed/simple;
	bh=pZ2GkSeOG1bJyzI8N4dGxsbB+VSA/yo1F4rcK5bsKRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2WHo0S6JqqfnuMLJkkSQP2W2skqHxt8TSSOnrpTMKgpdKcu5xK2kepakEJBNopsX1l/MDTQ1JP2ZoCt5nz4h4loyt8CuABb8uqLqzMw60kdbq5Pyt7lw4jVbJUuBQIyLTKfWGav+UQWVv8qfRaJqbyw4+jB1FX1Da0noRhWPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooYzn8T1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9786BC4CEE2;
	Tue, 28 Jan 2025 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086879;
	bh=pZ2GkSeOG1bJyzI8N4dGxsbB+VSA/yo1F4rcK5bsKRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooYzn8T1I+u0+3wXqp6Q8tO6KR69Wtf1RT+wT1z5LCXeAqoXBjBHxzDfPzFxJgFWB
	 JfAMRHlnyDtIrdXYn7ikchygjdrhRFbBYQsI26c0RG6w89Vnh3RGW7lK7FiDCTcR4E
	 mpq9UEgzBOQXAFW6wGR4CGyQRsB1+mPYNK5CuW/5Repf4PKV1E0gzgIfebqadybVsX
	 Zlbdy2YzGatEf7G1HoGWCJLeWkk53/VHvnBzVw3kP0yTRspSOj6ljiTkOl8fwEVZ0d
	 eeF7Qte05ZsEGVL3RNalr1k6T4qPPz+RWhgO09yK1VL+XoKbobUpj7/y6ou2+3q1WU
	 ikwhlvBKHwJRw==
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
Subject: [PATCH AUTOSEL 6.6 02/11] media: i2c: ds90ub913: Add error handling to ub913_hw_init()
Date: Tue, 28 Jan 2025 12:54:26 -0500
Message-Id: <20250128175435.1197457-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175435.1197457-1-sashal@kernel.org>
References: <20250128175435.1197457-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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
index 4bfa3b3cf619b..11cb62d422b3d 100644
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


