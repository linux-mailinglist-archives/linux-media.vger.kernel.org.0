Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE59FBC697
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440822AbfIXLXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:5191 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440814AbfIXLXI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="193418909"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id F3EEE20E69;
        Tue, 24 Sep 2019 14:23:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075M-Ax; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 3/7] smiapp: Refactor reading NVM page
Date:   Tue, 24 Sep 2019 14:23:34 +0300
Message-Id: <20190924112338.27180-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split out reading a single NVM page into a separate function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 83 ++++++++++++++------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 13f7a6315f39c..5a136068f4d60 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -970,56 +970,65 @@ static int smiapp_update_mode(struct smiapp_sensor *sensor)
  * SMIA++ NVM handling
  *
  */
-static int smiapp_read_nvm(struct smiapp_sensor *sensor,
-			   unsigned char *nvm)
+
+static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
 {
-	u32 i, s, p, np, v;
-	int rval = 0, rval2;
+	unsigned int i;
+	int rval;
 
-	np = sensor->nvm_size / SMIAPP_NVM_PAGE_SIZE;
-	for (p = 0; p < np; p++) {
-		rval = smiapp_write(
+	rval = smiapp_write(sensor,
+			    SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT, p);
+	if (rval)
+		return rval;
+
+	rval = smiapp_write(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL,
+			    SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN);
+	if (rval)
+		return rval;
+
+	for (i = 1000; i > 0; i--) {
+		u32 s;
+
+		rval = smiapp_read(
 			sensor,
-			SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT, p);
-		if (rval)
-			goto out;
+			SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS, &s);
 
-		rval = smiapp_write(sensor,
-				    SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL,
-				    SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN);
 		if (rval)
-			goto out;
+			return rval;
 
-		for (i = 1000; i > 0; i--) {
-			rval = smiapp_read(
-				sensor,
-				SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS, &s);
+		if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
+			break;
+	}
+	if (!i)
+		return -ETIMEDOUT;
 
-			if (rval)
-				goto out;
+	for (i = 0; i < SMIAPP_NVM_PAGE_SIZE; i++) {
+		u32 v;
 
-			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
-				break;
+		rval = smiapp_read(sensor,
+				   SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_0 + i,
+				   &v);
+		if (rval)
+			return rval;
 
-		}
-		if (!i) {
-			rval = -ETIMEDOUT;
-			goto out;
-		}
+		*nvm++ = v;
+	}
 
-		for (i = 0; i < SMIAPP_NVM_PAGE_SIZE; i++) {
-			rval = smiapp_read(
-				sensor,
-				SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_0 + i,
-				&v);
-			if (rval)
-				goto out;
+	return 0;
+}
 
-			*nvm++ = v;
-		}
+static int smiapp_read_nvm(struct smiapp_sensor *sensor,
+			   unsigned char *nvm)
+{
+	u32 p, np;
+	int rval = 0, rval2;
+
+	np = sensor->nvm_size / SMIAPP_NVM_PAGE_SIZE;
+	for (p = 0; p < np && !rval; p++) {
+		rval = smiapp_read_nvm_page(sensor, p, nvm);
+		nvm += SMIAPP_NVM_PAGE_SIZE;
 	}
 
-out:
 	rval2 = smiapp_write(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL, 0);
 	if (rval < 0)
 		return rval;
-- 
2.20.1

