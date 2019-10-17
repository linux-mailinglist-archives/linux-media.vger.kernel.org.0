Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E191EDAB1B
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406226AbfJQLWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39728 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405615AbfJQLWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:17 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 37236634C8B
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/7] smiapp: Don't update sensor configuration during power-on init
Date:   Thu, 17 Oct 2019 14:18:52 +0300
Message-Id: <20191017111856.10270-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
References: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor configuration since it was previously powered off was not
changed, so no need to update the PLL configuration etc. What is necessary
though is to re-apply the configuration to the sensor's registers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index edaeebaada79..5fc3bcc6def0 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1267,10 +1267,6 @@ static int smiapp_power_on(struct device *dev)
 		rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
 		if (rval)
 			goto out_cci_addr_fail;
-
-		rval = smiapp_update_mode(sensor);
-		if (rval < 0)
-			goto out_cci_addr_fail;
 	}
 
 	mutex_unlock(&sensor->mutex);
-- 
2.20.1

