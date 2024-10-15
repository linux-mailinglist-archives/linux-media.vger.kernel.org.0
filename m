Return-Path: <linux-media+bounces-19649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2B99E05F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829C5281E91
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 08:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8712B1BDABD;
	Tue, 15 Oct 2024 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP/gCuNF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABF19F420;
	Tue, 15 Oct 2024 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979688; cv=none; b=YBpWajhGbMxIx1VwiM27AjHONYx1IwhaCM+13mR8cpK7WaSKHcvNM6L1bUyf6Y/YTcftqew4rZf/btd1wNggPbu9XOI4uMgK9YS0HMD6Kjh2jiEE1XbpENMIpTMCJ139W+ebhRHMOxJrNSzpH1V7HUiAsKh6lJJBxbTnrKjcJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979688; c=relaxed/simple;
	bh=0HM5QzbApdifMro5Q6I0Vfw6ka77pCzXs9quQRKR2us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D/9E44mh+XBHadWB8yQcvuXIA09Sf+BuBqn15FmoYQzOvanrBnRLOgY9lrrvQmzFWSOZ2fugRHgEZ1xt9AhseqPG9XGYsxFdfSn3KvlQvin6zv2WqMGpPJKBHZbqpszk7V5cSB4mxlw/MG6024IRXTRatuStyEN0jFJhGcxZ370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP/gCuNF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a007743e7so328602e87.1;
        Tue, 15 Oct 2024 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728979684; x=1729584484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf4YX1pnBlpdfRPG1tk8PhQCn7JdDosYa2aEpKQFtec=;
        b=ZP/gCuNFZroSRIO/r77w0cXXDSjmmiW/dk00nqkl/Nm4bHQ56RfUWwBgZi4I2cfJLo
         m5EhIIIZFJbtcMNDcDURPv9dhdH9zGTocOdR/sWqnCyvM/G9dtGKUdCmXFiKjmV0WePb
         aoE3FIL9HvtSzz7d59PqK0ySq02X+xMzYEc/7qyVRntV7CeBOzJQ45iFAUxdi17De0cR
         ZSjeXtWRZJxTb8VQVwkfzSHlfWXwrO43PYvdilDZsUAX9l0ELy4Sfg/+Mz/uKg6jACky
         xk16ThyQBJbibEUZdATkPlRznW32ag0PWpv9PCxeysOKoqZZPzRlMCqTYg+3SuLCWEC+
         20kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979684; x=1729584484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf4YX1pnBlpdfRPG1tk8PhQCn7JdDosYa2aEpKQFtec=;
        b=HvLRn3WbokrKPvRCQdQl3LZhGhigk8ZvH8Bc6YCxWomCVFtVxQx6GxxqrLprXVD9MP
         0sKIas2WXRQ9UD6kCl5Ll6KMDOLdtg/4YNQcsYGx9kSUhIWQ3e15cnLFGIotpxBJcdcy
         YHORSgHpvVPgxW2e7qmTaDkaX43Yw2HwB78fJGoVJijlahJYuhwXYO3BUjLp7YI6kMvr
         UqenjPYjIffkOu97pjs8E+i8YHtIW58dzpm08UVlbxE9kw7yVoak8yJ8tlY/EQs5ybbM
         31GOeCuX29ZWrYX9eWvB9hEyKVzSFFRx8MDAtjVudrav7o2Yw4AQpdQCD3MGfU+ks1nq
         pnvQ==
X-Gm-Message-State: AOJu0YxbuD5L1Oqnv+63G9RR3sw4fKX+GwZTFH+UlGTVbiqVepdCnzx1
	4Qe/XBtqHAKctn8+M7F5irEpPk7rpvXOtq3ZGw9kdNpxVkOMZhIdotVHNQKgCQc=
X-Google-Smtp-Source: AGHT+IEv1hJjXrzLHsjIxDivTbnZhYVuj6vaZhprgrQSN8mpwxtBFCbAyWJBy1N163Rq17jGawuGsw==
X-Received: by 2002:a05:6512:3c92:b0:536:9f72:c427 with SMTP id 2adb3069b0e04-539da4e12dfmr6293352e87.28.1728979683201;
        Tue, 15 Oct 2024 01:08:03 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3ddfsm94736e87.149.2024.10.15.01.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:08:01 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v3 1/3] media: i2c: ds90ub960: Convert IC specific variables to enums
Date: Tue, 15 Oct 2024 11:07:35 +0300
Message-Id: <20241015080737.16272-1-eagle.alexander923@gmail.com>
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

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
v2: Use family enumeration instead of flags to indicate FPD3/FPD4 difference.
v3: Fix Media-CI test warnings
---
 drivers/media/i2c/ds90ub960.c | 83 ++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..8000801d5810 100644
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
+	if (priv->hw_data->chip_family != FAMILY_FPD4 &&
+	    cdr_mode == RXPORT_CDR_FPD4) {
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
+	}
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


