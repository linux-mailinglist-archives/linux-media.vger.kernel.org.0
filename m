Return-Path: <linux-media+bounces-24599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB96A08B46
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC1B188D1B3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147BF20E6E2;
	Fri, 10 Jan 2025 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NQ5V5/gD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39D20E03B;
	Fri, 10 Jan 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500547; cv=none; b=VdrFU00nfJSmZ125ZZEf6cTIIpehjvZ6Qm6auuEJzmytShovyvH2XAu7T0q75t83AYeTWlSBVdB5RudICRmGnrWLKvF0Zlhe3yY5SM7ET9GtVQGMj+iTfiugZ3ze+JtOeiob0fllqGNJ16U0XLzsjrPid5oLkpTOFB9jL/nOvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500547; c=relaxed/simple;
	bh=xENFn0j7WKkzC+GeAFdGiwux+LBDvFMD326jlfn1Wbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFfV31nl5aJo+FQpU614M3xpLp1Bi1+ADAv72g7rY7aY2hdpE6zDiy78H8ZNKPjfqjS0qImA4altjMgBfdKOoDsmZ1CdLKL7GHUWOg0w1rFKJbUvsNtCEk8vfPoTmL+EZ4FP3foATTLk4CgcT3bX4i9au70Ets3EQuGQ0T58xQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NQ5V5/gD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06E4326A3;
	Fri, 10 Jan 2025 10:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500461;
	bh=xENFn0j7WKkzC+GeAFdGiwux+LBDvFMD326jlfn1Wbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NQ5V5/gDEKN402IqBB4sDO9rW1RCHvbF7tZhncJ0mnbNZFBBjS4UmcSpHv0Oy9tQW
	 jQ1ifOy8DyO9FuK1jsWrv/chkl92BAbhcrZGWMWIhlj36NxQULkgJIne4s8EJPQoDW
	 N1l9ZYqgy2tGaaxbS3sqV1PVWjPtRHrZg6dARgwY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:19 +0200
Subject: [PATCH 19/19] media: i2c: ds90ub9xx: Set serializer temperature
 ramp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-19-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7480;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=j8VGR+q9mnFLoJmhSBGzWeDaLhfWfz5KiFjXcez6K8o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUXIjMNcAZG0fOOpyWxCZgqAkESM1i10Te/4
 MKhe6/llsOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFwAKCRD6PaqMvJYe
 9WWvD/9foVh0T4uzHHcItQeYVxUAxOKhnGdHgf2DmB9xeHVTkDsZrXsWGBfwmgJawJCZll+Yefe
 TGhk7wdqT19hWVn0kurlskTt//Y+f7c4Hu482MAC+XYxdFDmfo0LpHNlv7jFcm5bfSjGKJQ5isq
 7f31BKQsfclEUc56fok9GIOCrVhw26GJhehIpdyppv8xAUr755M3CyINBrc1RPb9x2g+4a3biJx
 +9liO+DDQ+OioYWix2iegfiq2OBCM1no3AEGA435yKjK1tjL+1f5SxcecdIOp41xrD7yrDh+Kx/
 fnr+ehOYXwmPyKBV4s1ovBce5jyyMoOG8e/xl0Sw7+J+ICuAh1r/09yKW5rcIdWNtqbL0XaWBO3
 Hm1dQxckmwvnMU0/uuPPJ2TGMUlsfzIEc75pfVNcleXwvGX4Rj9jgl6apM6qUG9NYx0dSbVfvp3
 0shla8ewqN29LpxTctP5rEvg0p9IgQAl2UFtbsLQlz/ylDSIpCe0EdDnU6I2Ju2rbzJQN+Kv/0B
 tIjqeEsbBZ9xAQRoLMGPsa2/Fx/2ZGKVVN2RKPyhfPGpxBc4EcfK3R9LWfU4RfQJXK0VHZVpLLB
 dFfXE7Z7PRWMSc1vQIPIg8t2y7SDXk+XHXf9vsoa9KE/St4IoW46/TewJ8i44+6VUwTt9EN7Oq7
 7QXeuBcf3Pf5fcw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

For continuous PLL lock, it is recommended to extend the temperature
ramp down range of the DS90UB953-Q1 serializer based on the device's
initial temperature [1].

The serializer's die temperature is reported only to the deserializer
through the sensor status registers, and for UB9702, it is recommended
to set the temperature ramp during the link setup sequence, i.e. before
we even probe the ub953 driver.

Add support to the deserializer driver to configure ub953's temperature
ramp.

[1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c |   9 ---
 drivers/media/i2c/ds90ub960.c | 125 ++++++++++++++++++++++++++++++++++++++++++
 include/media/i2c/ds90ub9xx.h |  15 +++++
 3 files changed, 140 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 6c36980e8beb..bba8be031032 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -35,10 +35,6 @@
 
 #define UB953_DEFAULT_CLKOUT_RATE	25000000UL
 
-#define UB953_REG_RESET_CTL			0x01
-#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
-#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
-
 #define UB953_REG_GENERAL_CFG			0x02
 #define UB953_REG_GENERAL_CFG_CONT_CLK		BIT(6)
 #define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT	4
@@ -92,16 +88,11 @@
 #define UB953_REG_PKT_HDR_WC_MSB		0x63
 #define UB953_REG_CSI_ECC			0x64
 
-#define UB953_REG_IND_ACC_CTL			0xb0
-#define UB953_REG_IND_ACC_ADDR			0xb1
-#define UB953_REG_IND_ACC_DATA			0xb2
-
 #define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
 #define UB953_REG_FPD3_RX_ID_LEN		6
 
 /* Indirect register blocks */
 #define UB953_IND_TARGET_PAT_GEN		0x00
-#define UB953_IND_TARGET_FPD3_TX		0x01
 #define UB953_IND_TARGET_DIE_ID			0x02
 
 #define UB953_IND_PGEN_CTL			0x01
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 1ec3c060d4c6..6daf760f394b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2036,6 +2036,110 @@ static int ub960_rxport_serializer_write(struct ub960_rxport *rxport, u8 reg,
 	return ret;
 }
 
+static int ub960_rxport_serializer_read(struct ub960_rxport *rxport, u8 reg,
+					u8 *val, int *err)
+{
+	struct ub960_data *priv = rxport->priv;
+	struct device *dev = &priv->client->dev;
+	union i2c_smbus_data data = { 0 };
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	ret = i2c_smbus_xfer(priv->client->adapter, rxport->ser.alias,
+			     priv->client->flags, I2C_SMBUS_READ, reg,
+			     I2C_SMBUS_BYTE_DATA, &data);
+	if (ret)
+		dev_err(dev,
+			"rx%u: cannot read serializer register 0x%02x (%d)!\n",
+			rxport->nport, reg, ret);
+	else
+		*val = data.byte;
+
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int ub960_serializer_temp_ramp(struct ub960_rxport *rxport)
+{
+	struct ub960_data *priv = rxport->priv;
+	short temp_dynamic_offset[] = {-1, -1, 0, 0, 1, 1, 1, 3};
+	u8 temp_dynamic_cfg;
+	u8 nport = rxport->nport;
+	u8 ser_temp_code;
+	int ret;
+
+	/* Configure temp ramp only on UB953 */
+	if (!fwnode_device_is_compatible(rxport->ser.fwnode, "ti,ds90ub953-q1"))
+		return 0;
+
+	/* Read current serializer die temperature */
+	ub960_rxport_read(priv, nport, UB960_RR_SENSOR_STS_2, &ser_temp_code,
+			  &ret);
+
+	/* Enable I2C passthrough on back channel */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, &ret);
+
+	if (ret)
+		return ret;
+
+	/* Select indirect page for analog regs on the serializer */
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_CTL,
+				      UB953_IND_TARGET_ANALOG << 2, &ret);
+
+	/* Set temperature ramp dynamic and static config */
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_ADDR,
+				      UB953_IND_ANA_TEMP_DYNAMIC_CFG, &ret);
+	ub960_rxport_serializer_read(rxport, UB953_REG_IND_ACC_DATA,
+				     &temp_dynamic_cfg, &ret);
+
+	if (ret)
+		return ret;
+
+	temp_dynamic_cfg |= UB953_IND_ANA_TEMP_DYNAMIC_CFG_OV;
+	temp_dynamic_cfg += temp_dynamic_offset[ser_temp_code];
+
+	/* Update temp static config */
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_ADDR,
+				      UB953_IND_ANA_TEMP_STATIC_CFG, &ret);
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_DATA,
+				      UB953_IND_ANA_TEMP_STATIC_CFG_MASK, &ret);
+
+	/* Update temperature ramp dynamic config */
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_ADDR,
+				      UB953_IND_ANA_TEMP_DYNAMIC_CFG, &ret);
+
+	/* Enable I2C auto ack on BC before we set dynamic cfg and reset */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_AUTO_ACK_ALL,
+				 UB960_RR_BCC_CONFIG_AUTO_ACK_ALL, &ret);
+
+	ub960_rxport_serializer_write(rxport, UB953_REG_IND_ACC_DATA,
+				      temp_dynamic_cfg, &ret);
+
+	if (ret)
+		return ret;
+
+	/* Soft reset to apply PLL updates */
+	ub960_rxport_serializer_write(rxport, UB953_REG_RESET_CTL,
+				      UB953_REG_RESET_CTL_DIGITAL_RESET_0,
+				      &ret);
+	msleep(20);
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
 static int ub960_rxport_bc_ser_config(struct ub960_rxport *rxport)
 {
 	struct ub960_data *priv = rxport->priv;
@@ -2415,6 +2519,20 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 		return ret;
 	}
 
+	/* Set temperature ramp on serializer */
+	for_each_active_rxport(priv) {
+		ret = ub960_serializer_temp_ramp(it.rxport);
+		if (ret)
+			return ret;
+
+		ub960_rxport_update_bits(priv, it.nport, UB960_RR_BCC_CONFIG,
+					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+					 &ret);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Clear any errors caused by switching the RX port settings while
 	 * probing.
@@ -3171,6 +3289,13 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	/* Wait time for stable lock */
 	fsleep(15000);
 
+	/* Set temperature ramp on serializer */
+	for_each_active_rxport(priv) {
+		ret = ub960_serializer_temp_ramp(it.rxport);
+		if (ret)
+			return ret;
+	}
+
 	for_each_active_rxport_fpd4(priv) {
 		ret = ub960_enable_dfe_lms_ub9702(priv, it.nport);
 		if (ret)
diff --git a/include/media/i2c/ds90ub9xx.h b/include/media/i2c/ds90ub9xx.h
index 0245198469ec..d803af07cabc 100644
--- a/include/media/i2c/ds90ub9xx.h
+++ b/include/media/i2c/ds90ub9xx.h
@@ -5,6 +5,21 @@
 
 #include <linux/types.h>
 
+#define UB953_REG_RESET_CTL			0x01
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
+
+#define UB953_REG_IND_ACC_CTL			0xb0
+#define UB953_REG_IND_ACC_ADDR			0xb1
+#define UB953_REG_IND_ACC_DATA			0xb2
+
+#define UB953_IND_TARGET_ANALOG			0x01
+
+#define UB953_IND_ANA_TEMP_DYNAMIC_CFG		0x4b
+#define UB953_IND_ANA_TEMP_DYNAMIC_CFG_OV	BIT(5)
+#define UB953_IND_ANA_TEMP_STATIC_CFG		0x4c
+#define UB953_IND_ANA_TEMP_STATIC_CFG_MASK	GENMASK(6, 4)
+
 struct i2c_atr;
 
 /**

-- 
2.43.0


