Return-Path: <linux-media+bounces-25289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D6A1B919
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CC7A7A65F9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6DC2253F1;
	Fri, 24 Jan 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YdjVeN4g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39410224AE4;
	Fri, 24 Jan 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731933; cv=none; b=Es/rvN4UkiaWCyF3Epw9XzSfBeJFpwWj9+NbqBy7DVxNdPkJiZoegnthekUzv15v0iwONNwTkCl7FDz10mHFdixP8Y73fKv4dlukgx8ijOkn3S3bmC+2N7uvWo20nnoSjJfbkiZF4l+KztnAJIHda5EYVR/92BB3JL8zi642jOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731933; c=relaxed/simple;
	bh=oS6tM2dO1JZIKtrBAaX94XfiyYnY3jTtcIrzOy/wjlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEzZlR0+IlO3SHgKNqYoPRDH3qXETeTSs32kI6e8kiWq0QbGSuk0LYGI53BHaPl0kRjyFdUx03arT0NxzQmv/eCHLnRHPO9+BA9ANnXMVH3o+hNBJAMfGUS8hxWu2XU8m+eVhC7fmC42uVJ0ABQypDfJS2PouGryWaX4FziehkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YdjVeN4g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 348EC26A2;
	Fri, 24 Jan 2025 16:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731840;
	bh=oS6tM2dO1JZIKtrBAaX94XfiyYnY3jTtcIrzOy/wjlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YdjVeN4gwSRsX0JxVbnRjqCAk90J5MD/grwzQHb4GSXbgxrkxVtSrIK+54IOVh1j8
	 rj0X5RscG/gVqFbKLI+DZDt826pJQCVvdvOiDm7awl6L7l77Kst4H+SQbtL0G8a6Gc
	 IvWXpTCrTHLWNVCydaGO3iGtykpfct/7tT4D9Tyc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:58 +0200
Subject: [PATCH v2 21/22] media: i2c: ds90ub960: Configure serializer using
 back-channel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-21-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7004;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XZHMM7WZVDyCaKLu3pBm5wvNyeSYU3gKzm7wKY6o1j0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68zE2sYxDX0438DrmAtRiOhnPLiEIK/N7nTG
 ukaMxE+WBGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMwAKCRD6PaqMvJYe
 9Y/RD/0U91KDYG29d5lkfJoLSAqdfB9sEmOh4TbD+6ekw+/QLdUMESbyfonLkPnNJCxTFDMwvnE
 KK52UQsRrO2ARFSlHgu/r5NaujRVxyiWd15NNv+eCfYaqDmPzRWxsLTLYTlfWsIOEb/6ephqekz
 lWUDLAS7nm+pHwAJ1R5LX26jD7EQxoM2v8oHkTsObPFhEdHHs2Fchv2LKyE/PIWQzNLyZAAZj0C
 DDRFTcNXnE5rQr1KZBQxOaSsDDjyVHiZUIBsdCXL3KgoVe6b5VU+ZTAgu7BOmoAuQaqI8jcNd2I
 M9S26k6G5T/G8zM1EjBt0UHQScnAeFAHMXo3YeycTxzZkMLbA/+A6CMPSDTZqU7o7Uns6lpc56H
 Il5Vkjt9NhkeQBDBFyZvvXqlC6QmXFFHxE9R11rAFcGsd5ljNn/doGPJ3J79AnH8deFJ8BVILXr
 bNkSG6wtNMU5FwuyZ3fCaVoUZ5AUGHG5cVIqgNyvB2UOltNSuTBDv/ZQgrdFwEihN3UE+1i/j8g
 lb30Tg3cUIhcjZ2oUYei8x1lyYf/RyQKgoITwhxY0r+M4lNPkE2te0PTOgSPmqQzu67NeVqOnAb
 CUvTKD14osIqw7MlyvpaODOEhqBGUCBh8VHsD1GFha+LdbsDibI8Am1ElolepgfzY71P/N7nxhB
 /ckSmWobUqo0KRA==
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
 drivers/media/i2c/ds90ub953.h |   4 ++
 drivers/media/i2c/ds90ub960.c | 126 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.h b/drivers/media/i2c/ds90ub953.h
index 8bb28f0daee9..de606474493f 100644
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
index cc2a72fdcf4f..04488544da43 100644
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
@@ -503,7 +508,9 @@ struct ub960_rxport {
 		struct fwnode_handle *fwnode;
 		struct i2c_client *client;
 		unsigned short alias; /* I2C alias (lower 7 bits) */
+		short addr; /* Local I2C address (lower 7 bits) */
 		struct ds90ub9xx_platform_data pdata;
+		struct regmap *regmap;
 	} ser;
 
 	enum ub960_rxport_mode  rx_mode;
@@ -2001,6 +2008,78 @@ static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
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
@@ -2952,6 +3031,36 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
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
 	if (fwnode_property_read_bool(dev_fwnode(dev), "ti,enable-sscg")) {
 		ret = ub960_enable_sscg_ub9702(priv);
 		if (ret)
@@ -3086,16 +3195,17 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
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
@@ -4254,6 +4364,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 	s32 strobe_pos;
 	u32 eq_level;
 	u32 ser_i2c_alias;
+	u32 ser_i2c_addr;
 	int ret;
 
 	cdr_mode = RXPORT_CDR_FPD3;
@@ -4365,6 +4476,13 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
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
2.43.0


