Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91B62680B4
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 20:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgIMSQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 14:16:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:26624 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725936AbgIMSQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 14:16:35 -0400
X-IronPort-AV: E=Sophos;i="5.76,422,1592838000"; 
   d="scan'208";a="56924689"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Sep 2020 03:16:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9401D40B5F11;
        Mon, 14 Sep 2020 03:16:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3] media: rcar-vin: Enable YDS bit depending on bus_width and data_shift
Date:   Sun, 13 Sep 2020 19:16:08 +0100
Message-Id: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
for MEDIA_BUS_FMT_UYVY8_2X8 format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes for v3:
* Dropped BIT macro
* Introduced struct v4l2_fwnode_bus_parallel

Changes for v2:
* Dropped DT binding documentation patch
* Select the data pins depending on bus-width and data-shift

v1 -
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
---
 drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
 drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
 drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27..1149ab76cf5c 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
 
 	switch (vin->parallel->mbus_type) {
 	case V4L2_MBUS_PARALLEL:
-		vin_dbg(vin, "Found PARALLEL media bus\n");
-		vin->parallel->mbus_flags = vep->bus.parallel.flags;
-		break;
 	case V4L2_MBUS_BT656:
-		vin_dbg(vin, "Found BT656 media bus\n");
-		vin->parallel->mbus_flags = 0;
+		vin_dbg(vin, "Found %s media bus\n",
+			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
+			"PARALLEL" : "BT656");
+		vin->parallel->bus = vep->bus.parallel;
 		break;
 	default:
 		vin_err(vin, "Unknown media bus type\n");
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index a5dbb90c5210..d067439b0b0d 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -125,6 +125,7 @@
 #define VNDMR2_VPS		(1 << 30)
 #define VNDMR2_HPS		(1 << 29)
 #define VNDMR2_CES		(1 << 28)
+#define VNDMR2_YDS		(1 << 22)
 #define VNDMR2_FTEV		(1 << 17)
 #define VNDMR2_VLV(n)		((n & 0xf) << 12)
 
@@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
 
 	if (!vin->is_csi) {
 		/* Hsync Signal Polarity Select */
-		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
+		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
 			dmr2 |= VNDMR2_HPS;
 
 		/* Vsync Signal Polarity Select */
-		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
+		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
 			dmr2 |= VNDMR2_VPS;
 
 		/* Data Enable Polarity Select */
-		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
+		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
 			dmr2 |= VNDMR2_CES;
+
+		switch (vin->mbus_code) {
+		case MEDIA_BUS_FMT_UYVY8_2X8:
+			if (vin->parallel->bus.bus_width == 8 &&
+			    vin->parallel->bus.data_shift == 8)
+				dmr2 |= VNDMR2_YDS;
+			break;
+		default:
+			break;
+		}
 	}
 
 	/*
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index c19d077ce1cb..8396e0e45478 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/videobuf2-v4l2.h>
 
 /* Number of HW buffers */
@@ -92,7 +93,7 @@ struct rvin_video_format {
  * @asd:	sub-device descriptor for async framework
  * @subdev:	subdevice matched using async framework
  * @mbus_type:	media bus type
- * @mbus_flags:	media bus configuration flags
+ * @bus:	media bus parallel configuration
  * @source_pad:	source pad of remote subdevice
  * @sink_pad:	sink pad of remote subdevice
  *
@@ -102,7 +103,7 @@ struct rvin_parallel_entity {
 	struct v4l2_subdev *subdev;
 
 	enum v4l2_mbus_type mbus_type;
-	unsigned int mbus_flags;
+	struct v4l2_fwnode_bus_parallel bus;
 
 	unsigned int source_pad;
 	unsigned int sink_pad;
-- 
2.17.1

