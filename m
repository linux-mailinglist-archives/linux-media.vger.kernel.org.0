Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AD640EA36
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 20:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242871AbhIPSs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 14:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347993AbhIPSss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 14:48:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1B1C08EAC1
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 10:25:19 -0700 (PDT)
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:83cf:f045:9f9f:a85e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DDC02A5;
        Thu, 16 Sep 2021 19:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631813116;
        bh=g053aPWC6KethM95zWMEmpRemfkbprMU9HvC/pomOcU=;
        h=From:To:Cc:Subject:Date:From;
        b=o+06QvJDcbHRRScbmlQP8ps/yYpmEHdC2MEPjWtfAILSEo2OpFvAcU4lVizc2vhjp
         stqFL9b5vw6hf+NJkZKAF8kd+R5OILmF/89ovlgSiNImKYlKaLxQlzyw/RMOHESKqV
         sW/wuYFVq6vo3AHfk+4XGApWCot/+foIXv7IxOGM=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        laurent.pinchart@ideasonboard.com, tfiga@google.com,
        tian.shu.qiu@intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice in the stripes
Date:   Thu, 16 Sep 2021 19:25:04 +0200
Message-Id: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While playing with low resolutions for the grid, it appeared that
height_per_slice is not initialised if we are not using both stripes for
the calculations. This pattern occurs three times:
- for the awb_fr processing block
- for the af processing block
- for the awb processing block

The idea of this small portion of code is to reduce complexity in
loading the statistics, it could be done also when only one stripe is
used. Fix it by getting this initialisation code outside of the else()
test case.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 44 ++++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index e9d6bd9e9332..05da7dbdca78 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -2428,16 +2428,16 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 					acc->awb_fr.stripes[1].grid_cfg.width,
 					b_w_log2);
 		acc->awb_fr.stripes[1].grid_cfg.x_end = end;
-
-		/*
-		 * To reduce complexity of debubbling and loading
-		 * statistics fix grid_height_per_slice to 1 for both
-		 * stripes.
-		 */
-		for (i = 0; i < stripes; i++)
-			acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
 	}
 
+	/*
+	 * To reduce complexity of debubbling and loading
+	 * statistics fix grid_height_per_slice to 1 for both
+	 * stripes.
+	 */
+	for (i = 0; i < stripes; i++)
+		acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
+
 	if (imgu_css_awb_fr_ops_calc(css, pipe, &acc->awb_fr))
 		return -EINVAL;
 
@@ -2591,15 +2591,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 			imgu_css_grid_end(acc->af.stripes[1].grid_cfg.x_start,
 					  acc->af.stripes[1].grid_cfg.width,
 					  b_w_log2);
-
-		/*
-		 * To reduce complexity of debubbling and loading statistics
-		 * fix grid_height_per_slice to 1 for both stripes
-		 */
-		for (i = 0; i < stripes; i++)
-			acc->af.stripes[i].grid_cfg.height_per_slice = 1;
 	}
 
+	/*
+	 * To reduce complexity of debubbling and loading statistics
+	 * fix grid_height_per_slice to 1 for both stripes
+	 */
+	for (i = 0; i < stripes; i++)
+		acc->af.stripes[i].grid_cfg.height_per_slice = 1;
+
 	if (imgu_css_af_ops_calc(css, pipe, &acc->af))
 		return -EINVAL;
 
@@ -2660,15 +2660,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
 					  acc->awb.stripes[1].grid.width,
 					  b_w_log2);
-
-		/*
-		 * To reduce complexity of debubbling and loading statistics
-		 * fix grid_height_per_slice to 1 for both stripes
-		 */
-		for (i = 0; i < stripes; i++)
-			acc->awb.stripes[i].grid.height_per_slice = 1;
 	}
 
+	/*
+	 * To reduce complexity of debubbling and loading statistics
+	 * fix grid_height_per_slice to 1 for both stripes
+	 */
+	for (i = 0; i < stripes; i++)
+		acc->awb.stripes[i].grid.height_per_slice = 1;
+
 	if (imgu_css_awb_ops_calc(css, pipe, &acc->awb))
 		return -EINVAL;
 
-- 
2.30.2

