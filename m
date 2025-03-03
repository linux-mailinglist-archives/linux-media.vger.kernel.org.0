Return-Path: <linux-media+bounces-27378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221FA4C64C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDDA57A8DA5
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CED23A98A;
	Mon,  3 Mar 2025 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e0hPPRS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549F21B9E9;
	Mon,  3 Mar 2025 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017841; cv=none; b=QgjBKzWvCum/GZpNDBMP/O5tcIz3S/hM8xX1AUJSDGopMTk5YC15V9Pd96gF0YvnN55sv1zC/gLyDOEEM7HauellKOO6gco4vMJbkuWckXynN0BygFF0Uq40kqu/ftQFjjfKTAkxoV2kRiuw86vydfbPVFRUo5j5a9wYmMAlvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017841; c=relaxed/simple;
	bh=g+H/ekm4a1tNd9/uuqmtmBcE1liUdfh8+ZrY8uuygvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Px8Y5AWcCrpvKEloNjEjAFgY7o1oR4Bji4n4612iZYmU/D70vsJC4ZIC5qjBt87zco4AtIfq10NerXPTd+TJ8OWMY8nFmJbtve8Um/a+ZQyyR4dWMNG8AFa/dTe0KLZuTtLrLPNegV5X+7CLwTKbP70USnwleyLtdK1oy/Okd/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e0hPPRS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016A822A;
	Mon,  3 Mar 2025 17:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017747;
	bh=g+H/ekm4a1tNd9/uuqmtmBcE1liUdfh8+ZrY8uuygvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e0hPPRS+27gKnKXtQUHFEwz0AB2UQ/QtoE5PXCtdmaTaNqcB7jmRNpBCrRGHxdMim
	 K8XokO9qyEVVZAXkF0osidbf9Ns7oJbpI9xThZiTydW/9NFar1s3X7vZfPcvzWXbq3
	 HOu3cJoklc5T+wE6G2KPrwLjX1J8WczjQbMzjVBY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:22 +0530
Subject: [PATCH v3 19/19] media: i2c: ds90ub9xx: Set serializer temperature
 ramp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-19-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6487;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=g+H/ekm4a1tNd9/uuqmtmBcE1liUdfh8+ZrY8uuygvc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKBHjjvy8tJ6tgEh+AwC3Jkd3H0+XFY0/gXW
 t4ScrjR/0CJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgQAKCRBD3pH5JJpx
 RTkED/9yHuHpKSVb3fqOOKfB4WRC+qMYWAWVCK3TOiNvZocH5pByQ5r89T4HuwxvujIchsbIIaQ
 z/+DNTg9IdlVOxivcqjcOWjlhFf0G03yfDdbH73GtRQAA8NGYLV0SNyp92HxmxeUyhXvTozx5HI
 eOzUr47O4iNG8cGsfiglLbHdwptQ42qYQ/UDV0Cf3Df6V7hqxMoUFfdPZDY2RufjcaMB4R+bda5
 Knz2eFe5cxZY/3ogfsAUBNb7kKW10ZNotN4J9pthPHYkw/l/LDoIDP7HVCFJCYEfKLvLmJ5oTsP
 pSTky242R/AdL2Fuw3ieSl3XpcSygUHPd0cIKOFuOLYSH9Cp+XTAe944ZtJdMCbN5bSvccxMwU1
 7b16xcZ6slwTMfSaWE6rzN/pjcS8GgpfsYhCgfOKpZi0/zCLkqzue2Twoq0IUGaipZBXHxteBNO
 +3hPs/7yclikcTg4BcFYsP9ap+Uouzy/R4vXSsTSC4fCHh5SVI0JScvxR8/G45kkqb4OlmoxgWh
 tT2tuBtMFFVBGSvch+GGZ2T4Xnvg/RTywYgu/gQKTlwLdss5NeRFkU7pzXpqq9o32sPsCVG3bWq
 QIWml8SEzrFgjbfxUsBqRRUuJuM0EPpS7bdNWJtVYnvcTvW7sy+UAWIK3Mbg2gTVut7GdQ6OkjA
 v2g5C3RfHHsqAfw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

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
---
 drivers/media/i2c/ds90ub953.h |   7 ++-
 drivers/media/i2c/ds90ub960.c | 125 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.h b/drivers/media/i2c/ds90ub953.h
index de606474493f8d95a412e5564b0fac21885e581d..97a6b3af326eb96af20653ed13b89798e18646bd 100644
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
index cad25dcbca11bf6597d00eede6dfa9110f445886..1877eb735cc7d865a68e315446a24b536b387d2a 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2017,6 +2017,110 @@ static int ub960_rxport_serializer_write(struct ub960_rxport *rxport, u8 reg,
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
@@ -2396,6 +2500,20 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
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
@@ -3071,6 +3189,13 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
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
2.48.1


