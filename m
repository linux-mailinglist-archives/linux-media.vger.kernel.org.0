Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0443B36D1
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhFXTYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:24:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47920 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhFXTYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:24:46 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMOSP089352;
        Thu, 24 Jun 2021 14:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562544;
        bh=vGRXhM54uyY710uCaO6wJ9lMJ1bbMGIRaxUAqx8uXVY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GX1MZFgFpZJetaUpsOa8F7DIuYmZYvCf3QJ8rOVKJoFK+DOtjmCdqdcnOd6YbMvnM
         3gBjUgIeyFj93JPHQozyd4EpbCABrdrQs9Ho9fJjM1aMntfSUSWfEHrKM6N75KsV/+
         wnBXTShFP+27oqfyR4yHPo2LR5OmQKrQ+ZJWoxfs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMOdJ086061
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:24 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14J120548;
        Thu, 24 Jun 2021 14:22:22 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 03/11] media: cadence: csi2rx: Add external DPHY support
Date:   Fri, 25 Jun 2021 00:51:52 +0530
Message-ID: <20210624192200.22559-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624192200.22559-1-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some platforms like TI's J721E can have the CSI2RX paired with an
external DPHY. Add support to enable and configure the DPHY using the
generic PHY framework.

Get the pixel rate and bpp from the subdev and pass them on to the DPHY
along with the number of lanes. All other settings are left to their
default values.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v3:
- Use v4l2_get_link_freq() to calculate pixel clock.

Changes in v2:
- Use phy_pm_runtime_get_sync() and phy_pm_runtime_put() before making
  calls to set PHY mode, etc. to make sure it is ready.

 drivers/media/platform/cadence/cdns-csi2rx.c | 148 +++++++++++++++++--
 1 file changed, 138 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index bf2e024d73c5..d86be917135b 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -30,6 +30,12 @@
 #define CSI2RX_STATIC_CFG_DLANE_MAP(llane, plane)	((plane) << (16 + (llane) * 4))
 #define CSI2RX_STATIC_CFG_LANES_MASK			GENMASK(11, 8)
 
+#define CSI2RX_DPHY_LANE_CTRL_REG		0x40
+#define CSI2RX_DPHY_CL_RST			BIT(16)
+#define CSI2RX_DPHY_DL_RST(i)			BIT((i) + 12)
+#define CSI2RX_DPHY_CL_EN			BIT(4)
+#define CSI2RX_DPHY_DL_EN(i)			BIT(i)
+
 #define CSI2RX_STREAM_BASE(n)		(((n) + 1) * 0x100)
 
 #define CSI2RX_STREAM_CTRL_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x000)
@@ -54,6 +60,11 @@ enum csi2rx_pads {
 	CSI2RX_PAD_MAX,
 };
 
+struct csi2rx_fmt {
+	u32				code;
+	u8				bpp;
+};
+
 struct csi2rx_priv {
 	struct device			*dev;
 	unsigned int			count;
@@ -85,6 +96,37 @@ struct csi2rx_priv {
 	int				source_pad;
 };
 
+static const struct csi2rx_fmt formats[] = {
+	{
+		.code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.bpp	= 16,
+	},
+	{
+		.code	= MEDIA_BUS_FMT_UYVY8_2X8,
+		.bpp	= 16,
+	},
+	{
+		.code	= MEDIA_BUS_FMT_YVYU8_2X8,
+		.bpp	= 16,
+	},
+	{
+		.code	= MEDIA_BUS_FMT_VYUY8_2X8,
+		.bpp	= 16,
+	},
+};
+
+static u8 csi2rx_get_bpp(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].code == code)
+			return formats[i].bpp;
+	}
+
+	return 0;
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -101,6 +143,71 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
 }
 
+static int csi2rx_configure_external_dphy(struct csi2rx_priv *csi2rx)
+{
+	union phy_configure_opts opts = { };
+	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+	struct v4l2_subdev_format sd_fmt;
+	s64 pixel_clock;
+	int ret;
+	u8 bpp;
+	bool got_pm = true;
+
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = 0;
+
+	ret = v4l2_subdev_call(csi2rx->source_subdev, pad, get_fmt, NULL,
+			       &sd_fmt);
+	if (ret)
+		return ret;
+
+	bpp = csi2rx_get_bpp(sd_fmt.format.code);
+	if (!bpp)
+		return -EINVAL;
+
+	/*
+	 * Do not divide by the number of lanes here. That will be done by
+	 * phy_mipi_dphy_get_default_config().
+	 */
+	pixel_clock = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
+					 1, 2);
+	if (pixel_clock < 0)
+		return pixel_clock;
+
+	ret = phy_mipi_dphy_get_default_config(pixel_clock, bpp,
+					       csi2rx->num_lanes, cfg);
+	if (ret)
+		return ret;
+
+	ret = phy_pm_runtime_get_sync(csi2rx->dphy);
+	if (ret == -ENOTSUPP)
+		got_pm = false;
+	else if (ret)
+		return ret;
+
+	ret = phy_set_mode_ext(csi2rx->dphy, PHY_MODE_MIPI_DPHY,
+			       PHY_MIPI_DPHY_SUBMODE_RX);
+	if (ret)
+		goto out;
+
+	ret = phy_power_on(csi2rx->dphy);
+	if (ret)
+		goto out;
+
+	ret = phy_configure(csi2rx->dphy, &opts);
+	if (ret) {
+		/* Can't do anything if it fails. Ignore the return value. */
+		phy_power_off(csi2rx->dphy);
+		goto out;
+	}
+
+out:
+	if (got_pm)
+		phy_pm_runtime_put(csi2rx->dphy);
+
+	return ret;
+}
+
 static int csi2rx_start(struct csi2rx_priv *csi2rx)
 {
 	unsigned int i;
@@ -139,6 +246,17 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	if (ret)
 		goto err_disable_pclk;
 
+	/* Enable DPHY clk and data lanes. */
+	if (csi2rx->dphy) {
+		reg = CSI2RX_DPHY_CL_EN | CSI2RX_DPHY_CL_RST;
+		for (i = 0; i < csi2rx->num_lanes; i++) {
+			reg |= CSI2RX_DPHY_DL_EN(csi2rx->lanes[i] - 1);
+			reg |= CSI2RX_DPHY_DL_RST(csi2rx->lanes[i] - 1);
+		}
+
+		writel(reg, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
+	}
+
 	/*
 	 * Create a static mapping between the CSI virtual channels
 	 * and the output stream.
@@ -169,10 +287,21 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	if (ret)
 		goto err_disable_pixclk;
 
+	if (csi2rx->dphy) {
+		ret = csi2rx_configure_external_dphy(csi2rx);
+		if (ret) {
+			dev_err(csi2rx->dev,
+				"Failed to configure external DPHY: %d\n", ret);
+			goto err_disable_sysclk;
+		}
+	}
+
 	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
 
+err_disable_sysclk:
+	clk_disable_unprepare(csi2rx->sys_clk);
 err_disable_pixclk:
 	for (; i > 0; i--)
 		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
@@ -200,6 +329,13 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 
 	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
 		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
+
+	if (csi2rx->dphy) {
+		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
+
+		if (phy_power_off(csi2rx->dphy))
+			dev_warn(csi2rx->dev, "Couldn't power off DPHY\n");
+	}
 }
 
 static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
@@ -307,15 +443,6 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 		return PTR_ERR(csi2rx->dphy);
 	}
 
-	/*
-	 * FIXME: Once we'll have external D-PHY support, the check
-	 * will need to be removed.
-	 */
-	if (csi2rx->dphy) {
-		dev_err(&pdev->dev, "External D-PHY not supported yet\n");
-		return -EINVAL;
-	}
-
 	ret = clk_prepare_enable(csi2rx->p_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare and enable P clock\n");
@@ -345,7 +472,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 	 * FIXME: Once we'll have internal D-PHY support, the check
 	 * will need to be removed.
 	 */
-	if (csi2rx->has_internal_dphy) {
+	if (!csi2rx->dphy && csi2rx->has_internal_dphy) {
 		dev_err(&pdev->dev, "Internal D-PHY not supported yet\n");
 		return -EINVAL;
 	}
@@ -466,6 +593,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev,
 		 "Probed CSI2RX with %u/%u lanes, %u streams, %s D-PHY\n",
 		 csi2rx->num_lanes, csi2rx->max_lanes, csi2rx->max_streams,
+		 csi2rx->dphy ? "external" :
 		 csi2rx->has_internal_dphy ? "internal" : "no");
 
 	return 0;
-- 
2.30.0

