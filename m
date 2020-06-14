Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F0A1F8B73
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgFOAA3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgFOAA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F9FA2C0;
        Mon, 15 Jun 2020 02:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179217;
        bh=Fg1nMoN5tPw1TmVma1H/776+Ve/qQ62S4Ry+rvOCVpc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NG/ZR7Acvt+4v6Wi9koFPN5m8axfKLuS8DKZxsQCOUxOC5LxTKEC+0C/miVW1iaSn
         nLQ5TuaPZxrBuEboIimu8QctHvn0JpbYAHzzaP/rSzHFa1SPsPzZF5vLcFVNvWIJpV
         s5p3tPJTiFcXnbpKtLf8l0EaCteVffsfEPxyliMM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 017/107] media: ti-vpe: cal: Rename cal_csi2_phy base_fields to fields
Date:   Mon, 15 Jun 2020 02:58:14 +0300
Message-Id: <20200614235944.17716-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_csi2_phy structure has lost its 'fields' field that used to
clash with the 'base_fields' field. Rename base_fields to fields.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 46e12e4c4f5d..19cd795b71b9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -239,7 +239,7 @@ struct cal_csi2_phy {
 	struct {
 		unsigned int lsb;
 		unsigned int msb;
-	} base_fields[F_MAX_FIELDS];
+	} fields[F_MAX_FIELDS];
 	const int num_lanes;
 };
 
@@ -252,7 +252,7 @@ struct cal_data {
 
 static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 	{
-		.base_fields = {
+		.fields = {
 			[F_CTRLCLKEN] = { 10, 10 },
 			[F_CAMMODE] = { 11, 12 },
 			[F_LANEENABLE] = { 13, 16 },
@@ -261,7 +261,7 @@ static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 		.num_lanes = 4,
 	},
 	{
-		.base_fields = {
+		.fields = {
 			[F_CTRLCLKEN] = { 0, 0 },
 			[F_CAMMODE] = { 1, 2 },
 			[F_LANEENABLE] = { 3, 4 },
@@ -284,7 +284,7 @@ static const struct cal_data dra72x_es1_cal_data = {
 
 static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 	{
-		.base_fields = {
+		.fields = {
 			[F_CTRLCLKEN] = { 8, 8 },
 			[F_CAMMODE] = { 9, 10 },
 			[F_CSI_MODE] = { 11, 11 },
@@ -293,7 +293,7 @@ static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 		.num_lanes = 5,
 	},
 	{
-		.base_fields = {
+		.fields = {
 			[F_CTRLCLKEN] = { 0, 0 },
 			[F_CAMMODE] = { 1, 2 },
 			[F_CSI_MODE] = { 3, 3 },
@@ -310,7 +310,7 @@ static const struct cal_data dra76x_cal_data = {
 
 static struct cal_csi2_phy am654_cal_csi_phy[] = {
 	{
-		.base_fields = {
+		.fields = {
 			[F_CTRLCLKEN] = { 15, 15 },
 			[F_CAMMODE] = { 24, 25 },
 			[F_LANEENABLE] = { 0, 4 },
@@ -493,8 +493,8 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev, struct cc_data *cc,
 	for (i = 0; i < F_MAX_FIELDS; i++) {
 		struct reg_field field = {
 			.reg = dev->syscon_camerrx_offset,
-			.lsb = phy->base_fields[i].lsb,
-			.msb = phy->base_fields[i].msb,
+			.lsb = phy->fields[i].lsb,
+			.msb = phy->fields[i].msb,
 		};
 
 		/*
-- 
Regards,

Laurent Pinchart

