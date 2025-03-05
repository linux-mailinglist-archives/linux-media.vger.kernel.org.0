Return-Path: <linux-media+bounces-27616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32074A4FE78
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83DB57A92CF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9396C24418F;
	Wed,  5 Mar 2025 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L28ebd2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1DF233704;
	Wed,  5 Mar 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177042; cv=none; b=J+ct8ySWB+pWQiw6zzvDXhJkvD/NNB6jN2wi4bzycOD7+Wncq+awZrn0mkgepcisYunQnBRWEm7RTUnUy2jdoWaEtKbE47fu3NjOLQdYfCGGeUBudhxAA5Wl6207dpyCeHyzI87DJF2TpQgI4HadyUS5lGsUaVSNQ1TUUiPhP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177042; c=relaxed/simple;
	bh=c8HNlQtVKz71RBTz76uv+PsgcyAwc2ltozUI9rKht10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cthf7v/C+dYEtTBu9CHUm0DQ+xesoTXczy6lxVbyuSa4GYi0NBcQuN7proshetiOpfc3ZXY6LbffEO1pAd4nxjksrPzNDAQBYWQ9tOJmh9Bp2BEhuGZuzoCLpJwt0fNFSRFzFq2JP+iWxsWMbXokjKLIx8t1yHq/zbqQ2t5dkRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L28ebd2Z; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525CHCks3942494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 06:17:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741177032;
	bh=DUHp9eSHGc+P9s82racCnHhMayC632vJ3CcA8SF8Sno=;
	h=From:To:CC:Subject:Date;
	b=L28ebd2Z23FcffUVb6x70umOHgcsvecVY2r9MFzzNvqB5y1DRMK7xMYfhTtmzRyWe
	 WODYTTzPkCrcY3DTxG3bc/D2OLCCtndfK/FF3O4oKiDn4nD3F931ebgBin9TNSHgzm
	 dTnCmWQiQlwcN+c0yGt+ITr7AgGLgsmxtvXAYmUI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525CHCRI013954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Mar 2025 06:17:12 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 06:17:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 06:17:11 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525CH9EG095057;
	Wed, 5 Mar 2025 06:17:09 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>
Subject: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
Date: Wed, 5 Mar 2025 17:47:05 +0530
Message-ID: <20250305121705.2143540-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The DS90UB960-Q1 includes a second I2C interface for independent control
of the deserializer and remote devices. However, the current driver does
not utilize it, thus restricting users to either CSI TX0 or CSI TX1 on
the primary I2C interface. Enable the second I2C interface, allowing
flexible routing where CSI TX0 can be used on the primary and CSI TX1 on
the secondary, or vice versa by enabling appropriate ports in DT. To
achieve the same only modify the bits relevant to the enabled RX and TX
ports of that interface and during probe and enable_streams call, few
registers were being reset to HW reset state, these operations are not
necessary for functionality and resets the state when secondary I2C
interface is probed, thus drop them.

DS90UB960 data sheet: https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 64 +++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b..4c0052e05071 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -73,6 +73,9 @@
 
 #define UB960_NUM_BC_GPIOS		4
 
+#define UB960_ALL_RX_PORTS_MASK	GENMASK(3, 0)
+#define UB960_CSI_TX0			BIT(4)
+
 /*
  * Register map
  *
@@ -111,6 +114,7 @@
 #define UB960_SR_SCL_HIGH_TIME			0x0a
 #define UB960_SR_SCL_LOW_TIME			0x0b
 #define UB960_SR_RX_PORT_CTL			0x0c
+#define UB960_SR_RX_PORT_CTL_BCC_MAP		GENMASK(7, 4)
 #define UB960_SR_IO_CTL				0x0d
 #define UB960_SR_GPIO_PIN_STS			0x0e
 #define UB960_SR_GPIO_INPUT_CTL			0x0f
@@ -524,6 +528,8 @@ struct ub960_data {
 
 	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
 	s64 tx_link_freq[1];
+	u8 rx_mask;
+	u8 tx_mask;
 
 	struct i2c_atr *atr;
 
@@ -2168,6 +2174,17 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 static int ub960_init_rx_ports(struct ub960_data *priv)
 {
 	unsigned int nport;
+	u8 enabled_rxports_mask;
+	u8 enabled_rxports;
+	int ret;
+
+	/* Configure i2c interface for RX ports */
+	enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
+	enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;
+
+	ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask, enabled_rxports);
+	if (ret)
+		return ret;
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
@@ -2509,14 +2526,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		}
 	}
 
-	/* Configure RX ports */
-
-	/*
-	 * Keep all port forwardings disabled by default. Forwarding will be
-	 * enabled in ub960_enable_rx_port.
-	 */
-	fwd_ctl = GENMASK(7, 4);
-
 	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports;
 	     nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
@@ -2570,9 +2579,9 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
 	}
 
-	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
+	ret = ub960_update_bits(priv, UB960_SR_FWD_CTL1, priv->rx_mask, fwd_ctl);
 
-	return 0;
+	return ret;
 }
 
 static void ub960_update_streaming_status(struct ub960_data *priv)
@@ -3574,6 +3583,32 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	return 0;
 }
 
+static int ub960_parse_active_ports(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int nport;
+
+	priv->rx_mask = 0;
+	priv->tx_mask = 0;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports + priv->hw_data->num_txports; nport++) {
+		struct fwnode_handle *ep_fwnode;
+
+		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), nport, 0, 0);
+		if (!ep_fwnode)
+			continue;
+
+		if (nport < priv->hw_data->num_rxports)
+			priv->rx_mask |= BIT(nport);
+		else
+			priv->tx_mask |= BIT(nport);
+
+		fwnode_handle_put(ep_fwnode);
+	}
+
+	return 0;
+}
+
 static int ub960_parse_dt(struct ub960_data *priv)
 {
 	int ret;
@@ -3900,11 +3935,6 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		!!(dev_sts & BIT(4)), refclk_freq,
 		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
 
-	/* Disable all RX ports by default */
-	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
-	if (ret)
-		goto err_pd_gpio;
-
 	/* release GPIO lock */
 	if (priv->hw_data->is_ub9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
@@ -3969,6 +3999,10 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_mutex_destroy;
 
+	ret = ub960_parse_active_ports(priv);
+	if (ret)
+		goto err_disable_core_hw;
+
 	ret = ub960_parse_dt(priv);
 	if (ret)
 		goto err_disable_core_hw;
-- 
2.34.1


