Return-Path: <linux-media+bounces-24594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F67A08B49
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1823AAEE5
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E6020DD48;
	Fri, 10 Jan 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/9/yeuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBDA20D4EE;
	Fri, 10 Jan 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500539; cv=none; b=rURlTyamd7dZV8eVnmtzriq6s7cO5M1Rb+cy5M7uw0YpsFaG9Vae9xpIT5DlwL9EAuIh06huoffu3szm+N8ab2od/VdR4qoqQU7VLj3eoY5YA19hw2LzSkX2pgW0vRR54ifO0g+uV/y2L52k1iutwv+Dz630u2FcEqFAdUI+H8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500539; c=relaxed/simple;
	bh=DWToMBwr1xndBK5uWEpp0zwmeBf6j+ydEZOw6FvNts0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7xijdPi7RqWxsvf5tHqZfTQUZ1zw/0SfZcK77CB/B4tD+3iJU1OaaJIk6gUHQf/vfLI7qpxPXOvR5W0PfvGUTkCgYhKEaUbHAHfeKCJhYjKOUXOQjHrJP4ODnkTGUCGHy8GvquhI4Ex+GlMdszTFLLgJSZ6e28KruN91hhS39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/9/yeuJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22AE6CE6;
	Fri, 10 Jan 2025 10:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500458;
	bh=DWToMBwr1xndBK5uWEpp0zwmeBf6j+ydEZOw6FvNts0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/9/yeuJgH+kaIxwMvIzEssTudHUI5m9C+63kIr0nNfyLH7+Kenum9pdrs6eJi9Pc
	 z2sAv2hLQka+hQMDaFgQjFFoXS8kNU/ZbRpcEl45tLB/hctfo4bzI3zz/EImg1dZ7l
	 9F2S6e3XUoepBks3yPkpNrsYWfWGImKKAYSuSG94=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:14 +0200
Subject: [PATCH 14/19] media: i2c: ds90ub960: Remove old ub9702 RX port
 init code (SQUASH)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-14-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8434;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DWToMBwr1xndBK5uWEpp0zwmeBf6j+ydEZOw6FvNts0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUVzyp2xUSU3/mk0orGb4TQsEb6IxtLZ8HlZ
 Y6iQtb0z+CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFQAKCRD6PaqMvJYe
 9UDOEACw5fJnSjq4pp3NqzuISwNH1Vgd2oMT7axPkoYW6bUxsxLXxLSaXp6o4up3A1iXzz8XJZd
 eStwq4lfrPh+tLGenwEkINVkBAlu5M6xyLzc0C354N/8hdA5d8Z/3sxoTyJ1IyeTyzcLybQBY3R
 dUQTpSoaSHy42l1HvrE/S+vByjHutVZN122TvxJgktnre88XrYWrjrF3ttZFgGkp5ySvVSeSoy+
 UkcKXpNFt1HfYPT1oRVsgUYEwqdErYHEcK7omRoJ9QIu8TVTdl1W0PCvrUAK6ZDk76ASRgr/KXR
 hO9oiRbCAchbnjz5M3lAw0oKGZp0xTa430Butqw/aIvCvcXbq4uJ5Qsk5o35I+6dg/NrIVdRXWG
 vFC491d1DBL/3rgh546hPbcQzRztB5vZNVHjR4YhOCqBDbteKgFgA+k76pWQJr6BXRHSEUuryRu
 HUxm0JjOmcusMiQ1iRp2ftN0a97VDYfHYmgb0s+lADrluSjTITGs+XgPRstXcsewp/WlveBSolL
 m8BbhTqwArb8YxUAT23egUNusjo+XNizTftpc0LdEOVavqWol0xBWyrZVflEC9jyc1WY9cUSWsV
 uG144b7Tvr/Q4DP01Fud4tWVuDve1TMaAEoc70m1wiBynZ82D2ibmmpPt8Tl2tOFbcaCGIZ9IIc
 EksKlx6xonC0tpA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We will refresh ub9702 RX port initialization code in the following
patch. To make that patch easier to review, remove the old ub9702 code
here.

This should be squashed in the final version.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 273 +-----------------------------------------
 1 file changed, 3 insertions(+), 270 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index cc944d737524..dc9ead85c676 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2257,268 +2257,7 @@ static int ub960_init_rx_port_ub960(struct ub960_data *priv,
 	return ret;
 }
 
-static int ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
-					  struct ub960_rxport *rxport)
-{
-	unsigned int nport = rxport->nport;
-	u8 bc_freq_val;
-	u8 fpd_func_mode;
-	int ret = 0;
-
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		bc_freq_val = 0;
-		fpd_func_mode = 5;
-		break;
-
-	case RXPORT_MODE_RAW12_HF:
-		bc_freq_val = 0;
-		fpd_func_mode = 4;
-		break;
-
-	case RXPORT_MODE_RAW12_LF:
-		bc_freq_val = 0;
-		fpd_func_mode = 6;
-		break;
-
-	case RXPORT_MODE_CSI2_SYNC:
-		bc_freq_val = 6;
-		fpd_func_mode = 2;
-		break;
-
-	case RXPORT_MODE_CSI2_NONSYNC:
-		bc_freq_val = 2;
-		fpd_func_mode = 2;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, &ret);
-	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, fpd_func_mode,
-			   &ret);
-
-	/* set serdes_eq_mode = 1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80,
-			&ret);
-
-	/* enable serdes driver */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f,
-			&ret);
-
-	/* set serdes_eq_offset=4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			&ret);
-
-	/* init default serdes_eq_max in 0xa9 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23,
-			&ret);
-
-	/* init serdes_eq_min in 0xaa */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0, &ret);
-
-	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
-	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
-			      BIT(3), BIT(3), &ret);
-
-	/* RX port to half-rate */
-	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  BIT(nport * 2), &ret);
-
-	return ret;
-}
-
-static int ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
-					      struct ub960_rxport *rxport)
-{
-	unsigned int nport = rxport->nport;
-	bool first_time_power_up = true;
-	int ret = 0;
-
-	if (first_time_power_up) {
-		u8 v;
-
-		/* AEQ init */
-		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v,
-			       &ret);
-
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28,
-				v + 1, &ret);
-
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b,
-				0x00, &ret);
-	}
-
-	/* enable serdes_eq_ctl2 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00,
-			&ret);
-
-	/* enable serdes_eq_ctl1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40,
-			&ret);
-
-	/* enable serdes_eq_en */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40,
-			&ret);
-
-	/* disable serdes_eq_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00,
-			&ret);
-
-	/* disable serdes_gain_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00,
-			&ret);
-
-	return ret;
-}
-
-static int ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
-					  struct ub960_rxport *rxport)
-{
-	unsigned int nport = rxport->nport;
-	u8 bc_freq_val;
-	int ret = 0;
-
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		bc_freq_val = 0;
-		break;
-
-	case RXPORT_MODE_RAW12_HF:
-		bc_freq_val = 0;
-		break;
-
-	case RXPORT_MODE_RAW12_LF:
-		bc_freq_val = 0;
-		break;
-
-	case RXPORT_MODE_CSI2_SYNC:
-		bc_freq_val = 6;
-		break;
-
-	case RXPORT_MODE_CSI2_NONSYNC:
-		bc_freq_val = 2;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, &ret);
-
-	/* FPD4 Sync Mode */
-	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0, &ret);
-
-	/* add serdes_eq_offset of 4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			&ret);
-
-	/* FPD4 serdes_start_eq in 0x27: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0, &ret);
-	/* FPD4 serdes_end_eq in 0x28: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23,
-			&ret);
-
-	/* set serdes_driver_mode into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00,
-			&ret);
-	/* set FPD PBC drv into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00,
-			&ret);
-
-	/* set serdes_system_init to 0x2f */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f,
-			&ret);
-	/* set serdes_system_rst in reset mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1,
-			&ret);
-
-	/* RX port to 7.55G mode */
-	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  0 << (nport * 2), &ret);
-
-	if (ret)
-		return ret;
-
-	ret = ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int ub960_init_rx_port_ub9702(struct ub960_data *priv,
-				     struct ub960_rxport *rxport)
-{
-	unsigned int nport = rxport->nport;
-	int ret;
-
-	if (rxport->cdr_mode == RXPORT_CDR_FPD3)
-		ret = ub960_init_rx_port_ub9702_fpd3(priv, rxport);
-	else /* RXPORT_CDR_FPD4 */
-		ret = ub960_init_rx_port_ub9702_fpd4(priv, rxport);
-
-	if (ret)
-		return ret;
-
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		/*
-		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
-		 * 0b10 : 8-bit processing using upper 8 bits
-		 */
-		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
-					 0x3 << 6, 0x2 << 6, &ret);
-
-		break;
-
-	case RXPORT_MODE_RAW12_HF:
-	case RXPORT_MODE_RAW12_LF:
-		/* Not implemented */
-		return -EINVAL;
-
-	case RXPORT_MODE_CSI2_SYNC:
-	case RXPORT_MODE_CSI2_NONSYNC:
-
-		break;
-	}
-
-	/* LV_POLARITY & FV_POLARITY */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol, &ret);
-
-	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, &ret);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, &ret);
-
-	/* Enable I2C_PASS_THROUGH */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, &ret);
-
-	/* Enable I2C communication to the serializer via the alias addr */
-	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1, &ret);
-
-	/* Enable RX port */
-	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
-			  &ret);
-
-	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
-		/* unreset 960 AEQ */
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25,
-				0x41, &ret);
-	}
-
-	return ret;
-}
-
-static int ub960_init_rx_ports(struct ub960_data *priv)
+static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int port_lock_mask;
@@ -2526,13 +2265,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 	int ret;
 
 	for_each_active_rxport(priv) {
-		int ret;
-
-		if (priv->hw_data->is_ub9702)
-			ret = ub960_init_rx_port_ub9702(priv, it.rxport);
-		else
-			ret = ub960_init_rx_port_ub960(priv, it.rxport);
-
+		ret = ub960_init_rx_port_ub960(priv, it.rxport);
 		if (ret)
 			return ret;
 	}
@@ -4393,7 +4126,7 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ports;
 
-	ret = ub960_init_rx_ports(priv);
+	ret = ub960_init_rx_ports_ub960(priv);
 	if (ret)
 		goto err_disable_vpocs;
 

-- 
2.43.0


