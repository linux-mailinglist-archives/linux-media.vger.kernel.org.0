Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A24926E07A
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 18:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgIQQUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:20:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42560 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728397AbgIQQTO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:19:14 -0400
X-Greylist: delayed 417 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 12:18:49 EDT
X-IronPort-AV: E=Sophos;i="5.77,271,1596466800"; 
   d="scan'208";a="57331016"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2020 01:09:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A5394011AC1;
        Fri, 18 Sep 2020 01:09:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
Date:   Thu, 17 Sep 2020 17:08:47 +0100
Message-Id: <20200917160847.31936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return -EINVAL if invalid bus-type is detected while parsing endpoints.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Updated commit description
* Fixed nit pointed by Sakari

v1 - https://patchwork.kernel.org/patch/11777127/
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++++-
 include/media/v4l2-mediabus.h         | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index d7bbe33840cb..dfc53d11053f 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -93,7 +93,7 @@ v4l2_fwnode_bus_type_to_mbus(enum v4l2_fwnode_bus_type type)
 	const struct v4l2_fwnode_bus_conv *conv =
 		get_v4l2_fwnode_bus_conv_by_fwnode_bus(type);
 
-	return conv ? conv->mbus_type : V4L2_MBUS_UNKNOWN;
+	return conv ? conv->mbus_type : V4L2_MBUS_INVALID;
 }
 
 static const char *
@@ -436,6 +436,10 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 		 v4l2_fwnode_mbus_type_to_string(vep->bus_type),
 		 vep->bus_type);
 	mbus_type = v4l2_fwnode_bus_type_to_mbus(bus_type);
+	if (mbus_type == V4L2_MBUS_INVALID) {
+		pr_debug("unsupported bus type %u\n", bus_type);
+		return -EINVAL;
+	}
 
 	if (vep->bus_type != V4L2_MBUS_UNKNOWN) {
 		if (mbus_type != V4L2_MBUS_UNKNOWN &&
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 59b1de197114..c20e2dc6d432 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -103,6 +103,7 @@
  * @V4L2_MBUS_CCP2:	CCP2 (Compact Camera Port 2)
  * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
  * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
+ * @V4L2_MBUS_INVALID:	invalid bus type (keep as last)
  */
 enum v4l2_mbus_type {
 	V4L2_MBUS_UNKNOWN,
@@ -112,6 +113,7 @@ enum v4l2_mbus_type {
 	V4L2_MBUS_CCP2,
 	V4L2_MBUS_CSI2_DPHY,
 	V4L2_MBUS_CSI2_CPHY,
+	V4L2_MBUS_INVALID,
 };
 
 /**
-- 
2.17.1

