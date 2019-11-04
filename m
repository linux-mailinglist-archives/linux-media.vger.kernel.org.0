Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56081EE878
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfKDTcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:19 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42536 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729785AbfKDTcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:18 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWG3F105082;
        Mon, 4 Nov 2019 13:32:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895936;
        bh=ff8Tub1pbnLGcq2hI0X58+76sy0Wq3xUywCcOClageo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H/g7wGiyroRd2X5tITNgMeEJMwApibrpNMEZtLDwNqFpe0xE0gLaVJHM9KvZV9Hi1
         sttIci3JGqHBULvKmD7pb6VB7h66yot5OsliSGg2ZLyD46NnfR65Puge1rOqapl/uZ
         HkKSi73a9LkTji3QSVYlFZdcaayMBW0wYmnTBDKo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWGLx025522;
        Mon, 4 Nov 2019 13:32:16 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:32:01 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdD096934;
        Mon, 4 Nov 2019 13:32:15 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 14/20] media: ti-vpe: cal: Add AM654 support
Date:   Mon, 4 Nov 2019 13:31:34 -0600
Message-ID: <20191104193140.31145-15-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
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
index e84f35d3a68e..995f4c67f764 100644
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
index 72ed2348389d..45653e9ed6cd 100644
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
 
@@ -2321,6 +2343,10 @@ static const struct of_device_id cal_of_match[] = {
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

