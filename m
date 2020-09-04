Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A068725E298
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgIDUSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6054 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726441AbgIDUSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:51 -0400
X-IronPort-AV: E=Sophos;i="5.76,391,1592838000"; 
   d="scan'208";a="56410437"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2020 05:18:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2FE08400C441;
        Sat,  5 Sep 2020 05:18:48 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 2/6] media: i2c: ov5640: Separate out mipi configuration from s_power
Date:   Fri,  4 Sep 2020 21:18:31 +0100
Message-Id: <20200904201835.5958-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for adding DVP configuration in s_power callback
move mipi configuration into separate function

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 116 +++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 880fde73a030..8af11d532699 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2014,6 +2014,61 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
 	clk_disable_unprepare(sensor->xclk);
 }
 
+static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
+{
+	int ret;
+
+	if (!on) {
+		/* Reset MIPI bus settings to their default values. */
+		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
+		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
+		return 0;
+	}
+
+	/*
+	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
+	 *
+	 * 0x300e = 0x40
+	 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
+	 *		  "ov5640_set_stream_mipi()")
+	 * [4] = 0	: Power up MIPI HS Tx
+	 * [3] = 0	: Power up MIPI LS Rx
+	 * [2] = 0	: MIPI interface disabled
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
+	if (ret)
+		return ret;
+
+	/*
+	 * Gate clock and set LP11 in 'no packets mode' (idle)
+	 *
+	 * 0x4800 = 0x24
+	 * [5] = 1	: Gate clock when 'no packets'
+	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set data lanes and clock in LP11 when 'sleeping'
+	 *
+	 * 0x3019 = 0x70
+	 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
+	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
+	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
+	if (ret)
+		return ret;
+
+	/* Give lanes some time to coax into LP11 state. */
+	usleep_range(500, 1000);
+
+	return 0;
+}
+
 static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 {
 	int ret = 0;
@@ -2026,67 +2081,16 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 		ret = ov5640_restore_mode(sensor);
 		if (ret)
 			goto power_off;
+	}
 
-		/* We're done here for DVP bus, while CSI-2 needs setup. */
-		if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
-			return 0;
-
-		/*
-		 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
-		 *
-		 * 0x300e = 0x40
-		 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
-		 *		  "ov5640_set_stream_mipi()")
-		 * [4] = 0	: Power up MIPI HS Tx
-		 * [3] = 0	: Power up MIPI LS Rx
-		 * [2] = 0	: MIPI interface disabled
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_IO_MIPI_CTRL00, 0x40);
-		if (ret)
-			goto power_off;
-
-		/*
-		 * Gate clock and set LP11 in 'no packets mode' (idle)
-		 *
-		 * 0x4800 = 0x24
-		 * [5] = 1	: Gate clock when 'no packets'
-		 * [2] = 1	: MIPI bus in LP11 when 'no packets'
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_MIPI_CTRL00, 0x24);
-		if (ret)
-			goto power_off;
-
-		/*
-		 * Set data lanes and clock in LP11 when 'sleeping'
-		 *
-		 * 0x3019 = 0x70
-		 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
-		 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
-		 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_PAD_OUTPUT00, 0x70);
+	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+		ret = ov5640_set_power_mipi(sensor, on);
 		if (ret)
 			goto power_off;
+	}
 
-		/* Give lanes some time to coax into LP11 state. */
-		usleep_range(500, 1000);
-
-	} else {
-		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
-			/* Reset MIPI bus settings to their default values. */
-			ov5640_write_reg(sensor,
-					 OV5640_REG_IO_MIPI_CTRL00, 0x58);
-			ov5640_write_reg(sensor,
-					 OV5640_REG_MIPI_CTRL00, 0x04);
-			ov5640_write_reg(sensor,
-					 OV5640_REG_PAD_OUTPUT00, 0x00);
-		}
-
+	if (!on)
 		ov5640_set_power_off(sensor);
-	}
 
 	return 0;
 
-- 
2.17.1

