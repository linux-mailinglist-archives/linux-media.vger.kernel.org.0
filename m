Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DEC27ECD3
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgI3P35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:57 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730986AbgI3P3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:09 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7D3E7634C93
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 046/100] ccs: Clean up runtime PM usage
Date:   Wed, 30 Sep 2020 18:28:04 +0300
Message-Id: <20200930152858.8471-47-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index bc3443a9f563..474cfc8e0c7e 100644
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

