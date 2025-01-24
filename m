Return-Path: <linux-media+bounces-25287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C846AA1B91A
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F2316EC8C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028BE2248AD;
	Fri, 24 Jan 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qSYiXTcx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53C223711;
	Fri, 24 Jan 2025 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731929; cv=none; b=H1XQkJXfdXh6WOJVFBpYUv/n8ZVJfFFuDt+Lbu4TI1910ITiHNt15AlBQQljUYI9a/yXGU/p8CMmKXQzv5HwgewDeacL2zuUN9Whz2mC0ovDU9rQLL73tn37oF4uVf64UfQdo70Ro2pvIAelZSr6gkbYcF528t1XTqmBY4r9A+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731929; c=relaxed/simple;
	bh=CM1W56D9qM93BC4zWdZEOfu5UnrV9UncxDigXhO+g64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/yqXQzYAuUu7kRlBaB8h9d2s1SgQn8ys/TyjMV6+LGnnBRWhT61w4f03LqjHmylMBH/sM8JNpNLE5QFtKqiixuUvU0DgmfXIb69Q9cA3igi7KWqBCoeojjKAYW6yn7lONldzLeVK2yxW/dn9MZtVMLdBNM6gNqKtexEJSHih28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qSYiXTcx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E3B2269C;
	Fri, 24 Jan 2025 16:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731839;
	bh=CM1W56D9qM93BC4zWdZEOfu5UnrV9UncxDigXhO+g64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qSYiXTcxkQ1x2WIDeIhnxIpndCmbiVtJeJGY+5+ippFvMooVxtB6dgDo5vY60xWF5
	 nvR1MSSvMGM9Rz6Snc7tHahpymTyMR/6gY/KdlcSGY+LXQ+lmw9o5PZ7Rk2KQckHkq
	 Ff0lUKhN4IFGIUUrXXcQ0tSzOuyHil6JHagOEvwg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:56 +0200
Subject: [PATCH v2 19/22] media: i2c: ds90ub960: Enable SSCG for UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-19-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=d0G3mPnIMO2zJnVlgzXqqtY/YBI1ZTZf9T6977AeIWY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68yBexrR3sufpomwv5eh3btV4xuFAW4rIYwC
 5MEoYCFFruJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMgAKCRD6PaqMvJYe
 9RdcD/9jGnBxGibTAU1a3he7a6c7FhcRRFL8HRIBz+6q6diwvYhGBHc5A7jGuvLCJXUaNdhFFop
 MSLtHMV2jIdqkDu/fgN3oL8lSf/R7Ez5lBSoOx37ywcBqwGl9gcPm3nSc8/uwsQn9o0FyReq1+G
 iemKiCIsIEdMi0Br2PqABoBLsuJNibDreg/i801d1Xy+GlDtn7L+L9znjsdq+Qv2MbeXPPdVFsJ
 Y/KhCmrujIYYERBkeGSfZ7qxQm80NEkUFbTT8yExSIhCVE8WKRn8nn3C+ywdUiQSB+eFwsNSCQQ
 7/MMTTGKngF5VfSsXAsTkLkJLtuyxTTIxDUv+ElKUsI694pvojaiUfUgokQ2dtOchf7cGIeNLrH
 PTGcpK+s24bZ+f/2Yw2l7N3T3rCF4zNrHgnHiAuekfNOIw9RkPZ1YEvbZzw0Edg+BidE6Vr4MeS
 SjOF/Qq2QslzRRsaom7rpC/CvvFpBQTUJahWfjgkw7dIacVr6gYilmpZx1W/5dBJ/abnvkF8rog
 /8tj1F4f2an9C/ZMA09Ctw6hlYDMs9x4yYUt+NbN8xvKQAU5tIXwPiMw5NqUEBI28ZLc46uryH1
 X4HWClpR9G33DfnUa2aPuOlXc5gxIrFbmfOWX5V1Y7F0FMC1g9lKs7+NdnJoyywrtcmnnUbywVG
 zkvcMIGXC13dZYQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

UB9702 supports spread-spectrum clock generation for the back-channel
clock, which is futher used by serializers in synchronous mode to
generate the forward-channel clock, which can help reduce peak EMI
energy. The SSCG is common to all RX ports, so it can only be used if
all the ports are in the same mode.

Add basic support for SSCG by adding a module parameter to enable the
SSCG. The SSCG uses hardcoded configurationg, with 0.5% center-spread at
33kHz modulation rate. See datasheet if different configuration is
required.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 98 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ccc1c7e398ea..cc2a72fdcf4f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -359,6 +359,7 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
+#define UB960_IND_TARGET_PLL_CTRL		0x05
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */
@@ -382,6 +383,22 @@
 #define UB960_IR_PGEN_VFP			0x0f
 #define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
 
+#define UB960_IR_PLL_DEN_MASH2			0x80
+#define UB960_IR_PLL_DEN_MASH1			0x81
+#define UB960_IR_PLL_DEN_MASH0			0x82
+#define UB960_IR_PLL_NUM_MASH2			0x83
+#define UB960_IR_PLL_NUM_MASH1			0x84
+#define UB960_IR_PLL_NUM_MASH0			0x85
+#define UB960_IR_PLL_NCOUNT1			0x86
+#define UB960_IR_PLL_NCOUNT0			0x87
+#define UB960_IR_PLL_SSCG_CTRL1			0x88
+#define UB960_IR_PLL_MASH_ORDER			0x8a
+#define UB960_IR_PLL_SSCG_CTRL2			0x8b
+#define UB960_IR_PLL_SSCG_CTRL3			0x8c
+#define UB960_IR_PLL_SSCG_CTRL4			0x8d
+#define UB960_IR_PLL_SSCG_CTRL5			0x8e
+#define UB960_IR_PLL_SSCG_MASH_CTRL		0x8f
+
 #define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
 #define UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
@@ -2837,6 +2854,81 @@ static int ub960_enable_dfe_lms_ub9702(struct ub960_data *priv,
 	return 0;
 }
 
+/*
+ * Configures back-channel spread-spectrum clocking with 0.5% center-spread at
+ * 33kHz modulation rate. See datasheet if different configuration is required.
+ */
+static int ub960_enable_sscg_ub9702(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret = 0;
+
+	/*
+	 * The configuration is hard-coded with FPD4 and BC frequency
+	 * 47.1875Mbps, so make sure all RX ports are configured with
+	 * synchronous clocking mode.
+	 */
+	for_each_active_rxport(priv, it) {
+		if (it.rxport->cdr_mode != RXPORT_CDR_FPD4 ||
+		    it.rxport->rx_mode != RXPORT_MODE_CSI2_SYNC) {
+			dev_warn(dev,
+				 "rx%u: Not in FPD4 SYNC mode, skipping SSCG\n",
+				 it.nport);
+			return 0;
+		}
+	}
+
+	/* Disable MASH */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_MASH_CTRL, 0x40, &ret);
+
+	/* Set MASH denominator */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH2,
+			0x7f, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH1,
+			0xff, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_DEN_MASH0,
+			0xf8, &ret);
+
+	/* Set MASH numerator */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH2,
+			0x7f, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH1,
+			0xff, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NUM_MASH0,
+			0xf8, &ret);
+
+	/* Set NCOUNT */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NCOUNT1,
+			0x00, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL, UB960_IR_PLL_NCOUNT0,
+			0x96, &ret);
+
+	/* Set MASH order */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_MASH_ORDER, 0x20, &ret);
+
+	/* Set rampx increment and stop */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL2, 0xbd, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL4, 0x73, &ret);
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_CTRL5, 0x41, &ret);
+
+	/* Enable SSCG */
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_PLL_CTRL,
+			      UB960_IR_PLL_SSCG_CTRL1, BIT(7), BIT(7), &ret);
+
+	/* Enable MASH */
+	ub960_write_ind(priv, UB960_IND_TARGET_PLL_CTRL,
+			UB960_IR_PLL_SSCG_MASH_CTRL, 0x0, &ret);
+
+	dev_dbg(dev, "SSCG enabled\n");
+
+	return ret;
+}
+
 static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -2860,6 +2952,12 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 	if (ret)
 		return ret;
 
+	if (fwnode_property_read_bool(dev_fwnode(dev), "ti,enable-sscg")) {
+		ret = ub960_enable_sscg_ub9702(priv);
+		if (ret)
+			return ret;
+	}
+
 	for_each_active_rxport_fpd4(priv, it) {
 		/* Hold state machine in reset */
 		ub960_rxport_write(priv, it.nport, UB9702_RR_RX_SM_SEL_2, 0x10,

-- 
2.43.0


