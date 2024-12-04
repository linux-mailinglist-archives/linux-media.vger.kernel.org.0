Return-Path: <linux-media+bounces-22604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED79E388A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89A5CB37968
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C721F6680;
	Wed,  4 Dec 2024 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8PbDpcW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD841B3955;
	Wed,  4 Dec 2024 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310367; cv=none; b=eAklhgLiwnxfU+zdVfpgCsds+fOpMKMObsudDdVvaKg4xOl2jrCjGKBjotqNuPEcyoQryYvnN1UkiV9IA5thPpZP0BmoxLrrc49cvBYGSBQgPuVkV82I9UUaI7g2Wp/Vexr4wJwj7EBwKENlyJpMcDmEI9FpwTeVhH2DX7om+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310367; c=relaxed/simple;
	bh=ivD5dRvUaz4myV9dQNU7bKA0VacIzVN1VBewFKJTG9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNpCQUi0P2roJn8M1z2XiY3o9I5UACgvmSViMwvaQLCAUU+F51QJigAD29YRRUlZEkiwuncECAnUG9C+jTzazV815i0c5GzZTg8CfqA9RdeNywUdm5cS3Uo0KlzPDojIe1I+ih5ekV4C9XqeQm32mgYiT4i3ieryC3epqGynZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8PbDpcW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD38E1DA1;
	Wed,  4 Dec 2024 12:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310324;
	bh=ivD5dRvUaz4myV9dQNU7bKA0VacIzVN1VBewFKJTG9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p8PbDpcW0ENlmxPv1s0jmBggzHcTRO8Thxw9zjaw8FImVUOynZyELABsJhqVTPaR0
	 4JdhpS0yJwZFLUtsp4Osta1GDdA4Xl4O1GzW5WewoYJRKU8rGA5bwPPRS/J2vgU10J
	 QI6vDryqg/DDAUIiUMVPyuF4ktOqOKJOiCPau+jU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:27 +0200
Subject: [PATCH v3 13/15] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-13-a933c109b323@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ivD5dRvUaz4myV9dQNU7bKA0VacIzVN1VBewFKJTG9o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeGPXe1noBnnx3mQJFJyXevBYE6dVpItPCyY
 oj4fxglXKqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hgAKCRD6PaqMvJYe
 9cSjD/0fVPIqmiaV/dII5LZ5ksz/pvvz4MxNWpLuz3pOMg1xLN9t9/fy+5D+IQI7vHjBHFffYvK
 TWD7RcgW0XyDECCkFkrChtFzFKxnqRcYSr5WO6AWB2JZFKrvNEZSaDXN7BhLjxbHo/AhUlWNWlo
 cf4WkRnAdVNG8FVJNZb7Vv3l7PjrHqxzTD4BGSHf1s3TY5rullgd/pZCtml63TKFGu6Ns2NLbMe
 bIrftWAptbeD/BJN5va/TEodlEAAM7gl4tz9CnGh5Yjj+ulY5DbtXbq8jpVdlyI8/vi7D+sAc92
 czQP7GcJG6XcC5Ku0OkFHL7PgXMiSpQhFXb0HMNAk9AwyAc3S0I2pcCOr05VnozpOxawOAge1sd
 AJxAk9G/Dkg/1a9NsOfwd8o7WfHvSx4BM7fGUQaTKPb9peNuV+twB2gkSBe8hap6gTcRFbPlov6
 YbOcfPtr/4mOfCj8aKyI1Zd9zBJ+fIW3sr104ps1AZwepOjMn0eZojg+APSFliRQFJSFgpJ7L0N
 nWJ6VWbPyiSvp/VU1pjZZWrlPQW0P/dp6hzcFaAuC5lTtPw2YmDvpnvamog2/Z5vocl9JU3A5p0
 AtUGjJWXJ8S8MMKhdGnqIxcg+giRz95BnrefFlRu5kxRaB6X48pAITW7h/yZXiVERWDuy9WMiXe
 f51esaTgwqjECsA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_hw_init() using a new helper function,
ub913_update_bits().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index b5375d736629..7670d6c82d92 100644
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
2.43.0


