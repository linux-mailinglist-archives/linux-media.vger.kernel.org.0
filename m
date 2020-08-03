Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7861423AA16
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 18:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgHCQDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 12:03:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40157 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726457AbgHCQDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 12:03:04 -0400
X-IronPort-AV: E=Sophos;i="5.75,430,1589209200"; 
   d="scan'208";a="53754805"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2020 01:03:02 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2643040062DB;
        Tue,  4 Aug 2020 01:03:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] media: rcar-vin: Add support to select data pins for YCbCr422-8bit input
Date:   Mon,  3 Aug 2020 17:02:53 +0100
Message-Id: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Select the data pins for YCbCr422-8bit input format depending on
bus_width and data_shift passed as part of DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes for v2:
* Dropped DT binding documentation patch
* Select the data pins depending on bus-width and data-shift

v1 -
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
---
 drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27..55005d86928d 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
 	vin->parallel = rvpe;
 	vin->parallel->mbus_type = vep->bus_type;
 
+	/* select VInDATA[15:8] pins for YCbCr422-8bit format */
+	if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
+	    vep->bus.parallel.data_shift == DATA_SHIFT_8)
+		vin->parallel->ycbcr_8b_g = true;
+
 	switch (vin->parallel->mbus_type) {
 	case V4L2_MBUS_PARALLEL:
 		vin_dbg(vin, "Found PARALLEL media bus\n");
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..5db483877d65 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -127,6 +127,8 @@
 #define VNDMR2_FTEV		(1 << 17)
 #define VNDMR2_VLV(n)		((n & 0xf) << 12)
 
+#define VNDMR2_YDS		BIT(22)
+
 /* Video n CSI2 Interface Mode Register (Gen3) */
 #define VNCSI_IFMD_DES1		(1 << 26)
 #define VNCSI_IFMD_DES0		(1 << 25)
@@ -698,6 +700,11 @@ static int rvin_setup(struct rvin_dev *vin)
 		/* Data Enable Polarity Select */
 		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
 			dmr2 |= VNDMR2_CES;
+
+		if (vin->parallel->ycbcr_8b_g && vin->mbus_code == MEDIA_BUS_FMT_UYVY8_2X8)
+			dmr2 |= VNDMR2_YDS;
+		else
+			dmr2 &= ~VNDMR2_YDS;
 	}
 
 	/*
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index c19d077ce1cb..3126fee9a89b 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -87,6 +87,9 @@ struct rvin_video_format {
 	u8 bpp;
 };
 
+#define BUS_WIDTH_8	8
+#define DATA_SHIFT_8	8
+
 /**
  * struct rvin_parallel_entity - Parallel video input endpoint descriptor
  * @asd:	sub-device descriptor for async framework
@@ -95,6 +98,7 @@ struct rvin_video_format {
  * @mbus_flags:	media bus configuration flags
  * @source_pad:	source pad of remote subdevice
  * @sink_pad:	sink pad of remote subdevice
+ * @ycbcr_8b_g:	select data pins for YCbCr422-8bit
  *
  */
 struct rvin_parallel_entity {
@@ -106,6 +110,7 @@ struct rvin_parallel_entity {
 
 	unsigned int source_pad;
 	unsigned int sink_pad;
+	bool ycbcr_8b_g;
 };
 
 /**
-- 
2.17.1

