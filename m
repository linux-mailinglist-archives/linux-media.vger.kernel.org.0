Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A102976AC
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754316AbgJWSLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:11:14 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51848 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754311AbgJWSLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:11:13 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 8F9D23B056D;
        Fri, 23 Oct 2020 17:46:36 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2E9101BF203;
        Fri, 23 Oct 2020 17:46:13 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: [PATCH 01/14] phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
Date:   Fri, 23 Oct 2020 19:45:33 +0200
Message-Id: <20201023174546.504028-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As some D-PHY controllers support both Rx and Tx mode, we need a way for
users to explicitly request one or the other. For instance, Rx mode can
be used along with MIPI CSI-2 while Tx mode can be used with MIPI DSI.

Introduce new MIPI D-PHY PHY submodes to use with PHY_MODE_MIPI_DPHY.
The default (zero value) is kept to Tx so only the rkisp1 driver, which
uses D-PHY in Rx mode, needs to be adapted.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/rkisp1/rkisp1-isp.c |  3 ++-
 include/linux/phy/phy-mipi-dphy.h         | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 6ec1e9816e9f..0afbce00121e 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -902,7 +902,8 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
 
 	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
 					 sensor->lanes, cfg);
-	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
+	phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
+			 PHY_MIPI_DPHY_SUBMODE_RX);
 	phy_configure(sensor->dphy, &opts);
 	phy_power_on(sensor->dphy);
 
diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
index a877ffee845d..0f57ef46a8b5 100644
--- a/include/linux/phy/phy-mipi-dphy.h
+++ b/include/linux/phy/phy-mipi-dphy.h
@@ -6,6 +6,19 @@
 #ifndef __PHY_MIPI_DPHY_H_
 #define __PHY_MIPI_DPHY_H_
 
+/**
+ * enum phy_mipi_dphy_submode - MIPI D-PHY sub-mode
+ *
+ * A MIPI D-PHY can be used to transmit or receive data.
+ * Since some controllers can support both, the direction to enable is specified
+ * with the PHY sub-mode. Transmit is assumed by default with phy_set_mode.
+ */
+
+enum phy_mipi_dphy_submode {
+	PHY_MIPI_DPHY_SUBMODE_TX = 0,
+	PHY_MIPI_DPHY_SUBMODE_RX,
+};
+
 /**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
-- 
2.28.0

