Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A84F2D1BFE
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgLGVZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:08 -0500
Received: from retiisi.eu ([95.216.213.190]:34620 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgLGVZH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:07 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 72A8C634CA1;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 16/24] ccs: Only do software reset if we have no hardware reset
Date:   Mon,  7 Dec 2020 23:15:22 +0200
Message-Id: <20201207211530.21180-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver always used software reset after the sensor's power sequence
that includes a hardware reset if we have a reset GPIO. Do not use
software reset if we just brought the sensor up from hardware reset state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index da7a6bd2c820..fdf2e83eeac3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1552,10 +1552,12 @@ static int ccs_power_on(struct device *dev)
 	 * is found.
 	 */
 
-	rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
-	if (rval < 0) {
-		dev_err(dev, "software reset failed\n");
-		goto out_cci_addr_fail;
+	if (!sensor->reset && !sensor->xshutdown) {
+		rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
+		if (rval < 0) {
+			dev_err(dev, "software reset failed\n");
+			goto out_cci_addr_fail;
+		}
 	}
 
 	if (sensor->hwcfg.i2c_addr_alt) {
-- 
2.29.2

