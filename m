Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F1527ECAC
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbgI3P3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44680 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731077AbgI3P3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A734E634D10
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 100/100] smiapp: Add CCS ACPI device ID
Date:   Wed, 30 Sep 2020 18:28:58 +0300
Message-Id: <20200930152858.8471-101-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index d2ffb48c9a30..313754515165 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3596,6 +3596,12 @@ static const struct ccs_device smia_device = {
 
 static const struct ccs_device ccs_device = {};
 
+static const struct acpi_device_id ccs_acpi_table[] = {
+	{ .id = "MIPI0200", .driver_data = (unsigned long)&ccs_device },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, ccs_acpi_table);
+
 static const struct of_device_id ccs_of_table[] = {
 	{ .compatible = "nokia,smia", .data = &smia_device },
 	{ .compatible = "mipi,ccs", .data = &ccs_device },
@@ -3610,6 +3616,7 @@ static const struct dev_pm_ops ccs_pm_ops = {
 
 static struct i2c_driver ccs_i2c_driver = {
 	.driver	= {
+		.acpi_match_table = ccs_acpi_table,
 		.of_match_table = ccs_of_table,
 		.name = CCS_NAME,
 		.pm = &ccs_pm_ops,
-- 
2.27.0

