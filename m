Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F672DD6DC
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgLQSHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgLQSHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:07:48 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8F6C061794
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 10:06:03 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 93C9C634C87
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 20:05:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] v4l: common: Fix naming of v4l2_get_link_rate
Date:   Thu, 17 Dec 2020 19:59:27 +0200
Message-Id: <20201217175927.26078-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename v4l2_get_link_rate() as v4l2_get_link_freq(). What the function
returns is the frequency of the link; rename it to reflect the name of the
control where the information is obtained.

Fixes: 1b888b3cebef ("media: v4l: Add a helper for obtaining the link frequency")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 drivers/media/v4l2-core/v4l2-common.c    | 4 ++--
 include/media/v4l2-common.h              | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 36e354ecf71e..6cada8a6e50c 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -302,7 +302,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 	if (!q->sensor)
 		return -ENODEV;
 
-	freq = v4l2_get_link_rate(q->sensor->ctrl_handler, bpp, lanes);
+	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes);
 	if (freq < 0) {
 		dev_err(dev, "error %lld, invalid link_freq\n", freq);
 		return freq;
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 78007dba4677..133d20e40f82 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -442,7 +442,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
 
-s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul,
+s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 		       unsigned int div)
 {
 	struct v4l2_ctrl *ctrl;
@@ -473,4 +473,4 @@ s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 	return freq > 0 ? freq : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(v4l2_get_link_rate);
+EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index be36cbdcc1bd..3eb202259e8c 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -520,7 +520,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 
 /**
- * v4l2_get_link_rate - Get link rate from transmitter
+ * v4l2_get_link_freq - Get link rate from transmitter
  *
  * @handler: The transmitter's control handler
  * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
@@ -537,7 +537,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  *	-ENOENT: Link frequency or pixel rate control not found
  *	-EINVAL: Invalid link frequency value
  */
-s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul,
+s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 		       unsigned int div);
 
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
-- 
2.29.2

