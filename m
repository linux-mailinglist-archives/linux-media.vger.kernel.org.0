Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5182285B1E
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgJGIrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:03 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbgJGIqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:08 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 52ED3634CD7
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 048/106] ccs: Clean up runtime PM usage
Date:   Wed,  7 Oct 2020 11:45:01 +0300
Message-Id: <20201007084557.25843-41-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If pm_runtime_get_sync() fails, there's no need to set the device active
again. Also, in the same case to return the usage_count to zero,
pm_runtime_put_noidle() is enough.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6c2f18abc921..b762f16531df 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1619,8 +1619,6 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 
 	rval = pm_runtime_get_sync(&client->dev);
 	if (rval < 0) {
-		if (rval != -EBUSY && rval != -EAGAIN)
-			pm_runtime_set_active(&client->dev);
 		pm_runtime_put_noidle(&client->dev);
 
 		return rval;
@@ -2836,9 +2834,8 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 
 	rval = pm_runtime_get_sync(dev);
 	if (rval < 0) {
-		if (rval != -EBUSY && rval != -EAGAIN)
-			pm_runtime_set_active(&client->dev);
-		pm_runtime_put(dev);
+		pm_runtime_put_noidle(dev);
+
 		return -EAGAIN;
 	}
 
-- 
2.27.0

