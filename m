Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BDE2B7CE0
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgKRLij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:39 -0500
Received: from retiisi.eu ([95.216.213.190]:53508 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbgKRLic (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:32 -0500
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6C3F6634CCA;
        Wed, 18 Nov 2020 13:38:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 18/29] smiapp: Differentiate CCS sensors from SMIA in subdev naming
Date:   Wed, 18 Nov 2020 13:31:00 +0200
Message-Id: <20201118113111.2548-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call CCS compliant sensors as "ccs" instead of "smiapp" in absence of a
device specific name. This is done based on the value of the manufacturer
ID register that is only present in CCS.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/ccs-core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/smiapp/ccs-core.c b/drivers/media/i2c/smiapp/ccs-core.c
index f9dbf1407a33..30c4d8edce9d 100644
--- a/drivers/media/i2c/smiapp/ccs-core.c
+++ b/drivers/media/i2c/smiapp/ccs-core.c
@@ -2437,8 +2437,6 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 	unsigned int i;
 	int rval = 0;
 
-	minfo->name = SMIAPP_NAME;
-
 	/* Module info */
 	rval = ccs_read(sensor, MODULE_MANUFACTURER_ID,
 			&minfo->mipi_manufacturer_id);
@@ -2528,15 +2526,18 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		"sensor revision 0x%2.2x firmware version 0x%2.2x\n",
 		minfo->sensor_revision_number, minfo->sensor_firmware_version);
 
-	if (minfo->ccs_version)
+	if (minfo->ccs_version) {
 		dev_dbg(&client->dev, "MIPI CCS version %u.%u",
 			(minfo->ccs_version & CCS_MIPI_CCS_VERSION_MAJOR_MASK)
 			>> CCS_MIPI_CCS_VERSION_MAJOR_SHIFT,
 			(minfo->ccs_version & CCS_MIPI_CCS_VERSION_MINOR_MASK));
-	else
+		minfo->name = CCS_NAME;
+	} else {
 		dev_dbg(&client->dev,
 			"smia version %2.2d smiapp version %2.2d\n",
 			minfo->smia_version, minfo->smiapp_version);
+		minfo->name = SMIAPP_NAME;
+	}
 
 	/*
 	 * Some modules have bad data in the lvalues below. Hope the
-- 
2.27.0

