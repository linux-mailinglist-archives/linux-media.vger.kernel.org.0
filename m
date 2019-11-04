Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F889EE891
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfKDTcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:53 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48792 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729742AbfKDTcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:13 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWCCL104218;
        Mon, 4 Nov 2019 13:32:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895932;
        bh=gakWC5j/zaO+BDPfXwOsF7lxIAuI+dHbk9ltuMT8WgI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=weEO16bal2SOKCtARr4Soh1ji8boIfb7/c8ra+Wva0gZbXhzgPY3Pk1Qb9fqc5O4A
         KcC7TLgpSA6Ik4jT+zFb1fqG4zxCM+naLBLQks5f1D+2yNHW3mby1ktdf/KqVeW4Sn
         ECOoSDqX/djFIvsnOIqsTlEP4LiOFiZrI4FUFYB8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JWBrH021618
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:32:11 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:57 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdB096934;
        Mon, 4 Nov 2019 13:32:11 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 12/20] media: ti-vpe: cal: Add DRA76x support
Date:   Mon, 4 Nov 2019 13:31:32 -0600
Message-ID: <20191104193140.31145-13-bparrot@ti.com>
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

Add the needed control module register bit layout to support
the DRA76x family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b348d99d6166..72ed2348389d 100644
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
@@ -2285,6 +2317,10 @@ static const struct of_device_id cal_of_match[] = {
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

