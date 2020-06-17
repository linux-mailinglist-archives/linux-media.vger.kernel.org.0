Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C9D1FCA64
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 12:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgFQKCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 06:02:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgFQKCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 06:02:47 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32186F9;
        Wed, 17 Jun 2020 12:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592388164;
        bh=NnHsELelEVsUdi6wQ88jrYUx6Sq76as0FBVrg4K2cto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pxDftpsBkiVwvLFBwiI301WwM1j6qN1VohZV5ICB4ierq2ksylGQiugR7YSQmPuL3
         MvFdEZjfZpkhmQYXde1cOBclbeb8f4uGkVIH+D0v6XJP3L4jmRyXSk4Vx4dUV/8XZs
         Su/41/IXqefy0RcWfDs9kY93kzHHVgSwtJ5JKeAI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: ti-vpe: cal: Use cal_data_get_num_csi2_phy() consistently
Date:   Wed, 17 Jun 2020 11:02:40 +0100
Message-Id: <20200617100240.886788-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a007b062-37b2-2088-7600-0b9f3fa5ab12@ideasonboard.com>
References: <a007b062-37b2-2088-7600-0b9f3fa5ab12@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The helper cal_data_get_num_csi2_phy() is defined late in the module,
leaving 3 instances of open-coded access to the num_csi2_phy value.

Move the helper function directly after the 'struct cal_data' definitions
and utilise the helper consistently throughout.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d00dc241804b..8e99e7e58188 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -253,6 +253,11 @@ static const struct cal_data am654_cal_data = {
 	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
 };
 
+static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
+{
+	return cal->data->num_csi2_phy;
+}
+
 /* ------------------------------------------------------------------
  *	I/O Register Accessors
  * ------------------------------------------------------------------
@@ -267,7 +272,7 @@ void cal_quickdump_regs(struct cal_dev *cal)
 		       (__force const void *)cal->base,
 		       resource_size(cal->res), false);
 
-	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 
 		cal_info(cal, "CSI2 Core %u Registers @ %pa:\n", i,
@@ -559,7 +564,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
-		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+		for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = cal_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
@@ -685,7 +690,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	v4l2_async_notifier_init(&cal->notifier);
 	cal->notifier.ops = &cal_async_notifier_ops;
 
-	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 		struct cal_v4l2_async_subdev *casd;
 		struct v4l2_async_subdev *asd;
@@ -904,11 +909,6 @@ static void cal_get_hwinfo(struct cal_dev *cal)
 			 hwinfo, CAL_HL_HWINFO_VALUE);
 }
 
-static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
-{
-	return cal->data->num_csi2_phy;
-}
-
 static int cal_init_camerarx_regmap(struct cal_dev *cal)
 {
 	struct platform_device *pdev = to_platform_device(cal->dev);
@@ -1063,7 +1063,7 @@ static int cal_probe(struct platform_device *pdev)
 
 error_media:
 	cal_media_cleanup(cal);
-	for (i = 0; i < cal->data->num_csi2_phy; i++)
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 error_pm_runtime:
@@ -1090,7 +1090,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	cal_media_cleanup(cal);
 
-	for (i = 0; i < cal->data->num_csi2_phy; i++)
+	for (i = 0; i < cal_data_get_num_csi2_phy(cal); i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -1109,7 +1109,7 @@ static int cal_runtime_resume(struct device *dev)
 		 * Apply errata on both port everytime we (re-)enable
 		 * the clock
 		 */
-		for (i = 0; i < cal->data->num_csi2_phy; i++)
+		for (i = 0; i < cal_data_get_num_csi2_phy(cal); i++)
 			cal_camerarx_i913_errata(cal->phy[i]);
 	}
 
-- 
2.25.1

