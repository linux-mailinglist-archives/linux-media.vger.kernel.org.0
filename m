Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109FC285B29
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgJGIrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:11 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57060 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgJGIqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:04 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 90FD7634CA5
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 029/106] =?UTF-8?q?ccs:=20Remove=20the=20I=C2=B2C=20ID?= =?UTF-8?q?=20table?=
Date:   Wed,  7 Oct 2020 11:44:42 +0300
Message-Id: <20201007084557.25843-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The I²C ID table is no longer needed; remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e348f55c62a6..660d5ab2c89d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3244,12 +3244,6 @@ static const struct of_device_id ccs_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ccs_of_table);
 
-static const struct i2c_device_id ccs_id_table[] = {
-	{ SMIAPP_NAME, 0 },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, ccs_id_table);
-
 static const struct dev_pm_ops ccs_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ccs_suspend, ccs_resume)
 	SET_RUNTIME_PM_OPS(ccs_power_off, ccs_power_on, NULL)
@@ -3263,7 +3257,6 @@ static struct i2c_driver ccs_i2c_driver = {
 	},
 	.probe_new = ccs_probe,
 	.remove	= ccs_remove,
-	.id_table = ccs_id_table,
 };
 
 static int ccs_module_init(void)
-- 
2.27.0

