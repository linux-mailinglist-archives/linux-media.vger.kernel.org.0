Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47EAC4A74BD
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 16:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbiBBPhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 10:37:43 -0500
Received: from retiisi.eu ([95.216.213.190]:43488 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbiBBPhm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 10:37:42 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8D38F634C90;
        Wed,  2 Feb 2022 17:37:41 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Date:   Wed,  2 Feb 2022 17:36:09 +0200
Message-Id: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As part of removing mbus config flags, remove VC flag use in the
microchip-csi2dc driver. The support can be reintroduced later on as part
of the streams patches.

Cc: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/atmel/microchip-csi2dc.c    | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
index 6bc549c28e05..6a7f5b4b0e3b 100644
--- a/drivers/media/platform/atmel/microchip-csi2dc.c
+++ b/drivers/media/platform/atmel/microchip-csi2dc.c
@@ -348,24 +348,15 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
 	if (ret == -ENOIOCTLCMD) {
 		dev_dbg(csi2dc->dev,
 			"no remote mbus configuration available\n");
-		goto csi2dc_get_mbus_config_defaults;
+		return 0;
 	}
 
 	if (ret) {
 		dev_err(csi2dc->dev,
 			"failed to get remote mbus configuration\n");
-		goto csi2dc_get_mbus_config_defaults;
+		return 0;
 	}
 
-	if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
-		csi2dc->vc = 0;
-	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
-		csi2dc->vc = 1;
-	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
-		csi2dc->vc = 2;
-	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
-		csi2dc->vc = 3;
-
 	dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
 
 	csi2dc->clk_gated = mbus_config.flags &
@@ -375,11 +366,6 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
 		csi2dc->clk_gated ? "gated" : "free running");
 
 	return 0;
-
-csi2dc_get_mbus_config_defaults:
-	csi2dc->vc = 0; /* Virtual ID 0 by default */
-
-	return 0;
 }
 
 static void csi2dc_vp_update(struct csi2dc_device *csi2dc)
-- 
2.30.2

