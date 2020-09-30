Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E905C27ECCE
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbgI3P3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731000AbgI3P3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:10 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75438C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:29:10 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A9822634CD9
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 048/100] ccs: Add device compatible identifiers for telling SMIA and CCS apart
Date:   Wed, 30 Sep 2020 18:28:06 +0300
Message-Id: <20200930152858.8471-49-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device data specific to DT compatible ID to tell SMIA and CCS devices
apart already in power-up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4bc483db6001..93c0da53f03f 100644
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
@@ -3277,9 +3283,15 @@ static int ccs_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct ccs_device smia_device = {
+	.flags = CCS_DEVICE_FLAG_IS_SMIA,
+};
+
+static const struct ccs_device ccs_device = {};
+
 static const struct of_device_id ccs_of_table[] = {
-	{ .compatible = "nokia,smia" },
-	{ .compatible = "mipi,ccs" },
+	{ .compatible = "nokia,smia", .data = &smia_device },
+	{ .compatible = "mipi,ccs", .data = &ccs_device },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ccs_of_table);
-- 
2.27.0

