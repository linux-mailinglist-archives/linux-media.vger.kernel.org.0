Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D4D423196
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 22:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbhJEUWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 16:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbhJEUWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 16:22:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDBAC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 13:20:43 -0700 (PDT)
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:87c1:5a4a:3543:636a])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D32D825B;
        Tue,  5 Oct 2021 22:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633465240;
        bh=eOPYWy7yDy5XaWj7tkWiVkHMDyPflrPLpIZ+fMc2XVY=;
        h=From:To:Cc:Subject:Date:From;
        b=Vrm8utqD/HmC5hPaa2p60E09ihUtyPWK9e1HsAjlicHnx+mjJx27/GfpVeuNrBjP1
         jbe23H4qHxukqccyRZ5e6zv4MwylXeDZQsv0zpUX9hQs15GbmRtD9h/GD9Z6wWXmYs
         hgkjdG9ce1ZxwkgAFIiY7zmrB26hzRrtx+lR1Rvk=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        laurent.pinchart@ideasonboard.com, tfiga@google.com,
        tian.shu.qiu@intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory layout
Date:   Tue,  5 Oct 2021 22:20:19 +0200
Message-Id: <20211005202019.253353-1-jeanmichel.hautbois@ideasonboard.com>
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
 .../media/ipu3/include/uapi/intel-ipu3.h      | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index 585f55981c86..ad116a912e44 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -61,17 +61,39 @@ struct ipu3_uapi_grid_config {
 	__u16 y_end;
 } __packed;
 
+/**
+ * struct ipu3_uapi_awb_set_item - Memory layout for each cell in AWB
+ *
+ * @Gr_avg:	Green average for red lines in the cell.
+ * @R_avg:	Red average in the cell.
+ * @B_avg:	Blue average in the cell.
+ * @Gb_avg:	Green average for blue lines in the cell.
+ * @sat_ratio:  Percentage of pixels over a given threshold set in
+ * 		ipu3_uapi_awb_config_s, coded from 0 to 255.
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
  */
 #define IPU3_UAPI_AWB_MAX_SETS				60
 /* Based on grid size 80 * 60 and cell size 16 x 16 */
-#define IPU3_UAPI_AWB_SET_SIZE				1280
-#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
+#define IPU3_UAPI_AWB_SET_SIZE				160
 #define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
-	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
-	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
+	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
 #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
@@ -83,7 +105,7 @@ struct ipu3_uapi_grid_config {
  *		the average values for each color channel.
  */
 struct ipu3_uapi_awb_raw_buffer {
-	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
+	struct ipu3_uapi_awb_set_item meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
 		__attribute__((aligned(32)));
 } __packed;
 
-- 
2.30.2

