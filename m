Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160292B7CD0
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgKRLic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:32 -0500
Received: from retiisi.eu ([95.216.213.190]:53498 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgKRLib (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:31 -0500
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D121E634CBD;
        Wed, 18 Nov 2020 13:38:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 13/29] smiapp: Use CCS limits in reading binning capabilities
Date:   Wed, 18 Nov 2020 13:30:55 +0200
Message-Id: <20201118113111.2548-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use CCS limits for obtaining binning capabilities and subtypes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 27 +++++++++-----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index c332b6ecf0bd..d786f91c1eae 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -3105,26 +3105,17 @@ static int smiapp_probe(struct i2c_client *client)
 	}
 
 	if (CCS_LIM(sensor, BINNING_CAPABILITY)) {
-		u32 val;
-
-		rval = smiapp_read(sensor,
-				   SMIAPP_REG_U8_BINNING_SUBTYPES, &val);
-		if (rval < 0) {
-			rval = -ENODEV;
-			goto out_free_ccs_limits;
-		}
-		sensor->nbinning_subtypes = min_t(u8, val,
-						  SMIAPP_BINNING_SUBTYPES);
+		sensor->nbinning_subtypes =
+			min_t(u8, CCS_LIM(sensor, BINNING_SUB_TYPES),
+			      CCS_LIM_BINNING_SUB_TYPE_MAX_N);
 
 		for (i = 0; i < sensor->nbinning_subtypes; i++) {
-			rval = smiapp_read(
-				sensor, SMIAPP_REG_U8_BINNING_TYPE_n(i), &val);
-			if (rval < 0) {
-				rval = -ENODEV;
-				goto out_free_ccs_limits;
-			}
-			sensor->binning_subtypes[i] =
-				*(struct smiapp_binning_subtype *)&val;
+			sensor->binning_subtypes[i].horizontal =
+				CCS_LIM_AT(sensor, BINNING_SUB_TYPE, i) >>
+				CCS_BINNING_SUB_TYPE_COLUMN_SHIFT;
+			sensor->binning_subtypes[i].vertical =
+				CCS_LIM_AT(sensor, BINNING_SUB_TYPE, i) &
+				CCS_BINNING_SUB_TYPE_ROW_MASK;
 
 			dev_dbg(&client->dev, "binning %xx%x\n",
 				sensor->binning_subtypes[i].horizontal,
-- 
2.27.0

