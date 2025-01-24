Return-Path: <linux-media+bounces-25290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD45A1B929
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2655917003D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203D6225768;
	Fri, 24 Jan 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XP6OVcTt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFFA224B18;
	Fri, 24 Jan 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731934; cv=none; b=ML1xUECtOgLnev4xsRYpoZ30pLZH67TE4ka9bhrxX4iNWgkTBo2aBq4Q88j4LUALBoJUBQ/vLymtJoFEA45C5he5TDvknE2XRc2Z4ebX6H2cVgZyJvrsoHZJVmOwemiAChIrkQ/acAFjJJL86XZgtNrsJN4k2Z0TH/1j9IkVejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731934; c=relaxed/simple;
	bh=pHHlNWs87KoEi+LKSuCvQsoVT9mLtZj47HDn8RzVgIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFbYJs5xb8j/rqvPg3HHs540GJWRj78U7e6WvZalLiFkWu6PIx+p0craed9gOdg7M1KpWPb6jby7HU1a/X3hum/Ky/F9yCIO6LFmVCfwT7IaCUOTOSl+Gwh+h6f46JHai2dXgMP6bttXsMNLowGTcLt1gHLJ+aPILERtkzc4F70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XP6OVcTt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6FE026A7;
	Fri, 24 Jan 2025 16:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731841;
	bh=pHHlNWs87KoEi+LKSuCvQsoVT9mLtZj47HDn8RzVgIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XP6OVcTtxKLUMLwpSVAjpxth6s/djE6lZfJwKdFp8ToJ7jmAeveam9mhFEIuoqXT4
	 gU3AmTf8jbPRjzIlm97cXQiPNWY7UI3GBbn0hmi2Th9x+FbczqZt1tTpGQvoDIBN4n
	 Hl5y0Zg5YNQncUIjeG3nFQDtT8hnztZ7wu+1xf68=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:59 +0200
Subject: [PATCH v2 22/22] media: i2c: ds90ub9xx: Set serializer temperature
 ramp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-22-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6440;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+ZP7e0Qzo1yNr7AGYgMYKFAhOOXGLrrNKqhBZqj/j/8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68zmyRWIvnyDGXMtY3VoTJNw6rsJtd/v+ISI
 CEDiCNd3j2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMwAKCRD6PaqMvJYe
 9U+RD/9XgAxgPTf0burhntPTE0NW/GyDBPbrKoRnM/hnRBmhbzA03+JPkKXG13u5o/To52hDLsE
 8NlKVweosDqONs0+dLgdoIveL8INSQhP/N1hmHsWa+UvGebXjRigz0BJ35d7D6Jx+iykL/lgYDK
 f+KfqE06zswuZuPkEiVHnGptJc+8KFwer/Sa5P7R4UfP2KoCJb03bBhAdfoo3WIMggkrjIFgbya
 Kc/RcFBhFlqhTnRob1fdi+52bhJaXaUS0CZ5NkDwq7MH+4mGKyBsOF4UGhnMPQzBiKvy4W45nsG
 fJpAI56FyDHS5QQf3824DBPIHIU57xfi8pgPcdUGJGmbvPp+twOJAUCjq8XPJCpzyoP4eZwSSJs
 tE5fyQySEbhox1G2w0BDH7G27vzC3Gd77wITKlEoI33OBTt/U3a04D7VsIiHIGDqcI7c/r/VuD4
 EYuCgqxM0JbscR8B7k0fJplmOPdzg1YpXmZIFpbMX9ZkamoarnslKPWrALD8t8dYANK0jlLcm9M
 9AkA8uEcdhimbHDxukdHJR5GQFF7W24a/jXZRyHgLpKn9Lsud9A/ALP8C87MYEOwXQ6v5d+BpzM
 0y6MR4QRoV99L7axGaAp/+yzlAjYNWHS0+DzKe8022J1qp1omOn0KRTP6oFJ/W2s95Zw9df07xy
 HSP+qvyuwP1PXJw==
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
 drivers/media/i2c/ds90ub953.h |   7 ++-
 drivers/media/i2c/ds90ub960.c | 125 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.h b/drivers/media/i2c/ds90ub953.h
index de606474493f..97a6b3af326e 100644
--- a/drivers/media/i2c/ds90ub953.h
+++ b/drivers/media/i2c/ds90ub953.h
@@ -71,7 +71,7 @@
 
 /* Indirect register blocks */
 #define UB953_IND_TARGET_PAT_GEN		0x00
-#define UB953_IND_TARGET_FPD3_TX		0x01
+#define UB953_IND_TARGET_ANALOG			0x01
 #define UB953_IND_TARGET_DIE_ID			0x02
 
 #define UB953_IND_PGEN_CTL			0x01
@@ -92,6 +92,11 @@
 #define UB953_IND_PGEN_VFP			0x0f
 #define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
 
+#define UB953_IND_ANA_TEMP_DYNAMIC_CFG		0x4b
+#define UB953_IND_ANA_TEMP_DYNAMIC_CFG_OV	BIT(5)
+#define UB953_IND_ANA_TEMP_STATIC_CFG		0x4c
+#define UB953_IND_ANA_TEMP_STATIC_CFG_MASK	GENMASK(6, 4)
+
 /* UB971 Registers */
 
 #define UB971_ENH_BC_CHK			0x4b
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 04488544da43..74977762bab6 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2034,6 +2034,110 @@ static int ub960_rxport_serializer_write(struct ub960_rxport *rxport, u8 reg,
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
@@ -2413,6 +2517,20 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 		return ret;
 	}
 
+	/* Set temperature ramp on serializer */
+	for_each_active_rxport(priv, it) {
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
@@ -3169,6 +3287,13 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	/* Wait time for stable lock */
 	fsleep(15000);
 
+	/* Set temperature ramp on serializer */
+	for_each_active_rxport(priv, it) {
+		ret = ub960_serializer_temp_ramp(it.rxport);
+		if (ret)
+			return ret;
+	}
+
 	for_each_active_rxport_fpd4(priv, it) {
 		ret = ub960_enable_dfe_lms_ub9702(priv, it.nport);
 		if (ret)

-- 
2.43.0


