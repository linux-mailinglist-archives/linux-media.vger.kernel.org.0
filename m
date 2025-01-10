Return-Path: <linux-media+bounces-24593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9AA08B33
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74ED188D38F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B2120D4ED;
	Fri, 10 Jan 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h0oXoeSi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A720CCCC;
	Fri, 10 Jan 2025 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500536; cv=none; b=lRpI/g5yUQ168JVbzU7x3X8g1pZrXg4YoxzKbUO7g3qYVGWu/ZJtErY9y8MY46DiSuyqtsOi+jMuM5Qw6DnggriLVlzMMHxc9K7AABYiAs4TxPs1K7YRFEvxPhCdCqU7M2fNDDAxLHpBMc+sgdMkbibxPtw+/ihcgTfTaghDF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500536; c=relaxed/simple;
	bh=XjaM0YwOS6nxizbXX1Yzxtppb/eYrdAYkmjsnuSndAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcIImrzwVgKjEZG0hhfSWRwXBlS4MpXeNQb7OaqibH+y13BR8G3W7PZanT5pIYVB0brJPL8ZBpgvjDcniUWmuTEJqCsGr6JlV4DSpQzIkGvtuv8lRP62HrSF3Jy21096soQlWMtGKmXIhzRdt0SzAwGDDwSoorlJQW68OVpVnD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h0oXoeSi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C2FA269B;
	Fri, 10 Jan 2025 10:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500457;
	bh=XjaM0YwOS6nxizbXX1Yzxtppb/eYrdAYkmjsnuSndAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h0oXoeSiYj/Y8JAj3TGO/1JguUnX6BpzOnYkfV00n8acD+UuuK/CI6a2n9i4j/zal
	 XOT8CNfj0zDSw0mZmrYGUIw0cN4ZVVrf46hxavssXiefNpy8e0jkpKi53WDAVjKRsu
	 KrkyDgrCQZc/vUqgw74FJVB2Ru0vmb1ufes39/jQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:13 +0200
Subject: [PATCH 13/19] media: i2c: ds90ub960: Move all RX port init code
 into ub960_init_rx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-13-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4398;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XjaM0YwOS6nxizbXX1Yzxtppb/eYrdAYkmjsnuSndAo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUVvB4cecieAxVScOpf9RKs1jOjhb83x56dU
 bLQxUiT1FiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFQAKCRD6PaqMvJYe
 9ZJAD/9YCGNXONe5E2ZetHQkPRZEx2mz3oORr7E1Yk4SIROF7+lMSJ6HR9F1aD1ljGIGYGJudN3
 gMDXgeOtkajH4DzEtsF80qbXfom0HUdxwxNN6GdhOQ1xgWi0QFJO4PDsCZrhXfp7LC/CEYlXx1c
 0vgTYF9W44eSp6oEfQ8IY7UtLkNRqPCLekgaHVS7C1y+Huwfi5k9RYUEoDOsOubv2lGgsHPriIG
 jZu+B1lk840Hyn2STiNm+x1sqomWKKGvFI5z+U5+Kr95mP+QAVTvBr6KqeEGZHAA+1SyqBSvMHL
 eVUtfP5+QSakyMtuoWw36/gxPgOG7VN/dF31RH5Gc56ISZnq3TVsl7OXu5W8iovjg6CA+GFgdIr
 Nhg1Csi3jRLJ9pXHcrJ9llTG5nZr1hA4VvVfMhoLw3Ip8sUK5t8lvQmfANz3TTy+VC+rLOYEvzF
 j44M1oP4pvfcslJbtC219e2305sPSg1DQTXfb/ZcN/D2rlyy7dPs8u9HruT7wsPaBJu2OCyvK9O
 2tDdq8U9+VyzVjYzyfDySRZDNzeK7S5v203JcuC26ixUvpaq4h14BS7hi9lS1HzGZt9yMusAuE7
 tcygSrMzl2gopTvgk/5Xs53UOIstxU8TV/xW+owDOXk9vecipjOlQuWlRPx/T4TjQzZ8N+emvBr
 tLPz8jpVEKLOOhg==
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
index 02e22ae813fa..cc944d737524 100644
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
 	for_each_active_rxport(priv) {
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
+	for_each_active_rxport(priv)
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
-	for_each_active_rxport(priv)
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


