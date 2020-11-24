Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E0D2C21AB
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbgKXJia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:30 -0500
Received: from retiisi.eu ([95.216.213.190]:44958 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731197AbgKXJi3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:29 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E80E0634C87;
        Tue, 24 Nov 2020 11:37:50 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 01/30] ccs: Add MIPI CCS compatible strings
Date:   Tue, 24 Nov 2020 11:31:57 +0200
Message-Id: <20201124093226.23737-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index 69e7990c65f3..64bad5b678a3 100644
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

