Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C6C28BF5C
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404141AbgJLSEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:04:30 -0400
Received: from retiisi.eu ([95.216.213.190]:45478 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404139AbgJLSE2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:04:28 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 53CB7634C89;
        Mon, 12 Oct 2020 21:03:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 1/8] ipu3-cio2: Return actual subdev format
Date:   Mon, 12 Oct 2020 21:04:07 +0300
Message-Id: <20201012180414.11579-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return actual subdev format on ipu3-cio2 subdev pads. The earlier
implementation was based on an infinite recursion that exhausted the
stack.

Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: stable@vger.kernel.org # v4.16 and up
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4e598e937dfe..afa472026ba4 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1232,29 +1232,11 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
-	struct v4l2_subdev_format format;
-	int ret;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
-		return 0;
-	}
-
-	if (fmt->pad == CIO2_PAD_SINK) {
-		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
-				       &format);
-
-		if (ret)
-			return ret;
-		/* update colorspace etc */
-		q->subdev_fmt.colorspace = format.format.colorspace;
-		q->subdev_fmt.ycbcr_enc = format.format.ycbcr_enc;
-		q->subdev_fmt.quantization = format.format.quantization;
-		q->subdev_fmt.xfer_func = format.format.xfer_func;
-	}
-
-	fmt->format = q->subdev_fmt;
+	else
+		fmt->format = q->subdev_fmt;
 
 	return 0;
 }
-- 
2.27.0

