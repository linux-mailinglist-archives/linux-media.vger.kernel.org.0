Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08E0285AD9
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgJGIqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:07 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57072 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D33B1634CBD
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 032/106] ccs: Fix obtaining bus information from firmware
Date:   Wed,  7 Oct 2020 11:44:45 +0300
Message-Id: <20201007084557.25843-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let v4l2_fwnode_endpoint_alloc_parse to figure out the type of the data
bus. As the old bindings did not require the "bus-type" property, we need
to rely on guessing between CSI-2 D-PHY and CCP2. Setting the type to
CSI-2 D-PHY will parse just that and succeed even if no data-lanes are
set.

Also add a comment on the matter to the driver to avoid breaking this in
the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 811f738f23aa..19ff15eda246 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2847,7 +2847,7 @@ static int __maybe_unused ccs_resume(struct device *dev)
 static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 {
 	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
-	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
+	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 rotation;
@@ -2858,13 +2858,11 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	if (!ep)
 		return -ENODEV;
 
-	bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
+	/*
+	 * Note that we do need to rely on detecting the bus type between CSI-2
+	 * D-PHY and CCP2 as the old bindings did not require it.
+	 */
 	rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	if (rval == -ENXIO) {
-		bus_cfg = (struct v4l2_fwnode_endpoint)
-			{ .bus_type = V4L2_MBUS_CCP2 };
-		rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	}
 	if (rval)
 		goto out_err;
 
@@ -2873,6 +2871,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
 		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 		break;
+	case V4L2_MBUS_CSI1:
 	case V4L2_MBUS_CCP2:
 		hwcfg->csi_signalling_mode = (bus_cfg.bus.mipi_csi1.strobe) ?
 		SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE :
-- 
2.27.0

