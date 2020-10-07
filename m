Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA6B285AEC
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgJGIqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57060 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgJGIqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:17 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 96B52634CA4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 093/106] ccs: Add support for obtaining C-PHY configuration from firmware
Date:   Wed,  7 Oct 2020 11:45:44 +0300
Message-Id: <20201007084557.25843-84-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7a6338a2db4c..d1a9a28f29ae 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2926,6 +2926,10 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
 		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 		break;
+	case V4L2_MBUS_CSI2_CPHY:
+		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_CPHY;
+		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+		break;
 	case V4L2_MBUS_CSI1:
 	case V4L2_MBUS_CCP2:
 		hwcfg->csi_signalling_mode = (bus_cfg.bus.mipi_csi1.strobe) ?
-- 
2.27.0

