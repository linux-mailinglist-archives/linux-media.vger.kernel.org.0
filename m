Return-Path: <linux-media+bounces-27377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD1A4C63A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02D03A533E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AA323909E;
	Mon,  3 Mar 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hgf+maBC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96421236A7A;
	Mon,  3 Mar 2025 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017835; cv=none; b=S/Amx8qMcNqNftzzO644/yZtlOA4q19xMQobl5ITL1BZ1oDvRvSNEXhEIwMKJ5JNL5dSqDlGCPRx6OXIVDs7sFs+HVe/LTwbXg9VonjrR7v2TBdxWXrYT9C1/nD3Wmsw5xD6Vaojp00mslo9S33dKD+s6t9cCYjkrbkSi4xoMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017835; c=relaxed/simple;
	bh=1q1zBUC/6Xctpn+8lCKjsOKd2v8UbT2NxezGcIrTzP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UxRUKyChDwb5XYE2gmx/AAmREBnhNcryHtDOi+7nbijM+eV6KojHILHRTKWO265LZYZfu4hI0VOPmHYPz64rmU8QEM+XNI+FGHIgQh3nU0fw4uDrcJ2ZHxjyBQiNXZyWAdXRkSvkmm2w2T+FluhqRqbccqqSIrGPhzu8yyJF7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hgf+maBC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C593722A;
	Mon,  3 Mar 2025 17:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017741;
	bh=1q1zBUC/6Xctpn+8lCKjsOKd2v8UbT2NxezGcIrTzP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hgf+maBCStuGHDbP4Zv+0AvRZ5qGFf31KWHfgGTo9EhydDJghYmw1RblxrIGl4hJt
	 UKJK9tmhZj3+fz+U6tOWvls3T2MXEUtd0ujrMbeIoF0pQSd+NYJ8oscntm7p0n7KLd
	 WUyz4huowVAtky0HHGIPQR0EGoUL17HFfiHR5Y7Y=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:21 +0530
Subject: [PATCH v3 18/19] media: i2c: ds90ub960: Configure serializer using
 back-channel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-18-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7074;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=1q1zBUC/6Xctpn+8lCKjsOKd2v8UbT2NxezGcIrTzP0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKB5TvFRvHGOCzGdkgjzqcwykU1h9C4Jq1Mj
 nYHjyuSqymJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgQAKCRBD3pH5JJpx
 RRMID/9u+pXglliec+lUBL/xo9DFAHMemUpY+qcJAfQ3/35yNxjFNeAox1Sf3Jql950UP8mr0JU
 DNmFYVxAMLkXXZQ3lWOLIQYl9dCP1jM9swALP8uvg4vBD1ijTndNbAOZf8n6p3jsTjnyKXlfyiK
 trWH79YgesgpL8U+chAmfNpI6471KbRpNQj7GMs2jEDCdlNLHuPkOVZqsI0YQ+7q/sLZge3iTsn
 iWIlHXbckVtBsklX2T0p0t7j3oQ8N6H3WAm5UWS8/v0y3ZFEX61NLFjBUDRPo6MNCPML4XZoNWk
 g3jdeeeyuAANK1Hw6boC4Z9kQ1P9c65eyZhlMR/gI6Hnsvco1g0eYJMTpl3RxH/jN7ZTT/7qLHu
 Shv+4IbCt/C5SkvtKs5BporqzVzPwO3daD+0y8a37No7AITTLVkSYCX9W+C3UYMSYaYCd6mOTV2
 Xf8+dnCbj0LlEw9g+zx9EJZn0tz9YOsikon8UcrsoF1fuTWpOxUKp/olD7Sojx1Aqe8MG4KibvB
 46rGLH4MJG0q+o8XcGF/e8ihqMVuKryVLhObouZ9KxtQF5PTl/My+rIsCwWXGcRFxG2UVGCkdaD
 PfFbVAOKnX3J5AvkOFMuos440mrevhx5aRf3ws6oyeslEwHl3Ek7lgcR9Qeto5DF0WLWEA7fSBl
 Fqb0CwNFxtIPYKQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

For DS90UB9702-Q1, it is recommended to configure some serializer
settings over the back-channel before the forward-channel is active.

This can only be done if the serializer's I2C address on the FPD-Link
bus is populated in the device tree node.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.h |   4 ++
 drivers/media/i2c/ds90ub960.c | 126 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.h b/drivers/media/i2c/ds90ub953.h
index 8bb28f0daee96044a7bf838a680e506af4f70f10..de606474493f8d95a412e5564b0fac21885e581d 100644
--- a/drivers/media/i2c/ds90ub953.h
+++ b/drivers/media/i2c/ds90ub953.h
@@ -92,4 +92,8 @@
 #define UB953_IND_PGEN_VFP			0x0f
 #define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
 
+/* UB971 Registers */
+
+#define UB971_ENH_BC_CHK			0x4b
+
 #endif /* __MEDIA_I2C_DS90UB953_H__ */
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 56b1a88c1c29fbefecae60f4c9976e8ede554447..cad25dcbca11bf6597d00eede6dfa9110f445886 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -52,6 +52,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "ds90ub953.h"
+
 #define MHZ(v) ((u32)((v) * HZ_PER_MHZ))
 
 /*
@@ -244,13 +246,16 @@
 
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
@@ -486,7 +491,9 @@ struct ub960_rxport {
 		struct fwnode_handle *fwnode;
 		struct i2c_client *client;
 		unsigned short alias; /* I2C alias (lower 7 bits) */
+		short addr; /* Local I2C address (lower 7 bits) */
 		struct ds90ub9xx_platform_data pdata;
+		struct regmap *regmap;
 	} ser;
 
 	enum ub960_rxport_mode  rx_mode;
@@ -1984,6 +1991,78 @@ static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
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
+			"rx%u: serializer address missing, skip configuration\n",
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
+	ub960_rxport_serializer_write(rxport, UB971_ENH_BC_CHK, 0x02, &ret);
+	/* Decrease link detect timer */
+	ub960_rxport_serializer_write(rxport, UB953_REG_BC_CTRL, 0x06, &ret);
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
@@ -2860,6 +2939,36 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	if (ret)
 		return ret;
 
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
+		if (fwnode_device_is_compatible(it.rxport->ser.fwnode,
+						"ti,ds90ub971-q1")) {
+			ret = ub960_rxport_bc_ser_config(it.rxport);
+			if (ret)
+				return ret;
+		}
+	}
+
 	for_each_active_rxport_fpd4(priv, it) {
 		/* Hold state machine in reset */
 		ub960_rxport_write(priv, it.nport, UB9702_RR_RX_SM_SEL_2, 0x10,
@@ -2988,16 +3097,17 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
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
@@ -4156,6 +4266,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	s32 strobe_pos;
 	u32 eq_level;
 	u32 ser_i2c_alias;
+	u32 ser_i2c_addr;
 	int ret;
 
 	cdr_mode = RXPORT_CDR_FPD3;
@@ -4267,6 +4378,13 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
+	ret = fwnode_property_read_u32(rxport->ser.fwnode, "reg",
+				       &ser_i2c_addr);
+	if (ret)
+		rxport->ser.addr = -EINVAL;
+	else
+		rxport->ser.addr = ser_i2c_addr;
+
 	return 0;
 }
 

-- 
2.48.1


