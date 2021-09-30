Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DE641D626
	for <lists+linux-media@lfdr.de>; Thu, 30 Sep 2021 11:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349311AbhI3JWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Sep 2021 05:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349310AbhI3JWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Sep 2021 05:22:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8C0C06176A
        for <linux-media@vger.kernel.org>; Thu, 30 Sep 2021 02:20:28 -0700 (PDT)
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:bab4:22c5:662d:e478])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 878A218BF;
        Thu, 30 Sep 2021 11:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632993625;
        bh=aomcsFcMP7W6VnQi5ZUU4KsViC04MuTN2b3WQGMMl1E=;
        h=From:To:Cc:Subject:Date:From;
        b=Yk/pIygUlxQQot8oyKMF9BAlQwmxo7o+rUGBW9bOVpaWMWHpDCqk3pVkMFo/aQ2bx
         D5OUh+r2Tf9HvJUq2XJl2NRg+V0YT2KCbKB5U5Nd6Nug6XxJBKtNFnjiJqAj1L5vOf
         RIYQPtwZ2yib04jJVmh3C69RhGGIk1wWVMRetiUQ=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        laurent.pinchart@ideasonboard.com, tfiga@google.com,
        tian.shu.qiu@intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH] media: staging: ipu3-imgu: add the AWB memory layout
Date:   Thu, 30 Sep 2021 11:20:21 +0200
Message-Id: <20210930092021.65741-1-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While parsing the RAW AWB metadata, the AWB layout was missing to fully
understand which byte corresponds to which feature. Make the field names
and usage explicit, as it is used by the userspace applications.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 .../media/ipu3/include/uapi/intel-ipu3.h      | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index 585f55981c86..fdda9d0a30af 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -61,6 +61,29 @@ struct ipu3_uapi_grid_config {
 	__u16 y_end;
 } __packed;
 
+/**
+ * struct ipu3_uapi_awb_set_item - Memory layout for each cell in AWB
+ *
+ * @Gr_avg:	Green average for red lines in the cell.
+ * @R_avg:	Red average in the cell.
+ * @B_avg:	Blue average in the cell.
+ * @Gb_avg:	Green average for blue lines in the cell.
+ * @sat_ratio:  Saturation ratio in the cell.
+ * @padding0:   Unused byte for padding.
+ * @padding1:   Unused byte for padding.
+ * @padding2:   Unused byte for padding.
+ */
+struct ipu3_uapi_awb_set_item {
+	__u8 Gr_avg;
+	__u8 R_avg;
+	__u8 B_avg;
+	__u8 Gb_avg;
+	__u8 sat_ratio;
+	__u8 padding0;
+	__u8 padding1;
+	__u8 padding2;
+} __attribute__((packed));
+
 /*
  * The grid based data is divided into "slices" called set, each slice of setX
  * refers to ipu3_uapi_grid_config width * height_per_slice.
@@ -73,8 +96,9 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
 	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
 #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
-	(IPU3_UAPI_AWB_MAX_SETS * \
-	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
+	((IPU3_UAPI_AWB_MAX_SETS * \
+	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES)) / \
+	 sizeof(struct ipu3_uapi_awb_set_item))
 
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
@@ -83,7 +107,7 @@ struct ipu3_uapi_grid_config {
  *		the average values for each color channel.
  */
 struct ipu3_uapi_awb_raw_buffer {
-	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
+	struct ipu3_uapi_awb_set_item meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
 		__attribute__((aligned(32)));
 } __packed;
 
-- 
2.30.2

