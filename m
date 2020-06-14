Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2DC1F8B75
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgFOAA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgFOAA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:26 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DB6019EE;
        Mon, 15 Jun 2020 02:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179216;
        bh=slpa+jwQ/ggnyTeEw/d0q/9TG9eW1Ixiq6xb+uCzdHk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OTKEAN8GnFFp5MoW3pZ70tXs7pj1EFraXfp9S5rPKkusX6JfWKhDQkfJDokq6NNby
         n17gFCTET0hpKtARaVneyYKJseSPuJR1OaqAiWCAp6Dt0VDV8MAHrS2UiVM9mek1+Q
         vSaQ4SzgCkrQADe+0kepi6jGolgYXDfR6ORE0lXM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 014/107] media: ti-vpe: cal: Embed base_fields array in struct cal_csi2_phy
Date:   Mon, 15 Jun 2020 02:58:11 +0300
Message-Id: <20200614235944.17716-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The base_fields field of cal_csi2_phy points to a fixed-size array of
struct reg_field. This level of indirection isn't needed, embed the
array directly in struct cal_csi2_phy.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 70 +++++++++++++----------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a407dbeaa720..116d7890cadd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -234,7 +234,7 @@ enum cal_camerarx_field {
 
 struct cal_csi2_phy {
 	struct regmap_field *fields[F_MAX_FIELDS];
-	struct reg_field *base_fields;
+	struct reg_field base_fields[F_MAX_FIELDS];
 	const int num_lanes;
 };
 
@@ -245,27 +245,23 @@ struct cal_data {
 	const unsigned int flags;
 };
 
-static struct reg_field dra72x_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
-	[F_CTRLCLKEN] = REG_FIELD(0, 10, 10),
-	[F_CAMMODE] = REG_FIELD(0, 11, 12),
-	[F_LANEENABLE] = REG_FIELD(0, 13, 16),
-	[F_CSI_MODE] = REG_FIELD(0, 17, 17),
-};
-
-static struct reg_field dra72x_ctrl_core_csi1_reg_fields[F_MAX_FIELDS] = {
-	[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
-	[F_CAMMODE] = REG_FIELD(0, 1, 2),
-	[F_LANEENABLE] = REG_FIELD(0, 3, 4),
-	[F_CSI_MODE] = REG_FIELD(0, 5, 5),
-};
-
 static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 	{
-		.base_fields = dra72x_ctrl_core_csi0_reg_fields,
+		.base_fields = {
+			[F_CTRLCLKEN] = REG_FIELD(0, 10, 10),
+			[F_CAMMODE] = REG_FIELD(0, 11, 12),
+			[F_LANEENABLE] = REG_FIELD(0, 13, 16),
+			[F_CSI_MODE] = REG_FIELD(0, 17, 17),
+		},
 		.num_lanes = 4,
 	},
 	{
-		.base_fields = dra72x_ctrl_core_csi1_reg_fields,
+		.base_fields = {
+			[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
+			[F_CAMMODE] = REG_FIELD(0, 1, 2),
+			[F_LANEENABLE] = REG_FIELD(0, 3, 4),
+			[F_CSI_MODE] = REG_FIELD(0, 5, 5),
+		},
 		.num_lanes = 2,
 	},
 };
@@ -281,27 +277,23 @@ static const struct cal_data dra72x_es1_cal_data = {
 	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
 };
 
-static struct reg_field dra76x_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
-	[F_CTRLCLKEN] = REG_FIELD(0, 8, 8),
-	[F_CAMMODE] = REG_FIELD(0, 9, 10),
-	[F_CSI_MODE] = REG_FIELD(0, 11, 11),
-	[F_LANEENABLE] = REG_FIELD(0, 27, 31),
-};
-
-static struct reg_field dra76x_ctrl_core_csi1_reg_fields[F_MAX_FIELDS] = {
-	[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
-	[F_CAMMODE] = REG_FIELD(0, 1, 2),
-	[F_CSI_MODE] = REG_FIELD(0, 3, 3),
-	[F_LANEENABLE] = REG_FIELD(0, 24, 26),
-};
-
 static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 	{
-		.base_fields = dra76x_ctrl_core_csi0_reg_fields,
+		.base_fields = {
+			[F_CTRLCLKEN] = REG_FIELD(0, 8, 8),
+			[F_CAMMODE] = REG_FIELD(0, 9, 10),
+			[F_CSI_MODE] = REG_FIELD(0, 11, 11),
+			[F_LANEENABLE] = REG_FIELD(0, 27, 31),
+		},
 		.num_lanes = 5,
 	},
 	{
-		.base_fields = dra76x_ctrl_core_csi1_reg_fields,
+		.base_fields = {
+			[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
+			[F_CAMMODE] = REG_FIELD(0, 1, 2),
+			[F_CSI_MODE] = REG_FIELD(0, 3, 3),
+			[F_LANEENABLE] = REG_FIELD(0, 24, 26),
+		},
 		.num_lanes = 3,
 	},
 };
@@ -311,15 +303,13 @@ static const struct cal_data dra76x_cal_data = {
 	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
 };
 
-static struct reg_field am654_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
-	[F_CTRLCLKEN] = REG_FIELD(0, 15, 15),
-	[F_CAMMODE] = REG_FIELD(0, 24, 25),
-	[F_LANEENABLE] = REG_FIELD(0, 0, 4),
-};
-
 static struct cal_csi2_phy am654_cal_csi_phy[] = {
 	{
-		.base_fields = am654_ctrl_core_csi0_reg_fields,
+		.base_fields = {
+			[F_CTRLCLKEN] = REG_FIELD(0, 15, 15),
+			[F_CAMMODE] = REG_FIELD(0, 24, 25),
+			[F_LANEENABLE] = REG_FIELD(0, 0, 4),
+		},
 		.num_lanes = 5,
 	},
 };
-- 
Regards,

Laurent Pinchart

