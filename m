Return-Path: <linux-media+bounces-22778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7D9E68C9
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C90166C71
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74D51F427E;
	Fri,  6 Dec 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jwv37fzO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C61EE01B;
	Fri,  6 Dec 2024 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473644; cv=none; b=hy7PFgudfSfTdTXDwvqvHvOuWIUTnlAvSyJrdjSAiwPFKGo7/tQNC5cAv4y6zc6tPSleYUiPdq5jqBgsnTdCiejX6/Ypa9buGXNzybzU39As/9fQUh9UA4Bst0Z5QFyzbtj7+5bgFrvM27q+IQ2LjNikzOhF8LIAPsP3E/vEd0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473644; c=relaxed/simple;
	bh=Cq58bbzo/NugwJpxuMZSFFqgnspSJu6mhpl9XGc+2sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIbMqv8BwlXlCcDsStbv4HQVI0Crtr9gQiQEsQIewOZ98eI9oFCU3tGwViuUtRNmv+lHT42CLiOtok15Hod8agaP4wwNh7d/EgfBZSt4mQICFCtuCT8H2+fdbs9HyEaVWQyiwX4WyOquVKm8sMSYyNXDrbY66QniZvS2KjtpcB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jwv37fzO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7EF11419;
	Fri,  6 Dec 2024 09:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473607;
	bh=Cq58bbzo/NugwJpxuMZSFFqgnspSJu6mhpl9XGc+2sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jwv37fzOHBmxTMRFPJq7iBqWiYZjiHriyzh0Sry5tKvR4hCoJwV7oM2hzCGxZaU1e
	 u4jpu3gLBlAp9NFPEdmpOER5G89lRUHofI7rNYqUoNTGxrO0JTDpVJtWb3KFaxF7h9
	 nPDEO9N0RK1LIJidhoP5bnVxY1NczNawm+rq0IaY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:40 +0200
Subject: [PATCH v4 04/15] media: i2c: ds90ub960: Fix logging SP & EQ status
 only for UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-4-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Cq58bbzo/NugwJpxuMZSFFqgnspSJu6mhpl9XGc+2sk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVcXCKszF6Ap6X1Mmea7Fvk8ZCl5H7QhgB82
 TrYCYzbv3OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XAAKCRD6PaqMvJYe
 9Z7qD/4107DrcdQMrsCfpnCr4zvQ58ZAnMHXESfPUD1+oagnoeijv0xqQbdg352rxHU6PEPhuST
 SOPyL02YwScOWqnbhipFVZUzFP4+GHTUt7EVydJ88Mpx+GNCLmnV6AseMOkr2nLcTVVwiAp+ti0
 q6+xFWCgRQjhfGLPjoUjOqMQiTDpUwLlHJhe9TtvQR7bjQ89E1CFr7E/efZzOyfxYSWhmD5a2Le
 JZaN+LjKKA20AHDQRaZVi3m5rrN0KLACWNXzar18YL/wQyLbrbuC/nIicxBeL1gkhWv6yk8GaMf
 bRbe1S4m/t2oTY7osNIAvC8R21kKv7/rx7HXMyWTRe+hn2XsIIeHlcIq2/mRISog9kmIc/qzOVh
 Io2WLjNj1wYjlbcI4BHPS7kfmrWjkQC7KMxqno45wTUsxIJm+XvX5MwMpiWxWchEooRVwkNEnVV
 elMQRuxc17djdCnZG3dkrp0Y0jOWPVKxPH5NXZqQysaIDT1/PLDUvkPBRKdp1+kgcMEu+acPX1P
 bIIxiFMEXkxTwk5UVypISwCwel3y2ulb7Lkeree+Z3hC5qwThiCISxoh+zYjoB8HlFDLp0YNFZh
 w31fOh3IR1dASmRcXj5k0brbUJR6U+rXcz3eM76unrwflP02d5CU4xT9j6vnveJzc281SKc7OjR
 xqI19PMjpBG3nyQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 does not have SP and EQ registers, but the driver uses them in
log_status(). Fix this by separating the SP and EQ related log_status()
work into a separate function (for clarity) and calling that function
only for UB960.

Cc: stable@vger.kernel.org
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 90 ++++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 24198b803eff..94c8acf171b4 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2950,6 +2950,54 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
 	.set_fmt = ub960_set_fmt,
 };
 
+static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
+					 unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+	u8 eq_level;
+	s8 strobe_pos;
+	u8 v = 0;
+
+	/* Strobe */
+
+	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+
+	dev_info(dev, "\t%s strobe\n",
+		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
+							  "Manual");
+
+	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
+		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+
+		dev_info(dev, "\tStrobe range [%d, %d]\n",
+			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
+			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
+	}
+
+	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+
+	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
+
+	/* EQ */
+
+	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+
+	dev_info(dev, "\t%s EQ\n",
+		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
+						    "Adaptive");
+
+	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
+		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+
+		dev_info(dev, "\tEQ range [%u, %u]\n",
+			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
+			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
+	}
+
+	if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
+		dev_info(dev, "\tEQ level %u\n", eq_level);
+}
+
 static int ub960_log_status(struct v4l2_subdev *sd)
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
@@ -2997,8 +3045,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
-		u8 eq_level;
-		s8 strobe_pos;
 		unsigned int i;
 
 		dev_info(dev, "RX %u\n", nport);
@@ -3034,44 +3080,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		/* Strobe */
-
-		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
-
-		dev_info(dev, "\t%s strobe\n",
-			 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
-								  "Manual");
-
-		if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
-			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
-
-			dev_info(dev, "\tStrobe range [%d, %d]\n",
-				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
-				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
-		}
-
-		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
-
-		dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
-
-		/* EQ */
-
-		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
-
-		dev_info(dev, "\t%s EQ\n",
-			 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
-							    "Adaptive");
-
-		if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
-			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
-
-			dev_info(dev, "\tEQ range [%u, %u]\n",
-				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
-				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
-		}
-
-		if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
-			dev_info(dev, "\tEQ level %u\n", eq_level);
+		if (!priv->hw_data->is_ub9702)
+			ub960_log_status_ub960_sp_eq(priv, nport);
 
 		/* GPIOs */
 		for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {

-- 
2.43.0


