Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5E02C21AA
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731474AbgKXJi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:29 -0500
Received: from retiisi.eu ([95.216.213.190]:44952 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731160AbgKXJi2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:28 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2D4A8634C8C;
        Tue, 24 Nov 2020 11:37:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 04/30] =?UTF-8?q?ccs:=20Remove=20the=20I=C2=B2C=20ID=20tab?= =?UTF-8?q?le?=
Date:   Tue, 24 Nov 2020 11:32:00 +0200
Message-Id: <20201124093226.23737-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index bb712d71b8c8..bb3759e2534c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3262,12 +3262,6 @@ static const struct of_device_id ccs_of_table[] = {
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
@@ -3282,7 +3276,6 @@ static struct i2c_driver ccs_i2c_driver = {
 	},
 	.probe_new = ccs_probe,
 	.remove	= ccs_remove,
-	.id_table = ccs_id_table,
 };
 
 static int ccs_module_init(void)
-- 
2.27.0

