Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F040BF933D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfKLOvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:00 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52512 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfKLOvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:00 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEowbu098030;
        Tue, 12 Nov 2019 08:50:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570258;
        bh=3afVrSmjTL4CyEPRTamBo0N3qnu4sRsruT5eMjfEjYc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=U+tvYrnagsI0ahEjQ8+aSPNEJBnEtL5Poy8oj3Jzopc+Pm3kInQaZX/1JJ0ZkyskY
         7zPluxw6hjxCFvQHG2Yp0B+Yyy0RSoENh22R84ZKZHgEeVsv5IhbeH+303el/RZTpv
         u6YcJJcx4cQ4eYdHPVuNOQD5ILMtPahtFiQLrY48=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEoweB070469;
        Tue, 12 Nov 2019 08:50:58 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:40 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokex068428;
        Tue, 12 Nov 2019 08:50:57 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 13/20] media: ti-vpe: cal: Add DRA76x support
Date:   Tue, 12 Nov 2019 08:53:40 -0600
Message-ID: <20191112145347.23519-14-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the needed control module register bit layout to support
the DRA76x family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8d9c1569c05a..0ed517b3c00d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -287,6 +287,36 @@ static const struct cal_data dra72x_es1_cal_data = {
 	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
 };
 
+static struct reg_field dra76x_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
+	[F_CTRLCLKEN] = REG_FIELD(0, 8, 8),
+	[F_CAMMODE] = REG_FIELD(0, 9, 10),
+	[F_CSI_MODE] = REG_FIELD(0, 11, 11),
+	[F_LANEENABLE] = REG_FIELD(0, 27, 31),
+};
+
+static struct reg_field dra76x_ctrl_core_csi1_reg_fields[F_MAX_FIELDS] = {
+	[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
+	[F_CAMMODE] = REG_FIELD(0, 1, 2),
+	[F_CSI_MODE] = REG_FIELD(0, 3, 3),
+	[F_LANEENABLE] = REG_FIELD(0, 24, 26),
+};
+
+static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
+	{
+		.base_fields = dra76x_ctrl_core_csi0_reg_fields,
+		.num_lanes = 5,
+	},
+	{
+		.base_fields = dra76x_ctrl_core_csi1_reg_fields,
+		.num_lanes = 3,
+	},
+};
+
+static const struct cal_data dra76x_cal_data = {
+	.csi2_phy_core = dra76x_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
+};
+
 /*
  * there is one cal_dev structure in the driver, it is shared by
  * all instances.
@@ -2287,6 +2317,10 @@ static const struct of_device_id cal_of_match[] = {
 		.compatible = "ti,dra72-pre-es2-cal",
 		.data = (void *)&dra72x_es1_cal_data,
 	},
+	{
+		.compatible = "ti,dra76-cal",
+		.data = (void *)&dra76x_cal_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
-- 
2.17.1

