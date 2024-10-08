Return-Path: <linux-media+bounces-19210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3C99429C
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4421C23864
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90721DED53;
	Tue,  8 Oct 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi0loRjH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8F17BEC8
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375675; cv=none; b=LTcoB07SGOxa8CTwsIpfGvcAzJAbwugzSnJfiSAgsAnWM0UhwmAbB9sDWtx3KNjjdleojxNJ7vSyVgTzRYYjygdmCNJE8XTKcqUNHqPj9KGSC7i2ZOl0X1JO6uYI1MRKXUwvj2p4I4YZ+mvnNzCcTkR+1ZHpyCQcPsLcuhyh5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375675; c=relaxed/simple;
	bh=ukKAPkz119HubdIQtpNpkPIOz5mdopXWIAu9TIMPQ6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKogXhW2yBzWoDZ2OvrXC/neoa89wXUIUXT9dfNGDE8Lzmm0rdi77oItcHSoV1jRjIFJBGxWfumqeKnvMx8eyjCJ8yGhFJKUnuOrdeVHOHJdpFMFrGgVx8EpdnqJ7iLrT7DNp7G/uEiLiklB0KnIcTxKFmk0mHK5gmcOmnUfmws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi0loRjH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fad6de2590so78691831fa.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728375671; x=1728980471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thUQDlHD8CjBtubIuNxEsUDz+R6ECfeexNMZdbpZUHM=;
        b=Yi0loRjHh9jVTik0XLCnNcrCB7bHy1JbxZ72IFUHL2Z6+f0hVl+79cwse38BBJR6rV
         mL5XQ5l1OLSAIlRPT4aXdmvUgcpkgNf0G/97OJGFf1Ab9yegtNb4NfnMquniPrFxQiMe
         X8oJSHmZiJobjRQWasWWXvD9ME2LkrKhIcpNMR4am+f7X/lnrnzFcjRewZO3JWs05ZR7
         Z4qt1FisESteASjEvoqjpwmymd4swK5Yk8/DNIBwe6z38aBLGjXJXd/Zo3zKnQ9ix0lr
         Fx7RpnEGuwadNGxh3svk292dVBHSowNmVA7ZpBkWZTtwwFox0qmKUhikjlQYh3hDRbPo
         cYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375671; x=1728980471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thUQDlHD8CjBtubIuNxEsUDz+R6ECfeexNMZdbpZUHM=;
        b=bOtvB8yqZRUz/y7DGICOFRUhd7ouSQTI9N7dSYyvwJXh0MiKVKy2P2M63xnXLB1/nL
         rvU8J/4QHDoJm4HQvgBeKTEHXk5SOph/jQ/RIXD1gb1lPwXaj7Aq1Z3iN1V5PiSf4twC
         96x2bfb3JY7OqN7pfOPZLEuQbqOEGefvCd0eQAO2ixiCixZKyGn2BZfbNbg6gf3Z53zc
         jERo7ARd/MEIHVA55c4Hdhq5L07viwd0DWInr4fnfhdVnkY6ONeWcWelUyjyk9aoRlGH
         l5fm8i88THZBnnkhzr4xtRXvHy1ZmLGd7ABcF0Eo3CGMhbGreaL/LL6P73xoGgfbu45Q
         48AA==
X-Gm-Message-State: AOJu0YzZ40uiT3r19sy3N6VG6NWRZp9TZtl5mQcjldz7gomFGUsOg4Zv
	YM5FGOpAPMZu0xWg/9KB6JENiaTq2tubPM8M9pthN3oUaBJ+g9fFfM127nzx
X-Google-Smtp-Source: AGHT+IFqGiQmVETDXIeFxWVy6wXlOWD+rb768oK+jDD3w8CnGLJwl59alq0MEKHNMWeZj6DjnXHSGw==
X-Received: by 2002:a2e:be06:0:b0:2f0:1a95:7106 with SMTP id 38308e7fff4ca-2faf3d7921bmr91145151fa.39.1728375670906;
        Tue, 08 Oct 2024 01:21:10 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac440asm11022941fa.46.2024.10.08.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:21:10 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 2/3] media: i2c: ds90ub960: Add DS90UB954 support
Date: Tue,  8 Oct 2024 11:20:48 +0300
Message-Id: <20241008082049.18483-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241008082049.18483-1-eagle.alexander923@gmail.com>
References: <20241008082049.18483-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for TI DS90UB954 FPD-Link III Deserializer.
---
v2: Avoid potentially infinite loop when checking chip frequency.
    Move chip specific checks to appropriate functions.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/Kconfig     |  4 +--
 drivers/media/i2c/ds90ub960.c | 58 ++++++++++++++++++++++++++++++++---
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca..91fd2c3eb8bb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1604,8 +1604,8 @@ config VIDEO_DS90UB960
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
-	  Device driver for the Texas Instruments DS90UB960
-	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
+	  Device driver for the Texas Instruments DS90UB954/DS90UB960
+	  FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
 
 config VIDEO_MAX96714
 	tristate "Maxim MAX96714 GMSL2 deserializer"
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index d71920677a0a..78f228c62d8a 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -403,6 +403,7 @@
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 enum chip_type {
+	UB954,
 	UB960,
 	UB9702,
 };
@@ -815,6 +816,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 
 	lockdep_assert_held(&priv->reg_lock);
 
+	/* TX port registers is shared for UB954 */
+	if (priv->hw_data->chip_type == UB954)
+		return 0;
+
 	if (priv->reg_current.txport == nport)
 		return 0;
 
@@ -1157,10 +1162,18 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	priv->tx_link_freq[0] = vep.link_frequencies[0];
 	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
 
-	if (priv->tx_data_rate != MHZ(1600) &&
-	    priv->tx_data_rate != MHZ(1200) &&
-	    priv->tx_data_rate != MHZ(800) &&
-	    priv->tx_data_rate != MHZ(400)) {
+	switch (priv->tx_data_rate) {
+	case MHZ(1600):
+	case MHZ(800):
+	case MHZ(400):
+		break;
+	case MHZ(1200):
+		/* UB954 does not support 1.2 Gbps */
+		if ((priv->hw_data->chip_type == UB960) ||
+		    (priv->hw_data->chip_type == UB9702))
+			break;
+		fallthrough;
+	default:
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		ret = -EINVAL;
 		goto err_free_vep;
@@ -1311,6 +1324,10 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 {
 	u8 clk_delay, data_delay;
 
+	/* FIXME: After writing to this area the UB954 chip no longer responds */
+	if (priv->hw_data->chip_type == UB954)
+		return;
+
 	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
 	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
@@ -3853,6 +3870,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	}
 
 	switch (priv->hw_data->chip_type) {
+	case UB954:
+		model = "UB954";
+		break;
 	case UB960:
 		model = "UB960";
 		break;
@@ -3874,6 +3894,27 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
+	if (priv->hw_data->chip_type == UB954) {
+		/* From DS90UB954-Q1 datasheet:
+		 * "REFCLK_FREQ measurement is not synchronized. Value in this
+		 * register should read twice and only considered valid if
+		 * REFCLK_FREQ is unchanged between reads."
+		 */
+		unsigned long timeout = jiffies + msecs_to_jiffies(100);
+
+		do {
+			u8 refclk_new;
+
+			ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new);
+			if (ret)
+				goto err_pd_gpio;
+
+			if (refclk_new == refclk_freq)
+				break;
+			refclk_freq = refclk_new;
+		} while (time_before(jiffies, timeout));
+	}
+
 	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
 		!!(dev_sts & BIT(4)), refclk_freq,
 		clk_get_rate(priv->refclk) / 1000000);
@@ -4045,6 +4086,13 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.chip_type = UB954,
+	.chip_family = FAMILY_FPD3,
+	.num_rxports = 2,
+	.num_txports = 1,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.chip_type = UB960,
 	.chip_family = FAMILY_FPD3,
@@ -4060,6 +4108,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -4067,6 +4116,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.39.1


