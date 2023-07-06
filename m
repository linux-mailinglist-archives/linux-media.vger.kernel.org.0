Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9106574A041
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 16:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbjGFO66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 10:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjGFO6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 10:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B18E8F
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688655482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wtCBMSK1n2sPm2JQyfppT4f8AyynMBzRpqgk+4OELvg=;
        b=eVpi9oBVaUypYtwCkl5u1uJymdMwTjA7QAA21DkkTff4uhY2YH7epCpK2vMrIkPKWEFzZd
        xQd8u/srsSemfX5hAZKfyJInlMFN/EAv9e7z8fBv2tJY3UuBPQH9Qzud3pwYYjc+BglCG7
        H2gaQ0CXgARimY0svf/C1Zl24j8PiOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-Czc6WoQeOBu9krCxQ_XBjQ-1; Thu, 06 Jul 2023 10:57:59 -0400
X-MC-Unique: Czc6WoQeOBu9krCxQ_XBjQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CB702812972;
        Thu,  6 Jul 2023 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8E4344CD0CF;
        Thu,  6 Jul 2023 14:57:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>
Subject: [PATCH v4 1/1] media: i2c: Add driver for DW9719 VCM
Date:   Thu,  6 Jul 2023 16:57:45 +0200
Message-ID: <20230706145745.115719-2-hdegoede@redhat.com>
In-Reply-To: <20230706145745.115719-1-hdegoede@redhat.com>
References: <20230706145745.115719-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Scally <djrscally@gmail.com>

Add a driver for the DW9719 VCM. The driver creates a v4l2 subdevice
and registers a control to set the desired focus.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4 (Hans de Goede)
- Back to a standalone patch again (instead of being part of a series)
- Switch to using CCI helpers for register access
- Use new DEFINE_RUNTIME_DEV_PM_OPS() for pm-ops
- Make v4l2_subdev first member of dw9719_device
- Drop v4l2_ctrl_handler_init() ret value check
- Turn of VCM on dw9719_remove() if necessary

Changes in v3 (Hans de Goede)
- New patch in v3 of this series based on Dan Scally's initial
  DW9719 upstream submission:
  https://lore.kernel.org/all/20211128232115.38833-1-djrscally@gmail.com/
- Drop hack to enable "vsio" regulator, this is no longer necessary
  now that there is a device-link making the VCM a runtime-pm consumer
  of the sensor
- Add checking of device-properties for sac-mode and vcm-freq,
  as requested by Sakari, this is done similar to the dw9768:
  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
  Note no devicetree binding doc is added since currently only
  i2c_device_id enumeration (instantiated by IPU bridge) is
  supported
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  12 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/dw9719.c | 348 +++++++++++++++++++++++++++++++++++++
 4 files changed, 368 insertions(+)
 create mode 100644 drivers/media/i2c/dw9719.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 494682dd437f..cf8e799f6ea2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6266,6 +6266,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
 F:	drivers/media/i2c/dw9714.c
 
+DONGWOON DW9719 LENS VOICE COIL DRIVER
+M:	Daniel Scally <djrscally@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/i2c/dw9719.c
+
 DONGWOON DW9768 LENS VOICE COIL DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 26dc365365d8..9f2331e9836a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -875,6 +875,18 @@ config VIDEO_DW9714
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_DW9719
+	tristate "DW9719 lens voice coil support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
+	select V4L2_CCI_I2C
+	help
+	  This is a driver for the DW9719 camera lens voice coil.
+	  This is designed for linear control of voice coil motors,
+	  controlled via I2C serial interface.
+
 config VIDEO_DW9768
 	tristate "DW9768 lens voice coil support"
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d175a2e2fb19..745f8d07e649 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_VIDEO_DS90UB913) += ds90ub913.o
 obj-$(CONFIG_VIDEO_DS90UB953) += ds90ub953.o
 obj-$(CONFIG_VIDEO_DS90UB960) += ds90ub960.o
 obj-$(CONFIG_VIDEO_DW9714) += dw9714.o
+obj-$(CONFIG_VIDEO_DW9719) += dw9719.o
 obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
new file mode 100644
index 000000000000..d8975b5bcfa9
--- /dev/null
+++ b/drivers/media/i2c/dw9719.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2012 Intel Corporation
+
+/*
+ * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in this repo:
+ * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#define DW9719_MAX_FOCUS_POS	1023
+#define DW9719_CTRL_STEPS	16
+#define DW9719_CTRL_DELAY_US	1000
+
+#define DW9719_INFO			CCI_REG8(0)
+#define DW9719_ID			0xF1
+
+#define DW9719_CONTROL			CCI_REG8(2)
+#define DW9719_ENABLE_RINGING		0x02
+
+#define DW9719_VCM_CURRENT		CCI_REG16(3)
+
+#define DW9719_MODE			CCI_REG8(6)
+#define DW9719_MODE_SAC_SHIFT		4
+#define DW9719_MODE_SAC3		4
+
+#define DW9719_VCM_FREQ			CCI_REG8(7)
+#define DW9719_DEFAULT_VCM_FREQ		0x60
+
+#define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
+
+struct dw9719_device {
+	struct v4l2_subdev sd;
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator *regulator;
+	u32 sac_mode;
+	u32 vcm_freq;
+
+	struct dw9719_v4l2_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *focus;
+	} ctrls;
+};
+
+static int dw9719_detect(struct dw9719_device *dw9719)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (val != DW9719_ID) {
+		dev_err(dw9719->dev, "Failed to detect correct id\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int dw9719_power_down(struct dw9719_device *dw9719)
+{
+	return regulator_disable(dw9719->regulator);
+}
+
+static int dw9719_power_up(struct dw9719_device *dw9719)
+{
+	int ret;
+
+	ret = regulator_enable(dw9719->regulator);
+
+	/* Jiggle SCL pin to wake up device */
+	cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
+
+	/* Need 100us to transit from SHUTDOWN to STANDBY*/
+	fsleep(100);
+
+	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+	cci_write(dw9719->regmap, DW9719_MODE,
+		  dw9719->sac_mode << DW9719_MODE_SAC_SHIFT, &ret);
+	cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+
+	if (ret)
+		dw9719_power_down(dw9719);
+
+	return ret;
+}
+
+static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
+{
+	return cci_write(dw9719->regmap, DW9719_VCM_CURRENT, value, NULL);
+}
+
+static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct dw9719_device *dw9719 = container_of(ctrl->handler,
+						    struct dw9719_device,
+						    ctrls.handler);
+	int ret;
+
+	/* Only apply changes to the controls if the device is powered up */
+	if (!pm_runtime_get_if_in_use(dw9719->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_FOCUS_ABSOLUTE:
+		ret = dw9719_t_focus_abs(dw9719, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	pm_runtime_put(dw9719->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops dw9719_ctrl_ops = {
+	.s_ctrl = dw9719_set_ctrl,
+};
+
+static int dw9719_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dw9719_device *dw9719 = to_dw9719_device(sd);
+	int ret;
+	int val;
+
+	for (val = dw9719->ctrls.focus->val; val >= 0;
+	     val -= DW9719_CTRL_STEPS) {
+		ret = dw9719_t_focus_abs(dw9719, val);
+		if (ret)
+			return ret;
+
+		usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US + 10);
+	}
+
+	return dw9719_power_down(dw9719);
+}
+
+static int dw9719_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dw9719_device *dw9719 = to_dw9719_device(sd);
+	int current_focus = dw9719->ctrls.focus->val;
+	int ret;
+	int val;
+
+	ret = dw9719_power_up(dw9719);
+	if (ret)
+		return ret;
+
+	for (val = current_focus % DW9719_CTRL_STEPS; val < current_focus;
+	     val += DW9719_CTRL_STEPS) {
+		ret = dw9719_t_focus_abs(dw9719, val);
+		if (ret)
+			goto err_power_down;
+
+		usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US + 10);
+	}
+
+	return 0;
+
+err_power_down:
+	dw9719_power_down(dw9719);
+	return ret;
+}
+
+static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops dw9719_internal_ops = {
+	.open = dw9719_open,
+	.close = dw9719_close,
+};
+
+static int dw9719_init_controls(struct dw9719_device *dw9719)
+{
+	const struct v4l2_ctrl_ops *ops = &dw9719_ctrl_ops;
+	int ret;
+
+	v4l2_ctrl_handler_init(&dw9719->ctrls.handler, 1);
+
+	dw9719->ctrls.focus = v4l2_ctrl_new_std(&dw9719->ctrls.handler, ops,
+						V4L2_CID_FOCUS_ABSOLUTE, 0,
+						DW9719_MAX_FOCUS_POS, 1, 0);
+
+	if (dw9719->ctrls.handler.error) {
+		dev_err(dw9719->dev, "Error initialising v4l2 ctrls\n");
+		ret = dw9719->ctrls.handler.error;
+		goto err_free_handler;
+	}
+
+	dw9719->sd.ctrl_handler = &dw9719->ctrls.handler;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
+	return ret;
+}
+
+static const struct v4l2_subdev_ops dw9719_ops = { };
+
+static int dw9719_probe(struct i2c_client *client)
+{
+	struct dw9719_device *dw9719;
+	int ret;
+
+	dw9719 = devm_kzalloc(&client->dev, sizeof(*dw9719), GFP_KERNEL);
+	if (!dw9719)
+		return -ENOMEM;
+
+	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(dw9719->regmap))
+		return PTR_ERR(dw9719->regmap);
+
+	dw9719->dev = &client->dev;
+	dw9719->sac_mode = DW9719_MODE_SAC3;
+	dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+
+	/* Optional indication of SAC mode select */
+	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
+				 &dw9719->sac_mode);
+
+	/* Optional indication of VCM frequency */
+	device_property_read_u32(&client->dev, "dongwoon,vcm-freq",
+				 &dw9719->vcm_freq);
+
+	dw9719->regulator = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(dw9719->regulator))
+		return dev_err_probe(&client->dev, PTR_ERR(dw9719->regulator),
+				     "getting regulator\n");
+
+	v4l2_i2c_subdev_init(&dw9719->sd, client, &dw9719_ops);
+	dw9719->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	dw9719->sd.internal_ops = &dw9719_internal_ops;
+
+	ret = dw9719_init_controls(dw9719);
+	if (ret)
+		return ret;
+
+	ret = media_entity_pads_init(&dw9719->sd.entity, 0, NULL);
+	if (ret < 0)
+		goto err_free_ctrl_handler;
+
+	dw9719->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	/*
+	 * We need the driver to work in the event that pm runtime is disable in
+	 * the kernel, so power up and verify the chip now. In the event that
+	 * runtime pm is disabled this will leave the chip on, so that the lens
+	 * will work.
+	 */
+
+	ret = dw9719_power_up(dw9719);
+	if (ret)
+		goto err_cleanup_media;
+
+	ret = dw9719_detect(dw9719);
+	if (ret)
+		goto err_powerdown;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(&client->dev);
+
+	ret = v4l2_async_register_subdev(&dw9719->sd);
+	if (ret < 0)
+		goto err_pm_runtime;
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+
+err_pm_runtime:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+err_powerdown:
+	dw9719_power_down(dw9719);
+err_cleanup_media:
+	media_entity_cleanup(&dw9719->sd.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
+
+	return ret;
+}
+
+static void dw9719_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct dw9719_device *dw9719 =
+		container_of(sd, struct dw9719_device, sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
+	media_entity_cleanup(&dw9719->sd.entity);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		dw9719_power_down(dw9719);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct i2c_device_id dw9719_id_table[] = {
+	{ "dw9719" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
+				 NULL);
+
+static struct i2c_driver dw9719_i2c_driver = {
+	.driver = {
+		.name = "dw9719",
+		.pm = pm_sleep_ptr(&dw9719_pm_ops),
+	},
+	.probe = dw9719_probe,
+	.remove = dw9719_remove,
+	.id_table = dw9719_id_table,
+};
+module_i2c_driver(dw9719_i2c_driver);
+
+MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
+MODULE_DESCRIPTION("DW9719 VCM Driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

