Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5625285B27
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgJGIrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57056 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 67562634CCA
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 038/106] ccs: Replace somewhat harsh internal checks based on BUG with WARN_ON
Date:   Wed,  7 Oct 2020 11:44:51 +0300
Message-Id: <20201007084557.25843-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an internal driver error was encountered, BUG was issued. Instead, do
less harsh WARN_ON_ONCE and try to manage with the consequences.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d19267591d33..e01a5584b8b0 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -540,6 +540,10 @@ static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 		to_csi_format_idx(sensor->internal_csi_format) & ~3;
 	unsigned int pixel_order = ccs_pixel_order(sensor);
 
+	if (WARN_ON_ONCE(max(internal_csi_format_idx, csi_format_idx) +
+			 pixel_order >= ARRAY_SIZE(ccs_csi_data_formats)))
+		return;
+
 	sensor->mbus_frame_fmts =
 		sensor->default_mbus_frame_fmts << pixel_order;
 	sensor->csi_format =
@@ -548,9 +552,6 @@ static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 		&ccs_csi_data_formats[internal_csi_format_idx
 					 + pixel_order];
 
-	BUG_ON(max(internal_csi_format_idx, csi_format_idx) + pixel_order
-	       >= ARRAY_SIZE(ccs_csi_data_formats));
-
 	dev_dbg(&client->dev, "new pixel order %s\n",
 		pixel_order_str[pixel_order]);
 }
@@ -1800,7 +1801,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		*crops[CCS_PAD_SRC] = *comp;
 		break;
 	default:
-		BUG();
+		WARN_ON_ONCE(1);
 	}
 }
 
-- 
2.27.0

