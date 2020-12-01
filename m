Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E4F2CA8B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390189AbgLAQtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:22 -0500
Received: from retiisi.eu ([95.216.213.190]:50080 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388184AbgLAQtV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:49:21 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4A80B634CBF;
        Tue,  1 Dec 2020 18:45:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 24/30] ccs: Clean up runtime PM usage
Date:   Tue,  1 Dec 2020 18:42:40 +0200
Message-Id: <20201201164246.18003-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
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
index 5e01f22608d7..c3023570a620 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1625,8 +1625,6 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 
 	rval = pm_runtime_get_sync(&client->dev);
 	if (rval < 0) {
-		if (rval != -EBUSY && rval != -EAGAIN)
-			pm_runtime_set_active(&client->dev);
 		pm_runtime_put_noidle(&client->dev);
 
 		return rval;
@@ -2842,9 +2840,8 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 
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

