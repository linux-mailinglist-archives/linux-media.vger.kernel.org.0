Return-Path: <linux-media+bounces-24598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E5A08B47
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9465168BF4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061FE209F5F;
	Fri, 10 Jan 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h5q6Z6fF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD120A5F3;
	Fri, 10 Jan 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500546; cv=none; b=jGGLz6MHu8jgpdqwKs1tANncSo7+Cb57Q164OXGopKFbAiWQwqpZGTXFkbkEDDHX5ENT7ha8lSdbTZ9qWg03F8X2Pj28QQtyo+Mx2RzhiGvPe+tBDYbwD8Ue5meOREO8G8HllIldzvuO9v1lyXfnx66rlupLbP5bWiLqEzKbyZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500546; c=relaxed/simple;
	bh=KdKGroifs831tSI8Vh8STKybkm+iASoe48SfOf8JeM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFbsdBMtog5d1/yJYqVeVoCdEKgH7DhKYAP48kTXr05g/uP/srjeyT5OdV19lI+MOaJIJee1oHYYd+kLyHxw4o3q+rdDmpLa6JJzRRChtmS4VDJQBJ7AqqtV6MhlIbj+YsOD5tRtNWTYX+UPFnjRjJG5YdnaYCkctiY5u7Hppa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h5q6Z6fF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7731C26A2;
	Fri, 10 Jan 2025 10:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500460;
	bh=KdKGroifs831tSI8Vh8STKybkm+iASoe48SfOf8JeM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h5q6Z6fFhhLwKrHqvd37gPOY3jRPcov2NTMF3SwY+brlMtPbp5naTRsHAD/NC7kUx
	 2CEeB9BEPI1WcSR9kXQkovhJLLdP7eTFK1a1rdL07oaUwjjYjAIHy8dnb9Zbo4Z+9O
	 DmpNiNqk7at/KScOfHQkFhSb59h1IY/KHHIq4LaE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:18 +0200
Subject: [PATCH 18/19] media: i2c: ds90ub960: Configure serializer using
 back-channel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-18-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6543;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=o25qM9tbApGD5KT0V52QfFJt1agsjTKsyXqEjqXOvxw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUXLkdO0bDxaRPAW3/aKYm0qbz4GarxKJ+8f
 vVaR34XjQ2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFwAKCRD6PaqMvJYe
 9evsD/9zD6obQsMiRBp5L8qUVk0hZdublhPH/NBsrjLjzNzptrTvIdWWjujhyWeUhRJ5pA5mycH
 4hyKNGwdSmHF2/W3mSq1W+G2tBpftJt0fkSZDtHZxba6uIGSZMcw6u90LbnnfolLKnjvSyAeqEg
 B8/7vBPHvr0Rzee5TmEmA5CTi34yRUmfNO6usUL4Yf+lORJ8Su0jd6FE8N64HjpaUn822MawqWm
 hea3gSUkrLC4wexF0HsBHmlOC0BLtcfpGx5ZwsGapcs5tt2EoWOJ8ikuXM3LRSBQNETjCVz5Se4
 o+mntc9FqwNi0ftQzkhz/o3+QZCvlkIOdxAk2RXeUxMq78K5emiRT1OFzDcmfci09sUMCYEs2BC
 0YvnxaXoL9nWPC8f22rFvYEU+CK1kpTuzIu2oiNenHR0a79LsCPavq4mqqGN8YfRpgS4n1F8Btb
 r3IYhW15yqcKq1BGA5lQPCp6Po9zAAlqgyu0pXnDgkGtEa6CSu24xVfLUCdMH/Il+Epd9gi4M1Z
 PtjCKDPhHPLfuCZwrrviQulz20vbTyZ7pXxAlt5ZhLFMnISm7Eu8/sHwFJU1vhzUoD3+sCB5YTj
 fK2SXD8/ZoQ5pgC3NIDJouInNS5bemOpH9bp762s9FM/Dc+4yy9lu7ousD3TxIEhru0yyrxnWL5
 tajXhTWfwes8fqw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

For DS90UB9702-Q1, it is recommended to configure some serializer
settings over the back-channel before the forward-channel is active.

This can only be done if the serializer's I2C address on the FPD-Link
bus is populated in the device tree node.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 124 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index a534d077f045..1ec3c060d4c6 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -248,13 +248,16 @@ MODULE_PARM_DESC(enable_sscg, "Enable SSCG (if available)");
 
 #define UB960_RR_BCC_CONFIG			0x58
 #define UB960_RR_BCC_CONFIG_BC_ALWAYS_ON	BIT(4)
+#define UB960_RR_BCC_CONFIG_AUTO_ACK_ALL	BIT(5)
 #define UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
 #define UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK	GENMASK(2, 0)
 
 #define UB960_RR_DATAPATH_CTL1			0x59
 #define UB960_RR_DATAPATH_CTL2			0x5a
 #define UB960_RR_SER_ID				0x5b
+#define UB960_RR_SER_ID_FREEZE_DEVICE_ID	BIT(0)
 #define UB960_RR_SER_ALIAS_ID			0x5c
+#define UB960_RR_SER_ALIAS_ID_AUTO_ACK		BIT(0)
 
 /* For these two register sets: n < UB960_MAX_PORT_ALIASES */
 #define UB960_RR_SLAVE_ID(n)			(0x5d + (n))
@@ -507,7 +510,9 @@ struct ub960_rxport {
 		struct fwnode_handle *fwnode;
 		struct i2c_client *client;
 		unsigned short alias; /* I2C alias (lower 7 bits) */
+		short addr; /* Local I2C address (lower 7 bits) */
 		struct ds90ub9xx_platform_data pdata;
+		struct regmap *regmap;
 	} ser;
 
 	enum ub960_rxport_mode  rx_mode;
@@ -2005,6 +2010,78 @@ static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
 	}
 }
 
+static int ub960_rxport_serializer_write(struct ub960_rxport *rxport, u8 reg,
+					 u8 val, int *err)
+{
+	struct ub960_data *priv = rxport->priv;
+	struct device *dev = &priv->client->dev;
+	union i2c_smbus_data data;
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	data.byte = val;
+
+	ret = i2c_smbus_xfer(priv->client->adapter, rxport->ser.alias, 0,
+			     I2C_SMBUS_WRITE, reg, I2C_SMBUS_BYTE_DATA, &data);
+	if (ret)
+		dev_err(dev,
+			"rx%u: cannot write serializer register 0x%02x (%d)!\n",
+			rxport->nport, reg, ret);
+
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int ub960_rxport_bc_ser_config(struct ub960_rxport *rxport)
+{
+	struct ub960_data *priv = rxport->priv;
+	struct device *dev = &priv->client->dev;
+	u8 nport = rxport->nport;
+	int ret;
+
+	/* Skip port if serializer's address is not known */
+	if (rxport->ser.addr < 0) {
+		dev_dbg(dev,
+			"rx%u: 'i2c-addr' property missing, skip serializer configuration\n",
+			nport);
+		return 0;
+	}
+
+	/*
+	 * Note: the code here probably only works for CSI-2 serializers in
+	 * sync mode. To support other serializers the BC related configuration
+	 * should be done before calling this function.
+	 */
+
+	/* Enable I2C passthrough and auto-ack on BC */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH |
+					 UB960_RR_BCC_CONFIG_AUTO_ACK_ALL,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH |
+					 UB960_RR_BCC_CONFIG_AUTO_ACK_ALL,
+				 &ret);
+
+	if (ret)
+		return ret;
+
+	/* Disable BC alternate mode auto detect */
+	ub960_rxport_serializer_write(rxport, 0x4b, 0x02, &ret);
+	/* Decrease link detect timer */
+	ub960_rxport_serializer_write(rxport, 0x49, 0x06, &ret);
+
+	/* Disable I2C passthrough and auto-ack on BC */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH |
+					 UB960_RR_BCC_CONFIG_AUTO_ACK_ALL,
+				 0x0, &ret);
+
+	return ret;
+}
+
 static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 {
 	struct ub960_rxport *rxport = priv->rxports[nport];
@@ -2956,6 +3033,36 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	if (ret)
 		return ret;
 
+	for_each_active_rxport(priv) {
+		if (it.rxport->ser.addr >= 0) {
+			/*
+			 * Set serializer's I2C address if set in the dts file,
+			 * and freeze it to prevent updates from the FC.
+			 */
+			ub960_rxport_write(priv, it.nport, UB960_RR_SER_ID,
+					   it.rxport->ser.addr << 1 |
+					   UB960_RR_SER_ID_FREEZE_DEVICE_ID,
+					   &ret);
+		}
+
+		/* Set serializer I2C alias with auto-ack */
+		ub960_rxport_write(priv, it.nport, UB960_RR_SER_ALIAS_ID,
+				   it.rxport->ser.alias << 1 |
+				   UB960_RR_SER_ALIAS_ID_AUTO_ACK, &ret);
+
+		if (ret)
+			return ret;
+	}
+
+	for_each_active_rxport(priv) {
+		if (fwnode_device_is_compatible(it.rxport->ser.fwnode,
+						"ti,ds90ub971-q1")) {
+			ret = ub960_rxport_bc_ser_config(it.rxport);
+			if (ret)
+				return ret;
+		}
+	}
+
 	if (ub960_enable_sscg) {
 		ret = ub960_enable_sscg_ub9702(priv);
 		if (ret)
@@ -3090,16 +3197,17 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 		ub960_rxport_write(priv, it.nport, UB960_RR_PORT_ICR_LO, 0x7f,
 				   &ret);
 
+		/* Clear serializer I2C alias auto-ack */
+		ub960_rxport_update_bits(priv, it.nport, UB960_RR_SER_ALIAS_ID,
+					 UB960_RR_SER_ALIAS_ID_AUTO_ACK, 0,
+					 &ret);
+
 		/* Enable I2C_PASS_THROUGH */
 		ub960_rxport_update_bits(priv, it.nport, UB960_RR_BCC_CONFIG,
 					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
 					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
 					 &ret);
 
-		/* Enable I2C communication to the serializer via the alias */
-		ub960_rxport_write(priv, it.nport, UB960_RR_SER_ALIAS_ID,
-				   it.rxport->ser.alias << 1, &ret);
-
 		if (ret)
 			return ret;
 	}
@@ -4258,6 +4366,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	s32 strobe_pos;
 	u32 eq_level;
 	u32 ser_i2c_alias;
+	u32 ser_i2c_addr;
 	int ret;
 
 	cdr_mode = RXPORT_CDR_FPD3;
@@ -4363,6 +4472,13 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	}
 	rxport->ser.alias = ser_i2c_alias;
 
+	ret = fwnode_property_read_u32(link_fwnode, "i2c-addr",
+				       &ser_i2c_addr);
+	if (ret)
+		rxport->ser.addr = -EINVAL;
+	else
+		rxport->ser.addr = ser_i2c_addr;
+
 	rxport->ser.fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
 	if (!rxport->ser.fwnode) {
 		dev_err(dev, "rx%u: missing 'serializer' node\n", nport);

-- 
2.43.0


