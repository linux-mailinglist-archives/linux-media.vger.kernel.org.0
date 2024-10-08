Return-Path: <linux-media+bounces-19209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477899429B
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAB0C1F2100A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABFE1DEFCD;
	Tue,  8 Oct 2024 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USxXkugi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E28C17BEC8
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375672; cv=none; b=UBEFbdl+sufdHi4NLBFoqMexQj/G32E2AfzFhgqc+OoVRgh72EUIEfDf0ZQHWPoxMlr6HVkwHJ0jiq461dJ4K4CKYbSZ7Qa3g2ZPRuos+hSiJison2dKvplT9Q8e2bXxXmJAgn6coxVg5T9YVC5mTMGUp2K4EYAVzECdKjbnoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375672; c=relaxed/simple;
	bh=Vmf+xo4EPlclr1GOySuBC9cVmg1k3w0bFE3c3z/7Ga8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B4FDZzMJBzvhDAnzJ2c7JQ/RSWmk9XEfBCMTTZzy5TNr0KThRwLl7hi1/vHUA4kv80sy/EYHb2q+iaiaTCt/0JmHfJoZINmaCTmeoDLFAetgvAs5PWC3f9JMJrP96bFqTrgMhM+qlYX+BHZV1g55zdJwPsGGtqKUIuuuVXgY+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USxXkugi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso57186811fa.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728375668; x=1728980468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7ihgprzGUdeCuQ+MS3SxlAgTfH1Bl/IAOciBoUsZ7E=;
        b=USxXkugiVRdGXu3JtF/znJo8lO8I3md1/Bu5zMHzlrWVCYxgVnuTModu6ZAT1CnXJK
         dbGFbmZOQl1GUtoP/vzhA7hknUcS8/4PnqO9QzjOxPEV2S9aV7PYiK1mSdH1ObLVjEYI
         lk2tLlFQkghY3P05uXN/6qBLdthCFwzYDLNmswwocV7oh+8NKBj0k4V5Y8TiSbaFtfFM
         oFad6/HndlaiG5ksH6Y5IW8xsVtFFs56ctMNCME6h1aOb7kzDJaTJR62yFXlyVV7nGLK
         QBBz9Rcxpk5FT9JPp7j8iQ2muiSstLisjrzPRqaC+mEsuQs9KIX2yjho/UnOO97pqWnP
         F8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375668; x=1728980468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7ihgprzGUdeCuQ+MS3SxlAgTfH1Bl/IAOciBoUsZ7E=;
        b=VjOnT6DxhLchYniwSaoyMjGMIpQjTHtqEpZd7M1pDzQQLruljLHq4ntMqs1QLGoL/G
         vXTYU85KHZCzW6X3+ISsZiBcCLlz3IotJ6ZMuNh7ujqB2OzLbRwi8Sp9A7UNxw9/B5DL
         aEkOSKQMOOxjoV5NoX0d/Ebp1KRhYe1kfxzUkx7GT9sbw/v5n4KKMPXAq+u8Pc8HDBHZ
         PuZCz6cbuBT+Dxu0BnAqK9NWwYxHRUTUpkVIFjfpNQwB8rtKk1qjOEpjP/CCiSATpg9n
         HC5RVs/XuX9f9incxdVK9fn7teNcy/Zz7vI3Dp1sa441ir0+XO3kHcWkGo+G5AZ7GO6B
         YZNw==
X-Gm-Message-State: AOJu0YxP4Kc8GbYj7ZMWFZF2xKH8ZKPa2rS6aPTnYwz9ayAMAM3bQoNt
	GmpBwCW1zfA/t9VeJ7h5B0w82/CcYCt3wkCZUcs7RbnWb2hepdqSi01lEUKx
X-Google-Smtp-Source: AGHT+IHzG2jHmxPsUNMHyIMe6oCa6AfdcB8BUhjGQ4P2XLwQqaJoYBkr8szHLpLpD1oyqCehk3Zkdw==
X-Received: by 2002:a05:651c:502:b0:2f7:543a:3b1a with SMTP id 38308e7fff4ca-2faf3c01f4emr63688091fa.7.1728375667717;
        Tue, 08 Oct 2024 01:21:07 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac440asm11022941fa.46.2024.10.08.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:21:06 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 1/3] media: i2c: ds90ub960: Convert IC specific variables to enums
Date: Tue,  8 Oct 2024 11:20:47 +0300
Message-Id: <20241008082049.18483-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch converts chip-specific variables into chip enums that
can be used to easily add support for other chip types.
---
v2: Use family enumeration instead of flags to indicate FPD3/FPD4 difference.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/ds90ub960.c | 83 ++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..d71920677a0a 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -402,12 +402,21 @@
 #define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
+enum chip_type {
+	UB960,
+	UB9702,
+};
+
+enum chip_family {
+	FAMILY_FPD3,
+	FAMILY_FPD4,
+};
+
 struct ub960_hw_data {
-	const char *model;
+	enum chip_type chip_type;
+	enum chip_family chip_family;
 	u8 num_rxports;
 	u8 num_txports;
-	bool is_ub9702;
-	bool is_fpdlink4;
 };
 
 enum ub960_rxport_mode {
@@ -1654,10 +1663,15 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->is_ub9702)
+
+	switch (priv->hw_data->chip_type) {
+	case UB9702:
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
-	else
+		break;
+	default:
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
+		break;
+	}
 
 	/*
 	 * The serializer is added under the same i2c adapter as the
@@ -1785,7 +1799,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
 
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
 
 		switch (priv->tx_data_rate) {
@@ -2140,10 +2154,14 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 		if (!rxport)
 			continue;
 
-		if (priv->hw_data->is_ub9702)
+		switch (priv->hw_data->chip_type) {
+		case UB9702:
 			ub960_init_rx_port_ub9702(priv, rxport);
-		else
+			break;
+		default:
 			ub960_init_rx_port_ub960(priv, rxport);
+			break;
+		}
 	}
 
 	return 0;
@@ -2486,6 +2504,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 vc = vc_map[nport];
+		unsigned int i;
 
 		if (rx_data[nport].num_streams == 0)
 			continue;
@@ -2509,21 +2528,22 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (!priv->hw_data->is_ub9702) {
+			switch (priv->hw_data->chip_type) {
+			case UB9702:
+				/* Map all VCs from this port to VC(nport) */
+				for (i = 0; i < 8; i++)
+					ub960_rxport_write(priv, nport,
+							   UB960_RR_VC_ID_MAP(i),
+							   nport);
+				break;
+			default:
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
-			} else {
-				unsigned int i;
-
-				/* Map all VCs from this port to VC(nport) */
-				for (i = 0; i < 8; i++)
-					ub960_rxport_write(priv, nport,
-							   UB960_RR_VC_ID_MAP(i),
-							   nport);
+				break;
 			}
 
 			break;
@@ -3217,7 +3237,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+	if ((priv->hw_data->chip_family != FAMILY_FPD4) &&
+	    (cdr_mode == RXPORT_CDR_FPD4)) {
 		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
@@ -3796,6 +3817,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
 static int ub960_enable_core_hw(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	const char *model;
 	u8 rev_mask;
 	int ret;
 	u8 dev_sts;
@@ -3830,8 +3852,19 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 	}
 
-	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
-		rev_mask);
+	switch (priv->hw_data->chip_type) {
+	case UB960:
+		model = "UB960";
+		break;
+	case UB9702:
+		model = "UB9702";
+		break;
+	default:
+		model = "Unknown";
+		break;
+	};
+
+	dev_info(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
 
 	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
 	if (ret)
@@ -3851,7 +3884,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 
 	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE);
@@ -4013,17 +4046,17 @@ static void ub960_remove(struct i2c_client *client)
 }
 
 static const struct ub960_hw_data ds90ub960_hw = {
-	.model = "ub960",
+	.chip_type = UB960,
+	.chip_family = FAMILY_FPD3,
 	.num_rxports = 4,
 	.num_txports = 2,
 };
 
 static const struct ub960_hw_data ds90ub9702_hw = {
-	.model = "ub9702",
+	.chip_type = UB9702,
+	.chip_family = FAMILY_FPD4,
 	.num_rxports = 4,
 	.num_txports = 2,
-	.is_ub9702 = true,
-	.is_fpdlink4 = true,
 };
 
 static const struct i2c_device_id ub960_id[] = {
-- 
2.39.1


