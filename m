Return-Path: <linux-media+bounces-21137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D019C1951
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71131C22CDF
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98CF1E909E;
	Fri,  8 Nov 2024 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BFU+eCir"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4D1E9067;
	Fri,  8 Nov 2024 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058539; cv=none; b=WtDbGcYcABVd+RSvUr1aJ1SijPYMLkSRfZb7ivg/5JjZMY5WZWwZaHpSsRgI3DxDHlcKl2+VGG/n+ZeA23NCkoWku+Tmd50DYB8uh2ddRsdinz9Tt/38ixZJnTbJCVpwMNCG90D4MCbE6nQbSc8Q51AoO88/TkG3/1KmrccAkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058539; c=relaxed/simple;
	bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fATwRxnYZw2J0Snx767skbeGPz9jc9JpVJqru0IRHFUs7ARD63MYHYrWrn2JV2/RH9WmSdRSnCltYluj6vthpTuiBsoPYFkwVWw82py7WBj6kjlv5MhA1v9PrGrJMlZPNDLxD4LdHGo3JkKqGXKmw19tct1S2UYIBynU+cNwFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BFU+eCir; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F57D19F8;
	Fri,  8 Nov 2024 10:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058513;
	bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BFU+eCirGNtjW4hEwuEH0U16PUlojgutS+8rUZbsomG1XDUHDkIUBGMLXIwEAoyiA
	 MMow8FZeBpuZvqxAIhtESwDJ1xYrrm/5tNVQnABBKZ2RZ6BuAzlA8SEcV9TAp4zYtF
	 Lgv9GdXYc9agIQEBDLF4gKOPkZy66l8GoPS8Hvpk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:56 +0200
Subject: [PATCH v2 12/15] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-12-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtRErQZjLah8pu+FWMv1Jjgk4eFr78wsmb1H
 Nlv93HlKyCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUQAKCRD6PaqMvJYe
 9btyEACaH8SvLnYHyGGwu2TZ9KTo/YHMB0adC3yQmsuIwTUi5p3tPpdGM1Bpugyb3hJGr1LQ4ZK
 2H0aZpsTxyZE9x4rDTs2p4/KiCfWB4K1w4JVTRZ2LEx+MTs/Hq1FtoJNZpxjSOOeR4gDKa+o6BI
 y9zL296l3k4x2BS1f/dGFD+Dp8GxfdK554/EBFv0jWKfAv1juJo0vzwS2UKr1+s+3A1D2TKeEoU
 LCggmnmoIbV3m56DlP9bgyc0oTFzE1FD2RHOBUZJ2H9tlLn2iTh6s2qGnvUMqcgDATc1eMMjdiX
 O4K6VAn8rY+O6LNoa/lTwwrWMKISiDRhFQwbdNnoGycihUbze1dq6W2fQS9lwfIb8B8QjiLW0dt
 bmR58zD+NExgRiJIu8wNfKruVkHNmUh9x0c49BtRBWwyLdTUF1kEXOAWmPnRBn0m7pCpWeJcscL
 mNjkxoJJg+b7GTshUXKqDbN01szFQxmkZoymyZHecTTiizxPNysQwZh1uefTSTr2wTUYZXZz/Jh
 PAWejtYqH02Ps9nLv73g0DLJu31NyMT+xRE/b3nAtwyNg2cYP9zcEp5pfsuF2OLTPB1/FmoEARF
 riXTZh55ZMKB1zw+Cbb57JQAPEwzJn69i+vS5BN8qitgcMX4mCuGFWvaQPjYuaQ9/pHZZyi3wB/
 ozkxquzEKFTVwRQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c read/write calls to
ub960_log_status_ub960_sp_eq().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 64b5297c5f22..1dc10b2ba1f1 100644
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


