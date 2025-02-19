Return-Path: <linux-media+bounces-26380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B1A3C0AF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D146168EAB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE491F5619;
	Wed, 19 Feb 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rAhzs1jK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135641F4629;
	Wed, 19 Feb 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973000; cv=none; b=kbaFtq/y6DvXA7yzjCHL6MBG0T2oXCfYrj1FOVmtYFaKpZmot+Y7wUHANDGqGF3Lx0GoAhrcwcUkcc9PDwhxV0xqDa14x4YRowc0a59ySyoY9mW+ctuY+48vvsk2Ge8bv0889/8kPzodZFqJrR/PggY9inBNa07JNzXlamQVXJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973000; c=relaxed/simple;
	bh=Wik3MCT/8mMmWyYgUU93n7+wbTYPLNdfK0ZB/R1V7H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDfpEpSDaDnRoIScK5f1NSsxHF8TjUapAAD0x3I4SaHKpTNC/IP5xGIqqLyhr0/d5U3oMU64luao0v6/Jes5Fttwli6r0SweQgDsY0xRwCdzmiGdJmIdqbgUPGoxNvR2WBMEuZb0AG/fArvziFpNC2NKDVozViqCe7HHnVa5d8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rAhzs1jK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3779E1934;
	Wed, 19 Feb 2025 14:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972906;
	bh=Wik3MCT/8mMmWyYgUU93n7+wbTYPLNdfK0ZB/R1V7H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rAhzs1jKVzse1tqVdR+4E5XKEL8u5eeJp7Z5LZc2M47KTnZzKQcdrbyCBWQgbjqkD
	 bhx5tU+tvUV5ods+JLv7bH7ZUE5UfUYX8ScTNCLTfCj/l2omxYWbzv+N1tZrX9ecZB
	 rmrJ9focZsGvyQIf7cnLOhFsHHSj28R17FEZJ5mM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:02 +0200
Subject: [PATCH 08/18] media: rcar-csi2: Move rcar2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-8-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Wik3MCT/8mMmWyYgUU93n7+wbTYPLNdfK0ZB/R1V7H4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFyMO1BKh2HE+YUW0FWd5kQ4NKSH/KOsrGyY
 VISgO9perGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcgAKCRD6PaqMvJYe
 9cstD/sGpAGbbMhxLdUmNX3XbgcyeSXfEzYy2uSnnoy131xN8jdlkEfa9wwes0fRvLgoOF+s3pi
 sprq1cdoLwRbJLvVa/Cg6y1l+JWV6EnhJrd9X+eG5vXOnFktaYjeBOVZxQnUXNjnhEhhDnNGhrW
 mn74+5nzp9pvidOGmOG2+NMvFhQqopBNA7Ol9v1cwBJOUxqOPcqY16yfIW/9DkFseGdJhHoe2Ip
 9fzTeZySUbzczLtrZv0aHgHaEjP6OcyayDs/9nkryNReNwWwC5ywOdVHd3nuO9nwt4AjgnRRLLA
 H0hvNxRm7fQKgDFfvLgPw47cznY7JYCaDeXeRRLJSmEzFOMlgBVbkdylzzD+ivj5WPBu8SdULP7
 gsuqOLh7BWpAFFOy87XGDqGRgs9fW8z0TfdFBaN17Wcs7XiutwxVjekA3Pxa1AO36Mvr0lLXAgx
 xSGLLf5u19r4rnVtEf+hf9Zp+ZptrzUfjVoVnKyb/QYzVx4azcmjbKFXjNbP8omMv/zNnF+UFyT
 PG+6vxRilfFDexC0kDZCIP36LO5eFAQx/GDFH53EwMa/zCpw+0QIkimse7sZnSL0/aQ7H5IuKPX
 B+gznYDr9XkCYRdCvoa0SsqcI40XVHoWAnrkwLVzMCnApwaCAmH3//9RkpHrlrk7i8TeE2m6rrJ
 921TFGqHqFMJsqw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the function so that it can call rcsi2_get_active_lanes() in the
following patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 62 +++++++++++++++---------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 92697ea3df01..8de0f88aca61 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -951,37 +951,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
-{
-	struct v4l2_subdev *source;
-	s64 freq;
-	u64 mbps;
-
-	if (!priv->remote)
-		return -ENODEV;
-
-	source = priv->remote;
-
-	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
-	if (freq < 0) {
-		int ret = (int)freq;
-
-		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
-			source->name, ret);
-
-		return ret;
-	}
-
-	mbps = div_u64(freq * 2, MEGA);
-
-	/* Adjust for C-PHY, divide by 2.8. */
-	if (priv->cphy)
-		mbps = div_u64(mbps * 5, 14);
-
-	return mbps;
-}
-
 static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 				  unsigned int *lanes)
 {
@@ -1029,6 +998,37 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
+			   unsigned int lanes)
+{
+	struct v4l2_subdev *source;
+	s64 freq;
+	u64 mbps;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	source = priv->remote;
+
+	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
+	if (freq < 0) {
+		int ret = (int)freq;
+
+		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
+			source->name, ret);
+
+		return ret;
+	}
+
+	mbps = div_u64(freq * 2, MEGA);
+
+	/* Adjust for C-PHY, divide by 2.8. */
+	if (priv->cphy)
+		mbps = div_u64(mbps * 5, 14);
+
+	return mbps;
+}
+
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {

-- 
2.43.0


