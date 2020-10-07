Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28394285AF4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgJGIq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgJGIqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:20 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 71C10634D16
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:23 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 106/106] ccs: Add CCS ACPI device ID
Date:   Wed,  7 Oct 2020 11:45:57 +0300
Message-Id: <20201007084557.25843-97-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index 10ed3d01af16..297c5373a305 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3604,6 +3604,12 @@ static const struct ccs_device smia_device = {
 
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
@@ -3620,6 +3626,7 @@ static const struct dev_pm_ops ccs_pm_ops = {
 
 static struct i2c_driver ccs_i2c_driver = {
 	.driver	= {
+		.acpi_match_table = ccs_acpi_table,
 		.of_match_table = ccs_of_table,
 		.name = CCS_NAME,
 		.pm = &ccs_pm_ops,
-- 
2.27.0

