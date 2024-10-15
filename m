Return-Path: <linux-media+bounces-19650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E599E063
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AEAA1C21B8B
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 08:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE981C75F9;
	Tue, 15 Oct 2024 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lumL0BqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB731C233E;
	Tue, 15 Oct 2024 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979692; cv=none; b=pEdF8a7sAqXMZx+ljKmC9r1BsXktoclW1bni1dj3SDjPht3wx30L4mwJtbarrwQicchfG9NuSAgpqpOGLkU/JlYZyc1Wy2ZruqP79xu7kxM9QTQTiJZ7lyQPKP5LoPeOazeltMfF8lWerh+PYqkslVhVNXU8gKjV6jbRmyib9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979692; c=relaxed/simple;
	bh=MQ9Ytm+hxvpCDsBW4EujpQGGUncwYo1BVMDZiSOOZcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qR/8ovW5N2xLqkn2YTLsl9F+RZYwI5+OmKJn4yJr3YUfal+rxhy6pxLRFHdPqgXiXp/E3ToVeVUM2TyYNEf3dx657jIbLD39iJh/qjhtUdpFVj5oTEkYc9Jh/fU75L/d5kiYJ6ryP7vLiCI5YC/R3NRPfSk82YJ4Hf3EDmfPp1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lumL0BqT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2338355e87.0;
        Tue, 15 Oct 2024 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728979689; x=1729584489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYUK+ZHP63y8EBGKj6xXLUuCn0+yJAOR87u+nvJa/Jo=;
        b=lumL0BqTiDvaRkzPDBKYPehRR+2ASoeUr6fAvYMTBp4rAGDCDRjGLXWb3i72Upe1Ez
         PWAtzXtoaOA7hzB1a6eotF5AHz4jFnEYd6/L/4piYhctdvjFT1wmnaDuRNyOQXDt48o5
         ZlWlETYhKHYj44WV6vuBD49XnrrpHAptIhB7nlhKg2lVA+S9Vz6gDFUDsvmZbD2UcEkU
         Ze8PxiZMZYSme32HNi6i21PJyPbVCSyMJSXnjopie3Wx9asfBK7xHFO9gDQ9bnfdxoWM
         dQ9kLv7yee2+BcE/Iqs+2SjbxFD7jWaD2t+wkIP3aRYGWDSVZ16PGEixVHk1ASVtVzwj
         FFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979689; x=1729584489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYUK+ZHP63y8EBGKj6xXLUuCn0+yJAOR87u+nvJa/Jo=;
        b=Tb1X72axTXDeqxlfUoWhTRM4dNpGXc6lXdD6N9EHzaBHPWkO2yoUcthjTCErAGOeUG
         Wu7lRWGrXl0lRR58ZLs0c8d5MnFB2jS2KZiZQEFuvkNzt5GtjmE3YOjyQ/wYYJK2q2+m
         Z+rdsTPnNLRB3Z9HlnNK3Fpa+9akbfeempTyBf656n92N7MsVB2jPwTmkXfilXRcBZRi
         NUaecHUbCCpxt288JjvwaweSWzs8P9AdyCSoWT3FOTq40oaDAocxWrXbb90N0J5YrDDp
         wUZpHk5hqEWufNW8uQV0lZP3BFE35vlISaF7e0R1niDXx+PksMVMdB8kTRAV+7T9Bpev
         ZCYw==
X-Gm-Message-State: AOJu0YxEClzhgMORxAtyZT7mHIRWh+4cLvXGQKdH3kJAPHMcF/Koq9XL
	7mLcSoc1D0L+oh2s4Bz0Efwuv15wJJ7Oo1Qu/nUOoy0S+xD5WdGe5egA5CdDTtw=
X-Google-Smtp-Source: AGHT+IFnaMMaL27Pu+KUSITg1UOjNPOGe5ftSOQVNYgmhTE8sKJPWxU+fZ4VK48SD8lmKgq4UDbyvA==
X-Received: by 2002:a05:6512:b88:b0:539:e98c:c33b with SMTP id 2adb3069b0e04-539e98cc3c1mr3766403e87.41.1728979688485;
        Tue, 15 Oct 2024 01:08:08 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3ddfsm94736e87.149.2024.10.15.01.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:08:06 -0700 (PDT)
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
Subject: [PATCH v3 2/3] media: i2c: ds90ub960: Add DS90UB954 support
Date: Tue, 15 Oct 2024 11:07:36 +0300
Message-Id: <20241015080737.16272-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241015080737.16272-1-eagle.alexander923@gmail.com>
References: <20241015080737.16272-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for TI DS90UB954 FPD-Link III Deserializer.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
v2: Avoid potentially infinite loop when checking chip frequency.
    Move chip specific checks to appropriate functions.
v3: Fix Media-CI test warnings
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
index 8000801d5810..7efe8635b221 100644
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
+		if (priv->hw_data->chip_type == UB960 ||
+		    priv->hw_data->chip_type == UB9702)
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


