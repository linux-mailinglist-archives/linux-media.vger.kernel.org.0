Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F9467B8B7
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 18:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbjAYRhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 12:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236068AbjAYRhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 12:37:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE384B75C
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 09:37:35 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 386FB1204;
        Wed, 25 Jan 2023 18:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674668250;
        bh=lsOhnBsueJT5+Vnq0iApg4VIEcToEChO3dFh+KQmPoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZPitwvscySt5z5wIoPXOeyCVM8n5dYFKxwSSfbLVWhJVENg3kkE43cr5To276sTo7
         zCDA8x+bPxRFSiO1BW/c703b5bdGq3JEafYZAUBFMmFDLPYctPjhaqRsybSMAXjSIm
         oa/fUGbzXFXXVOrcE2DFGMAkFLa24+p+9llxVqLI=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v4 2/8] media: i2c: ov5670: Allow probing with OF
Date:   Wed, 25 Jan 2023 18:37:01 +0100
Message-Id: <20230125173707.127687-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
References: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5670 driver currently only supports probing using ACPI matching.
Add support for OF and add a missing header inclusion.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index bc9fc3bc90c2..07a396c8ab68 100644
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
@@ -2583,11 +2585,18 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
 #endif
 
+static const struct of_device_id ov5670_of_ids[] = {
+	{ .compatible = "ovti,ov5670" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov5670_of_ids);
+
 static struct i2c_driver ov5670_i2c_driver = {
 	.driver = {
 		.name = "ov5670",
 		.pm = &ov5670_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
+		.of_match_table = ov5670_of_ids,
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
-- 
2.39.0

