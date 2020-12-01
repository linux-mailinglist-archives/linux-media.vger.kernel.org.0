Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CF22CA8BD
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404024AbgLAQtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404017AbgLAQts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 11:49:48 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B6C061A4A
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 08:48:08 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 70CE7634CC1;
        Tue,  1 Dec 2020 18:45:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 26/30] =?UTF-8?q?ccs:=20Use=20longer=20pre-I=C2=B2C=20s?= =?UTF-8?q?leep=20for=20CCS=20compliant=20devices?=
Date:   Tue,  1 Dec 2020 18:42:42 +0200
Message-Id: <20201201164246.18003-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
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
index 863295b8fb5c..5014aa0d7969 100644
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

