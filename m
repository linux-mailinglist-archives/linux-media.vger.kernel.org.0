Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225C0215E82
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgGFShr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729788AbgGFShq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A1F61942;
        Mon,  6 Jul 2020 20:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060660;
        bh=0CJLIfcwDy12OEalmyrUgs7HnqPtjh9B2pEbwkazzh8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PPSUgHPZFhq7Ne8xjY/4cE0eZ3r34FYJWlFwRJG6ppjWd73u3l2U8ReLI6fNlu9pe
         aycFvW7OLFsJ5YOMx1N3tudPqpq0kok5ODqEo/PAKvLWlpIEOdaVcsQEfH5qqptSar
         wPJEzp1bJQxyssLgmv113Yl4GxprkTxSxzl7MAFY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 019/108] media: ti-vpe: cal: Constify platform data
Date:   Mon,  6 Jul 2020 21:35:40 +0300
Message-Id: <20200706183709.12238-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e7e1ad428074..86e67b98dc63 100644
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

