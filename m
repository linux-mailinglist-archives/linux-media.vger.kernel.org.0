Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CE627ECD2
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731142AbgI3P35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:57 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730988AbgI3P3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:10 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id BD4E4634C92
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 049/100] =?UTF-8?q?ccs:=20Use=20longer=20pre-I=C2=B2C=20sl?= =?UTF-8?q?eep=20for=20CCS=20compliant=20devices?=
Date:   Wed, 30 Sep 2020 18:28:07 +0300
Message-Id: <20200930152858.8471-50-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Longer idle period is required on I²C bus before the first transaction
after lifting xshutdown.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 93c0da53f03f..a99022e8de25 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1300,6 +1300,7 @@ static int ccs_power_on(struct device *dev)
 	 */
 	struct ccs_sensor *sensor =
 		container_of(ssd, struct ccs_sensor, ssds[0]);
+	const struct ccs_device *ccsdev = device_get_match_data(dev);
 	unsigned int sleep;
 	int rval;
 
@@ -1320,7 +1321,11 @@ static int ccs_power_on(struct device *dev)
 	gpiod_set_value(sensor->reset, 0);
 	gpiod_set_value(sensor->xshutdown, 1);
 
-	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
+	if (ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA)
+		sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
+	else
+		sleep = 5000;
+
 	usleep_range(sleep, sleep);
 
 	/*
-- 
2.27.0

