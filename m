Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAA0DC8AD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410677AbfJRPcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44830 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410668AbfJRPcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:21 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWKdO117113;
        Fri, 18 Oct 2019 10:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412740;
        bh=r5gqWhuoa2gJ1iIJ0GdWbvBLizT1eB9GcyotAuDXfac=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZevOt9ld7M6nhyVxwr0+s5B4kZMvbBXn5HnHbyFB4xtictTSPFXTW55WeDj6fb+2c
         l4jiV/foNA+TTitr0Rfk9uPNZCutVfK7ifEzeTkrEaC7Wy+BVW7KZxJAii2QFxabbf
         pbfapOvCI/n473Jner3xOS6dSOF122C8cv2f93e4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWKab080890
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:20 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:11 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15S080266;
        Fri, 18 Oct 2019 10:32:19 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 14/19] media: ti-vpe: cal: Add AM654 support
Date:   Fri, 18 Oct 2019 10:34:32 -0500
Message-ID: <20191018153437.20614-15-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the needed control module register bit layout to support the AM654
family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/Kconfig      |  2 +-
 drivers/media/platform/ti-vpe/cal.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 997de1a83ff9..24713e79c1ec 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -151,7 +151,7 @@ source "drivers/media/platform/sunxi/Kconfig"
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
 	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on SOC_DRA7XX || COMPILE_TEST
+	depends on SOC_DRA7XX || ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f590fe712d3d..42b0063b610e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -322,6 +322,26 @@ static struct cal_data dra76x_cal_data = {
 	.flags = 0,
 };
 
+static struct reg_field am654_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
+	[F_CTRLCLKEN] = REG_FIELD(0, 15, 15),
+	[F_CAMMODE] = REG_FIELD(0, 24, 25),
+	[F_LANEENABLE] = REG_FIELD(0, 0, 4),
+};
+
+static struct cal_csi2_phy am654_cal_csi_phy[] = {
+	{
+		.base_fields = am654_ctrl_core_csi0_reg_fields,
+		.num_lanes = 5,
+	},
+};
+
+static struct cal_data am654_cal_data = {
+	.csi2_phy_core = am654_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
+
+	.flags = 0,
+};
+
 /*
  * there is one cal_dev structure in the driver, it is shared by
  * all instances.
@@ -548,7 +568,9 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 	/* Always enable all lanes at the phy control level */
 	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
 	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
-	regmap_field_write(phy->fields[F_CSI_MODE], 1);
+	/* F_CSI_MODE is not present on every architecture */
+	if (phy->fields[F_CSI_MODE])
+		regmap_field_write(phy->fields[F_CSI_MODE], 1);
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
 }
 
@@ -2331,6 +2353,10 @@ static const struct of_device_id cal_of_match[] = {
 		.compatible = "ti,dra76-cal",
 		.data = (void *)&dra76x_cal_data,
 	},
+	{
+		.compatible = "ti,am654-cal",
+		.data = (void *)&am654_cal_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
-- 
2.17.1

