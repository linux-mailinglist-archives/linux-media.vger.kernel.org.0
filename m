Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCAE4D890D
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242997AbiCNQ2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242998AbiCNQ2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:42 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49A9BC06
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:27:31 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 27165240016;
        Mon, 14 Mar 2022 16:27:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v2 2/8] media: i2c: ov5670: Allow probing with OF
Date:   Mon, 14 Mar 2022 17:27:08 +0100
Message-Id: <20220314162714.153970-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314162714.153970-1-jacopo@jmondi.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5670 driver currently only supports probing using ACPI matching.
Add support for OF and add a missing header inclusion.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 02f75c18e480..721441024598 100644
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
@@ -2585,11 +2587,20 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id ov5670_of_ids[] = {
+	{ .compatible = "ovti,ov5670" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov5670_of_ids);
+#endif
+
 static struct i2c_driver ov5670_i2c_driver = {
 	.driver = {
 		.name = "ov5670",
 		.pm = &ov5670_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
+		.of_match_table = of_match_ptr(ov5670_of_ids),
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
-- 
2.35.1

