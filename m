Return-Path: <linux-media+bounces-25269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B118EA1B8E2
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A381890FA3
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E1B18E02D;
	Fri, 24 Jan 2025 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bUwQqmCK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6B15855C;
	Fri, 24 Jan 2025 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731897; cv=none; b=ellLihvII076pk9DDMh+/Ia43yWFR64uzLNdRoi+LJN5uo3hkj6Fv4xviCIcgZ0A6ZF61tSJR0eBb7R9zW4uqgjD6l1rea0PjsWP2jI2hlomBieYyoQj1kf3JCLXh5zyZD33NpT21X/IxhAHDkdItwFR5KNNykdK3ZbxkeE3+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731897; c=relaxed/simple;
	bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy017TNDQoSvPDboKGEvnitxEn0TZ7qXzouT40dVolFbsJ9jNwxKfWUxu9REz1FPVjz1Equ/BwH0GYsqdlwMCxoAK3mPfzujLz4jVJP37KjlIDlnGT0MUxzZa/Z7wTFcZf+cDLmJXrWeSrjecL1IIbFbvYb9BUspqbmM+TqY2pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bUwQqmCK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4689564;
	Fri, 24 Jan 2025 16:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731829;
	bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bUwQqmCKsVmV9XH6yJI9u9Px+N9+VX+JS8mDLQpQpsgJO6jNcrVfxfmj0vAOg/jEn
	 OOaLaP/FQngXMESk5bl8qFjLZZUxBk8k1C2EMd3Gbiy7GfoK5Ni5w/kBVECfelwYtW
	 oD0KWBSsoY5PmmieFHFOqnx4LLtBZJTVYScnEtkA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:38 +0200
Subject: [PATCH v2 01/22] media: i2c: ds90ub953: Fix error prints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-1-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68rVOiiiwC9C+BZXHVkVPF5/p1QNvzKMKzf2
 LO32iKtaV6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvKwAKCRD6PaqMvJYe
 9SDaD/9RNt4K3pz8mEGnolvfizT+eQDt0SgVc1r58yyW+M3JEouNUXFU+ATt3x5sTAHy77Ukauv
 LXLxSCz5V1962JlIDrVJZwMIARSeXNx2+Epzihv4mvvhstqEiNJVlrxGPT6lACkbo/0+v5G6XyL
 Ow4OyqAWI7DcPeQJPKi/CkygYtOrU9/gURKS8swYPg3OUnOY7V8W4Z+V00vh5I6H2p0NVkTJseW
 dmTe9h+31FYD7789yeulv1fhtOWHd1+AbuyaYvZxxCDPaAOAR+0RTpwkqiR9uYWRuVZ92q6UMuo
 T0ZbieDZSau8zhPElAQu0W58P2QURy9tOuBGewvW4IeFX966XInNOKzmZAyOXZ3BvSkSoWr34Ti
 y+Kg4zsv8LsVsvwDb2Nzvs42GZ1Iz7ftmghcuBXiWPRf8CEZhWGCnpbU3faINWqWp4foxjUwoHQ
 CETrnpMHcLmJFVR6mFBItrwnnqwnaCcupnrAw8W+JhqxOwtzwgIO9+fz1uGOuFGTJfP9CLs76N5
 gS2kLVdKmEx7qvVHRR5LxCULMfrF3MLGdCG+S/guIlFTb6d+9pkZ5TF7yUQkvmSegTmtFtm6KQE
 kakje5wAQTXbYDrM1Jjdgz9AiduQbo0pPzV/Lsi4YPF4Er19RoNsx+/cblR0j9+gEckTQ09NwWI
 Dtj6md7YytzJySQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

ub953_read_ind() and ub953_write_ind() have broken error prints, and the
register address is printed incorrectly. Fix the prints.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 028892cfa361..fd1c442e8a07 100644
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
2.43.0


