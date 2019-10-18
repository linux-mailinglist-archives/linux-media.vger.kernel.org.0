Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51BEEDC8AB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410661AbfJRPcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40708 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410600AbfJRPcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWHFJ002693;
        Fri, 18 Oct 2019 10:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412737;
        bh=fOWgVpmqUokvYHMT4mlXfALvalPrfwrOzlcnd0f6R94=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LdSLvwMjC2eEIRq+N0l9Hwc4wiAYwGpdQKt+K/Jq56PKrAm/ugExFfOLwQ/X7zyHP
         ++MWtOC4jJX342xnugGdWx8ZlsXdsIFWm1yagj5AbJbSDt3HRbjSfi0ymTbsnBj7tc
         zbTQYFK+zSWZacUy58VAVrHrI8Hs2WQHuSF82iY8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWH0O105954;
        Fri, 18 Oct 2019 10:32:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:17 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15Q080266;
        Fri, 18 Oct 2019 10:32:17 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 12/19] media: ti-vpe: cal: Add DRA76x support
Date:   Fri, 18 Oct 2019 10:34:30 -0500
Message-ID: <20191018153437.20614-13-bparrot@ti.com>
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

Add the needed control module register bit layout to support
the DRA76x family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c912ea82b534..f590fe712d3d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -290,6 +290,38 @@ static struct cal_data dra72x_es1_cal_data = {
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
+static struct cal_data dra76x_cal_data = {
+	.csi2_phy_core = dra76x_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
+
+	.flags = 0,
+};
+
 /*
  * there is one cal_dev structure in the driver, it is shared by
  * all instances.
@@ -2295,6 +2327,10 @@ static const struct of_device_id cal_of_match[] = {
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

