Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D671285AD6
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgJGIqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:04 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57038 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbgJGIqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:03 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7E9A0634CA4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 028/106] ccs: Add MIPI CCS compatible strings
Date:   Wed,  7 Oct 2020 11:44:41 +0300
Message-Id: <20201007084557.25843-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add "mipi-ccs-1.0" and "mipi-ccs-1.1" compatible strings to the CCS
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 775037ce361f..e348f55c62a6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3236,6 +3236,9 @@ static int ccs_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id ccs_of_table[] = {
+	{ .compatible = "mipi-ccs-1.1" },
+	{ .compatible = "mipi-ccs-1.0" },
+	{ .compatible = "mipi-ccs" },
 	{ .compatible = "nokia,smia" },
 	{ },
 };
-- 
2.27.0

