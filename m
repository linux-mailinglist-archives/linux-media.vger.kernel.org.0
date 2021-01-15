Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DF52F85F3
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 21:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388548AbhAOUCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 15:02:51 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59217 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbhAOUCt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 15:02:49 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B95B51C000A;
        Fri, 15 Jan 2021 20:02:04 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v5 06/16] media: sun6i-csi: Only configure the interface data width for parallel
Date:   Fri, 15 Jan 2021 21:01:31 +0100
Message-Id: <20210115200141.1397785-7-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bits related to the interface data width are only applicable to the
parallel interface and are irrelevant when the CSI controller is taking
input from the MIPI CSI-2 controller.

In prevision of adding support for this case, set these bits
conditionally so there is no ambiguity. The conditional block is
moved around before the interlaced conditional block for nicer code
symmetry (conditional blocks first) while at it.

Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 42 +++++++++++--------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 1a11a6174a17..d06028f42534 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -378,8 +378,13 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 	unsigned char bus_width;
 	u32 flags;
 	u32 cfg;
+	bool input_parallel = false;
 	bool input_interlaced = false;
 
+	if (endpoint->bus_type == V4L2_MBUS_PARALLEL ||
+	    endpoint->bus_type == V4L2_MBUS_BT656)
+		input_parallel = true;
+
 	if (csi->config.field == V4L2_FIELD_INTERLACED
 	    || csi->config.field == V4L2_FIELD_INTERLACED_TB
 	    || csi->config.field == V4L2_FIELD_INTERLACED_BT)
@@ -395,6 +400,26 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 		 CSI_IF_CFG_HREF_POL_MASK | CSI_IF_CFG_FIELD_MASK |
 		 CSI_IF_CFG_SRC_TYPE_MASK);
 
+	if (input_parallel) {
+		switch (bus_width) {
+		case 8:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
+			break;
+		case 10:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
+			break;
+		case 12:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
+			break;
+		case 16: /* No need to configure DATA_WIDTH for 16bit */
+			break;
+		default:
+			dev_warn(sdev->dev, "Unsupported bus width: %u\n",
+				 bus_width);
+			break;
+		}
+	}
+
 	if (input_interlaced)
 		cfg |= CSI_IF_CFG_SRC_TYPE_INTERLACED;
 	else
@@ -440,23 +465,6 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 		break;
 	}
 
-	switch (bus_width) {
-	case 8:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
-		break;
-	case 10:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
-		break;
-	case 12:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
-		break;
-	case 16: /* No need to configure DATA_WIDTH for 16bit */
-		break;
-	default:
-		dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
-		break;
-	}
-
 	regmap_write(sdev->regmap, CSI_IF_CFG_REG, cfg);
 }
 
-- 
2.30.0

