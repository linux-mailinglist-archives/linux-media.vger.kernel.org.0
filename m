Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CA12C21A9
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgKXJi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:28 -0500
Received: from retiisi.eu ([95.216.213.190]:44936 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731143AbgKXJi1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:27 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0B45F634C89;
        Tue, 24 Nov 2020 11:37:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 02/30] ccs: Add device compatible identifiers for telling SMIA and CCS apart
Date:   Tue, 24 Nov 2020 11:31:58 +0200
Message-Id: <20201124093226.23737-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index 64bad5b678a3..1d365da570a6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -58,6 +58,12 @@ static const struct ccs_module_ident ccs_module_idents[] = {
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
@@ -3235,11 +3241,17 @@ static int ccs_remove(struct i2c_client *client)
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

