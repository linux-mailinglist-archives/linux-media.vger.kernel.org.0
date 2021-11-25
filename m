Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9518345D5FE
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 09:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347634AbhKYIOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 03:14:42 -0500
Received: from comms.puri.sm ([159.203.221.185]:47652 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244365AbhKYIMl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 03:12:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id C46ADE1475;
        Thu, 25 Nov 2021 00:09:30 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8Eesu1oqX7vR; Thu, 25 Nov 2021 00:09:29 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, Angus Ainslie <angus@akkea.ca>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] media: i2c: dw9714: add optional regulator support
Date:   Thu, 25 Nov 2021 09:09:22 +0100
Message-Id: <20211125080922.978583-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Angus Ainslie <angus@akkea.ca>

Allow the dw9714 to control a regulator and adjust suspend() and resume()
to support both runtime and system pm.

Signed-off-by: Angus Ainslie <angus@akkea.ca>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---

hi sakari,

I send this instead of that old one that was incomplete:
https://lore.kernel.org/linux-media/20211109125505.2682553-1-martin.kepplinger@puri.sm/

thank you,

                        martin


 drivers/media/i2c/dw9714.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 3863dfeb8293..6857e4ab7be5 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -5,6 +5,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -36,6 +37,7 @@ struct dw9714_device {
 	struct v4l2_ctrl_handler ctrls_vcm;
 	struct v4l2_subdev sd;
 	u16 current_val;
+	struct regulator *vcc;
 };
 
 static inline struct dw9714_device *to_dw9714_vcm(struct v4l2_ctrl *ctrl)
@@ -145,6 +147,21 @@ static int dw9714_probe(struct i2c_client *client)
 	if (dw9714_dev == NULL)
 		return -ENOMEM;
 
+	dw9714_dev->vcc = devm_regulator_get_optional(&client->dev, "vcc");
+	if (IS_ERR(dw9714_dev->vcc)) {
+		if (PTR_ERR(dw9714_dev->vcc) != -ENODEV)
+			return dev_err_probe(&client->dev,
+					     PTR_ERR(dw9714_dev->vcc),
+					     "failed to request regulator\n");
+		dw9714_dev->vcc = NULL;
+	}
+
+	rval = regulator_enable(dw9714_dev->vcc);
+	if (rval < 0) {
+		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
+		return rval;
+	}
+
 	v4l2_i2c_subdev_init(&dw9714_dev->sd, client, &dw9714_ops);
 	dw9714_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 				V4L2_SUBDEV_FL_HAS_EVENTS;
@@ -200,6 +217,9 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
 	struct dw9714_device *dw9714_dev = sd_to_dw9714_vcm(sd);
 	int ret, val;
 
+	if (pm_runtime_suspended(&client->dev))
+		return 0;
+
 	for (val = dw9714_dev->current_val & ~(DW9714_CTRL_STEPS - 1);
 	     val >= 0; val -= DW9714_CTRL_STEPS) {
 		ret = dw9714_i2c_write(client,
@@ -208,6 +228,13 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
 			dev_err_once(dev, "%s I2C failure: %d", __func__, ret);
 		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
 	}
+
+	if (dw9714_dev->vcc) {
+		ret = regulator_disable(dw9714_dev->vcc);
+		if (ret)
+			dev_err(dev, "Failed to disable vcc: %d\n", ret);
+	}
+
 	return 0;
 }
 
@@ -224,6 +251,18 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
 	struct dw9714_device *dw9714_dev = sd_to_dw9714_vcm(sd);
 	int ret, val;
 
+	if (pm_runtime_suspended(&client->dev))
+		return 0;
+
+	if (dw9714_dev->vcc) {
+		ret = regulator_enable(dw9714_dev->vcc);
+		if (ret) {
+			dev_err(dev, "Failed to enable vcc: %d\n", ret);
+			return ret;
+		}
+		usleep_range(1000, 2000);
+	}
+
 	for (val = dw9714_dev->current_val % DW9714_CTRL_STEPS;
 	     val < dw9714_dev->current_val + DW9714_CTRL_STEPS - 1;
 	     val += DW9714_CTRL_STEPS) {
-- 
2.30.2

