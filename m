Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BEA44608D
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 09:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbhKEIZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 04:25:55 -0400
Received: from retiisi.eu ([95.216.213.190]:56924 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232676AbhKEIZy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 04:25:54 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 45ED4634C91;
        Fri,  5 Nov 2021 10:23:10 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 1/1] hi846: Drop of_match_ptr() from OF device ID list
Date:   Fri,  5 Nov 2021 10:22:50 +0200
Message-Id: <20211105082250.849743-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The compatible strings can also be used on ACPI so drop of_match_ptr()
macro. This also fixes a compiler warning when the driver is compiled
without OF support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/hi846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 822ce3021fde..cf61c22f6125 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2176,7 +2176,7 @@ static struct i2c_driver hi846_i2c_driver = {
 	.driver = {
 		.name = "hi846",
 		.pm = &hi846_pm_ops,
-		.of_match_table = of_match_ptr(hi846_of_match),
+		.of_match_table = hi846_of_match,
 	},
 	.probe_new = hi846_probe,
 	.remove = hi846_remove,
-- 
2.30.2

