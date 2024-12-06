Return-Path: <linux-media+bounces-22787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0729E68DC
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1F4285D1C
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56FB1FCFED;
	Fri,  6 Dec 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C/PDgfQT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E51FCF6D;
	Fri,  6 Dec 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473658; cv=none; b=QqjwAxjXcLJT0fyZpvDxWI7pS31sySux0tv8ib4Wv3/qIzP3s1zervoZgZ1hh4ggQPNyqQYiZIxyNanftLlAfVYZaLYJh/HUGgpZy5cOEiKX38c0oZutSfY/Pnxto0+rGCicE3wsnYk2OKq2KZZIDfvGX7UxwPd9+l11tpKU0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473658; c=relaxed/simple;
	bh=wawwTlrATwlu77FUSKQv7xr0i0QLJWn85E9bt6sA41A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSMhGgqYH00GP0uui/LxmquDJXiJtk1iAR6afmPOhze2SHK6YqDtkJ5niTUSXskrPsob+X+yZrAZVv1LBB10KMj7ccespEFEGkY9C2xFKfVhb3SVrC/GB6TmGY+djxzI5fmbJcAyplGRgbUIszxTdPdaicbjwLdhxDWyYJ1+4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C/PDgfQT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 569EEB2B;
	Fri,  6 Dec 2024 09:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473612;
	bh=wawwTlrATwlu77FUSKQv7xr0i0QLJWn85E9bt6sA41A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/PDgfQT4eVA6Lwkuv1VjeFvIq+d1ZHU7P43n2aq4GrgHKTLIeSbgVA7dOEAJvF5r
	 iHUdkcBZHL+FoeNdf0B9TUMG/GRRPCLqtHDD7sUHc1WRFVioeVl8TLVUbFCaE/2tTd
	 mne9vdsIRAcp8wB4WHe7vdS8Nyeaj78DHSYg+k/k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:49 +0200
Subject: [PATCH v4 13/15] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-13-466786eec7cc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=wawwTlrATwlu77FUSKQv7xr0i0QLJWn85E9bt6sA41A=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVgIo01TOohQgvPnFdvO7BBKWuIN4R5Ztks5
 4Bv0NO6QcCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1YAAKCRD6PaqMvJYe
 9c0VD/0c/G3Ly4P2AuQu5pGjRNxDVpgwdkbrWB8zyH9QPVZ0Y4SLOkPoZnzqqxxTowd0ucLKubG
 MVs8LQqzwl+2t8veCEGjevi9pMux5VcNaKswXVx5P8+A+A2Qez+jfJmrD805EsnyNKZJBtTw5oV
 gBBNbtxlkLYiNhsCPdq5ZcefFG72C/U2RiYLZ06UdDukyIbB4V5jp16wX0pzLfmNxbd3L5ZDLhQ
 odYaIKIenlMyflmhEYB+ayB+DRj6N+NBMDZN2IEguywydCGL+EguwPFZqOHLA/AR751oay6WYh0
 rTmoalKIUzJ4m9xrxCHVcHBbdm3LQpMzuO790UwbjUhZZ25XNHnrvMJbW6pD4GTHIt3Vf/d8xC7
 z/0fjqYbqJjfArbFGn2zLV3uf3HnLC7wJgUeXxkYC9JHwq4unQzJFFN0g2NfualnjKkEhesxtmk
 4wrv0wrHsEW0n4t7D9NR/I2Fkh6jvlWwtF07aJGpVS9bfrwgNY5MnuSJHRlBU83b91l6iwPWJcl
 WDFSjceiNmMTWhEZrwFEt5V2L06SLgnZoYlL/VPQoo5urjKJRAwaKCJYVT7QXMbWiYVg9SVKMCm
 2zQ7o3ukTuZY9xf9nUMF8T+q868dfrOKM4tV7aJi974N1Rwsc7GoTaT/0C0ik2LCQRhNMS+IoHc
 59xc4o6FRooXfLA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_hw_init() using a new helper function,
ub913_update_bits().

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
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


