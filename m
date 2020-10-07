Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD2F285B30
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgJGIrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgJGIqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:02 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6E8C0613D2
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 01:46:02 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1BBF5634C99
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 016/106] smiapp: Differentiate CCS sensors from SMIA in subdev naming
Date:   Wed,  7 Oct 2020 11:44:36 +0300
Message-Id: <20201007084557.25843-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index dd093a7d2ef4..c82e311d2661 100644
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

