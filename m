Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AD428BF5F
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404174AbgJLSEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404156AbgJLSEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:04:44 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5024EC0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:04:44 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id DAB52634C8C;
        Mon, 12 Oct 2020 21:03:35 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 7/8] ipu3-cio2: Rename CIO2_IMAGE_MAX_LENGTH as CIO2_IMAGE_MAX_HEIGHT
Date:   Mon, 12 Oct 2020 21:04:13 +0300
Message-Id: <20201012180414.11579-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CIO2_IMAGE_MAX_LENGTH is the maximum width of the image. Rename it as
"CIO2_IMAGE_MAX_HEIGHT" in order to better describe what it is.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 6 +++---
 drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index e42177f8c426..d9baa8bfe54f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1094,8 +1094,8 @@ static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	/* Only supports up to 4224x3136 */
 	if (mpix->width > CIO2_IMAGE_MAX_WIDTH)
 		mpix->width = CIO2_IMAGE_MAX_WIDTH;
-	if (mpix->height > CIO2_IMAGE_MAX_LENGTH)
-		mpix->height = CIO2_IMAGE_MAX_LENGTH;
+	if (mpix->height > CIO2_IMAGE_MAX_HEIGHT)
+		mpix->height = CIO2_IMAGE_MAX_HEIGHT;
 
 	mpix->num_planes = 1;
 	mpix->pixelformat = fmt->fourcc;
@@ -1283,7 +1283,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
-	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
+	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_HEIGHT);
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	mutex_lock(&q->subdev_lock);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 7650d7998a3f..ccf0b85ae36f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -14,7 +14,7 @@
 #define CIO2_DMA_MASK					DMA_BIT_MASK(39)
 
 #define CIO2_IMAGE_MAX_WIDTH				4224U
-#define CIO2_IMAGE_MAX_LENGTH				3136U
+#define CIO2_IMAGE_MAX_HEIGHT				3136U
 
 /* 32MB = 8xFBPT_entry */
 #define CIO2_MAX_LOPS					8
-- 
2.27.0

