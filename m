Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4822619F0C5
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDFHai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:30:38 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50596 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgDFHai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 03:30:38 -0400
Received: by mail-pj1-f66.google.com with SMTP id v13so6141395pjb.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K3p/lQx+tpT+aWKhosNqn6+WJk+UguEpa+LWCMn2kuY=;
        b=FRAbjrr+Kh0RWiDOE//vfhFSmuHQqW5aYl+eON2r4HXfTye48DaOLkNNKtepb9qHRk
         XzEYhReIBGl3k3mNP2Fkz/Q4zNBdL9IhwEcYBkNiJ1+kDekXrhR46KHa+fcYB/LdL3FW
         AvGXpsWwVnZEXSbnoh5CMN6GT6Nhxwxac/FZ4nThOluK8+xDifrHWU4O/0/SVAC82LlZ
         w/fAaQL86bEC2FlsjWtlg3l0XKsx0CbNfKvPCyI37yooldKIjfmd7RL8oFf0mn3T6HeB
         hMViH6T5UlknVJWuhILQyycCOikKGWQ/10eQ8Vpp/WTSKY/u5mKHkh2DGONTxj8xt3zo
         jhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K3p/lQx+tpT+aWKhosNqn6+WJk+UguEpa+LWCMn2kuY=;
        b=efyxUOvHT57z3FhPxs1N1bmNH1Urx+/iDlXhmLFqNX0EISg3va8/ROEddZPp0KTU/K
         InkpTw2vrpTsO7G7NFeC6tpmo2DiiHTnhbs13Pl1bRn2ztO/iSWsFIktU4urt8SMLAzk
         e/LrvNYhOOfAt3//c2y2OXzH+kw4dG4iwQ4pVczcaZEpOsVjsU4z9M/kOXDZO6eIyI/X
         E2vt14YiB3Djsjdq7La/kYIheLDGgdKSxsMKbxY/6GxhEIxgGl3AUmanGl2iK18EOJRy
         GTPdBRezqd/YFUHCo6ZUDfPAeyyMunMjmN6WPge2azBKVQwaRxJOd1XvzE/Wsmgjjmmj
         C0kQ==
X-Gm-Message-State: AGi0PuaIYEh4/YufsAse8ll0n6EfyotdP5c84E9bj+3FWyFthL3DKvMP
        TC67gRjy/ggQsZ6ROZ0XNz5gp2SF
X-Google-Smtp-Source: APiQypIUBUA0cGaztJwFmKFzWRcDEhfbwhShwaytBnnFs0M5R4hpYNbawZXGsBaM7QIF3dwDT93D7A==
X-Received: by 2002:a17:90a:208:: with SMTP id c8mr24779983pjc.153.1586158235874;
        Mon, 06 Apr 2020 00:30:35 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-174-82.hsd1.ca.comcast.net. [24.4.174.82])
        by smtp.googlemail.com with ESMTPSA id z6sm10170179pgg.39.2020.04.06.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:30:35 -0700 (PDT)
From:   Karthik Poduval <karthik.poduval@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Karthik Poduval <karthik.poduval@gmail.com>
Subject: [PATCH v2 1/3] media: staging: phy-rockchip-dphy-rx0: add rk3288 support to DPHY driver
Date:   Mon,  6 Apr 2020 00:30:15 -0700
Message-Id: <20200406073017.19462-2-karthik.poduval@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406073017.19462-1-karthik.poduval@gmail.com>
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add rk3288 support to Rockchip DPHY driver

tested on tinkerbaord with ov5647 using command
cam -c 1 -C -F cap

Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
---
 .../bindings/phy/rockchip-mipi-dphy-rx0.yaml  |  1 +
 .../phy-rockchip-dphy-rx0.c                   | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
index 5dacece35702..8927c36de532 100644
--- a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     const: rockchip,rk3399-mipi-dphy-rx0
+    const: rockchip,rk3288-mipi-dphy-rx0
 
   reg:
     maxItems: 1
diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c b/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
index 7c4df6d48c43..36fc1b1ee7ae 100644
--- a/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
@@ -26,6 +26,15 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#define RK3288_GRF_SOC_CON6     0x025c
+#define RK3288_GRF_SOC_CON8     0x0264
+#define RK3288_GRF_SOC_CON9     0x0268
+#define RK3288_GRF_SOC_CON10    0x026c
+#define RK3288_GRF_SOC_CON14    0x027c
+#define RK3288_GRF_SOC_STATUS21 0x02d4
+#define RK3288_GRF_IO_VSEL      0x0380
+#define RK3288_GRF_SOC_CON15    0x03a4
+
 #define RK3399_GRF_SOC_CON9		0x6224
 #define RK3399_GRF_SOC_CON21		0x6254
 #define RK3399_GRF_SOC_CON22		0x6258
@@ -47,6 +56,19 @@ struct hsfreq_range {
 	u8 cfg_bit;
 };
 
+static const struct hsfreq_range rk3288_mipidphy_hsfreq_ranges[] = {
+	{  89, 0x00}, {  99, 0x10}, { 109, 0x20}, { 129, 0x01},
+	{ 139, 0x11}, { 149, 0x21}, { 169, 0x02}, { 179, 0x12},
+	{ 199, 0x22}, { 219, 0x03}, { 239, 0x13}, { 249, 0x23},
+	{ 269, 0x04}, { 299, 0x14}, { 329, 0x05}, { 359, 0x15},
+	{ 399, 0x25}, { 449, 0x06}, { 499, 0x16}, { 549, 0x07},
+	{ 599, 0x17}, { 649, 0x08}, { 699, 0x18}, { 749, 0x09},
+	{ 799, 0x19}, { 849, 0x29}, { 899, 0x39}, { 949, 0x0a},
+	{ 999, 0x1a}, {1049, 0x2a}, {1099, 0x3a}, {1149, 0x0b},
+	{1199, 0x1b}, {1249, 0x2b}, {1299, 0x3b}, {1349, 0x0c},
+	{1399, 0x1c}, {1449, 0x2c}, {1500, 0x3c}
+};
+
 static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
 	{   89, 0x00 }, {   99, 0x10 }, {  109, 0x20 }, {  129, 0x01 },
 	{  139, 0x11 }, {  149, 0x21 }, {  169, 0x02 }, {  179, 0x12 },
@@ -60,6 +82,11 @@ static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
 	{ 1399, 0x1c }, { 1449, 0x2c }, { 1500, 0x3c }
 };
 
+static const char * const rk3288_mipidphy_clks[] = {
+	"dphy-ref",
+	"pclk",
+};
+
 static const char * const rk3399_mipidphy_clks[] = {
 	"dphy-ref",
 	"dphy-cfg",
@@ -109,6 +136,36 @@ struct dphy_reg {
 #define PHY_REG(_offset, _width, _shift) \
 	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
 
+static const struct dphy_reg rk3288_grf_dphy_regs[] = {
+	[GRF_CON_DISABLE_ISP] = PHY_REG(RK3288_GRF_SOC_CON6, 1, 0),
+	[GRF_CON_ISP_DPHY_SEL] = PHY_REG(RK3288_GRF_SOC_CON6, 1, 1),
+	[GRF_DSI_CSI_TESTBUS_SEL] = PHY_REG(RK3288_GRF_SOC_CON6, 1, 14),
+	[GRF_DPHY_TX0_TURNDISABLE] = PHY_REG(RK3288_GRF_SOC_CON8, 4, 0),
+	[GRF_DPHY_TX0_FORCERXMODE] = PHY_REG(RK3288_GRF_SOC_CON8, 4, 4),
+	[GRF_DPHY_TX0_FORCETXSTOPMODE] = PHY_REG(RK3288_GRF_SOC_CON8, 4, 8),
+	[GRF_DPHY_TX1RX1_TURNDISABLE] = PHY_REG(RK3288_GRF_SOC_CON9, 4, 0),
+	[GRF_DPHY_TX1RX1_FORCERXMODE] = PHY_REG(RK3288_GRF_SOC_CON9, 4, 4),
+	[GRF_DPHY_TX1RX1_FORCETXSTOPMODE] = PHY_REG(RK3288_GRF_SOC_CON9, 4, 8),
+	[GRF_DPHY_TX1RX1_ENABLE] = PHY_REG(RK3288_GRF_SOC_CON9, 4, 12),
+	[GRF_DPHY_RX0_TURNDISABLE] = PHY_REG(RK3288_GRF_SOC_CON10, 4, 0),
+	[GRF_DPHY_RX0_FORCERXMODE] = PHY_REG(RK3288_GRF_SOC_CON10, 4, 4),
+	[GRF_DPHY_RX0_FORCETXSTOPMODE] = PHY_REG(RK3288_GRF_SOC_CON10, 4, 8),
+	[GRF_DPHY_RX0_ENABLE] = PHY_REG(RK3288_GRF_SOC_CON10, 4, 12),
+	[GRF_DPHY_RX0_TESTCLR] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 0),
+	[GRF_DPHY_RX0_TESTCLK] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 1),
+	[GRF_DPHY_RX0_TESTEN] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 2),
+	[GRF_DPHY_RX0_TESTDIN] = PHY_REG(RK3288_GRF_SOC_CON14, 8, 3),
+	[GRF_DPHY_TX1RX1_ENABLECLK] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 12),
+	[GRF_DPHY_RX1_SRC_SEL] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 13),
+	[GRF_DPHY_TX1RX1_MASTERSLAVEZ] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 14),
+	[GRF_DPHY_TX1RX1_BASEDIR] = PHY_REG(RK3288_GRF_SOC_CON14, 1, 15),
+	[GRF_DPHY_RX0_TURNREQUEST] = PHY_REG(RK3288_GRF_SOC_CON15, 4, 0),
+	[GRF_DPHY_TX1RX1_TURNREQUEST] = PHY_REG(RK3288_GRF_SOC_CON15, 4, 4),
+	[GRF_DPHY_TX0_TURNREQUEST] = PHY_REG(RK3288_GRF_SOC_CON15, 3, 8),
+	[GRF_DVP_V18SEL] = PHY_REG(RK3288_GRF_IO_VSEL, 1, 1),
+	[GRF_DPHY_RX0_TESTDOUT] = PHY_REG(RK3288_GRF_SOC_STATUS21, 8, 0),
+};
+
 static const struct dphy_reg rk3399_grf_dphy_regs[] = {
 	[GRF_DPHY_RX0_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON9, 4, 0),
 	[GRF_DPHY_RX0_CLK_INV_SEL] = PHY_REG(RK3399_GRF_SOC_CON9, 1, 10),
@@ -303,6 +360,14 @@ static const struct phy_ops rk_dphy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct rk_dphy_drv_data rk3288_mipidphy_drv_data = {
+	.clks = rk3288_mipidphy_clks,
+	.num_clks = ARRAY_SIZE(rk3288_mipidphy_clks),
+	.hsfreq_ranges = rk3288_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk3288_mipidphy_hsfreq_ranges),
+	.regs = rk3288_grf_dphy_regs,
+};
+
 static const struct rk_dphy_drv_data rk3399_mipidphy_drv_data = {
 	.clks = rk3399_mipidphy_clks,
 	.num_clks = ARRAY_SIZE(rk3399_mipidphy_clks),
@@ -312,6 +377,10 @@ static const struct rk_dphy_drv_data rk3399_mipidphy_drv_data = {
 };
 
 static const struct of_device_id rk_dphy_dt_ids[] = {
+	{
+		.compatible = "rockchip,rk3288-mipi-dphy-rx0",
+		.data = &rk3288_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3399-mipi-dphy-rx0",
 		.data = &rk3399_mipidphy_drv_data,
-- 
2.17.1

