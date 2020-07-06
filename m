Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA18E215E7D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgGFShn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgGFShl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F73D18E5;
        Mon,  6 Jul 2020 20:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060656;
        bh=5CAf84wzd07iLfE4t/B89y8/q+FOpSe6xnFOCZuhZxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M1+aSc4zaRO4xqkO2EQhJD8clHgacIlyCzqU1mS+xzMRlokUUKdS5Kx8w7VcjIg1U
         mu0i/MZosBGCnDHp5U7+CA0l9xaKuEZHaf9tgeY+pWoy1r9yW5Fy8aXcyfgi4BiSB3
         oE8900SB8UCztuG0saUrI6mHZYo8b8kGZ0d8mDjY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 014/108] media: ti-vpe: cal: Embed base_fields array in struct cal_csi2_phy
Date:   Mon,  6 Jul 2020 21:35:35 +0300
Message-Id: <20200706183709.12238-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 70 +++++++++++++----------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 579f823451f4..1f15481ba5a2 100644
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

