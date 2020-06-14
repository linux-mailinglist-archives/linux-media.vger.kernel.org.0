Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2681F8B80
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgFOAAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgFOAA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:27 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5B6F1A79;
        Mon, 15 Jun 2020 02:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179216;
        bh=/1H6osgF3gK5494/xDWFkPCrWyZl7DI8vntMrGbO+rk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Htqg/MAvkqPNqGkCi8xKTds29HR2OWAJl8slibvSgWpvaGSwHayfOB6yoIJtRDUe8
         kkLPgwfMlngzbmIxvledceu+VI5nzDHqQ9WX3kHjWmSB2lPsMohS5pF+fwGrW04SZG
         XeTKglw68hHxanwQxZOYTEEPsNbKxmagozYtWK14=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 015/107] media: ti-vpe: cal: Don't modify cal_csi2_phy base_fields
Date:   Mon, 15 Jun 2020 02:58:12 +0300
Message-Id: <20200614235944.17716-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation to constify cal_csi2_phy, avoid modifying the base_fields
array at runtime. As the array now only needs to stored two values
instead of a full struct reg_field instance, save memory by using a
custom structure for the base_fields elements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 54 ++++++++++++++++-------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 116d7890cadd..dda0d7a6b02f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -234,7 +234,10 @@ enum cal_camerarx_field {
 
 struct cal_csi2_phy {
 	struct regmap_field *fields[F_MAX_FIELDS];
-	struct reg_field base_fields[F_MAX_FIELDS];
+	struct {
+		unsigned int lsb;
+		unsigned int msb;
+	} base_fields[F_MAX_FIELDS];
 	const int num_lanes;
 };
 
@@ -248,19 +251,19 @@ struct cal_data {
 static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 	{
 		.base_fields = {
-			[F_CTRLCLKEN] = REG_FIELD(0, 10, 10),
-			[F_CAMMODE] = REG_FIELD(0, 11, 12),
-			[F_LANEENABLE] = REG_FIELD(0, 13, 16),
-			[F_CSI_MODE] = REG_FIELD(0, 17, 17),
+			[F_CTRLCLKEN] = { 10, 10 },
+			[F_CAMMODE] = { 11, 12 },
+			[F_LANEENABLE] = { 13, 16 },
+			[F_CSI_MODE] = { 17, 17 },
 		},
 		.num_lanes = 4,
 	},
 	{
 		.base_fields = {
-			[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
-			[F_CAMMODE] = REG_FIELD(0, 1, 2),
-			[F_LANEENABLE] = REG_FIELD(0, 3, 4),
-			[F_CSI_MODE] = REG_FIELD(0, 5, 5),
+			[F_CTRLCLKEN] = { 0, 0 },
+			[F_CAMMODE] = { 1, 2 },
+			[F_LANEENABLE] = { 3, 4 },
+			[F_CSI_MODE] = { 5, 5 },
 		},
 		.num_lanes = 2,
 	},
@@ -280,19 +283,19 @@ static const struct cal_data dra72x_es1_cal_data = {
 static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 	{
 		.base_fields = {
-			[F_CTRLCLKEN] = REG_FIELD(0, 8, 8),
-			[F_CAMMODE] = REG_FIELD(0, 9, 10),
-			[F_CSI_MODE] = REG_FIELD(0, 11, 11),
-			[F_LANEENABLE] = REG_FIELD(0, 27, 31),
+			[F_CTRLCLKEN] = { 8, 8 },
+			[F_CAMMODE] = { 9, 10 },
+			[F_CSI_MODE] = { 11, 11 },
+			[F_LANEENABLE] = { 27, 31 },
 		},
 		.num_lanes = 5,
 	},
 	{
 		.base_fields = {
-			[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
-			[F_CAMMODE] = REG_FIELD(0, 1, 2),
-			[F_CSI_MODE] = REG_FIELD(0, 3, 3),
-			[F_LANEENABLE] = REG_FIELD(0, 24, 26),
+			[F_CTRLCLKEN] = { 0, 0 },
+			[F_CAMMODE] = { 1, 2 },
+			[F_CSI_MODE] = { 3, 3 },
+			[F_LANEENABLE] = { 24, 26 },
 		},
 		.num_lanes = 3,
 	},
@@ -306,9 +309,9 @@ static const struct cal_data dra76x_cal_data = {
 static struct cal_csi2_phy am654_cal_csi_phy[] = {
 	{
 		.base_fields = {
-			[F_CTRLCLKEN] = REG_FIELD(0, 15, 15),
-			[F_CAMMODE] = REG_FIELD(0, 24, 25),
-			[F_LANEENABLE] = REG_FIELD(0, 0, 4),
+			[F_CTRLCLKEN] = { 15, 15 },
+			[F_CAMMODE] = { 24, 25 },
+			[F_LANEENABLE] = { 0, 4 },
 		},
 		.num_lanes = 5,
 	},
@@ -476,7 +479,6 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
 
 static int cal_camerarx_regmap_init(struct cal_dev *dev)
 {
-	struct reg_field *field;
 	struct cal_csi2_phy *phy;
 	unsigned int i, j;
 
@@ -486,16 +488,20 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev)
 	for (i = 0; i < cal_data_get_num_csi2_phy(dev); i++) {
 		phy = &dev->data->csi2_phy_core[i];
 		for (j = 0; j < F_MAX_FIELDS; j++) {
-			field = &phy->base_fields[j];
+			struct reg_field field = {
+				.reg = dev->syscon_camerrx_offset,
+				.lsb = phy->base_fields[j].lsb,
+				.msb = phy->base_fields[j].msb,
+			};
+
 			/*
 			 * Here we update the reg offset with the
 			 * value found in DT
 			 */
-			field->reg = dev->syscon_camerrx_offset;
 			phy->fields[j] =
 				devm_regmap_field_alloc(&dev->pdev->dev,
 							dev->syscon_camerrx,
-							*field);
+							field);
 			if (IS_ERR(phy->fields[j])) {
 				cal_err(dev, "Unable to allocate regmap fields\n");
 				return PTR_ERR(phy->fields[j]);
-- 
Regards,

Laurent Pinchart

