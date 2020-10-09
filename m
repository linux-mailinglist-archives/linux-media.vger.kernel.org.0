Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFAC288C36
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389180AbgJIPH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389124AbgJIPH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:07:58 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F80C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 08:07:58 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 44515634C89;
        Fri,  9 Oct 2020 18:07:05 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/5] ipu3-cio2: Return actual subdev format
Date:   Fri,  9 Oct 2020 18:07:52 +0300
Message-Id: <20201009150756.3397-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
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

