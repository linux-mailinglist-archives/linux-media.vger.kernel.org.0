Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594F3BC69E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504654AbfIXLXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:38145 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504517AbfIXLXM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:09 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="213654954"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:09 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0F16920E80;
        Tue, 24 Sep 2019 14:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075S-Cv; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 5/7] smiapp: Don't poll for NVM ready on devices that don't need it
Date:   Tue, 24 Sep 2019 14:23:36 +0300
Message-Id: <20190924112338.27180-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only some devices require polling for NVM ready. Do the polling only on
devices that need it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 28 ++++++++++++++++----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 5a136068f4d60..5a04ae2544aa0 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -986,21 +986,27 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
 	if (rval)
 		return rval;
 
-	for (i = 1000; i > 0; i--) {
-		u32 s;
+	if (sensor->limits[SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY] &
+	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_POLL) {
+		for (i = 1000; i > 0; i--) {
+			u32 s;
 
-		rval = smiapp_read(
-			sensor,
-			SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS, &s);
+			rval = smiapp_read(
+				sensor,
+				SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS,
+				&s);
 
-		if (rval)
-			return rval;
+			if (rval)
+				return rval;
 
-		if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
-			break;
+			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
+				break;
+
+		}
+
+		if (!i)
+			return -ETIMEDOUT;
 	}
-	if (!i)
-		return -ETIMEDOUT;
 
 	for (i = 0; i < SMIAPP_NVM_PAGE_SIZE; i++) {
 		u32 v;
-- 
2.20.1

