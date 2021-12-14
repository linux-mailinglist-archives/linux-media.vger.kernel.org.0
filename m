Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0BE474775
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhLNQSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:18:49 -0500
Received: from retiisi.eu ([95.216.213.190]:50618 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhLNQSs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:18:48 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1FCE6634C91;
        Tue, 14 Dec 2021 18:18:40 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 1/1] Update Intel-submitted camera sensor driver contacts
Date:   Tue, 14 Dec 2021 18:17:47 +0200
Message-Id: <20211214161747.75300-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hyungwoo's e-mail no longer works so I presume he's left the company. Drop
Hyungwoo as maintainer on ov5670 driver and remove his e-mail from other
sensor drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS                 | 1 -
 drivers/media/i2c/imx319.c  | 2 +-
 drivers/media/i2c/imx355.c  | 2 +-
 drivers/media/i2c/ov13858.c | 2 +-
 drivers/media/i2c/ov5670.c  | 2 +-
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38235471fed0..79fd8a012893 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14106,7 +14106,6 @@ F:	drivers/media/i2c/ov5647.c
 
 OMNIVISION OV5670 SENSOR DRIVER
 M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
-M:	Hyungwoo Yang <hyungwoo.yang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index daa976858e29..a2b5a34de76b 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2565,6 +2565,6 @@ module_i2c_driver(imx319_i2c_driver);
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
-MODULE_AUTHOR("Yang, Hyungwoo <hyungwoo.yang@intel.com>");
+MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx319 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cb51c81786bd..3922b9305978 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1851,6 +1851,6 @@ module_i2c_driver(imx355_i2c_driver);
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
-MODULE_AUTHOR("Yang, Hyungwoo <hyungwoo.yang@intel.com>");
+MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx355 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index b4d22f5d9933..d5fe67c763f7 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1818,6 +1818,6 @@ module_i2c_driver(ov13858_i2c_driver);
 
 MODULE_AUTHOR("Kan, Chris <chris.kan@intel.com>");
 MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
-MODULE_AUTHOR("Yang, Hyungwoo <hyungwoo.yang@intel.com>");
+MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Omnivision ov13858 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 251f459ab484..165cb34ca202 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2585,6 +2585,6 @@ static struct i2c_driver ov5670_i2c_driver = {
 module_i2c_driver(ov5670_i2c_driver);
 
 MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
-MODULE_AUTHOR("Yang, Hyungwoo <hyungwoo.yang@intel.com>");
+MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Omnivision ov5670 sensor driver");
 MODULE_LICENSE("GPL v2");
-- 
2.30.2

