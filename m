Return-Path: <linux-media+bounces-22786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DD9E68DA
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360A91665B7
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0FF1FCF73;
	Fri,  6 Dec 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oDzVEB9K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B991FCD02;
	Fri,  6 Dec 2024 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473656; cv=none; b=YIApQ5vbF7hQmJ0R6G5AF3KPvxBT/M992d3hHVLnMW4Ef4k/7Xm2ZAXG6+aOCMQLjc8rjrjDmRYXNKeli97nYZgqSzvWOi9hV/HE2YzLgpNsvRUXVcVfazDlP82KUVnCsAGSebVxWLlejXHZWPagaIknCWRphG+GgLlE2+72HRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473656; c=relaxed/simple;
	bh=5COZwvSMdK8s/hcEQR7wWr/vduphQhcGiVXzN9pyDuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5V+T3ooPPEalb585HgXTEjajw2F3fLKQigM4sjeSsmvvosDKq0QJ/CPTbp6kyEpOZcQs1KH3HVDqTkYCBVzGyNIzg23CHzp/Ggo0wSBZ1sSRgxic/jWaQJrLAHC0ZvwhkqBGBVSGeoSRZv0uR1uruiUVLaG4lVkvAtgxHtkMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oDzVEB9K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B35D81B86;
	Fri,  6 Dec 2024 09:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473612;
	bh=5COZwvSMdK8s/hcEQR7wWr/vduphQhcGiVXzN9pyDuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oDzVEB9KkZ8oR/InPTujdu3wzcluxsMKYnOlcgSWIXEgI6zW5pTjSU4+9B3QiQ6xM
	 iXjawqgrDhQmPEq0CS2NsDBPOHP8PGt1BNd8druAScHFqNsIxgqH6JVg9y1XVU3ouZ
	 lcapiXqC5LiIrDAo8e4CF4IKCPvkrdFBJ2kqfoNI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:48 +0200
Subject: [PATCH v4 12/15] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-12-466786eec7cc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5COZwvSMdK8s/hcEQR7wWr/vduphQhcGiVXzN9pyDuQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVfvvGpuzoBnLloZQjJB+o18ZamiH29jfi0R
 wYmdE2F4H2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XwAKCRD6PaqMvJYe
 9eGvD/4pBw8lsAyCu4HpP/M3bcChgVQKuZFCqAwQcNCoNsxAPuwYXBmV0HJg/7ZmTg3R/DgRu7E
 bTYmRYiWNpjPMQS6rEosSqaolF5/RIupCD+Hpq3MIRs+6z4o8mdf1Agm05UoUDIGP81Ht+cOD0H
 SnrrXEIgPDP7T6MBKTZt15s7GqLQUrZEvQz5fpHW015svpGEXO7Jufs8RZTAKeZjOFeIqr1StyK
 fNFFUy+epHe3Gk8+qYRx08ktcx/QSzxuBTDnEsY80eP0PIFg53lUad1Kjg5HQuniqjDrB952DEf
 exsA3SN6TIQ0ZX7v81IV7dIl4+CYAWGXP2bsi+zuvDhp32x3JRBPMkzQAOM2I/pZgPQ8bomHw7V
 Z3ARdMTaixC9cuUcR+5uTrs5DycIF2CbvldQbmwS/4gCNOrpx34yqWR9r44aQpTukLB2VPo2XKF
 r//Y6DTGvieux/LEU1nYgkTO4oO9DeE0yxO6gG8H6oIHAmEGIowUB+TWdSfW0OOQb8l53vndl06
 oHm9rQWDz3mG8Z86M0RUs+W0rChLV0Z9ldabBBBCl0KwgqZ5fqrmFq0QgZsIX8k65I7M6if2vjO
 8ODX24+k+K3PnkanYjVUpAK976i8/+gQfFcnDdEIcxV+l3EmygwwnzemDKmP0oS63cGdZWSrbSx
 c31UE9WHVpjWvXQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c read/write calls to
ub960_log_status_ub960_sp_eq().

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 8e8cda4475af..0db4fc980912 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2982,38 +2982,49 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 	struct device *dev = &priv->client->dev;
 	u8 eq_level;
 	s8 strobe_pos;
-	u8 v = 0;
+	int ret;
+	u8 v;
 
 	/* Strobe */
 
-	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s strobe\n",
 		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
 							  "Manual");
 
 	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
-		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tStrobe range [%d, %d]\n",
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
 	}
 
-	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	if (ret)
+		return;
 
 	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
 
 	/* EQ */
 
-	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s EQ\n",
 		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
 						    "Adaptive");
 
 	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
-		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tEQ range [%u, %u]\n",
 			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,

-- 
2.43.0


