Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011AE1F8B77
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgFOAAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgFOAAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:31 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D84598D;
        Mon, 15 Jun 2020 02:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179218;
        bh=k2Pac8C5U7yZWinwo0+cVxYwgDC0UxKJ6XykFPlnD1k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vk/hXRJBacGwzfffGL4MvUkREiK/wU2mYMVoAKx32EobKNtmp88lt2Y0G5q6Y64fX
         bX1+D0xXDzu4awY8UMFET8dTmn0mJjCW3Vtv120vU0z+eeERAKSE3km1mXuQhAVR8g
         wbEpJTH1m6vAUgpbtFTKyxzki8QZYQsnNMe2nv9Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 019/107] media: ti-vpe: cal: Constify platform data
Date:   Mon, 15 Jun 2020 02:58:16 +0300
Message-Id: <20200614235944.17716-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that no platform data fields are modified at runtime, make the
corresponding structures const. The const qualifier for integer fields
is removed as it's not required anymore.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d8bf24029d54..d1ab7fc26d25 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -240,17 +240,17 @@ struct cal_csi2_phy {
 		unsigned int lsb;
 		unsigned int msb;
 	} fields[F_MAX_FIELDS];
-	const unsigned int num_lanes;
+	unsigned int num_lanes;
 };
 
 struct cal_data {
-	const unsigned int num_csi2_phy;
-	struct cal_csi2_phy *csi2_phy_core;
+	unsigned int num_csi2_phy;
+	const struct cal_csi2_phy *csi2_phy_core;
 
-	const unsigned int flags;
+	unsigned int flags;
 };
 
-static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
+static const struct cal_csi2_phy dra72x_cal_csi_phy[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 10, 10 },
@@ -282,7 +282,7 @@ static const struct cal_data dra72x_es1_cal_data = {
 	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
 };
 
-static struct cal_csi2_phy dra76x_cal_csi_phy[] = {
+static const struct cal_csi2_phy dra76x_cal_csi_phy[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 8, 8 },
@@ -308,7 +308,7 @@ static const struct cal_data dra76x_cal_data = {
 	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
 };
 
-static struct cal_csi2_phy am654_cal_csi_phy[] = {
+static const struct cal_csi2_phy am654_cal_csi_phy[] = {
 	{
 		.fields = {
 			[F_CTRLCLKEN] = { 15, 15 },
-- 
Regards,

Laurent Pinchart

