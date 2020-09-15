Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010B526A932
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 17:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgIOP4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 11:56:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:44828 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727533AbgIOP4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 11:56:18 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57341061"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Sep 2020 00:56:08 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5BEEF400F7C1;
        Wed, 16 Sep 2020 00:56:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
Date:   Tue, 15 Sep 2020 16:55:44 +0100
Message-Id: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the current implementation if invalid bus-type is passed via DT
v4l2_fwnode_endpoint_parse() defaulted the mus-type to V4L2_MBUS_PARALLEL
instead of returning error.

This Patch adds V4L2_MBUS_INVALID entry to v4l2_mbus_type enum and when
invalid bus-type is detected in v4l2_fwnode_endpoint_parse() it returns
-EINVAL to the caller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++++-
 include/media/v4l2-mediabus.h         | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index a4c3c77c1894..a6f3549eadd3 100644
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
index 45f88f0248c4..b4f630783cb7 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -78,6 +78,7 @@
  * @V4L2_MBUS_CCP2:	CCP2 (Compact Camera Port 2)
  * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
  * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
+ * @V4L2_MBUS_INVALID:	invalid bus type (keep it last for sanity)
  */
 enum v4l2_mbus_type {
 	V4L2_MBUS_UNKNOWN,
@@ -87,6 +88,7 @@ enum v4l2_mbus_type {
 	V4L2_MBUS_CCP2,
 	V4L2_MBUS_CSI2_DPHY,
 	V4L2_MBUS_CSI2_CPHY,
+	V4L2_MBUS_INVALID,
 };
 
 /**
-- 
2.17.1

