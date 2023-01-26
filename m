Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A9067D244
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjAZQ7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjAZQ7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:59:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1314A233DF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:59:32 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41845D77;
        Thu, 26 Jan 2023 17:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674752368;
        bh=lsOhnBsueJT5+Vnq0iApg4VIEcToEChO3dFh+KQmPoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PlDC2kZ8l59H0QuIlLwV/qm+6QXHTiS3sB9bE/A1lANcVGGwTjLX60mQM+kkI0A9T
         y1GFLUO3klKYEk3x4N317W8vALc+CtA8kLjNBbYDtPSo+58Kaik2LGo5TLWurlVTGd
         YQ4XCQ+UlyDvkfIuQIA0S7KnYpS+r5QO2s1OK03o=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 2/9] media: i2c: ov5670: Allow probing with OF
Date:   Thu, 26 Jan 2023 17:59:02 +0100
Message-Id: <20230126165909.121302-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
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

