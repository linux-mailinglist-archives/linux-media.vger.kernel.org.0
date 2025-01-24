Return-Path: <linux-media+bounces-25282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEDA1B8F7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E8B1890F16
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AAB222598;
	Fri, 24 Jan 2025 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g1kZAwJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A522257A;
	Fri, 24 Jan 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731921; cv=none; b=EVZ2WcqwbKFcOmGfERe+DuYDGZkNbqkMZiM/gtWY+lH03MTlRHyG5tcUeN7WiJ31BgvbLo1pITku40xCCVJ6sl14ZQAbNv7HzCARCG5pDcWAAPzwL1VCgxXWQ6i18TGzKJepPBslT4KnY7z/Jt0S7LwywECYrb9aovbsMwb52yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731921; c=relaxed/simple;
	bh=xZ7psnWvXF6i+m31Zeng0obThzYex6xiUZGuJ6GYE4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix5x1upX7cmTQCmjSfupNRdg8wD05muFFq6IE3YKvnx8uJUaEaoXQHrHEPtoJ7NLHCQaewcZNNwLdHIHPee+hyvQQCUVJrEXhqgZtmXsX+m+d4WF4hQJle+39aBpywyV9uyjk2KfoiFRhpcnnCKNvxNJPJTmQ3d+J/7g+as6EDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g1kZAwJ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 035F31B83;
	Fri, 24 Jan 2025 16:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731836;
	bh=xZ7psnWvXF6i+m31Zeng0obThzYex6xiUZGuJ6GYE4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g1kZAwJ2SVgk31nqYdgXl3N+op9MtiVHnVa3mrzx5g5PBVRC6ztwQCT+jELlbG6b0
	 5m3mjLyvDJA6i2wTZDDWssWg1NXAmtQzpxKDdgO9z14Yyc/hQsrZBWr/GFBQ6ajpXJ
	 TSdjGRNIeZc0Axyd6CdSVRQs530pa7oXtirdft6w=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:51 +0200
Subject: [PATCH v2 14/22] media: i2c: ds90ub960: Move all RX port init code
 into ub960_init_rx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-14-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4410;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xZ7psnWvXF6i+m31Zeng0obThzYex6xiUZGuJ6GYE4k=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68wwZ+jNKdgzZl5wzLIC7+DIC/UrOaNk8kLj
 8XmSf8I7GWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMAAKCRD6PaqMvJYe
 9Rs2EACYzg1j2T3/u2/HltjYaX5UGzxSUPrzIOBHaNE/zD4Glo5m4T5FATajItkNuGKrl1z4At0
 EB3drnxdIQ91A8KtnCeCKO1kB8d4oK2fiBiV0gmfg26pT0RSj0Tt20vrZ6ASqtgz+U/J/1NwHiE
 tv8A7c4tDkMr6KV5GsGH9vBK08vNKxBxB5OJRVCJ7sPU92cgzsElqeXWqRpX/7M8yjzGEp4HT0M
 +u4makrDk9GISp1RD7stO3t6uObCpq5zE/QRF/9NxySOgyK7sPeROmjFBOF8DuPCSpcO+3a7iBN
 fTnx7kH6kTQXYbn/yKFNVAzfsk94cN58rx64U/sVI0yFvr/VBLWZzssiJnlk5u1zNWe3AQwmajO
 d0BbrrDH8yteMSez8Kso3QuYWVdoxvDey2tbSrNMYCPpcB/vgZr56Y7US41lal2k20yTQSKnosf
 Z5v9mMf3LJOVnxN1tI3/bH7xdeg48dLhBDCeDCsZM7CvgxI/jUmOCLhXo5xpDqwxFX3bpFrdTi5
 e+Zp8EC3owXhSjGPTvVgsFBLAFoqg1vVwkP1/4+TJGndAnyCeygz0wKgv7s1nPoiNmYmsy4h+m3
 ln+aU6guUb3yMg3eCx02rdCs8b991zPMIa2L6o0fPwdZLkJEbuB0evE4hXvKOgm3DkTcuxG0dqk
 +WPOVVkZV6u9hzw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We have some code in probe() which is related to RX port initialization,
and should be in ub960_init_rx_ports(). Move the code there.

We also move ub960_reset() so that it is accessible from
ub960_init_rx_ports().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 115 ++++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 25859417fa60..0fdebf258c29 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1225,6 +1225,33 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 	return ret;
 }
 
+static int ub960_reset(struct ub960_data *priv, bool reset_regs)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+	u8 bit;
+
+	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
+			   UB960_SR_RESET_DIGITAL_RESET0;
+
+	ret = ub960_write(priv, UB960_SR_RESET, bit, NULL);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
+				       (v & bit) == 0, 2000, 100000);
+
+	mutex_unlock(&priv->reg_lock);
+
+	if (ret)
+		dev_err(dev, "reset failed: %d\n", ret);
+
+	return ret;
+}
+
 /* -----------------------------------------------------------------------------
  * I2C-ATR (address translator)
  */
@@ -2493,6 +2520,11 @@ static int ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 static int ub960_init_rx_ports(struct ub960_data *priv)
 {
+	struct device *dev = &priv->client->dev;
+	unsigned int port_lock_mask;
+	unsigned int port_mask;
+	int ret;
+
 	for_each_active_rxport(priv, it) {
 		int ret;
 
@@ -2505,6 +2537,33 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 			return ret;
 	}
 
+	ret = ub960_reset(priv, false);
+	if (ret)
+		return ret;
+
+	port_mask = 0;
+
+	for_each_active_rxport(priv, it)
+		port_mask |= BIT(it.nport);
+
+	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
+	if (ret)
+		return ret;
+
+	if (port_mask != port_lock_mask) {
+		ret = -EIO;
+		dev_err_probe(dev, ret, "Failed to lock all RX ports\n");
+		return ret;
+	}
+
+	/*
+	 * Clear any errors caused by switching the RX port settings while
+	 * probing.
+	 */
+	ret = ub960_clear_rx_errors(priv);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -4168,33 +4227,6 @@ static const struct regmap_config ub960_regmap_config = {
 	.disable_locking = true,
 };
 
-static int ub960_reset(struct ub960_data *priv, bool reset_regs)
-{
-	struct device *dev = &priv->client->dev;
-	unsigned int v;
-	int ret;
-	u8 bit;
-
-	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
-			   UB960_SR_RESET_DIGITAL_RESET0;
-
-	ret = ub960_write(priv, UB960_SR_RESET, bit, NULL);
-	if (ret)
-		return ret;
-
-	mutex_lock(&priv->reg_lock);
-
-	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
-				       (v & bit) == 0, 2000, 100000);
-
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret)
-		dev_err(dev, "reset failed: %d\n", ret);
-
-	return ret;
-}
-
 static int ub960_get_hw_resources(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -4319,8 +4351,6 @@ static int ub960_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ub960_data *priv;
-	unsigned int port_lock_mask;
-	unsigned int port_mask;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -4367,33 +4397,6 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_disable_vpocs;
 
-	ret = ub960_reset(priv, false);
-	if (ret)
-		goto err_disable_vpocs;
-
-	port_mask = 0;
-
-	for_each_active_rxport(priv, it)
-		port_mask |= BIT(it.nport);
-
-	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
-	if (ret)
-		goto err_disable_vpocs;
-
-	if (port_mask != port_lock_mask) {
-		ret = -EIO;
-		dev_err_probe(dev, ret, "Failed to lock all RX ports\n");
-		goto err_disable_vpocs;
-	}
-
-	/*
-	 * Clear any errors caused by switching the RX port settings while
-	 * probing.
-	 */
-	ret = ub960_clear_rx_errors(priv);
-	if (ret)
-		goto err_disable_vpocs;
-
 	ret = ub960_init_atr(priv);
 	if (ret)
 		goto err_disable_vpocs;

-- 
2.43.0


