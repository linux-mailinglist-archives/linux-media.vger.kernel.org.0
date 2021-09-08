Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0EB403A38
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhIHNEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238011AbhIHNE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBF9C0613CF
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004mK-L7; Wed, 08 Sep 2021 15:03:16 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-0004SG-N2; Wed, 08 Sep 2021 15:03:15 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpGB-MC; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 4/6] media: allegro: add pm_runtime support
Date:   Wed,  8 Sep 2021 15:03:13 +0200
Message-Id: <20210908130315.3295253-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The allegro driver must ensure that the mcu and core clocks are enabled
and set to the expected clock rate before trying to load the firmware
and to reset the MCU.

Up until now, the driver assumed that the clocks are always enabled in
the PL (programming logic), because the xlnx_vcu driver did not export
the clocks to other drivers. This has changed and by explicitly enabling
the clocks in the driver, this assumption can be dropped.

It might even be possible to disable the clocks for the encoder if the
encoder is not used. However, the behavior is not documented and it
might be necessary to reinitialize the encoder after deactivating the
clocks. Play it safe by sticking to the current behavior.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 85 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 2663d9da0522..3deece8176eb 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/gcd.h>
 #include <linux/interrupt.h>
@@ -18,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -140,6 +142,9 @@ struct allegro_dev {
 	struct regmap *sram;
 	struct regmap *settings;
 
+	struct clk *clk_core;
+	struct clk *clk_mcu;
+
 	const struct fw_info *fw_info;
 	struct allegro_buffer firmware;
 	struct allegro_buffer suballocator;
@@ -3604,11 +3609,16 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 	v4l2_info(&dev->v4l2_dev,
 		  "using mcu firmware version '%s'\n", dev->fw_info->version);
 
+	pm_runtime_enable(&dev->plat_dev->dev);
+	err = pm_runtime_resume_and_get(&dev->plat_dev->dev);
+	if (err)
+		goto err_release_firmware_codec;
+
 	/* Ensure that the mcu is sleeping at the reset vector */
 	err = allegro_mcu_reset(dev);
 	if (err) {
 		v4l2_err(&dev->v4l2_dev, "failed to reset mcu\n");
-		goto err_release_firmware_codec;
+		goto err_suspend;
 	}
 
 	allegro_copy_firmware(dev, fw->data, fw->size);
@@ -3650,6 +3660,9 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 	allegro_mcu_hw_deinit(dev);
 err_free_fw_codec:
 	allegro_free_fw_codec(dev);
+err_suspend:
+	pm_runtime_put(&dev->plat_dev->dev);
+	pm_runtime_disable(&dev->plat_dev->dev);
 err_release_firmware_codec:
 	release_firmware(fw_codec);
 err_release_firmware:
@@ -3728,6 +3741,14 @@ static int allegro_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->settings))
 		dev_warn(&pdev->dev, "failed to open settings\n");
 
+	dev->clk_core = devm_clk_get(&pdev->dev, "core_clk");
+	if (IS_ERR(dev->clk_core))
+		return PTR_ERR(dev->clk_core);
+
+	dev->clk_mcu = devm_clk_get(&pdev->dev, "mcu_clk");
+	if (IS_ERR(dev->clk_mcu))
+		return PTR_ERR(dev->clk_mcu);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -3768,11 +3789,67 @@ static int allegro_remove(struct platform_device *pdev)
 		allegro_free_fw_codec(dev);
 	}
 
+	pm_runtime_put(&dev->plat_dev->dev);
+	pm_runtime_disable(&dev->plat_dev->dev);
+
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	return 0;
 }
 
+static int allegro_runtime_resume(struct device *device)
+{
+	struct allegro_dev *dev = dev_get_drvdata(device);
+	struct regmap *settings = dev->settings;
+	unsigned int clk_mcu;
+	unsigned int clk_core;
+	int err;
+
+	if (!settings)
+		return -EINVAL;
+
+#define MHZ_TO_HZ(freq) ((freq) * 1000 * 1000)
+
+	err = regmap_read(settings, VCU_CORE_CLK, &clk_core);
+	if (err < 0)
+		return err;
+	err = clk_set_rate(dev->clk_core, MHZ_TO_HZ(clk_core));
+	if (err < 0)
+		return err;
+	err = clk_prepare_enable(dev->clk_core);
+	if (err)
+		return err;
+
+	err = regmap_read(settings, VCU_MCU_CLK, &clk_mcu);
+	if (err < 0)
+		goto disable_clk_core;
+	err = clk_set_rate(dev->clk_mcu, MHZ_TO_HZ(clk_mcu));
+	if (err < 0)
+		goto disable_clk_core;
+	err = clk_prepare_enable(dev->clk_mcu);
+	if (err)
+		goto disable_clk_core;
+
+#undef MHZ_TO_HZ
+
+	return 0;
+
+disable_clk_core:
+	clk_disable_unprepare(dev->clk_core);
+
+	return err;
+}
+
+static int allegro_runtime_suspend(struct device *device)
+{
+	struct allegro_dev *dev = dev_get_drvdata(device);
+
+	clk_disable_unprepare(dev->clk_mcu);
+	clk_disable_unprepare(dev->clk_core);
+
+	return 0;
+}
+
 static const struct of_device_id allegro_dt_ids[] = {
 	{ .compatible = "allegro,al5e-1.1" },
 	{ /* sentinel */ }
@@ -3780,12 +3857,18 @@ static const struct of_device_id allegro_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, allegro_dt_ids);
 
+static const struct dev_pm_ops allegro_pm_ops = {
+	.runtime_resume = allegro_runtime_resume,
+	.runtime_suspend = allegro_runtime_suspend,
+};
+
 static struct platform_driver allegro_driver = {
 	.probe = allegro_probe,
 	.remove = allegro_remove,
 	.driver = {
 		.name = "allegro",
 		.of_match_table = of_match_ptr(allegro_dt_ids),
+		.pm = &allegro_pm_ops,
 	},
 };
 
-- 
2.30.2

