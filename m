Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A40288C3B
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389201AbgJIPIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:08:00 -0400
Received: from retiisi.eu ([95.216.213.190]:51604 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388790AbgJIPH7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 11:07:59 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7CFD8634C8D;
        Fri,  9 Oct 2020 18:07:05 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 4/5] ipu3-cio2: Validate mbus format in setting subdev format
Date:   Fri,  9 Oct 2020 18:07:55 +0300
Message-Id: <20201009150756.3397-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Validate media bus code, width and height when setting the subdev format.

This effectively reworks how setting subdev format is implemented in the
driver.

Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 28 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 9c7b527a8800..9726091c9985 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1257,6 +1257,9 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
+	struct v4l2_mbus_framefmt *mbus;
+	u32 mbus_code = fmt->format.code;
+	unsigned int i;
 
 	/*
 	 * Only allow setting sink pad format;
@@ -1265,18 +1268,25 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->pad == CIO2_PAD_SOURCE)
 		return cio2_subdev_get_fmt(sd, cfg, fmt);
 
-	mutex_lock(&q->subdev_lock);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		mbus = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	else
+		mbus = &q->subdev_fmt;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
-	} else {
-		/* It's the sink, allow changing frame size */
-		q->subdev_fmt.width = fmt->format.width;
-		q->subdev_fmt.height = fmt->format.height;
-		q->subdev_fmt.code = fmt->format.code;
-		fmt->format = q->subdev_fmt;
+	fmt->format.code = formats[0].mbus_code;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].mbus_code == fmt->format.code) {
+			fmt->format.code = mbus_code;
+			break;
+		}
 	}
 
+	fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
+	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
+
+	mutex_lock(&q->subdev_lock);
+	*mbus = fmt->format;
 	mutex_unlock(&q->subdev_lock);
 
 	return 0;
-- 
2.27.0

