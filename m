Return-Path: <linux-media+bounces-27366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD549A4C619
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97E4188D6B9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC822A4CB;
	Mon,  3 Mar 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PIlfh3nD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478621D00D;
	Mon,  3 Mar 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017776; cv=none; b=COb8FrfDiwDrrfnXS4TnqCDly2KGySmcUKJ55gcXrTYpD3Q/M/bk09shAY4LuzsusmDckdCq3rOjwoUATY0l8JvteEcWDDrJlW+2r88743zwyq3tgyYlZndlriApEcklQ1UU4jmHa9iA/4XvAu4pJCjbONaU7pmOKKnTPZ1BTIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017776; c=relaxed/simple;
	bh=YGNcpfecclFHsUxiBA262QSa31eZiUPpvs7Xod/t+R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utbytm6n+kwPoSpzqt8NtsmT0QXJb00wB0I5brjIhwnci2Gdh7ttpF0ZY/9hza313VFBRfTiaeiklLzaYN2JmX31noQ0e5R2LBEYGeBompuWg17YL9cc8RwxkXxnkTcfySUlvJsMk+qd7VasJg0LAwIcmGj98sO3LTzqdjx5x8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PIlfh3nD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CBB21189;
	Mon,  3 Mar 2025 17:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017682;
	bh=YGNcpfecclFHsUxiBA262QSa31eZiUPpvs7Xod/t+R4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PIlfh3nDOlUwoz02C0N6SFzfsseXOAZX1+z4aWxI7MNCm8EiIN7K91Ws9R/Nr89P3
	 z4qAesf1AbxY7JWIQq0MEvDSym6k3eB054LBdL1GpjKoelaX6+V/neTabfNBTgY9jt
	 rHSIUcYo3s+0HDGxpuaqYsCJSIEpeTIwgOwehjEw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:10 +0530
Subject: [PATCH v3 07/19] media: i2c: ds90ub913: Add error handling to
 ub913_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-7-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2117;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7IJDzezFLx1eVHMvd2PtZf75W4/IFV+34VaoTHVKehc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/ih4C/2QW9VkIjBlUwlD0rlMxR82Yh1Q7b
 tbjz3ORQZeJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 RUuiEACbE+eSyNbHYJbiIaI9/KZaCF5jHeOAVUPu/X8T6lqsSeRDC2IkSRxFnyilSNXJLTZSl1u
 pTqiVu1C39s4E0ZrJY1DGidRCkrsZddmhkjmYiuTMn99oqiwUJ2lnQS0VRb5ua/t1OcQki/in36
 fiV7KJS5pyXqL+vOmW5ZmvYieGRleMBGVaCLyZiQWh412rysBr4uvuKQkIseKD0oUOWO+Lq+4Yp
 RRRiq1y22dxxEDoboopPwNKuMr8MzVkM0YFX9MWnoXhgGy8r4aYMQEimXXo7udMvPhXlM4EoepT
 Xgc0Q5M9q4BR1PYjQqlM7Www813rePN7C/gze1445YqIo71fatgzUUr5kJNlZiLpVaq/PZtk9X9
 fID2Em/R4/VqBAsm9eC9QGek0w0Y6b6hB+jXaVV9q1cgWx+KRcq6wbHl7l6cCaUJAbz1ixDpzfk
 oh1bPaaC3ZN7O4bdzGg0pZP7BJRS5e6j4NSRXIIUxX3UHUnkl0E2fSl0eUWMgPedUXsM8s6zauh
 Yr1/ODQvMxwL1Apm2xZ2rL7u+l/qQ1LLOCi0qF0kOaBbbZwJtfG3upIXYJQM7A1ZEKceRbjlzFi
 975EklO2o2vtX4a9S9Luw5l8pzEMtvWFv7GstPkK8OcDFUoi8M8eW6MDlsvFzEqZ1Fw2bELom7a
 l2p0BpHgCP274ZQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Add error handling to ub913_log_status().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index f38421d34d204fa9ab898d10c6b69942858bced2..401cc2a10c3c9855b1875b2ff200d5109e80b2e0 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -504,25 +504,41 @@ static int ub913_log_status(struct v4l2_subdev *sd)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
 	struct device *dev = &priv->client->dev;
-	u8 v = 0, v1 = 0, v2 = 0;
+	u8 v, v1, v2;
+	int ret;
+
+	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
+	if (ret)
+		return ret;
 
-	ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
 	dev_info(dev, "MODE_SEL %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1, NULL);
-	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2, NULL);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1, &ret);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2, &ret);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
 
 	/* clear CRC errors */
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v, NULL);
+	ub913_read(priv, UB913_REG_GENERAL_CFG, &v, &ret);
 	ub913_write(priv, UB913_REG_GENERAL_CFG,
-		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET, NULL);
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v, NULL);
+		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET, &ret);
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v, &ret);
+
+	if (ret)
+		return ret;
+
+	ret = ub913_read(priv, UB913_REG_GENERAL_STATUS, &v, NULL);
+	if (ret)
+		return ret;
 
-	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v, NULL);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_PLL_OVR, &v, NULL);
+	ret = ub913_read(priv, UB913_REG_PLL_OVR, &v, NULL);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "PLL_OVR %#02x\n", v);
 
 	return 0;

-- 
2.48.1


