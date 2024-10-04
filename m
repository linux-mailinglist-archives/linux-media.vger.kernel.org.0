Return-Path: <linux-media+bounces-19094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2A9906BE
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1164D1F2151F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A009A3DAC03;
	Fri,  4 Oct 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FeoqdJJn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48286220815;
	Fri,  4 Oct 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053244; cv=none; b=JNRciiGPnIDzFPlW8Alw3T7yRPpxV+/uyLuFYZSeTeBoDKAkIZXB0DKBSZv7KtIxBfwnUiGhoLWzXCE3lAXmGoz1kfJV0gaFhnXnWafaMUqTBBuwlVO3M4w5A1iZLoqUjZxxe12WiNOwwWHRmKV9Or4F7lrOhioI+pSjZdTkrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053244; c=relaxed/simple;
	bh=PJSBX2bzqYP3+CKy9n8zSfhEFQa7EPI7dXwzmn9Bo1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4BL+fEALJ86yQZX2FjW2OOtg9Gz1DNqQHPxclXjK4yq2yQ2K1j3XzDryB0/7+gtB0nS10Qu4nupH6xg2/qPF9mirCTeOLqThz9fkeOf4GNi1+idljfHpAj6kF9WZaqWuZgNRfWiE7Jd94hAPnRT2BkP8CpwJsNE5MBHlSO5NBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FeoqdJJn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF6DEC8A;
	Fri,  4 Oct 2024 16:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053142;
	bh=PJSBX2bzqYP3+CKy9n8zSfhEFQa7EPI7dXwzmn9Bo1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FeoqdJJnF+8KLup/lK2Qv12DTZ+0Sw+stb/lYGMmqAwsxHoG0RjOAh/ILeZxjkC5L
	 ZeN5CEI+ucBrboZ0TYatYbjYt1T/x/NghnOY5CMeTX/Ei/GAxAAmT+qt0LNGx0QC11
	 kNF0T91FgBB2+tB8d9ksKcsk0IjnbfqOYWB7rHBg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:35 +0300
Subject: [PATCH 04/13] media: i2c: ds90ub960: Fix logging SP & EQ status
 only for UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-4-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PJSBX2bzqYP3+CKy9n8zSfhEFQa7EPI7dXwzmn9Bo1w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///txobIvR1pOFoUp0y17xNQxSyjk77xdBspu
 hJ3SHKZUASJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7QAKCRD6PaqMvJYe
 9QMvD/9h115ssOQMTWhn/Kwb/OWKtnGZ95wUDA2iLZE8tnB/y9yD99rMK12c4laUMFZ77c6O8Po
 vGoaYOuEvv8ZygEcdtcBLvYuIIcm/w5DAWpRai1LxwBPVfSEtjR0W2zSdQw0q6L3gZUmHg5gQHS
 iUbOXtx+0GJ1cSW4Dqltnc5pmsYxWLv3a8AIHnYUM04ZcCGConiV9yH0KGnrrfi/pt5X+3PIRt+
 q8B3aruwovIselV2WGq5g8PcZLOpvVFxx+u05o5APQcL+zU1/WmhrTyhLlntzCMPgzgFXczN7zj
 jBDfpZaG+aq5GUg6nEFcfL/VRMVtmDqGmuitM7VJwXwOL1M9LnM8/S4R66ghR/spr75DT8PVXfr
 gY+GgQaNlnr5t8nWwXeQ5ZT6xl0Pfq7iLhhoD/Cv8IJjFYFseEHGYGkof1zuU0TCXYJWZQazysE
 S6Fr97Bfmb7g+9+zqy2q2aOr5uqmlDt1795gyXLXnUVyVp8Lr/C5mvzrYd2njYHJZu/pKXzjvDy
 Dzs/s40JjFJY5P82mqSZ8JBjM6V2C2QEDS68AesbYzUyr9C6ZMKHoz/x55KhdRgpFIPel+mY/oh
 7C2hLHoNeo8RkRHe4vCsu54Maz3Lv4uD5w0ix2GT+EZ1gT8P33SJiDRMjCpOc7kRswS7bvtFcQR
 YDPCoXyrPVB4zjQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 does not have SP and EQ registers, but the driver uses them in
log_status(). Fix this by separating the SP and EQ related log_status()
work into a separate function (for clarity) and calling that function
only for UB960.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 92 ++++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 24198b803eff..5c393ec6c682 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2950,6 +2950,56 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
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
+			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) -
+				 7,
+			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) -
+				 7);
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
@@ -2997,8 +3047,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
-		u8 eq_level;
-		s8 strobe_pos;
 		unsigned int i;
 
 		dev_info(dev, "RX %u\n", nport);
@@ -3034,44 +3082,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
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


