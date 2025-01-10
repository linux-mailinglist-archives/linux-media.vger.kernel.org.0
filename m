Return-Path: <linux-media+bounces-24581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D909A08B12
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77EC3A9AC9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DA9209F53;
	Fri, 10 Jan 2025 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TT2D/FJL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F32209F31;
	Fri, 10 Jan 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500512; cv=none; b=IYXwjpXfPaIR2068E/vJBGCh/zuWQnPlT/BotP0S1TXlQ66TYHSDqvC9QO520Q1/YWCpjnymhLlSR6GyoAKL3kXmVjfj2rnOwv1rHb/R1OKPo4RjCqZQk2FphLuSapEx6VgFZRzDC/RemhqXRCDcc2+SbPaogn8KBbIFQocfc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500512; c=relaxed/simple;
	bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB3nIdRNk19Z0+A9EPkWl3mYJBYPNoA2a5UdU7llm3adY5ZpEXFqqIXdxp66VUS485dNO8UUNTxIlh5EvRZ0aClZbUmf2rfA/e8or4FjJfHhHcF7gDD2qWKBC4XONRWkDgQDThyUnTxHxy5bZtLhpVoNPfb6FnZAeqK4X5LFN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TT2D/FJL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC4EC8FA;
	Fri, 10 Jan 2025 10:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500451;
	bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TT2D/FJLSbchbZcSaUcDSV7qNs5aLcFltFomFzwXakFzext0reoJurVFu6XznUgOo
	 IWjDIrFdb7V6b+hfGifRnOaLPDUyM5DbkYKA0GT9xXYl7KMisnZ/8iz+4P4AcOD0Sx
	 Q0hQHJEB+ye4CCLamArPi8olXCtitnS8jWKL/MUo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:01 +0200
Subject: [PATCH 01/19] media: i2c: ds90ub953: Fix error prints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-1-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jvxUWvN2M6OAGbmHyJyxwhZ9FVde0WTx8Uk38EihmOg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUQQ5A0Wb+F4qbnc9nbX34HHAxZI/Gpb/Ugk
 eAhLMUYUreJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEAAKCRD6PaqMvJYe
 9TwXD/9wvXHMAYxWpK4CxAIdgnpjTT+Loi8zuE6jfUeBLnbLCVMF9E2YIR0BDZRiWaiODvmcn91
 OVrqDeWXg11F3IK2w9CSuFwclq3aFo7fsBmBK8yYBJnXP27ZPiSFEQe8Gvdx9ntqnpfAzihMlUs
 /NnxNl01OsjrY9CZfTCnZT9LO4Aflxe4xtp1qx40G+cmNu/9U7UNLFeJZt4uN6L09omqrnv5w1w
 3p7FHXJXMz2wMF9QAjTJ90qJMIXRnsMGYkqixBDPYOpIdG5IHOU7RDIS0w7DbYHkNDsewFk4h18
 CLbl7ILWWc+dKcg2lusbG68ys40K2HUrMBOOpr8jejVoKnuQrG3cLRcsQ+aGgZIZRXNNdsC9DnR
 z/MGAo6vsLGrhjVBbsJRS5dqOfquRakxZFFH509Ld1oeUbA6/x0bU1a0L2kure3Q6afV11Wai5C
 nykV4dm/ta0mHeJ1GaO3lK1cGspwNNxg6wPOCKMrZ/dneVsk7WnCwfpiLE6Hk9YURJejlejMi9q
 4++xPvPf4+jAKFddzhiyCszmg0JMU1uTJrtj/4vSuMzV/5kQG2aplTtD++8q1JkxFRSOej9zR+z
 pcK8GggFxNDen6giwAnn7PkdjSBXjC6eLCQBzTlvBSC+JPXsnAy9m+FZVDW3VvDkbgJz8gd50z7
 pVYVGR7BZQYbKaw==
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


