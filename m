Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E4B1F8B7E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgFOAAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgFOAAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E22022139;
        Mon, 15 Jun 2020 02:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179221;
        bh=Rnu81J9uEvTAr42o5HTOzXYKCaUbNUr7hdxSQ3LaF24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMixKa62KdshqjxJ688dHLxvuOgAFptV+2hQ0qhlyv+2Iwllz0gAxRqThLMFa7AJR
         UfOATjnucau2X1vALNtayRnEX+MTxw0KDLcV285j8VJkwilmmY4Smylyr4ZHujIwNR
         KWBmdxzO4kM3FCaD5Z2/Mbcpgx6uiJbyKxrMcZlk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 025/107] media: ti-vpe: cal: Rename cal_csi2_phy to cal_camerarx_data
Date:   Mon, 15 Jun 2020 02:58:22 +0300
Message-Id: <20200614235944.17716-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_csi2_phy contains platform data for the CAMERARX blocks. Rename
it to cal_camerarx_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 33 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index df756c7b53b7..8b76e8709aad 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -215,7 +215,7 @@ enum cal_camerarx_field {
 	F_MAX_FIELDS,
 };
 
-struct cal_csi2_phy {
+struct cal_camerarx_data {
 	struct {
 		unsigned int lsb;
 		unsigned int msb;
@@ -224,13 +224,12 @@ struct cal_csi2_phy {
 };
 
 struct cal_data {
+	const struct cal_camerarx_data *camerarx;
 	unsigned int num_csi2_phy;
-	const struct cal_csi2_phy *csi2_phy_core;
-
 	unsigned int flags;
 };
 
-static const struct cal_csi2_phy dra72x_cal_csi_phy[] = {
+static const struct cal_camerarx_data dra72x_cal_camerarx[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 10, 10 },
@@ -252,17 +251,17 @@ static const struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 };
 
 static const struct cal_data dra72x_cal_data = {
-	.csi2_phy_core = dra72x_cal_csi_phy,
-	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
+	.camerarx = dra72x_cal_camerarx,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
 };
 
 static const struct cal_data dra72x_es1_cal_data = {
-	.csi2_phy_core = dra72x_cal_csi_phy,
-	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
+	.camerarx = dra72x_cal_camerarx,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
 	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
 };
 
-static const struct cal_csi2_phy dra76x_cal_csi_phy[] = {
+static const struct cal_camerarx_data dra76x_cal_csi_phy[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 8, 8 },
@@ -284,11 +283,11 @@ static const struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 };
 
 static const struct cal_data dra76x_cal_data = {
-	.csi2_phy_core = dra76x_cal_csi_phy,
+	.camerarx = dra76x_cal_csi_phy,
 	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
 };
 
-static const struct cal_csi2_phy am654_cal_csi_phy[] = {
+static const struct cal_camerarx_data am654_cal_csi_phy[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 15, 15 },
@@ -300,7 +299,7 @@ static const struct cal_csi2_phy am654_cal_csi_phy[] = {
 };
 
 static const struct cal_data am654_cal_data = {
-	.csi2_phy_core = am654_cal_csi_phy,
+	.camerarx = am654_cal_csi_phy,
 	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
 };
 
@@ -456,7 +455,7 @@ static u32 cal_data_get_phy_max_lanes(struct cal_ctx *ctx)
 	struct cal_dev *dev = ctx->dev;
 	u32 phy_id = ctx->csi2_port;
 
-	return dev->data->csi2_phy_core[phy_id].num_lanes;
+	return dev->data->camerarx[phy_id].num_lanes;
 }
 
 static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
@@ -468,19 +467,19 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev,
 				    struct cal_camerarx *cc,
 				    unsigned int idx)
 {
-	const struct cal_csi2_phy *phy;
+	const struct cal_camerarx_data *phy_data;
 	unsigned int i;
 
 	if (!dev->data)
 		return -EINVAL;
 
-	phy = &dev->data->csi2_phy_core[idx];
+	phy_data = &dev->data->camerarx[idx];
 
 	for (i = 0; i < F_MAX_FIELDS; i++) {
 		struct reg_field field = {
 			.reg = dev->syscon_camerrx_offset,
-			.lsb = phy->fields[i].lsb,
-			.msb = phy->fields[i].msb,
+			.lsb = phy_data->fields[i].lsb,
+			.msb = phy_data->fields[i].msb,
 		};
 
 		/*
-- 
Regards,

Laurent Pinchart

