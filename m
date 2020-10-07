Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687FC285B26
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgJGIrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:09 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57060 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 796E4634CCC
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 039/106] ccs: Refactor register reading a little
Date:   Wed,  7 Oct 2020 11:44:52 +0300
Message-Id: <20201007084557.25843-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework quirk and 8-bit only access functions with a single function that
takes arguments. This is later extensible to support yet more flags.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 37 ++++++++++++--------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index a8e9a235bfb3..abec746f3c93 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -168,39 +168,36 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
-int ccs_read_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val)
-{
-	return __ccs_read_addr(
-		sensor, reg, val,
-		ccs_needs_quirk(sensor, CCS_QUIRK_FLAG_8BIT_READ_ONLY));
-}
-
-static int ccs_read_addr_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val,
-			       bool force8)
+static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
+			     bool force8, bool quirk)
 {
 	int rval;
 
-	*val = 0;
-	rval = ccs_call_quirk(sensor, reg_access, false, &reg, val);
-	if (rval == -ENOIOCTLCMD)
-		return 0;
-	if (rval < 0)
-		return rval;
+	if (quirk) {
+		*val = 0;
+		rval = ccs_call_quirk(sensor, reg_access, false, &reg, val);
+		if (rval == -ENOIOCTLCMD)
+			return 0;
+		if (rval < 0)
+			return rval;
 
-	if (force8)
-		return __ccs_read_addr(sensor, reg, val, true);
+		if (force8)
+			return __ccs_read_addr(sensor, reg, val, true);
+	}
 
-	return ccs_read_addr_no_quirk(sensor, reg, val);
+	return __ccs_read_addr(sensor, reg, val,
+			       ccs_needs_quirk(sensor,
+					       CCS_QUIRK_FLAG_8BIT_READ_ONLY));
 }
 
 int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_quirk(sensor, reg, val, false);
+	return ccs_read_addr_raw(sensor, reg, val, false, true);
 }
 
 int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	return ccs_read_addr_quirk(sensor, reg, val, true);
+	return ccs_read_addr_raw(sensor, reg, val, true, true);
 }
 
 int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
-- 
2.27.0

