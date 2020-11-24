Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFB62C21C7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731537AbgKXJiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:50 -0500
Received: from retiisi.eu ([95.216.213.190]:45012 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731483AbgKXJic (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:32 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6D6C4634C91;
        Tue, 24 Nov 2020 11:37:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 07/30] ccs: Fix obtaining bus information from firmware
Date:   Tue, 24 Nov 2020 11:32:03 +0200
Message-Id: <20201124093226.23737-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index dcc71c8fe075..6fb546ca08f3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2853,7 +2853,7 @@ static int __maybe_unused ccs_resume(struct device *dev)
 static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 {
 	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
-	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
+	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 rotation;
@@ -2864,13 +2864,11 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
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
 
@@ -2879,6 +2877,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
 		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 		break;
+	case V4L2_MBUS_CSI1:
 	case V4L2_MBUS_CCP2:
 		hwcfg->csi_signalling_mode = (bus_cfg.bus.mipi_csi1.strobe) ?
 		SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE :
-- 
2.27.0

