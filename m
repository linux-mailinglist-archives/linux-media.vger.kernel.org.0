Return-Path: <linux-media+bounces-25275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E5A1B8F9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B109A3B0545
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136C121D595;
	Fri, 24 Jan 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r+e2OzLC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95121D004;
	Fri, 24 Jan 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731908; cv=none; b=mprxLv6zkaSe6oYFUk4gFHhBm0HAm9KBn3auK6kdhyskG4JsEfMN52a/pYq28Ej6UrfDUdrOD/LIfoL1sfLE/4kICPoZ9fBxUlzGppr4EhbwPOgtZnj2gNZabsM16bEp8D02oT7p7xKPODnrmFLaE8zTRr27t5Q0Zdr3/cberFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731908; c=relaxed/simple;
	bh=ZjMsTlpQWwn+TTxjvnR5Ep9rYnfLaF11CFKcxciXroA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJ7iZnIUA5hmvhf6S9OZFZPKI+xbkjAzCSnYlySaPms5vbckE6JJelxhuWogFy/t4m+2+PFtYCNR2ePsEEQts5Su8+UWfPHc13lJmIKxhYrm6DpD36JPq7G5K3RtmGua/CflDwT+rXT4+c1+g4l+TuQDaX2l2gQarVIJbOWhXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r+e2OzLC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 388BF11F1;
	Fri, 24 Jan 2025 16:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731832;
	bh=ZjMsTlpQWwn+TTxjvnR5Ep9rYnfLaF11CFKcxciXroA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r+e2OzLCf28hISV/fBdQ4Wh6EBWNWC0rhE+o1TJdGMm+cS1DKVrwj1mGXv4khE1ov
	 DswIvMbybEA/YlRxzz6nv4Mmhc8AcDFzE9Um8VldLvoQ1/nxw0HC/HSNq6YQogszN/
	 jVM7OB3euU7fTtbinOdVjfelsu+0DcYEQgNgbZ4A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:44 +0200
Subject: [PATCH v2 07/22] media: i2c: ds90ub913: Add error handling to
 ub913_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-7-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ZjMsTlpQWwn+TTxjvnR5Ep9rYnfLaF11CFKcxciXroA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68ubIrL5TiYssWnHWUbJQIQ+pqihLMLfdVCk
 gVeewrbAfeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLgAKCRD6PaqMvJYe
 9eFfD/9O5SiwYKU3goS0uMKjf9OGo73+6Ta1BTS0pwvraHkeURUKfo287rbLgmNr3cR7f3jJJjy
 XdsV3QcD9AA0YWD1itN0fT6HNznVE8tW/iUElm9xloZzsGyjrkr9y1f9VWZ35Xxv9Ey8v6vAcGP
 3RyrxzFMOB0UPrgnfYtMFKICZ+bUPIsrlyqqJxXCD7U8iIF6mDui1Jpm1fbklDOGjqt4Ueebxpf
 ZbwdX8oF8JGRVolHxD9b1jmiOWVjpVTXuQIXbgYg9uGxyUtgKjODKyOZ6N9nsXPio/bI4rmGeyR
 eVNLMYuoQzM3S5YDvRL9FQ5zR0LbXKdnubIBGTL61bTAxpCPdGeqMEgvafBFkpcfxW9PO/8/r33
 dHHpbXJG/HYM7vCD859rzZUNr1Cld2EBSopMnOt/IGWMw07uxgqxLjrNPRsAxKM9YARoUzOJFUV
 7emN1S3I7rPFY/LTvOu/fIs3hMTDKlwFudbSZHGy/VGCkt3hsdusMC5riPypjM8HX2wvKaf8mhM
 hCbYmClb4tLSnTYrI7tAW62n/A5kCI8E7df9KIlGQ83RrvNQGrLSOR5eHziZ0XQ9gOdTL9JkN1j
 DFtda5A8GK00gymVXluoPBgrZk38X1SI7CEJQoBMo5CVKUC8nuOM01TdzxMzxxg9BPpo7E55ixZ
 rnPBgnQ2N/aLTVw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling to ub913_log_status().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 983187493308..fcf9b0ca3469 100644
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
2.43.0


