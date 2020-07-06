Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27611215ECC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgGFSjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730014AbgGFSjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:03 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A558E37;
        Mon,  6 Jul 2020 20:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060705;
        bh=suF+L1ZGbY53+eXOKoSVRSq9zC1iMHPOxoah1S1lQss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aLbJF89TaiBJ5iU9Ff2DiCgM81cJby8Jk7j6jiVmRy0XKmRVGEQro9ulilT6vDw/1
         efasKLKCu+ZoRwgLxEWV8KceU1/MsZRDoSsXqXn2MeK/KC6rKDLCrpYHIoyEEP7u4R
         kyXYM0Ko564q/wvUepTb+eHIhze/keuflic77K7M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 090/108] media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
Date:   Mon,  6 Jul 2020 21:36:51 +0300
Message-Id: <20200706183709.12238-91-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When performing operations on all CAMERARX instances, code usually
iterates over all cal->phy[] entries and skips the NULL pointers. The
number of available CAMERARX instances is however available through
cal->data->num_csi2_phy. Use it instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b9ee535513e8..5d073d9cd8b5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -263,12 +263,9 @@ void cal_quickdump_regs(struct cal_dev *cal)
 		       (__force const void *)cal->base,
 		       resource_size(cal->res), false);
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); ++i) {
+	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 
-		if (!phy)
-			continue;
-
 		cal_info(cal, "CSI2 Core %u Registers @ %pa:\n", i,
 			 &phy->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
@@ -464,7 +461,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
-		for (i = 0; i < CAL_NUM_CSI2_PORTS; ++i) {
+		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = cal_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
@@ -608,13 +605,13 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	v4l2_async_notifier_init(&cal->notifier);
 	cal->notifier.ops = &cal_async_notifier_ops;
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); ++i) {
+	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 		struct cal_v4l2_async_subdev *casd;
 		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *fwnode;
 
-		if (!phy || !phy->sensor_node)
+		if (!phy->sensor_node)
 			continue;
 
 		fwnode = of_fwnode_handle(phy->sensor_node);
@@ -997,7 +994,7 @@ static int cal_probe(struct platform_device *pdev)
 	}
 
 error_camerarx:
-	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 	cal_media_cleanup(cal);
@@ -1026,7 +1023,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	cal_media_cleanup(cal);
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -1038,14 +1035,15 @@ static int cal_remove(struct platform_device *pdev)
 static int cal_runtime_resume(struct device *dev)
 {
 	struct cal_dev *cal = dev_get_drvdata(dev);
+	unsigned int i;
 
 	if (cal->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
 		/*
 		 * Apply errata on both port everytime we (re-)enable
 		 * the clock
 		 */
-		cal_camerarx_i913_errata(cal->phy[0]);
-		cal_camerarx_i913_errata(cal->phy[1]);
+		for (i = 0; i < cal->data->num_csi2_phy; i++)
+			cal_camerarx_i913_errata(cal->phy[i]);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

