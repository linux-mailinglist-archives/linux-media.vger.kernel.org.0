Return-Path: <linux-media+bounces-21129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C239C193E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD451C20E2F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C97D1E47A7;
	Fri,  8 Nov 2024 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s2M9jR5L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEFE1E3DC3;
	Fri,  8 Nov 2024 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058526; cv=none; b=CEBlQpERr4lciZLpJYJYex61rcc+lPaJFAA7ZQLRsbF3Z9ZGnPOL40kXlAq5ZSPz1PE6MweEjhVryITtVn8dbFglN243i3IYKa8+eh1bhUPhdMIjp8icnoPT+6w1DPZQtwWoQK4hArXwzc6nl8KRe46EslkAwMCiFHnc5fyr+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058526; c=relaxed/simple;
	bh=yWjHH4n2+6qxjpnNorGxgj4zCDnWTjIhn3bpMUFpkHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bckhmMTPDNOGb5L3cIxt9aAoE6QXVIjrZqPDi8d9zP6g2PByphXGI+DELVTXoDopHLZNU6HKgh+sP7pHHErMSKI23SCvRAPKLvnSVTACJy48aixuH+xyyK6jHoix43DtiU/0ubuottF4QtRxK3TLpoNf2IwJrPYrLjoe6UDf5T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s2M9jR5L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F332F143C;
	Fri,  8 Nov 2024 10:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058509;
	bh=yWjHH4n2+6qxjpnNorGxgj4zCDnWTjIhn3bpMUFpkHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s2M9jR5L8E9iiO2wpb6i2S97R6yQsEgooTQnuO1YSbhA2CWJu80a9sgwvWSupXJrt
	 VzmY+7rA1yQr7TlenMNVVmGa6pBU/eKE/mbU7n9y0s8pFXEbfw3sSSHb50asVkVyYi
	 1AAh7QIFfBBlIkRJqiTUba5elP/7Geu1ouP+modI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:49 +0200
Subject: [PATCH v2 05/15] media: i2c: ds90ub960: Fix logging SP & EQ status
 only for UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-5-c7db3b2ad89f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=yWjHH4n2+6qxjpnNorGxgj4zCDnWTjIhn3bpMUFpkHQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtP2uVKPKcI7op32ItnawQ82SlWZ9hjrK5fW
 Pe07/QN3/6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTwAKCRD6PaqMvJYe
 9aHUD/9m5RHUuApsOznbralzAXzJJq/+7ZQB7N/OQCZfQDbaUyyKBGUQwvF+jt//6gAjCej7uhW
 adh21/5DD4zteCUTf3PjhKhk2hvigNVcL0FeW4wCb2JZXJWu2OE/K0wDCAxnKQvD7v9xR3pqlEc
 kiZj6Bz29mYLEC5hFn4S2udBhlbrMTSvzNzxX+MW1leeRcrjK9SbT7EasU5iUe8Isa6K7YTcNKm
 3VPBucFvN1FKqiHwtmL+vzC10ANEjZWR0TLeTtiq8k6aNpov8T0hGLiqnVUn1aqtK7HHic8a3wB
 TDli3n1JLCug7MC44k4PZyWoTYJ7oa357WPhYqwrXVL/9yNyt4DtevTKQPQwDxYvsdY4L6GKbom
 TxHseYhzLeDqxej5NmuCvsSaLF5ni0WSNLi7S6BXG67kiLHrBQbtwwgRaTOsa2Q5eO38SRroXOo
 6mlLGn42/W9xXoOrWH6p9GhiCIpTqFmDqlxNLjbwh6wMI6YimU/pea8ORIL9Jb/DeBhI5ZpLtF5
 G20+bdqd+aYSWjzMAd1qk1VeR4jQL2xyLQy/uEbiOKGfPw9MywJN12zu65VqRh2wLJ8IGOdB+Xr
 tJ8+r4KQjrCPHcDFaRbPeO/rQbaOWxlr+rqKb+LOw126kSkDRfLkkXz8QE2eNZjMu02QoKViN9b
 JHjzk+MBLkK5J1w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 does not have SP and EQ registers, but the driver uses them in
log_status(). Fix this by separating the SP and EQ related log_status()
work into a separate function (for clarity) and calling that function
only for UB960.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 90 ++++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 6266a4558eb8..2273e79430c0 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2951,6 +2951,54 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
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
@@ -2998,8 +3046,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
-		u8 eq_level;
-		s8 strobe_pos;
 		unsigned int i;
 
 		dev_info(dev, "RX %u\n", nport);
@@ -3035,44 +3081,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
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


