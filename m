Return-Path: <linux-media+bounces-25272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB4A1B8F1
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24FB7A5C93
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE7D21CFED;
	Fri, 24 Jan 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QAz+rZIY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841821CA06;
	Fri, 24 Jan 2025 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731904; cv=none; b=LJFgRuu8CrrJpKf3kmety7PgP/EF4lvvFbI8RwuFSyaeYP5l09PfNiykN/R7AA16GFg72PMM9yZoXIkK9pKOT8/ZWYGoG0VfqX1guGAsu+GejKSXomEfR75UXcp1vDZgGKtbIQe4hFess4owrr6XU8oXibEF2g8s03kcHnoLAa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731904; c=relaxed/simple;
	bh=dX7dExG+G47YrB7qoXEUKEdbVYixKTculMCgA5CAWs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWWKm2gWu/RWyP9Zr6YhU4hI33juRiLmVU7Eg3TpRg4ykMpNvP9pN0BiUXkQ+a0SHfFmJLofOH7Gtvtz2oelFCQUueMaNztQZl+MPQ/upYWbEOvdmKQDBEM03QvS7QG5U8LA1DHpHowAygWS9vV6t8cn0c0rhZyHZtUubPVRpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QAz+rZIY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 245DF11EA;
	Fri, 24 Jan 2025 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731831;
	bh=dX7dExG+G47YrB7qoXEUKEdbVYixKTculMCgA5CAWs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QAz+rZIY0XpzeBHFySIqNoOlA+La6wRw7lBGHMq/BEGhdE5mmI/sAgwgxmTLEHnaK
	 X7JciqlYv2qaob711EYR+hjqWWNrotsEfMsRD9JaF1hW1xLEErkalzk11G0StVBP8j
	 UEHcrBlADWdxuz4yAAyxRnxB+OU8s2/YbQ4z1Z18=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:42 +0200
Subject: [PATCH v2 05/22] media: i2c: ds90ub960: Add error handling to
 multiple places
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-5-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=41182;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dX7dExG+G47YrB7qoXEUKEdbVYixKTculMCgA5CAWs8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68tJrZRJw3g8FPzM6P8t3rsep+tu5jQlywn5
 VzbPAcrzASJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLQAKCRD6PaqMvJYe
 9TJvD/9GK3HSWNPzQDMS2S+LcpBD9K2AQI2n7nS7uTMtk9h7k+II/2OY5TP202sl0AVsiohfrkl
 3qf6k6fbq9dwL3ziEIxkoOcREvxDuLD0zCjYfjKLxb6OAQZpyijWUO+7vWyja05OpdWmTE5Mn1O
 6MW1xsXAMo/XSE2PmNBpLKyZBtpHJpV0kPav7ojzYMTdsK0aEOoC69/JgF5OFJozoRwOzpfSX9s
 9/Ksyn9sE1AcwgyDVZy4brjU6VkRRs5P/8rNGZA4yeUYOPX95s30M6tQwBScZoTUS6S9Tk/1gk7
 KXWBLrcClFfzqKb19r0IceOCrAEs1xUqV7/liiFZsyXLyEG6Wd05faedUG/AETkwU7aqU2yUaPD
 bjT6c/l4w60lPYCJrOsO9qkgpW+nzw06Kf7ANh3YwghUVDgoWX4dYwthwqW06Dzg4IPSXmcVXgZ
 dzwKTmZg/3uUPTbnrTfCNSH1DlioPyYGhzeuvSZWVEx+kLj9kNB5T1qpEdWmpw2FVbWQbUGNPj6
 Rtksc9tSMUlsj0MDTNyVFNvEdVCJOQJZimQIWDdWYCiNMfTwQhoVbiHOoSBpl2MklFdgzLzpMvK
 80pW2AE7r8JeLayOyFM6a++MKvKgzb6DRhqzbF82+5Z7COzclr/suCPNZYds6IwmDQIKQIJGbpo
 ZWlyZGiCQVj7fIw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver is missing checks for i2c read/write errors in many places.
Now that we have added the err parameter to the read/write functions in
the previous patch, add error handling to all the missing places.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 589 +++++++++++++++++++++++++++---------------
 1 file changed, 376 insertions(+), 213 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 03986a2aaf2c..80bbba0792c1 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1144,6 +1144,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
+	int ret = 0;
 
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
 		if (!rxport->aliased_clients[reg_idx])
@@ -1158,9 +1159,12 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	rxport->aliased_clients[reg_idx] = client;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
-			   client->addr << 1, NULL);
+			   client->addr << 1, &ret);
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
-			   alias << 1, NULL);
+			   alias << 1, &ret);
+
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
 		rxport->nport, client->addr, alias, reg_idx);
@@ -1175,6 +1179,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
+	int ret;
 
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
 		if (rxport->aliased_clients[reg_idx] == client)
@@ -1189,8 +1194,13 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	rxport->aliased_clients[reg_idx] = NULL;
 
-	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0,
-			   NULL);
+	ret = ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
+				 0, NULL);
+	if (ret) {
+		dev_err(dev, "rx%u: unable to fully unmap client 0x%02x: %d\n",
+			rxport->nport, client->addr, ret);
+		return;
+	}
 
 	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
 		client->addr, reg_idx);
@@ -1285,7 +1295,7 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	return ret;
 }
 
-static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
+static int  ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 {
 	struct device *dev = &priv->client->dev;
 	u8 csi_tx_isr;
@@ -1294,13 +1304,15 @@ static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 	ret = ub960_txport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr,
 				NULL);
 	if (ret)
-		return;
+		return ret;
 
 	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
 		dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
 
 	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
 		dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1352,28 +1364,38 @@ static void ub960_rxport_disable_vpocs(struct ub960_data *priv)
 	}
 }
 
-static void ub960_rxport_clear_errors(struct ub960_data *priv,
-				      unsigned int nport)
+static int ub960_rxport_clear_errors(struct ub960_data *priv,
+				     unsigned int nport)
 {
+	int ret = 0;
 	u8 v;
 
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v, NULL);
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v, NULL);
-	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v, NULL);
-	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v, &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v, &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v, &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v, &ret);
 
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v, NULL);
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v, &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v, &ret);
 
-	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v, &ret);
+
+	return ret;
 }
 
-static void ub960_clear_rx_errors(struct ub960_data *priv)
+static int ub960_clear_rx_errors(struct ub960_data *priv)
 {
 	unsigned int nport;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++)
-		ub960_rxport_clear_errors(priv, nport);
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		int ret;
+
+		ret = ub960_rxport_clear_errors(priv, nport);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
@@ -1383,14 +1405,18 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret;
 
-	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
+	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
+	if (ret)
+		return ret;
 
 	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
 			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
-	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
+	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
+	if (ret)
+		return ret;
 
 	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
 			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
@@ -1412,10 +1438,11 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	return 0;
 }
 
-static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
-					unsigned int nport, s8 strobe_pos)
+static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
+				       unsigned int nport, s8 strobe_pos)
 {
 	u8 clk_delay, data_delay;
+	int ret = 0;
 
 	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
 	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
@@ -1430,23 +1457,25 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, NULL);
+			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
 
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, NULL);
+			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+
+	return ret;
 }
 
-static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
-					  s8 strobe_min, s8 strobe_max)
+static int ub960_rxport_set_strobe_range(struct ub960_data *priv, s8 strobe_min,
+					 s8 strobe_max)
 {
 	/* Convert the signed strobe pos to positive zero based value */
 	strobe_min -= UB960_MIN_AEQ_STROBE_POS;
 	strobe_max -= UB960_MIN_AEQ_STROBE_POS;
 
-	ub960_write(priv, UB960_XR_SFILTER_CFG,
-		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
-		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT),
-		    NULL);
+	return ub960_write(priv, UB960_XR_SFILTER_CFG,
+			   ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
+			   ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT),
+			   NULL);
 }
 
 static int ub960_rxport_get_eq_level(struct ub960_data *priv,
@@ -1465,11 +1494,12 @@ static int ub960_rxport_get_eq_level(struct ub960_data *priv,
 	return 0;
 }
 
-static void ub960_rxport_set_eq_level(struct ub960_data *priv,
-				      unsigned int nport, u8 eq_level)
+static int ub960_rxport_set_eq_level(struct ub960_data *priv,
+				     unsigned int nport, u8 eq_level)
 {
 	u8 eq_stage_1_select_value, eq_stage_2_select_value;
 	const unsigned int eq_stage_max = 7;
+	int ret;
 	u8 v;
 
 	if (eq_level <= eq_stage_max) {
@@ -1480,7 +1510,9 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
 		eq_stage_2_select_value = eq_level - eq_stage_max;
 	}
 
-	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v, NULL);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v, NULL);
+	if (ret)
+		return ret;
 
 	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
 	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
@@ -1488,68 +1520,102 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
 	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
 	v |= UB960_RR_AEQ_BYPASS_ENABLE;
 
-	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v, NULL);
+	ret = ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
-static void ub960_rxport_set_eq_range(struct ub960_data *priv,
-				      unsigned int nport, u8 eq_min, u8 eq_max)
+static int ub960_rxport_set_eq_range(struct ub960_data *priv,
+				     unsigned int nport, u8 eq_min, u8 eq_max)
 {
+	int ret = 0;
+
 	ub960_rxport_write(priv, nport, UB960_RR_AEQ_MIN_MAX,
 			   (eq_min << UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) |
 			   (eq_max << UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT),
-			   NULL);
+			   &ret);
 
 	/* Enable AEQ min setting */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2,
 				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR,
-				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR, NULL);
+				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR, &ret);
+
+	return ret;
 }
 
-static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
+static int ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 {
 	struct ub960_rxport *rxport = priv->rxports[nport];
+	int ret;
 
 	/* We also set common settings here. Should be moved elsewhere. */
 
 	if (priv->strobe.manual) {
 		/* Disable AEQ_SFILTER_EN */
-		ub960_update_bits(priv, UB960_XR_AEQ_CTL1,
-				  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0, NULL);
+		ret = ub960_update_bits(priv, UB960_XR_AEQ_CTL1,
+					UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0,
+					NULL);
+		if (ret)
+			return ret;
 	} else {
 		/* Enable SFILTER and error control */
-		ub960_write(priv, UB960_XR_AEQ_CTL1,
-			    UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK |
-				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, NULL);
+		ret = ub960_write(priv, UB960_XR_AEQ_CTL1,
+				  UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK |
+					  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN,
+				  NULL);
+
+		if (ret)
+			return ret;
 
 		/* Set AEQ strobe range */
-		ub960_rxport_set_strobe_range(priv, priv->strobe.min,
-					      priv->strobe.max);
+		ret = ub960_rxport_set_strobe_range(priv, priv->strobe.min,
+						    priv->strobe.max);
+		if (ret)
+			return ret;
 	}
 
 	/* The rest are port specific */
 
 	if (priv->strobe.manual)
-		ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strobe_pos);
+		ret = ub960_rxport_set_strobe_pos(priv, nport,
+						  rxport->eq.strobe_pos);
 	else
-		ub960_rxport_set_strobe_pos(priv, nport, 0);
+		ret = ub960_rxport_set_strobe_pos(priv, nport, 0);
+
+	if (ret)
+		return ret;
 
 	if (rxport->eq.manual_eq) {
-		ub960_rxport_set_eq_level(priv, nport,
-					  rxport->eq.manual.eq_level);
+		ret = ub960_rxport_set_eq_level(priv, nport,
+						rxport->eq.manual.eq_level);
+		if (ret)
+			return ret;
 
 		/* Enable AEQ Bypass */
-		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
-					 UB960_RR_AEQ_BYPASS_ENABLE,
-					 UB960_RR_AEQ_BYPASS_ENABLE, NULL);
+		ret = ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
+					       UB960_RR_AEQ_BYPASS_ENABLE,
+					       UB960_RR_AEQ_BYPASS_ENABLE,
+					       NULL);
+		if (ret)
+			return ret;
 	} else {
-		ub960_rxport_set_eq_range(priv, nport,
-					  rxport->eq.aeq.eq_level_min,
-					  rxport->eq.aeq.eq_level_max);
+		ret = ub960_rxport_set_eq_range(priv, nport,
+						rxport->eq.aeq.eq_level_min,
+						rxport->eq.aeq.eq_level_max);
+		if (ret)
+			return ret;
 
 		/* Disable AEQ Bypass */
-		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
-					 UB960_RR_AEQ_BYPASS_ENABLE, 0, NULL);
+		ret = ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
+					       UB960_RR_AEQ_BYPASS_ENABLE, 0,
+					       NULL);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
@@ -1697,8 +1763,11 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			continue;
 		}
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v,
-				    NULL);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH,
+					  &v, NULL);
+
+		if (ret)
+			return ret;
 
 		if (priv->hw_data->is_ub9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
@@ -1867,8 +1936,8 @@ static void ub960_rxport_remove_serializers(struct ub960_data *priv)
 	}
 }
 
-static void ub960_init_tx_port(struct ub960_data *priv,
-			       struct ub960_txport *txport)
+static int ub960_init_tx_port(struct ub960_data *priv,
+			      struct ub960_txport *txport)
 {
 	unsigned int nport = txport->nport;
 	u8 csi_ctl = 0;
@@ -1885,7 +1954,7 @@ static void ub960_init_tx_port(struct ub960_data *priv,
 	if (!txport->non_continous_clk)
 		csi_ctl |= UB960_TR_CSI_CTL_CSI_CONTS_CLOCK;
 
-	ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl, NULL);
+	return ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl, NULL);
 }
 
 static int ub960_init_tx_ports(struct ub960_data *priv)
@@ -1893,6 +1962,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 	unsigned int nport;
 	u8 speed_select;
 	u8 pll_div;
+	int ret = 0;
 
 	/* TX ports */
 
@@ -1916,51 +1986,57 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 		break;
 	}
 
-	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, NULL);
+	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
 
 	if (priv->hw_data->is_ub9702) {
-		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div, NULL);
+		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div, &ret);
 
 		switch (priv->tx_data_rate) {
 		case MHZ(1600):
 		default:
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x80, NULL);
+					0x80, &ret);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, NULL);
+					0x2a, &ret);
 			break;
 		case MHZ(800):
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x90, NULL);
+					0x90, &ret);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f,
-					0x2a, NULL);
+					0x2a, &ret);
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, NULL);
+					0x2a, &ret);
 			break;
 		case MHZ(400):
 			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0xa0, NULL);
+					0xa0, &ret);
 			break;
 		}
 	}
 
+	if (ret)
+		return ret;
+
 	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)
 			continue;
 
-		ub960_init_tx_port(priv, txport);
+		ret = ub960_init_tx_port(priv, txport);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
 }
 
-static void ub960_init_rx_port_ub960(struct ub960_data *priv,
-				     struct ub960_rxport *rxport)
+static int ub960_init_rx_port_ub960(struct ub960_data *priv,
+				    struct ub960_rxport *rxport)
 {
 	unsigned int nport = rxport->nport;
 	u32 bc_freq_val;
+	int ret = 0;
 
 	/*
 	 * Back channel frequency select.
@@ -1989,19 +2065,19 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 		break;
 
 	default:
-		return;
+		return -EINVAL;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK,
-				 bc_freq_val, NULL);
+				 bc_freq_val, &ret);
 
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
 		/* FPD3_MODE = RAW10 Mode (DS90UB913A-Q1 / DS90UB933-Q1 compatible) */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG,
 					 UB960_RR_PORT_CONFIG_FPD3_MODE_MASK,
-					 0x3, NULL);
+					 0x3, &ret);
 
 		/*
 		 * RAW10_8BIT_CTL = 0b10 : 8-bit processing using upper 8 bits
@@ -2009,55 +2085,58 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
 			UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK,
 			0x2 << UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT,
-			NULL);
+			&ret);
 
 		break;
 
 	case RXPORT_MODE_RAW12_HF:
 	case RXPORT_MODE_RAW12_LF:
 		/* Not implemented */
-		return;
+		return -EINVAL;
 
 	case RXPORT_MODE_CSI2_SYNC:
 	case RXPORT_MODE_CSI2_NONSYNC:
 		/* CSI-2 Mode (DS90UB953-Q1 compatible) */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
-					 0x0, NULL);
+					 0x0, &ret);
 
 		break;
 	}
 
 	/* LV_POLARITY & FV_POLARITY */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol, NULL);
+				 rxport->lv_fv_pol, &ret);
 
 	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, NULL);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, &ret);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, &ret);
 
 	/* Enable I2C_PASS_THROUGH */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, NULL);
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, &ret);
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1, NULL);
+			   rxport->ser.alias << 1, &ret);
 
 	/* Configure EQ related settings */
 	ub960_rxport_config_eq(priv, nport);
 
 	/* Enable RX port */
 	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
-			  NULL);
+			  &ret);
+
+	return ret;
 }
 
-static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
-					   struct ub960_rxport *rxport)
+static int ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
+					  struct ub960_rxport *rxport)
 {
 	unsigned int nport = rxport->nport;
 	u8 bc_freq_val;
 	u8 fpd_func_mode;
+	int ret = 0;
 
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
@@ -2086,90 +2165,96 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 		break;
 
 	default:
-		return;
+		return -EINVAL;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, NULL);
+				 bc_freq_val, &ret);
 	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode,
-			   NULL);
+			   &ret);
 
 	/* set serdes_eq_mode = 1 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80,
-			NULL);
+			&ret);
 
 	/* enable serdes driver */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f,
-			NULL);
+			&ret);
 
 	/* set serdes_eq_offset=4 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			NULL);
+			&ret);
 
 	/* init default serdes_eq_max in 0xa9 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23,
-			NULL);
+			&ret);
 
 	/* init serdes_eq_min in 0xaa */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0, NULL);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0, &ret);
 
 	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
 	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
-			      BIT(3), BIT(3), NULL);
+			      BIT(3), BIT(3), &ret);
 
 	/* RX port to half-rate */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  BIT(nport * 2), NULL);
+			  BIT(nport * 2), &ret);
+
+	return ret;
 }
 
-static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
-					       struct ub960_rxport *rxport)
+static int ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
+					      struct ub960_rxport *rxport)
 {
 	unsigned int nport = rxport->nport;
 	bool first_time_power_up = true;
+	int ret = 0;
 
 	if (first_time_power_up) {
 		u8 v;
 
 		/* AEQ init */
 		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v,
-			       NULL);
+			       &ret);
 
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v,
-				NULL);
+				&ret);
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28,
-				v + 1, NULL);
+				v + 1, &ret);
 
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b,
-				0x00, NULL);
+				0x00, &ret);
 	}
 
 	/* enable serdes_eq_ctl2 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00,
-			NULL);
+			&ret);
 
 	/* enable serdes_eq_ctl1 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40,
-			NULL);
+			&ret);
 
 	/* enable serdes_eq_en */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40,
-			NULL);
+			&ret);
 
 	/* disable serdes_eq_override */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00,
-			NULL);
+			&ret);
 
 	/* disable serdes_gain_override */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00,
-			NULL);
+			&ret);
+
+	return ret;
 }
 
-static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
-					   struct ub960_rxport *rxport)
+static int ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
+					  struct ub960_rxport *rxport)
 {
 	unsigned int nport = rxport->nport;
 	u8 bc_freq_val;
+	int ret = 0;
 
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
@@ -2193,55 +2278,66 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 		break;
 
 	default:
-		return;
+		return -EINVAL;
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, NULL);
+				 bc_freq_val, &ret);
 
 	/* FPD4 Sync Mode */
-	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0, &ret);
 
 	/* add serdes_eq_offset of 4 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			NULL);
+			&ret);
 
 	/* FPD4 serdes_start_eq in 0x27: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0, NULL);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0, &ret);
 	/* FPD4 serdes_end_eq in 0x28: assign default */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23,
-			NULL);
+			&ret);
 
 	/* set serdes_driver_mode into FPD IV mode */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00,
-			NULL);
+			&ret);
 	/* set FPD PBC drv into FPD IV mode */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00,
-			NULL);
+			&ret);
 
 	/* set serdes_system_init to 0x2f */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f,
-			NULL);
+			&ret);
 	/* set serdes_system_rst in reset mode */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1,
-			NULL);
+			&ret);
 
 	/* RX port to 7.55G mode */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  0 << (nport * 2), NULL);
+			  0 << (nport * 2), &ret);
+
+	if (ret)
+		return ret;
 
-	ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
+	ret = ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
-static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
-				      struct ub960_rxport *rxport)
+static int ub960_init_rx_port_ub9702(struct ub960_data *priv,
+				     struct ub960_rxport *rxport)
 {
 	unsigned int nport = rxport->nport;
+	int ret;
 
 	if (rxport->cdr_mode == RXPORT_CDR_FPD3)
-		ub960_init_rx_port_ub9702_fpd3(priv, rxport);
+		ret = ub960_init_rx_port_ub9702_fpd3(priv, rxport);
 	else /* RXPORT_CDR_FPD4 */
-		ub960_init_rx_port_ub9702_fpd4(priv, rxport);
+		ret = ub960_init_rx_port_ub9702_fpd4(priv, rxport);
+
+	if (ret)
+		return ret;
 
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
@@ -2250,14 +2346,14 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 		 * 0b10 : 8-bit processing using upper 8 bits
 		 */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
-					 0x3 << 6, 0x2 << 6, NULL);
+					 0x3 << 6, 0x2 << 6, &ret);
 
 		break;
 
 	case RXPORT_MODE_RAW12_HF:
 	case RXPORT_MODE_RAW12_LF:
 		/* Not implemented */
-		return;
+		return -EINVAL;
 
 	case RXPORT_MODE_CSI2_SYNC:
 	case RXPORT_MODE_CSI2_NONSYNC:
@@ -2267,30 +2363,32 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 	/* LV_POLARITY & FV_POLARITY */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol, NULL);
+				 rxport->lv_fv_pol, &ret);
 
 	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, NULL);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, &ret);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, &ret);
 
 	/* Enable I2C_PASS_THROUGH */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, NULL);
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, &ret);
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1, NULL);
+			   rxport->ser.alias << 1, &ret);
 
 	/* Enable RX port */
 	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
-			  NULL);
+			  &ret);
 
 	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
 		/* unreset 960 AEQ */
 		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25,
-				0x41, NULL);
+				0x41, &ret);
 	}
+
+	return ret;
 }
 
 static int ub960_init_rx_ports(struct ub960_data *priv)
@@ -2299,20 +2397,24 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
+		int ret;
 
 		if (!rxport)
 			continue;
 
 		if (priv->hw_data->is_ub9702)
-			ub960_init_rx_port_ub9702(priv, rxport);
+			ret = ub960_init_rx_port_ub9702(priv, rxport);
 		else
-			ub960_init_rx_port_ub960(priv, rxport);
+			ret = ub960_init_rx_port_ub960(priv, rxport);
+
+		if (ret)
+			return ret;
 	}
 
 	return 0;
 }
 
-static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
+static int ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 {
 	struct device *dev = &priv->client->dev;
 	u8 rx_port_sts1;
@@ -2322,21 +2424,15 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 	int ret = 0;
 
 	/* Read interrupts (also clears most of them) */
-	if (!ret)
-		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
-					&rx_port_sts1, NULL);
-	if (!ret)
-		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
-					&rx_port_sts2, NULL);
-	if (!ret)
-		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS,
-					&csi_rx_sts, NULL);
-	if (!ret)
-		ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS,
-					&bcc_sts, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &rx_port_sts1,
+			  &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &rx_port_sts2,
+			  &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &csi_rx_sts, &ret);
+	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &bcc_sts, &ret);
 
 	if (ret)
-		return;
+		return ret;
 
 	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_PARITY_ERROR) {
 		u16 v;
@@ -2431,6 +2527,8 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 				"stable freq" :
 				"unstable freq");
 	}
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -2486,14 +2584,14 @@ static int ub960_enable_tx_port(struct ub960_data *priv, unsigned int nport)
 					UB960_TR_CSI_CTL_CSI_ENABLE, NULL);
 }
 
-static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
+static int ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
 {
 	struct device *dev = &priv->client->dev;
 
 	dev_dbg(dev, "disable TX port %u\n", nport);
 
-	ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
-				 UB960_TR_CSI_CTL_CSI_ENABLE, 0, NULL);
+	return ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
+					UB960_TR_CSI_CTL_CSI_ENABLE, 0, NULL);
 }
 
 static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2507,16 +2605,16 @@ static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
 				 UB960_SR_FWD_CTL1_PORT_DIS(nport), 0, NULL);
 }
 
-static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
+static int ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 {
 	struct device *dev = &priv->client->dev;
 
 	dev_dbg(dev, "disable RX port %u\n", nport);
 
 	/* Disable forwarding */
-	ub960_update_bits(priv, UB960_SR_FWD_CTL1,
-			  UB960_SR_FWD_CTL1_PORT_DIS(nport),
-			  UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
+	return ub960_update_bits(priv, UB960_SR_FWD_CTL1,
+				 UB960_SR_FWD_CTL1_PORT_DIS(nport),
+				 UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
 }
 
 /*
@@ -2658,12 +2756,12 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
 				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
-				NULL);
+				&ret);
 
 			ub960_rxport_write(priv, rxport->nport,
 				UB960_RR_RAW_EMBED_DTYPE,
 				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
-					rx_data[nport].meta_dt, NULL);
+					rx_data[nport].meta_dt, &ret);
 
 			break;
 
@@ -2681,7 +2779,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)),
-						   NULL);
+						   &ret);
 			} else {
 				unsigned int i;
 
@@ -2690,7 +2788,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
 							   (nport << 4) | nport,
-							   NULL);
+							   &ret);
 			}
 
 			break;
@@ -2702,9 +2800,9 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
 	}
 
-	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl, NULL);
+	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl, &ret);
 
-	return 0;
+	return ret;
 }
 
 static void ub960_update_streaming_status(struct ub960_data *priv)
@@ -3107,8 +3205,8 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
 	.set_fmt = ub960_set_fmt,
 };
 
-static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
-					 unsigned int nport)
+static int ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
+					unsigned int nport)
 {
 	struct device *dev = &priv->client->dev;
 	u8 eq_level;
@@ -3120,7 +3218,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 
 	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v, NULL);
 	if (ret)
-		return;
+		return ret;
 
 	dev_info(dev, "\t%s strobe\n",
 		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
@@ -3129,7 +3227,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
 		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v, NULL);
 		if (ret)
-			return;
+			return ret;
 
 		dev_info(dev, "\tStrobe range [%d, %d]\n",
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
@@ -3138,7 +3236,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 
 	ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
 	if (ret)
-		return;
+		return ret;
 
 	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
 
@@ -3146,7 +3244,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v, NULL);
 	if (ret)
-		return;
+		return ret;
 
 	dev_info(dev, "\t%s EQ\n",
 		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
@@ -3156,15 +3254,20 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v,
 					NULL);
 		if (ret)
-			return;
+			return ret;
 
 		dev_info(dev, "\tEQ range [%u, %u]\n",
 			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
 			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
 	}
 
-	if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
-		dev_info(dev, "\tEQ level %u\n", eq_level);
+	ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "\tEQ level %u\n", eq_level);
+
+	return 0;
 }
 
 static int ub960_log_status(struct v4l2_subdev *sd)
@@ -3176,11 +3279,15 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	u16 v16 = 0;
 	u8 v = 0;
 	u8 id[UB960_SR_FPD3_RX_ID_LEN];
+	int ret = 0;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	for (unsigned int i = 0; i < sizeof(id); i++)
-		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i], NULL);
+	for (unsigned int i = 0; i < sizeof(id); i++) {
+		ret = ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i], NULL);
+		if (ret)
+			return ret;
+	}
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
@@ -3194,24 +3301,39 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			continue;
 		}
 
-		ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v, NULL);
+		ret = ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
 			 v & (u8)BIT(0));
 
-		ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v16,
-			     NULL);
+		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
+				   &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tframe counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
-			     &v16, NULL);
+		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
+				   &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tframe error counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v16,
-			     NULL);
+		ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
+				   &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tline counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
-			     &v16, NULL);
+		ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
+				   &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tline error counter %u\n", v16);
 	}
 
@@ -3225,8 +3347,10 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			continue;
 		}
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v,
-				  NULL);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v,
+					NULL);
+		if (ret)
+			return ret;
 
 		if (v & UB960_RR_RX_PORT_STS1_LOCK_STS)
 			dev_info(dev, "\tLocked\n");
@@ -3234,32 +3358,53 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			dev_info(dev, "\tNot locked\n");
 
 		dev_info(dev, "\trx_port_sts1 %#02x\n", v);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v,
-				  NULL);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v,
+					NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16,
-				    NULL);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH,
+					  &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tlink freq %llu Hz\n", ((u64)v16 * HZ_PER_MHZ) >> 8);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16,
-				    NULL);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI,
+					  &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tparity errors %u\n", v16);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI, &v16,
-				    NULL);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI,
+					  &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tlines per frame %u\n", v16);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v16,
-				    NULL);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1,
+					  &v16, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tbytes per line %u\n", v16);
 
-		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v,
-				  NULL);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER,
+					&v, NULL);
+		if (ret)
+			return ret;
+
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (!priv->hw_data->is_ub9702)
-			ub960_log_status_ub960_sp_eq(priv, nport);
+		if (!priv->hw_data->is_ub9702) {
+			ret = ub960_log_status_ub960_sp_eq(priv, nport);
+			if (ret)
+				return ret;
+		}
 
 		/* GPIOs */
 		for (unsigned int i = 0; i < UB960_NUM_BC_GPIOS; i++) {
@@ -3269,7 +3414,9 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			ctl_reg = UB960_RR_BC_GPIO_CTL(i / 2);
 			ctl_shift = (i % 2) * 4;
 
-			ub960_rxport_read(priv, nport, ctl_reg, &v, NULL);
+			ret = ub960_rxport_read(priv, nport, ctl_reg, &v, NULL);
+			if (ret)
+				return ret;
 
 			dev_info(dev, "\tGPIO%u: mode %u\n", i,
 				 (v >> ctl_shift) & 0xf);
@@ -3325,16 +3472,22 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
 	for (i = 0; i < priv->hw_data->num_txports; i++) {
-		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
-			ub960_csi_handle_events(priv, i);
+		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i)) {
+			ret = ub960_csi_handle_events(priv, i);
+			if (ret)
+				return IRQ_NONE;
+		}
 	}
 
 	for (i = 0; i < priv->hw_data->num_rxports; i++) {
 		if (!priv->rxports[i])
 			continue;
 
-		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
-			ub960_rxport_handle_events(priv, i);
+		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i)) {
+			ret = ub960_rxport_handle_events(priv, i);
+			if (ret)
+				return IRQ_NONE;
+		}
 	}
 
 	return IRQ_HANDLED;
@@ -3938,7 +4091,7 @@ static const struct regmap_config ub960_regmap_config = {
 	.disable_locking = true,
 };
 
-static void ub960_reset(struct ub960_data *priv, bool reset_regs)
+static int ub960_reset(struct ub960_data *priv, bool reset_regs)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
@@ -3948,7 +4101,9 @@ static void ub960_reset(struct ub960_data *priv, bool reset_regs)
 	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
 			   UB960_SR_RESET_DIGITAL_RESET0;
 
-	ub960_write(priv, UB960_SR_RESET, bit, NULL);
+	ret = ub960_write(priv, UB960_SR_RESET, bit, NULL);
+	if (ret)
+		return ret;
 
 	mutex_lock(&priv->reg_lock);
 
@@ -3959,6 +4114,8 @@ static void ub960_reset(struct ub960_data *priv, bool reset_regs)
 
 	if (ret)
 		dev_err(dev, "reset failed: %d\n", ret);
+
+	return ret;
 }
 
 static int ub960_get_hw_resources(struct ub960_data *priv)
@@ -4017,7 +4174,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		fsleep(2000);
 	}
 
-	ub960_reset(priv, true);
+	ret = ub960_reset(priv, true);
+	if (ret)
+		goto err_pd_gpio;
 
 	/* Runtime check register accessibility */
 	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask, NULL);
@@ -4132,7 +4291,9 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_disable_vpocs;
 
-	ub960_reset(priv, false);
+	ret = ub960_reset(priv, false);
+	if (ret)
+		goto err_disable_vpocs;
 
 	port_mask = 0;
 
@@ -4159,7 +4320,9 @@ static int ub960_probe(struct i2c_client *client)
 	 * Clear any errors caused by switching the RX port settings while
 	 * probing.
 	 */
-	ub960_clear_rx_errors(priv);
+	ret = ub960_clear_rx_errors(priv);
+	if (ret)
+		goto err_disable_vpocs;
 
 	ret = ub960_init_atr(priv);
 	if (ret)

-- 
2.43.0


