Return-Path: <linux-media+bounces-27359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71CA4C5FF
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10602189507A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD7A215791;
	Mon,  3 Mar 2025 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IlCpmyhW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1432153F4;
	Mon,  3 Mar 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017742; cv=none; b=ERYpzRXsCE4AwyQgggi1xgF9Am/LZ+jUxJCXG3yrEle6TZtKGG4K612uPW0hPsDMj9BLUXQZqv4JlhAmFDEfQSEpr1vOHMKnNmANKsyEZeEJEq7VwmDkDOphPTU6uXBLpE1KC/kC0nKvWak+Fiq/A1y8XTEKS/w8HxAp91S09bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017742; c=relaxed/simple;
	bh=bBOawXfMAUxCvIZIRS1ntyjnXREI2J9jHtmTFXWo5wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYh+7g1CN6BjBkyXmjMXimKam+lA1e6zapgIA1NfXcJLJrPVCspRFMOPH9w4w/VKbM13brODjMynKC4s9X4CwWPwLFmoA26mt4F0T9RhUQ0EBajy+1t9EGS3dr7/JScJ2JVLBZIVMWxjGF7nZpmki8oJvInQ7nhVr+BwQVrw4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IlCpmyhW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8639A11E9;
	Mon,  3 Mar 2025 17:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017647;
	bh=bBOawXfMAUxCvIZIRS1ntyjnXREI2J9jHtmTFXWo5wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IlCpmyhWWDAJw/OpS7H/4dzH2VpoZYT+5lzzlZ3bcPFJL9lzS92Ia44D2CmtQb3M+
	 ghRmk/gsOyWxbqMD22IZHyq9dpkLb9zZ19TIPXFWUE3eKwtBlGqaWa+QJ8nNjSfjk7
	 ro0TtNXJwR3iMQ2ItrxktU8wuZenNqyBKMY+hEhY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:04 +0530
Subject: [PATCH v3 01/19] media: i2c: ds90ub953: Fix error prints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-1-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/auXz4Ow18mNQ+OTf10SPIs0hKMwR0gCoACEFK8Jhwk=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ+5+Wg+GwYCxUruPXGrp7AVupr1DuvKo0Nj
 IkbRAus07iJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfgAKCRBD3pH5JJpx
 RatfD/9KPSDobwF0IrmlE97OZhlr8/cAEvRlDV6LaGlyulg7A2BP6H+tPT+K1nXzSdy8OauFYv7
 xu/mT+ta0a+pdbWy9btI0B1wNsAfB4glSgX8KR04O+l3tBVrHgVLvVvcJe1EPPyfdjpDAi9TNuH
 meZx8NKCVlNrdZo14Qyf3L9bcjrjsDlVpwpoBZlG+l51CCYpcq7PbqY/PlPxmqlJCxG2tu9IkAb
 B48Q4JslFKsuS2r6befNDcP0g/Be/cw1S6B2s3qZtISMVOnBtky9/6M26j3i4ubUpgyMKAgq6Cg
 M06L7oT+oR61TT1Z47HqVTe50oWBNmgNmXnyzYpRKE5JhKpmcx4jeoXN/+hl1qOenloh+WCuOiz
 /NbSp10pJYou0AgV52TVQFdPIizZANl3kITxKheIRVvMCn4+TukUDuGWVnjjENtokVsLuV3kR5x
 Y3LrHoGQjqiAkIQDHBt6Hm5kEROl7a6beyVoCEojb9wxZR9iA01Dnzh+WcCvJqU/yWpQ/PDffCG
 GaMtze7emb/ZqJ6CiH/WAxWiaAgw+AqWeDnhn+wDvv8g7GjABrkn/s+qUxAf5sq9A/hV149thhj
 BF3SHau1AgME2n9umtxZg6pj/moq9pKlzMg3zHTlZ0SiSXG5HkIMMcGJ39mSUlY32Q5GNffvusN
 aXi4OhDpvu1oPUQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

ub953_read_ind() and ub953_write_ind() have broken error prints, and the
register address is printed incorrectly. Fix the prints.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332de3dfd89a0720ada64cdfa3297de..7b33b8cc83c17fce7d3ce6bf73c2ec8bc13a0bfd 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -258,7 +258,7 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
-			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
+			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
 	}
@@ -266,7 +266,7 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
 	if (ret) {
 		dev_err(&priv->client->dev,
-			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
+			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
 	}
@@ -293,7 +293,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
-			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
+			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
 		goto out_unlock;
 	}
@@ -301,7 +301,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
 	if (ret) {
 		dev_err(&priv->client->dev,
-			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
+			"Write to IND_ACC_DATA failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
 	}
 

-- 
2.48.1


