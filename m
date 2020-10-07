Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1E6285ADE
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgJGIqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57076 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgJGIqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:08 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7AAE8634CD9
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 050/106] ccs: Add device compatible identifiers for telling SMIA and CCS apart
Date:   Wed,  7 Oct 2020 11:45:03 +0300
Message-Id: <20201007084557.25843-43-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device data specific to DT compatible ID to tell SMIA and CCS devices
apart already in power-up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5f1665f08b9f..940b5327a388 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -59,6 +59,12 @@ static const struct ccs_module_ident ccs_module_idents[] = {
 	CCS_IDENT_LQ(0x10, 0x4241, -1, "imx125es", &smiapp_imx125es_quirk),
 };
 
+#define CCS_DEVICE_FLAG_IS_SMIA		BIT(0)
+
+struct ccs_device {
+	unsigned char flags;
+};
+
 /*
  *
  * Dynamic Capability Identification
@@ -3276,11 +3282,17 @@ static int ccs_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct ccs_device smia_device = {
+	.flags = CCS_DEVICE_FLAG_IS_SMIA,
+};
+
+static const struct ccs_device ccs_device = {};
+
 static const struct of_device_id ccs_of_table[] = {
-	{ .compatible = "mipi-ccs-1.1" },
-	{ .compatible = "mipi-ccs-1.0" },
-	{ .compatible = "mipi-ccs" },
-	{ .compatible = "nokia,smia" },
+	{ .compatible = "mipi-ccs-1.1", .data = &ccs_device },
+	{ .compatible = "mipi-ccs-1.0", .data = &ccs_device },
+	{ .compatible = "mipi-ccs", .data = &ccs_device },
+	{ .compatible = "nokia,smia", .data = &smia_device },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ccs_of_table);
-- 
2.27.0

