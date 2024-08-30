Return-Path: <linux-media+bounces-17206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670D9657E5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B4011C228EC
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 07:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1CB14A603;
	Fri, 30 Aug 2024 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY8eI+Av"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455314B097
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001234; cv=none; b=NezPzEuMRyk4YuZGzO8pvJuhs8ur9WHNRFo5/3H2hR7Z86lpey0A7MyFxIwH+OMCSnMzfaTHKM0l1ebU8W5xDphC0S+fUZ2KE0gk51y479oC8hC+kVq/xV5qjgJoRoTQaPxqAwhig2CANU7Db83KnAxa0tXzoV+Y1pz5Ue1RcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001234; c=relaxed/simple;
	bh=a6I8Qs7jMbe5Yb5WDtVl0Gq6RD5+eZiag/bS9+BBXxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oVVxc8PHImef+ZC1/UGfFV1NJTeLq96mfInFb6UNBFBnj+dfZerGK51sIF8f/lLBpc6ATOZaQH8p4E3ZOuuKi2qDJuuZwcfuQQzFIfS292cGXr70VijsO4SvK/BXQrXPgxXP/BkTGqXzZtkjimBHpx7ZFuOyB67WLNFC3KkFGJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY8eI+Av; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53345dcd377so1916967e87.2
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725001230; x=1725606030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7pxeFgHV40RxgLrj2ICzTAKUNIYzDpUHLvdENSnR6k=;
        b=gY8eI+AvOpbsfHGsCY+c8PpsEiSD6ZgbByKAn9Uh3liwVFufXTTHf5tSKAl3YvOu3Q
         REuvF4c6XoUaNZFJ0ytvi9GW+YfVtMHp+vLe48zR+ExE0I7W9wsGwkmJnMIoMWKyRzon
         fT1hfIrg+DM69O8q6uUnAr76eYSN5Ltu4mvX5NtxcrD5omErsDGLfpBY0/MqdZxNHLaT
         amp/kpBpI+a0vcghSAuXR7bB5Nd82+8DedBkqHvws6RGeARUB2+9TdlkcX5S+Sp03dWG
         H8HOCPNqaxafVRn6agNJu5aZUjBd6+Ruu0IkPO0xMSn4NKBMOQcgD7QZuQkrbGAVPgJY
         /AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001230; x=1725606030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7pxeFgHV40RxgLrj2ICzTAKUNIYzDpUHLvdENSnR6k=;
        b=OTEbzbbtXCT5vqGOw/6hX0vqkV+k3z477IrwTtMhtzZWiXdEBlf8tF7Z/wIhwJwwOp
         Zka8rR4QASe1p2x/Wt9o6EkXmksCEbYjjt+jhTX4zRKQdlgojf9GBCzVPEN1V/G75sI/
         VnDpWp4QBis5EP/hI4DucCMAs3kvDQRF2uuSzDtwUfZevhpuDiu8pJJ80gi178Ky+H3N
         LDFJSnRMPoH2sHndAvC6O1zbCgGcDQGP7M2GEaR67JpIMxB613H44FKKQzBSGAcKY5co
         sMRnRI1n7exCu6jBAeyo5gzP4y4yD+FVGiHcCTLBDYvnU2Q+uX/C+ytfWLF0pp57+Krc
         h8pg==
X-Gm-Message-State: AOJu0YzevQhcP15eR5xFK1YNvtuWGruAbGHO9i+heVY7smXpESk8OweV
	mAXoHag2nuugWwn3cF/YS5JCxLz4n7ui35AOm/STjdPXP6UFBSW38GjBpp9Zts8=
X-Google-Smtp-Source: AGHT+IEBWfPM5bLQmB/JIZOeeHbWFZdy1WPnG9UAWmNtbBe/eCxoGRDHSrUxaBPXSIeXdhlPYG2wdQ==
X-Received: by 2002:a05:6512:3e1d:b0:530:ea2b:1a92 with SMTP id 2adb3069b0e04-53546b93fa8mr670786e87.43.1725001229459;
        Fri, 30 Aug 2024 00:00:29 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079bc00sm444790e87.3.2024.08.30.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:00:28 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/3] media: i2c: ds90ub960: Convert IC specific variables to flags
Date: Fri, 30 Aug 2024 10:00:07 +0300
Message-Id: <20240830070008.9486-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch converts chip-specific variables into generic flags that
can be used to easily add support for other chip types.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/ds90ub960.c | 48 ++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..e9f9abf439ee 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -402,12 +402,18 @@
 #define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
+enum chip_type {
+	UB960,
+	UB9702,
+};
+
+#define FLAGS_HAS_FPDLINK4			BIT(0)
+
 struct ub960_hw_data {
-	const char *model;
+	enum chip_type chip_type;
 	u8 num_rxports;
 	u8 num_txports;
-	bool is_ub9702;
-	bool is_fpdlink4;
+	u32 flags;
 };
 
 enum ub960_rxport_mode {
@@ -1654,7 +1660,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
@@ -1785,7 +1791,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
 
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
 
 		switch (priv->tx_data_rate) {
@@ -2140,7 +2146,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 		if (!rxport)
 			continue;
 
-		if (priv->hw_data->is_ub9702)
+		if (priv->hw_data->chip_type == UB9702)
 			ub960_init_rx_port_ub9702(priv, rxport);
 		else
 			ub960_init_rx_port_ub960(priv, rxport);
@@ -2509,7 +2515,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (!priv->hw_data->is_ub9702) {
+			if (priv->hw_data->chip_type != UB9702) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -3217,7 +3223,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+	if (!(priv->hw_data->flags & FLAGS_HAS_FPDLINK4) &&
+	    (cdr_mode == RXPORT_CDR_FPD4)) {
 		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
@@ -3796,6 +3803,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
 static int ub960_enable_core_hw(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	const char *model;
 	u8 rev_mask;
 	int ret;
 	u8 dev_sts;
@@ -3830,8 +3838,19 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
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
+	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
 
 	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
 	if (ret)
@@ -3851,7 +3870,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 
 	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE);
@@ -4013,17 +4032,16 @@ static void ub960_remove(struct i2c_client *client)
 }
 
 static const struct ub960_hw_data ds90ub960_hw = {
-	.model = "ub960",
+	.chip_type = UB960,
 	.num_rxports = 4,
 	.num_txports = 2,
 };
 
 static const struct ub960_hw_data ds90ub9702_hw = {
-	.model = "ub9702",
+	.chip_type = UB9702,
 	.num_rxports = 4,
 	.num_txports = 2,
-	.is_ub9702 = true,
-	.is_fpdlink4 = true,
+	.flags = FLAGS_HAS_FPDLINK4,
 };
 
 static const struct i2c_device_id ub960_id[] = {
-- 
2.39.1


