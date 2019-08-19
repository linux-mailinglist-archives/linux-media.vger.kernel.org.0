Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F95923D6
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfHSMuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:50:21 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47464 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727512AbfHSMuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:50:20 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 4852B634C8C;
        Mon, 19 Aug 2019 15:49:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 5/6] smiapp: Remove the active field from sensor's struct
Date:   Mon, 19 Aug 2019 15:47:27 +0300
Message-Id: <20190819124728.10511-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The active field was used to track whether the sensor was powered when
settings its controls. This is no longer needed as runtime PM is used to
determine this instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 4 ----
 drivers/media/i2c/smiapp/smiapp-regs.c | 3 ---
 drivers/media/i2c/smiapp/smiapp.h      | 1 -
 3 files changed, 8 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 79330ec41392..76d7d204ec17 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1228,8 +1228,6 @@ static int smiapp_power_on(struct device *dev)
 	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
 	usleep_range(sleep, sleep);
 
-	sensor->active = true;
-
 	/*
 	 * Failures to respond to the address change command have been noticed.
 	 * Those failures seem to be caused by the sensor requiring a longer
@@ -1360,8 +1358,6 @@ static int smiapp_power_off(struct device *dev)
 			     SMIAPP_REG_U8_SOFTWARE_RESET,
 			     SMIAPP_SOFTWARE_RESET);
 
-	sensor->active = false;
-
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 	usleep_range(5000, 5000);
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/smiapp-regs.c
index 0470e47c2f7a..ce8c1d47fbf0 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/smiapp-regs.c
@@ -223,9 +223,6 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	     len != SMIAPP_REG_32BIT) || flags)
 		return -EINVAL;
 
-	if (!sensor->active)
-		return 0;
-
 	msg.addr = client->addr;
 	msg.flags = 0; /* Write */
 	msg.len = 2 + len;
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index ecf8a17dbe37..75e151e78617 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -198,7 +198,6 @@ struct smiapp_sensor {
 
 	u8 hvflip_inv_mask; /* H/VFLIP inversion due to sensor orientation */
 	u8 frame_skip;
-	bool active; /* is the sensor powered on? */
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
 	u16 image_start; /* image data start line */
-- 
2.20.1

