Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063784D47BA
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240534AbiCJNJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiCJNJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:49 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD0444771
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:48 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 79F412000E;
        Thu, 10 Mar 2022 13:08:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Date:   Thu, 10 Mar 2022 14:08:25 +0100
Message-Id: <20220310130829.96001-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5670 driver currently only supports probing using ACPI matching.
Add support for OF and add a missing header inclusion.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 02f75c18e480..39786f3c9489 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -3,7 +3,9 @@
 
 #include <linux/acpi.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -2583,6 +2585,12 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
 };
 
 MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
+#elif defined CONFIG_OF
+static const struct of_device_id ov5670_of_ids[] = {
+	{ .compatible = "ovti,ov5670" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov5670_of_ids);
 #endif
 
 static struct i2c_driver ov5670_i2c_driver = {
@@ -2590,6 +2598,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 		.name = "ov5670",
 		.pm = &ov5670_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
+		.of_match_table = of_match_ptr(ov5670_of_ids),
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
-- 
2.35.1

