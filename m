Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423362CA8A2
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388848AbgLAQsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:48:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388811AbgLAQsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 11:48:00 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9DFC0613D4
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 08:46:20 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 89DD7634C8B;
        Tue,  1 Dec 2020 18:45:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 03/30] ccs: Add CCS ACPI device ID
Date:   Tue,  1 Dec 2020 18:42:19 +0200
Message-Id: <20201201164246.18003-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CCS compliant sensors use device ID "MIPI0200". Use this id for ACPI
device matching.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1d365da570a6..bb712d71b8c8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3247,6 +3247,12 @@ static const struct ccs_device smia_device = {
 
 static const struct ccs_device ccs_device = {};
 
+static const struct acpi_device_id ccs_acpi_table[] = {
+	{ .id = "MIPI0200", .driver_data = (unsigned long)&ccs_device },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, ccs_acpi_table);
+
 static const struct of_device_id ccs_of_table[] = {
 	{ .compatible = "mipi-ccs-1.1", .data = &ccs_device },
 	{ .compatible = "mipi-ccs-1.0", .data = &ccs_device },
@@ -3269,6 +3275,7 @@ static const struct dev_pm_ops ccs_pm_ops = {
 
 static struct i2c_driver ccs_i2c_driver = {
 	.driver	= {
+		.acpi_match_table = ccs_acpi_table,
 		.of_match_table = ccs_of_table,
 		.name = CCS_NAME,
 		.pm = &ccs_pm_ops,
-- 
2.27.0

