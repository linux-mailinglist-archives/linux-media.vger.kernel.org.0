Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C895287D67
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 22:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbgJHUru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 16:47:50 -0400
Received: from retiisi.eu ([95.216.213.190]:43990 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730675AbgJHUru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 16:47:50 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F2B0A634C8C;
        Thu,  8 Oct 2020 23:46:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 3/3] ipu3-cio2: Only allow setting valid mbus codes
Date:   Thu,  8 Oct 2020 23:47:47 +0300
Message-Id: <20201008204747.26320-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check the mbus code provided by the user is one of those the driver
supports. Ignore the code in set_fmt otherwise.

Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 9c7b527a8800..2ea6313e00b0 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1270,10 +1270,17 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
 	} else {
+		unsigned int i;
+
 		/* It's the sink, allow changing frame size */
 		q->subdev_fmt.width = fmt->format.width;
 		q->subdev_fmt.height = fmt->format.height;
-		q->subdev_fmt.code = fmt->format.code;
+		for (i = 0; i < ARRAY_SIZE(formats); i++) {
+			if (formats[i].mbus_code == fmt->format.code) {
+				q->subdev_fmt.code = fmt->format.code;
+				break;
+			}
+		}
 		fmt->format = q->subdev_fmt;
 	}
 
-- 
2.27.0

