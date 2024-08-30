Return-Path: <linux-media+bounces-17207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2C9657E6
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373D2286495
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 07:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C976113632B;
	Fri, 30 Aug 2024 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE+lM2Hp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323814B097
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001237; cv=none; b=qpfBur5JxyvhgKmfHUnYb5Xmy/quJnHMZ5kxvWNAz9ghkFulm9Hjh4BSXtH+zuoOQyUPPmrDAYz1KTVjNOvBiTkWIN9IfFvYkDuhsYW1V2VWdJ/sF5pwnVNESzXFqgagKFKgUomAGXWo8Yhs+jMqbEJLQMP0X+wtgcXhS9Zav8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001237; c=relaxed/simple;
	bh=W5S7M4RNQkCcGnQoz8599FUBLtc2XrkIxxpn7l88GFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Woru1amLe6mUhUgJ29GkgzLD4Jsxk9YX5bxDttF6PGL92D5XjPtJofrDAyllznFRzORa54rjG93+WbtMACHiIqOeYOg8GCDAHdpH/YfmdDIkqZRnP44bSgpyys00C3ovh9QHIAPz5Vh9nPB54Eclc84KW2A0gk5mTWjBQeN64nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE+lM2Hp; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f2cda058so22966251fa.1
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725001233; x=1725606033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+I37Gce5202U+swYjBjto78oXZeUKvEmhAL5UPP3tg=;
        b=KE+lM2HpLqg/IygunSONuV2MHD5Z3gV4ZFpsyx2pOF0wpG3JoCXX+0gaz2AWpakII4
         oZA55l/TmXxyVzuMZFBJ3YnSmtlm5+ywmtUJllz8dWdARCDFd81dUO9Zg7ZHQSR8d3QP
         eYty/qcQanS4Q6PMBGz+nJFMVIIhHNDDH1y0ARAPlYiv+qwiUCubbDj9rnHvH/5XaEk+
         8kiF5i8SAjOetWFeJn4Oq7jJabzEXXAPsrJis5VM9H283np3JAgL2SQT0CgYPDfPjhr0
         cAe3wVgtuwsTuYdvUtn3LbUbeTsLr4D4gyUVW6SV0c8tS7geUfhLalqoMXnJ5g4p1H/2
         zFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001233; x=1725606033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+I37Gce5202U+swYjBjto78oXZeUKvEmhAL5UPP3tg=;
        b=T9nmOG6tMaSvG8iVJhz9OVgYXFBwHTLM3bEUEPH1rpxzFSEF6G0cuUg3fQo0uR1su9
         kqmty1KjpCSkyCxi8WrrngxVT8qNLcjEorpeh0g8VLp1+dGF/NUgOFJzm6V4U+79hwdv
         u/jYVY6tM5wX6Khk2lYBswVQH61DKW21TCmdGqQ/+vNZf4JHAdLAjjo3KcH9CeNQYZAZ
         RYhd/5b1QSszh/rxWtiethy21PiHpMvw41h4N5b2+MsPSXjUA5qX7XEShAd04KGSDWzE
         ARbi/zPA0sKKKyYCi3ARpII2Zm0bzxaCHvE9aADdT/DpGgvNG0/lbqIE3uufOd7clIAp
         gAmg==
X-Gm-Message-State: AOJu0YxBTaeqDocwIeaxJMi+ZyHbysSqDo4bVqF6JHyZv0yIsuNYOThv
	7DWB/wk55cyT3sLatA4klbKoxfvfjz2kLhGQK4NyayNipN4tYoYrmUljkEYl/SU=
X-Google-Smtp-Source: AGHT+IF3X/xSMPKK4mrHt+B0cfctMzSLF3sVOuvKAAjMGz+Ov2hrPyRzs46SNEhWOAzql7PKkTbYkg==
X-Received: by 2002:a05:6512:15a5:b0:530:ae99:c850 with SMTP id 2adb3069b0e04-535462ed7femr404802e87.1.1725001232554;
        Fri, 30 Aug 2024 00:00:32 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079bc00sm444790e87.3.2024.08.30.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:00:32 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/3] media: i2c: ds90ub960: Add DS90UB954 support
Date: Fri, 30 Aug 2024 10:00:08 +0300
Message-Id: <20240830070008.9486-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240830070008.9486-1-eagle.alexander923@gmail.com>
References: <20240830070008.9486-1-eagle.alexander923@gmail.com>
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
 drivers/media/i2c/Kconfig     |  2 +-
 drivers/media/i2c/ds90ub960.c | 52 +++++++++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca..18766898280b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1604,7 +1604,7 @@ config VIDEO_DS90UB960
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
-	  Device driver for the Texas Instruments DS90UB960
+	  Device driver for the Texas Instruments DS90UB954/DS90UB960
 	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
 
 config VIDEO_MAX96714
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index e9f9abf439ee..9edc7e8ceebd 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -403,6 +403,7 @@
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 enum chip_type {
+	UB954,
 	UB960,
 	UB9702,
 };
@@ -1154,10 +1155,17 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
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
+		if (priv->hw_data->chip_type != UB954)
+			break;
+		fallthrough;
+	default:
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		ret = -EINVAL;
 		goto err_free_vep;
@@ -1419,7 +1427,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 
 	if (priv->strobe.manual)
 		ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strobe_pos);
-	else
+	else if (priv->hw_data->chip_type != UB954)
 		ub960_rxport_set_strobe_pos(priv, nport, 0);
 
 	if (rxport->eq.manual_eq) {
@@ -3807,7 +3815,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	u8 rev_mask;
 	int ret;
 	u8 dev_sts;
-	u8 refclk_freq;
+	u8 refclk_freq[2];
 
 	ret = regulator_enable(priv->vddio);
 	if (ret)
@@ -3839,6 +3847,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	}
 
 	switch (priv->hw_data->chip_type) {
+	case UB954:
+		model = "UB954";
+		break;
 	case UB960:
 		model = "UB960";
 		break;
@@ -3856,12 +3867,26 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
-	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
+	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq[0]);
 	if (ret)
 		goto err_pd_gpio;
 
+	/* From DS90UB954-Q1 datasheet:
+	 * "REFCLK_FREQ measurement is not synchronized. Value in this register
+	 * should read twice and only considered valid if
+	 * REFCLK_FREQ is unchanged between reads."
+	*/
+	while (priv->hw_data->chip_type == UB954) {
+		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq[1]);
+		if (ret)
+			goto err_pd_gpio;
+		if (refclk_freq[0] == refclk_freq[1])
+			break;
+		refclk_freq[0] = refclk_freq[1];
+	};
+
 	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
-		!!(dev_sts & BIT(4)), refclk_freq,
+		!!(dev_sts & BIT(4)), refclk_freq[0],
 		clk_get_rate(priv->refclk) / 1000000);
 
 	/* Disable all RX ports by default */
@@ -3923,7 +3948,8 @@ static int ub960_probe(struct i2c_client *client)
 	 */
 	priv->reg_current.indirect_target = 0xff;
 	priv->reg_current.rxport = 0xff;
-	priv->reg_current.txport = 0xff;
+	/* Avoid using UB960_SR_CSI_PORT_SEL register for single TX channel */
+	priv->reg_current.txport = priv->hw_data->num_txports > 1 ? 0xff : 0x00;
 
 	ret = ub960_get_hw_resources(priv);
 	if (ret)
@@ -4031,6 +4057,12 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.chip_type = UB954,
+	.num_rxports = 2,
+	.num_txports = 1,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.chip_type = UB960,
 	.num_rxports = 4,
@@ -4045,6 +4077,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -4052,6 +4085,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.39.1


