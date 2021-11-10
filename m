Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0CC44B981
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 01:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhKJAEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 19:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhKJAEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 19:04:11 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33101C061764
        for <linux-media@vger.kernel.org>; Tue,  9 Nov 2021 16:01:23 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id z200so622908wmc.1
        for <linux-media@vger.kernel.org>; Tue, 09 Nov 2021 16:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=75ySCRDyvjzi8ujH1E+qJNgup4xQ25gICqNWYdHvk/s=;
        b=Vy1+fn6mE2j0ZsY3psFTEE9jiwq4CnyiyYGbffH9vKb5X4KtEv5xz8fOWbW+BYKR/1
         hGbUJ8Z1k0rjlXnWUbuflqhDFHe8891mDETZviI4n1Ui2ub7jO11xaXhSyXTGl+11Xut
         6f0rnGcuGyzJW4l57WFkr5LaE873mQFUzbU2nYSbUwDCpUhsYkAY6Vz6wrnDK+hCL9aE
         PQU0fiycxtexD9sUE5HhrqDRxOBG6Lcy4RqaqC4KO9caPU1Kj2ipiWV1u6DzU/Gc7cM+
         dt88EKYOyP0Q1cSsU8DhaIf0Sfy74Gw2+Y+Fl6LA+w4699/p8VjOymB3BKz7yT/caWuu
         9DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=75ySCRDyvjzi8ujH1E+qJNgup4xQ25gICqNWYdHvk/s=;
        b=30+AWXx/WvFbpQSA2lviGCozY0VFquawECzo2YF8vjcxE7526umA3VhCRpithenY2b
         WlVAGEKN2VMoo+8sER/9Bf4EdzfhaQMTWdt1pFmEElyT3LS65eEhg7Doxr6dNejqgvbR
         vBzzerLFMzj/wgvdwubh9CtCTiWg7Gj+wZAVQvlwPg10fQqBrBbTMFBupdQn9lAAjxGs
         yfayedqOW01Ge1EwLh5Q53FG6iAj85lSGv0BS5Lgc6A/pjs6BJWLMxHsC0Ssrx3HMnVU
         LC3SuuCA/dcL9f9v3pi9mF/Ph0nk//3tW2MvoGRyl4a0YA4hL7D/0C/3q2U02EcQg6rI
         z9iQ==
X-Gm-Message-State: AOAM532CCQ2chq/uvHgAQFRRVanTkPRw5xwjingmosDXZhbZOxeiOK+u
        zVfdLqDYyjVCypBjTL+Q90u1osBm5As=
X-Google-Smtp-Source: ABdhPJy5D63IiwoDRki1MBWJ/T486XvwFzFwkDseiPn75fq6uEB0Q/fEAKsU3/juf+ZW8B3VfP6soA==
X-Received: by 2002:a05:600c:2107:: with SMTP id u7mr11848642wml.82.1636502481303;
        Tue, 09 Nov 2021 16:01:21 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o25sm4004261wms.17.2021.11.09.16.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 16:01:20 -0800 (PST)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
From:   Daniel Scally <djrscally@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
Message-ID: <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
Date:   Wed, 10 Nov 2021 00:01:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------B01EC9D8B71A46848004E290"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------B01EC9D8B71A46848004E290
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Hans

On 09/11/2021 16:35, Daniel Scally wrote:
>>>> That's not working correctly for me at the moment, but I think this is a
>>>> surmountable problem rather than the wrong approach, so I'm just working
>>>> through the differences to try and get the matching working.
>>> OK, I eventually got this working - the dw9719 registers as
>>> /dev/v4l-subdev7 for me now ... long story short is the attached patch
>>> was needed to make the references work, as the internals of v4l2 aren't
>>> checking for fwnode->secondary. Prior to your latest series as well, an
>>> additional problem was that once the VCMs fwnode was linked to the
>>> sensor's the .complete() callback for ipu3-cio2 would never call
>>> (because it needs ALL the devices for the linked fwnodes to be bound to
>>> do that)...which meant the VCMs never got instantiated, because that was
>>> where that function was called. With your new set separating those
>>> processes it works well, so yes I like that new approach very much :D
>>>
>>>
>>> In the end we don't have to add a call creating the subdev's - it turns
>>> out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
>>> the nodes for the vcm when .complete() is called for that driver. I
>>> still think we should add a bit creating the link to expose to userspace
>>> in match_notify() though.
>>>
>>>
>>> Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
>>> -L fails with an IOCTL error, so I have some remedial work on the driver
>>> which I'll do tonight; I'd expect to be able to control focus with
>>> v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.
>> That is great, thank you so much. I wanted to look into this myself
>> today but I got distracted by other stuff.
>
> No problem; I'll link you the patches for the updated versions of
> everything once I've sorted the IOCTL error tonight.


OK, this is running now. With the attached patches on top of your v5
series and the 4-patch series from earlier today, the dw9719 registers
as a v4l2 subdev and I can control it with v4l2-ctl -d /dev/v4l-subdev7
-c focus_absolute=1200 (or whatever value). One problem I'm experiencing
is that the focus position I set isn't maintained; it holds for a couple
of seconds and then resets to the "normal" focus...this happens when the
.close() callback for the driver is called, which happens right after
the control value is applied. All the other VCM drivers in the kernel
power down on .close() so I did the same, but the behaviour is not
particularly useful - since removing the power seems to reset it, it
needs to be on whilst the linked sensor is streaming I suppose. Given
that ascertaining the state of the sensor probably will require some
link established between them anyway I guess I will look at that next,
unless you'd rather do it?


--------------B01EC9D8B71A46848004E290
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-media-i2c-Add-driver-for-DW9719-VCM.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0003-media-i2c-Add-driver-for-DW9719-VCM.patch"

From 94c27c5e7db05792e45cce1d8f283279d205eed2 Mon Sep 17 00:00:00 2001
From: Daniel Scally <djrscally@gmail.com>
Date: Thu, 28 Oct 2021 21:55:16 +0100
Subject: [PATCH 3/3] media: i2c: Add driver for DW9719 VCM

Add a driver for the DW9719 VCM. The driver creates a v4l2 subdevice
and registers a control to set the desired focus.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/dw9719.c | 386 +++++++++++++++++++++++++++++++++++++
 4 files changed, 405 insertions(+)
 create mode 100644 drivers/media/i2c/dw9719.c

diff --git a/MAINTAINERS b/MAINTAINERS
index df69dfe482e7..b7fcfc20d68f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5688,6 +5688,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 F:	drivers/media/i2c/dw9714.c
 
+DONGWOON DW9714 LENS VOICE COIL DRIVER
+M:	Daniel Scally <djrscally@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/i2c/dw9719.c
+
 DONGWOON DW9768 LENS VOICE COIL DRIVER
 M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index d6a5d4ca439a..89a3cc74e352 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1454,6 +1454,17 @@ config VIDEO_DW9714
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_DW9719
+	tristate "DW9719 lens voice coil support"
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
+	help
+	  This is a driver for the DW9719 camera lens voice coil.
+	  This is designed for linear control of  voice coil motors,
+	  controlled via I2C serial interface.
+
 config VIDEO_DW9768
 	tristate "DW9768 lens voice coil support"
 	depends on I2C && VIDEO_V4L2
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 4d4fe08d7a6a..2bbad5804711 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
 obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
 obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
 obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
+obj-$(CONFIG_VIDEO_DW9719)  += dw9719.o
 obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
new file mode 100644
index 000000000000..047f7636efde
--- /dev/null
+++ b/drivers/media/i2c/dw9719.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2012 Intel Corporation
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#define DW9719_MAX_FOCUS_POS	1023
+#define DELAY_PER_STEP_NS	1000000
+#define DELAY_MAX_PER_STEP_NS	(1000000 * 1023)
+
+#define DW9719_INFO			0
+#define DW9719_ID			0xF1
+#define DW9719_CONTROL			2
+#define DW9719_VCM_CURRENT		3
+
+#define DW9719_MODE			6
+#define DW9719_VCM_FREQ			7
+
+#define DW9719_MODE_SAC3		0x40
+#define DW9719_DEFAULT_VCM_FREQ		0x60
+#define DW9719_ENABLE_RINGING		0x02
+
+#define NUM_REGULATORS			2
+
+#define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
+
+struct dw9719_device {
+	struct device *dev;
+	struct i2c_client *client;
+	struct regulator_bulk_data regulators[NUM_REGULATORS];
+	struct v4l2_subdev sd;
+
+	struct dw9719_v4l2_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *focus;
+	} ctrls;
+};
+
+static int dw9719_i2c_rd8(struct i2c_client *client, u8 reg, u8 *val)
+{
+	struct i2c_msg msg[2];
+	u8 buf[2] = { reg };
+	int ret;
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = 1;
+	msg[0].buf = buf;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = 1;
+	msg[1].buf = &buf[1];
+	*val = 0;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
+	if (ret < 0)
+		goto err;
+
+	*val = buf[1];
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static int dw9719_i2c_wr8(struct i2c_client *client, u8 reg, u8 val)
+{
+	struct i2c_msg msg;
+	int ret;
+
+	u8 buf[2] = { reg, val };
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int dw9719_i2c_wr16(struct i2c_client *client, u8 reg, u16 val)
+{
+	struct i2c_msg msg;
+	u8 buf[3] = { reg, (u8)(val >> 8), (u8)(val & 0xff)};
+	int ret;
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int dw9719_detect(struct dw9719_device *dw9719)
+{
+	int ret;
+	u8 val;
+
+	ret = dw9719_i2c_rd8(dw9719->client, DW9719_INFO, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val != DW9719_ID) {
+		dev_err(dw9719->dev, "Failed to detect correct id\n");
+		ret = -ENXIO;
+	}
+
+	return 0;
+}
+
+static int dw9719_power_down(struct dw9719_device *dw9719)
+{
+	return regulator_bulk_disable(NUM_REGULATORS, dw9719->regulators);
+}
+
+static int dw9719_power_up(struct dw9719_device *dw9719)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(NUM_REGULATORS, dw9719->regulators);
+	if (ret)
+		return ret;
+
+	/* Jiggle SCL pin to wake up device */
+	ret = dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL, 1);
+
+	/* Need 100us to transit from SHUTDOWN to STANDBY*/
+	usleep_range(100, 1000);
+
+	ret = dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL,
+			     DW9719_ENABLE_RINGING);
+	if (ret < 0)
+		goto fail_powerdown;
+
+	ret = dw9719_i2c_wr8(dw9719->client, DW9719_MODE, DW9719_MODE_SAC3);
+	if (ret < 0)
+		goto fail_powerdown;
+
+	ret = dw9719_i2c_wr8(dw9719->client, DW9719_VCM_FREQ,
+			     DW9719_DEFAULT_VCM_FREQ);
+	if (ret < 0)
+		goto fail_powerdown;
+
+	return 0;
+
+fail_powerdown:
+	dw9719_power_down(dw9719);
+	return ret;
+}
+
+static int __maybe_unused dw9719_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dw9719_device *dw9719 = to_dw9719_device(sd);
+
+	return dw9719_power_down(dw9719);
+}
+
+static int __maybe_unused dw9719_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dw9719_device *dw9719 = to_dw9719_device(sd);
+
+	return dw9719_power_up(dw9719);
+}
+
+static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
+{
+	int ret;
+
+	value = clamp(value, 0, DW9719_MAX_FOCUS_POS);
+	ret = dw9719_i2c_wr16(dw9719->client, DW9719_VCM_CURRENT, value);
+	if (ret < 0)
+		return ret;
+
+	return 0;
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
+	ret = v4l2_ctrl_handler_init(&dw9719->ctrls.handler, 1);
+	if (ret)
+		return ret;
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
+
+	return ret;
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
+	dw9719->client = client;
+	dw9719->dev = &client->dev;
+
+	dw9719->regulators[0].supply = "vdd";
+	/*
+	 * The DW9719 has only the 1 VDD voltage input, but some PMICs such as
+	 * the TPS68470 PMIC have I2C passthrough capability, to disconnect the
+	 * sensor's I2C pins from the I2C bus when the sensors VSIO (Sensor-IO)
+	 * is off, because some sensors then short these pins to ground;
+	 * and the DW9719 might sit behind this passthrough, this it needs to
+	 * enable VSIO as that will also enable the I2C passthrough.
+	 */
+	dw9719->regulators[1].supply = "vsio";
+
+	ret = devm_regulator_bulk_get(&client->dev, NUM_REGULATORS, dw9719->regulators);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "getting regulators\n");
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
+static int dw9719_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct dw9719_device *dw9719 = container_of(sd, struct dw9719_device,
+						    sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
+	media_entity_cleanup(&dw9719->sd.entity);
+
+	return 0;
+}
+
+static const struct i2c_device_id dw9719_id_table[] = {
+	{ "dw9719" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
+
+static const struct dev_pm_ops dw9719_pm_ops = {
+	SET_RUNTIME_PM_OPS(dw9719_suspend, dw9719_resume, NULL)
+};
+
+static struct i2c_driver dw9719_i2c_driver = {
+	.driver = {
+		.name = "dw9719",
+		.pm = &dw9719_pm_ops,
+	},
+	.probe_new = dw9719_probe,
+	.remove = dw9719_remove,
+	.id_table = dw9719_id_table,
+};
+module_i2c_driver(dw9719_i2c_driver);
+
+MODULE_DESCRIPTION("DW9719 VCM Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


--------------B01EC9D8B71A46848004E290
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-device-property-Check-fwnode-secondary-when-finding-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-device-property-Check-fwnode-secondary-when-finding-.pa";
 filename*1="tch"

From 5a109d3adab4147df7932454ed8c097885e640f3 Mon Sep 17 00:00:00 2001
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 9 Nov 2021 01:13:47 +0000
Subject: [PATCH 2/3] device property: Check fwnode->secondary when finding
 properties

fwnode_property_get_reference_args() searches for named properties
against a fwnode_handle, but these could instead be against the fwnode's
secondary. If the property isn't found against the primary, check the
secondary to see if it's there instead.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/base/property.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 453918eb7390..054e62a4e710 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -479,8 +479,16 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       unsigned int nargs, unsigned int index,
 				       struct fwnode_reference_args *args)
 {
-	return fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
-				  nargs, index, args);
+	int ret;
+
+	ret = fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
+				 nargs, index, args);
+
+	if (ret < 0 && !IS_ERR_OR_NULL(fwnode->secondary))
+		ret = fwnode_call_int_op(fwnode->secondary, get_reference_args,
+					 prop, nargs_prop, nargs, index, args);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(fwnode_property_get_reference_args);
 
-- 
2.25.1


--------------B01EC9D8B71A46848004E290
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-int3472-Add-vsio-regulator-supply-to-bo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-platform-x86-int3472-Add-vsio-regulator-supply-to-bo.pa";
 filename*1="tch"

From dd7532ddea71482502394b6b36c9fd3e5f2a0a37 Mon Sep 17 00:00:00 2001
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 9 Nov 2021 23:12:06 +0000
Subject: [PATCH 1/3] platform/x86: int3472: Add vsio regulator supply to board
 file

The Surface Go2 board file needs to additionally specify a supply name
mapping the VSIO regulator to the world facing camera's VCM device, as
it can sit behind an I2C daisy chain which requires this regulator be
enabled to function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 20615c342875..556a615afaa9 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -29,6 +29,7 @@ static struct regulator_consumer_supply int347a_vcm_consumer_supplies[] = {
 
 static struct regulator_consumer_supply int347a_vsio_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT347A:00"),
+	REGULATOR_SUPPLY("vsio", "i2c-INT347A:00-VCM"),
 };
 
 static const struct regulator_init_data surface_go_tps68470_core_reg_init_data = {
-- 
2.25.1


--------------B01EC9D8B71A46848004E290--
