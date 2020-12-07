Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2822D2D1C12
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgLGV0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgLGV0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:51 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EF4C0611CD
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:24 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 82069634CA3;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 17/24] ccs: Wait until software reset is done
Date:   Mon,  7 Dec 2020 23:15:23 +0200
Message-Id: <20201207211530.21180-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Verify the software reset has been completed until proceeding.

The spec does not guarantee a delay but presumably 100 ms should be
enough.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index fdf2e83eeac3..e1b3c5693e01 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1553,11 +1553,26 @@ static int ccs_power_on(struct device *dev)
 	 */
 
 	if (!sensor->reset && !sensor->xshutdown) {
+		u8 retry = 100;
+		u32 reset;
+
 		rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
 		if (rval < 0) {
 			dev_err(dev, "software reset failed\n");
 			goto out_cci_addr_fail;
 		}
+
+		do {
+			rval = ccs_read(sensor, SOFTWARE_RESET, &reset);
+			reset = !rval && reset == CCS_SOFTWARE_RESET_OFF;
+			if (reset)
+				break;
+
+			usleep_range(1000, 2000);
+		} while (--retry);
+
+		if (!reset)
+			return -EIO;
 	}
 
 	if (sensor->hwcfg.i2c_addr_alt) {
-- 
2.29.2

