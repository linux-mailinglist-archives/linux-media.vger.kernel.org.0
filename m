Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6961F8BC1
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgFOACA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgFOAB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EE942169;
        Mon, 15 Jun 2020 02:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179253;
        bh=22qSUjasFKzx36r34TSsCdjuuIQVJ/PNhBsa27ON0FU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pmwBNFfWbYuR0uoXbyhsRIL9FIR0zmb6eqlWgyUHQDA3FpfydqCa88m/pfPV58awn
         7ldN612V7cA+8tPB8UqyU2YkzEp7O1kBf8POdtntmzDQkd3d6KvdS+MItwgmVPV957
         aSkc8A1WzdrXD48Q/0IFSHcQBChZ5oEn+AxdVv0M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 089/107] media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
Date:   Mon, 15 Jun 2020 02:59:26 +0300
Message-Id: <20200614235944.17716-90-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3e82a5edf376..ad6e8a1e352b 100644
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
@@ -463,7 +460,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
-		for (i = 0; i < CAL_NUM_CSI2_PORTS; ++i) {
+		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = cal_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
@@ -603,15 +600,12 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	v4l2_async_notifier_init(&cal->notifier);
 	cal->notifier.ops = &cal_async_notifier_ops;
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); ++i) {
+	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 		struct cal_v4l2_async_subdev *casd;
 		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *fwnode;
 
-		if (!phy)
-			continue;
-
 		fwnode = of_fwnode_handle(phy->sensor_node);
 		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
 							    fwnode,
@@ -986,7 +980,7 @@ static int cal_probe(struct platform_device *pdev)
 	cal_media_cleanup(cal);
 
 error_camerarx:
-	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 error_pm_runtime:
@@ -1013,7 +1007,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	cal_media_cleanup(cal);
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -1025,14 +1019,15 @@ static int cal_remove(struct platform_device *pdev)
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

