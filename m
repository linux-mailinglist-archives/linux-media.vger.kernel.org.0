Return-Path: <linux-media+bounces-33236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620AAC1ECD
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B2167B2017
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5D52253AB;
	Fri, 23 May 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LIYS1KZN"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A5A158535;
	Fri, 23 May 2025 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989486; cv=none; b=XBtp4+v9lu15pjXwV49YmM2ehgVoUXIha72awOIc5r2T3ZFGonn1iEl2vVoq91PANT0AYFDoeCzRT/7lEXLo7T4BCAbcH4iWo16s5oUomM7wJRB4ThppzVCsJprrk467WVPyCFVM72fD60IdSxFWg440P2KClUicCYfc/F/aY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989486; c=relaxed/simple;
	bh=4DVwylDOjk01tCJesuWxu1jMsOqNbSd+Z1Cv26MHz+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVVTSt9LwYAMReYdqarNgmyzeaeCzmONW2u4MWKuA2yThI7fn6ZB+DcnN33N7F9vbeNHhPAV9IiEk3KpQF/by6ZHD6rSUMV4qbKxf9/fWAvLwOojXCt0f/chOIQEHJBwQCKgGJYa6NuIWSx5k6tYkvuy9VmG8aATiJQQIeow1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LIYS1KZN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N8bsqo2049441;
	Fri, 23 May 2025 03:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747989474;
	bh=KmrZFgidPGZwccwufbPui6GCFr+1LgztHP2M67THRFQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LIYS1KZN44UPBOKW0zVW7SRnqM0QUEEwU30LhnJeSQRefIC6KkZrkohU2gujnHJw3
	 XeMLEoHm3XHCwfRiWqa9JisXT6AZbg0OXuon5nbXUbU+CwNoW05HAldmRF3cCMB4ww
	 eojYrCig6plQTt1QBFBB9gyIu/x5fWN3WuoiopOg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N8bsaM2094874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 03:37:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 03:37:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 03:37:53 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N8bbs51130054;
	Fri, 23 May 2025 03:37:49 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Date: Fri, 23 May 2025 14:06:55 +0530
Message-ID: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port.

Some other registers are marked as reserved in the datasheet as well,
notably around CSI-TX frame and line-count monitoring and some other
status registers. The datasheet also does not mention anything about
setting strobe position, and fails to lock the RX ports if we forcefully
set it, so disable it through the hw_data.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/i2c/Kconfig     |  2 +-
 drivers/media/i2c/ds90ub960.c | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8f..6e265e1cec20 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1662,7 +1662,7 @@ config VIDEO_DS90UB960
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
-	  Device driver for the Texas Instruments DS90UB960
+	  Device driver for the Texas Instruments DS90UB954/DS90UB960
 	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
 
 config VIDEO_MAX96714
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ed2cf9d247d1..38e4f006d098 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -460,6 +460,7 @@ struct ub960_hw_data {
 	u8 num_txports;
 	bool is_ub9702;
 	bool is_fpdlink4;
+	bool is_ub954;
 };
 
 enum ub960_rxport_mode {
@@ -982,6 +983,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 
 	lockdep_assert_held(&priv->reg_lock);
 
+	/* TX port registers are shared for UB954*/
+	if (priv->hw_data->is_ub954)
+		return 0;
+
 	if (priv->reg_current.txport == nport)
 		return 0;
 
@@ -1415,6 +1420,13 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 		goto err_free_vep;
 	}
 
+	/* UB954 does not support 1.2 Gbps */
+	if (priv->tx_data_rate == MHZ(1200) && priv->hw_data->is_ub954) {
+		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
+		ret = -EINVAL;
+		goto err_free_vep;
+	}
+
 	v4l2_fwnode_endpoint_free(&vep);
 
 	priv->txports[nport] = txport;
@@ -1572,6 +1584,10 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret = 0;
 
+	/* FIXME: After writing to this area the UB954 chip no longer responds */
+	if (priv->hw_data->is_ub954)
+		return 0;
+
 	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
 	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
@@ -5021,6 +5037,27 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (priv->hw_data->is_ub9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
+	else if (priv->hw_data->is_ub954) {
+		/* From DS90UB954-Q1 datasheet:
+		 * "REFCLK_FREQ measurement is not synchronized. Value in this
+		 * register should read twice and only considered valid if
+		 * REFCLK_FREQ is unchanged between reads."
+		 */
+		unsigned long timeout = jiffies + msecs_to_jiffies(100);
+
+		do {
+			u8 refclk_new;
+
+			ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
+					 NULL);
+			if (ret)
+				goto err_pd_gpio;
+
+			if (refclk_new == refclk_freq)
+				break;
+			refclk_freq = refclk_new;
+		} while (time_before(jiffies, timeout));
+	}
 	else
 		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
@@ -5177,6 +5214,13 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.model = "ub954",
+	.num_rxports = 2,
+	.num_txports = 1,
+	.is_ub954 = true,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.model = "ub960",
 	.num_rxports = 4,
@@ -5192,6 +5236,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -5199,6 +5244,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.34.1


