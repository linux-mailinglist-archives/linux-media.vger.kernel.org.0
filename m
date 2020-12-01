Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C972CA8B6
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403777AbgLAQtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388682AbgLAQtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 11:49:42 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC92C0617A6
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 08:48:02 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5A6D2634C97;
        Tue,  1 Dec 2020 18:45:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 13/30] ccs: Replace somewhat harsh internal checks based on BUG with WARN_ON
Date:   Tue,  1 Dec 2020 18:42:29 +0200
Message-Id: <20201201164246.18003-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
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
index 25b4c84524ff..70b4d2180971 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -546,6 +546,10 @@ static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 		to_csi_format_idx(sensor->internal_csi_format) & ~3;
 	unsigned int pixel_order = ccs_pixel_order(sensor);
 
+	if (WARN_ON_ONCE(max(internal_csi_format_idx, csi_format_idx) +
+			 pixel_order >= ARRAY_SIZE(ccs_csi_data_formats)))
+		return;
+
 	sensor->mbus_frame_fmts =
 		sensor->default_mbus_frame_fmts << pixel_order;
 	sensor->csi_format =
@@ -554,9 +558,6 @@ static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 		&ccs_csi_data_formats[internal_csi_format_idx
 					 + pixel_order];
 
-	BUG_ON(max(internal_csi_format_idx, csi_format_idx) + pixel_order
-	       >= ARRAY_SIZE(ccs_csi_data_formats));
-
 	dev_dbg(&client->dev, "new pixel order %s\n",
 		pixel_order_str[pixel_order]);
 }
@@ -1806,7 +1807,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		*crops[CCS_PAD_SRC] = *comp;
 		break;
 	default:
-		BUG();
+		WARN_ON_ONCE(1);
 	}
 }
 
-- 
2.27.0

