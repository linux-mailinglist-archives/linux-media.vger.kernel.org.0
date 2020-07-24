Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8154222C8A0
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 16:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgGXO7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 10:59:24 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18194 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727019AbgGXO7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 10:59:23 -0400
X-IronPort-AV: E=Sophos;i="5.75,391,1589209200"; 
   d="scan'208";a="52751512"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jul 2020 23:59:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 34668425F8C1;
        Fri, 24 Jul 2020 23:59:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] media: rcar-vin: Add support to read renesas-vin-ycbcr-8b-g property
Date:   Fri, 24 Jul 2020 15:58:52 +0100
Message-Id: <1595602732-25582-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read "renesas-vin-ycbcr-8b-g" DT property and select
the data pins accordingly for YCbCr422-8bit input

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 4 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c89..5273110 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -624,6 +624,9 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
 	vin->parallel = rvpe;
 	vin->parallel->mbus_type = vep->bus_type;
 
+	vin->parallel->ycbcr_8b_g = fwnode_property_present(vep->base.local_fwnode,
+							    "renesas-vin-ycbcr-8b-g");
+
 	switch (vin->parallel->mbus_type) {
 	case V4L2_MBUS_PARALLEL:
 		vin_dbg(vin, "Found PARALLEL media bus\n");
@@ -659,7 +662,6 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
 		to_of_node(vin->parallel->asd.match.fwnode));
-
 	vin->notifier.ops = &rvin_parallel_notify_ops;
 	ret = v4l2_async_notifier_register(&vin->v4l2_dev, &vin->notifier);
 	if (ret < 0) {
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd0..5db4838 100644
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
index c19d077..62a4bf2 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -95,6 +95,7 @@ struct rvin_video_format {
  * @mbus_flags:	media bus configuration flags
  * @source_pad:	source pad of remote subdevice
  * @sink_pad:	sink pad of remote subdevice
+ * @ycbcr_8b_g:	select data pins for YCbCr422-8bit
  *
  */
 struct rvin_parallel_entity {
@@ -106,6 +107,7 @@ struct rvin_parallel_entity {
 
 	unsigned int source_pad;
 	unsigned int sink_pad;
+	bool ycbcr_8b_g;
 };
 
 /**
-- 
2.7.4

