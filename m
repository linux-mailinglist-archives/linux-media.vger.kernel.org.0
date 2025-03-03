Return-Path: <linux-media+bounces-27373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC0A4C62E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 009147A59AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7D0230999;
	Mon,  3 Mar 2025 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JBn3K3GY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401722FE07;
	Mon,  3 Mar 2025 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017814; cv=none; b=eIrShVZelMyy3R46HcilrMCI5PYkyY2L20cAT+AswBSdwY79GaFCykbeVu1gEZknMl2kTuWs1uD5VjW3mgxEAQ52sFjKYyBfXU5ckl/r/B8R5j3OqYJmOlz3sLNgnszmvLhoLosQvmG2IEx02oBi0LcJXBE3S+9lui5D95+/eRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017814; c=relaxed/simple;
	bh=1LYoHn7cglryZkiunEyyZ2IYGQPqXjjRMLLhkhy7Uag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7s56DFiaUbgfXbPcqT8m0kK7u0RdDh0R2pzgsZewRkx14CY5gGV0iWCwmtcbSZ8st1SHFKE2OjDYta7tJXyJ48khZX4YuWJ3QTYGR5avLuH9+tMpCpfUzEcs8klDP11MfPdIwt/dUW05ZBggAsEpuEvGDd7CX4H6hAht3j9JRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JBn3K3GY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B82122A;
	Mon,  3 Mar 2025 17:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017718;
	bh=1LYoHn7cglryZkiunEyyZ2IYGQPqXjjRMLLhkhy7Uag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JBn3K3GYfdvZBGaT+589Fnc6dDJ/XGt45GFpneIFeqFY1LOxRVZt1KwYhjPOL3vPK
	 d2cCH4LUzwzEMRXr6j8QhAdbM8bSjrqgnjAVldq7SIEcFvzhIqNUFeOBJUJ1eiHkrC
	 /cHmxShzRdWjXuTsWrQpFJme1BLsZehMAgKbD+eA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:17 +0530
Subject: [PATCH v3 14/19] media: i2c: ds90ub960: Move all RX port init code
 into ub960_init_rx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-14-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=5vAdE8JH99elaLom56l61DRpwX5MtLaWKo6x3CCqmJs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKAAshWsTTRAIQ3B8xQcLNqdfT6Sv+Y3Gist
 RTGBm9PTvSJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 RV1QD/0cD6y+n8fCR2jGhvFphxQFZULt+hjWSRS6xAOHLso/zgbXCR7NN7/nfAGhZHcUhYKwyVQ
 NPbZZXeGFloN8UPHa6MIhqKAo1KkB3gFNLo+Pfa/9+moeTrUN8O75FH791x6SqGqTv2r3xgxnJp
 vt3Jao7zWqIqkCL3th8ila0Ilfdgp94hpLmLstrbzPbGJmZfKOZ/FwqpMdLLv7kEQ8XfmNdUm1D
 kyqjPEbDVfr/Oy7O/rb7i4XBkNvWRDj3YkF3qe4W2gcoV0xKAPZtlA9/BBZ/T09wcL8ZtqR3Zxv
 DcqgqqkEy531fGaj8gt5CM3pQm4vZW61oL+A6bRWxPTCKZD+aZrF2OUTals/ExnTvBukXbEmjYy
 OlMVCccz2J2kif3vUMSuKJ1ZlgbBfcLKubLUJt94gHsERytZmvTVUk8B4VNXA4Ew/pxDZJUeNNe
 m2koPHTDd6edCEdldCLV1HHuJLYEeStS0BCqCZkDguQTC6TDTgPj8jIrHbDxzOY3ivDIHYaGwmz
 2MubCALEf8IxmCad5eAyaTL1BptjShOdeMmgoFkDdEcpmULY4OB4PlEGsyXMD5+oEHmwaWCA1FR
 oNb9aN4WsP5qT2m5dexC5ZPUWiI5MPlgCNZTCUlUNvcauM7s4vzPQ+/nxufPNS7OFe0nzv6JMfa
 PsK3ZJkk0bXqzAg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

We have some code in probe() which is related to RX port initialization,
and should be in ub960_init_rx_ports(). Move the code there.

We also move ub960_reset() so that it is accessible from
ub960_init_rx_ports().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 115 ++++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index af7ba1c824b12893bd31bed7a88a6e3bf8a62f7e..130bf4cc0a7485e997dd979954a9b6d28b693a5a 100644
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
2.48.1


