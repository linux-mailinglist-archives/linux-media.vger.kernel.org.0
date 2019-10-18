Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45E6DD0F1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 23:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634617AbfJRVOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 17:14:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55658 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394316AbfJRVOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 17:14:10 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 82548634C87
        for <linux-media@vger.kernel.org>; Sat, 19 Oct 2019 00:13:34 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] smiapp: Destroy sensor's mutex
Date:   Sat, 19 Oct 2019 00:10:48 +0300
Message-Id: <20191018211048.8575-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Destroy the mutex initialised by the driver in probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 24f4197cf7ad..1756c9e640b5 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2854,7 +2854,6 @@ static int smiapp_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	sensor->hwcfg = hwcfg;
-	mutex_init(&sensor->mutex);
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
 	v4l2_i2c_subdev_init(&sensor->src->sd, client, &smiapp_ops);
@@ -2918,6 +2917,8 @@ static int smiapp_probe(struct i2c_client *client)
 	if (rval < 0)
 		return rval;
 
+	mutex_init(&sensor->mutex);
+
 	rval = smiapp_identify_module(sensor);
 	if (rval) {
 		rval = -ENODEV;
@@ -3111,6 +3112,7 @@ static int smiapp_probe(struct i2c_client *client)
 
 out_power_off:
 	smiapp_power_off(&client->dev);
+	mutex_destroy(&sensor->mutex);
 
 	return rval;
 }
@@ -3133,6 +3135,7 @@ static int smiapp_remove(struct i2c_client *client)
 		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 	}
 	smiapp_cleanup(sensor);
+	mutex_destroy(&sensor->mutex);
 
 	return 0;
 }
-- 
2.20.1

