Return-Path: <linux-media+bounces-25283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE967A1B90F
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0A27A6FEF
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD021BEF9E;
	Fri, 24 Jan 2025 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ppmVdJqi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB531C07EE;
	Fri, 24 Jan 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731923; cv=none; b=rWxmz58vF/8lO3PqihnRFgMigEsy0nk/yDG6A8JcmyUqjopVTNy+a+6pyAWXtbErp+D+fB05jYwMrdpBJoP5N2ydIiUUNzhyMDa2mLNzeiAPN4wj0e4R/PfowIIvXJKaKS+WsCHLJPq4EKcGt4gl92X13/goFsakd2UOPALr5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731923; c=relaxed/simple;
	bh=nXEtvv2D6xfaYKwYAxNll3BhpSod2ViR4fQnsE18aMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNNPXffuG/oIdu8Ivx4doJcz+8Zvwm7fZ7XlvAAHN5CjBa/1BUz/qPSFqK9glQmLLHEORYFsl6AkGadsQyyQEpkIblzBxeSXBk6VGdqg7Bjvcm10LPv2N3YvZb6WkX48fE4WEK7pFQJbKaJgO2wIGftJwxOZeBK9skzP8TRcBiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ppmVdJqi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 872FB66B;
	Fri, 24 Jan 2025 16:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731836;
	bh=nXEtvv2D6xfaYKwYAxNll3BhpSod2ViR4fQnsE18aMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ppmVdJqivpWwgn/cnkmQZ4zPPZDDGM5yQsLBt4ksEDks9MnZUAe4d/NJRDSB8SDqL
	 udQguydGKyGZfqXhKE4TmiTMrwkUKBTTt3xxCispvCyEj4JLZx/zNZWO7w8E4DwbEo
	 4OALSsfh2I08jg0bZ0NC3RjJHpuBgpiFJt53CNvc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:52 +0200
Subject: [PATCH v2 15/22] media: i2c: ds90ub960: Remove old ub9702 RX port
 init code (SQUASH)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-15-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nXEtvv2D6xfaYKwYAxNll3BhpSod2ViR4fQnsE18aMk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68wHzsARX3q0+pT9T2qV4qo/+si4kNC+hUB+
 W9VbvjMkmGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMAAKCRD6PaqMvJYe
 9Ro3D/sFHxaJfi+OapgYCFpfz56nY/xcOR9GCEZcB2SvNNhqiwuTuZVd07kuVg/XoV5UtMD0Bhi
 53vBhDNCoMxpVxQGqiYD17S/U25Dn+/aDGmE58NW23Ytg+c4fiPQonnuPagd3LnQaUqa/O6KDq/
 h2qOpS8J9I373yE+ke/vbRrKzHZjoKi24TH4SJe/50rRVUXx/CAkxWplJLoWPexYkpcY0AXMM+M
 s6NVe6COZiV7pR6tjb9uPHUBp3NGErG9nyZIU6u0rSfSJBZNhDjyQxjncEyN8VPi+JgRpHA3iJ0
 D4Js1fnVUXOLL9LBbvBRAHLC4tSCMYpxBmgre/DLgPE++2pIPThtZgDrI0gBv3WwpBxiWxRH1wz
 78Y1YA56w+vsi93V4aIlSWq/mY3tQ+xtb0P9AO/a5+bBI44ztUyzMbe3eAR95wWXKbtwZKmCd2P
 bU8sFkruiBcrBukI5IXYoNi79wdCcgfPSVd154cEzfhhZJ7z96elA+LIh1X1bQg1tg5oGbHjcEE
 7fZ/8XFuzMmLuVTl6SbAh9y/ibilhzDbP/EQKne5vIs9M8xYwoMPGOgjPUQo7JOkGG71pGdWkaS
 t4kTUxXjUD0tgOhcIqOdLcUusAv5nJCHO9i40c8PVYXL4bib0QkW6W2iC6lhlToeBFFgp5SaEh6
 96XVBsHQ1HI/TDA==
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
index 0fdebf258c29..0d2ff6a2c42c 100644
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
 
 	for_each_active_rxport(priv, it) {
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


