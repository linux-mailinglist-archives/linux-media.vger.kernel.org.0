Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C24E27ECA8
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgI3P3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbgI3P3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A23E6634CFA
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 087/100] ccs: Add support for obtaining C-PHY configuration from firmware
Date:   Wed, 30 Sep 2020 18:28:45 +0300
Message-Id: <20200930152858.8471-88-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Try parsing the firmware also as C-PHY. Do this only after D-PHY as older
firmware may not explicitly specify bus-type in which case D-PHY is the
default.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a6d5164be8a0..00a1ea46f25a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2917,6 +2917,11 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 			{ .bus_type = V4L2_MBUS_CCP2 };
 		rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	}
+	if (rval == -ENXIO) {
+		bus_cfg = (struct v4l2_fwnode_endpoint)
+			{ .bus_type = V4L2_MBUS_CSI2_CPHY };
+		rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	}
 	if (rval)
 		goto out_err;
 
@@ -2925,6 +2930,10 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
 		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 		break;
+	case V4L2_MBUS_CSI2_CPHY:
+		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_CPHY;
+		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+		break;
 	case V4L2_MBUS_CCP2:
 		hwcfg->csi_signalling_mode = (bus_cfg.bus.mipi_csi1.strobe) ?
 		SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE :
-- 
2.27.0

