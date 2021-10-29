Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671A643FBCB
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 13:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhJ2LxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJ2LxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 07:53:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C479C061570
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 04:50:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u18so15796256wrg.5
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:references:from:to:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=nQxB7at3IpWv7uH7OreBIOApLAo8AGQz9NFGJWbRmkM=;
        b=TJZKlful/u3UwMXmDkloo+iWRWtD3J8cPw8M9yekuEEpQ0HK0HvQ7BZOc/qbylOoKs
         1wtEmPERnuasnZwPzMoPmY3WBejFsXC4+QHMWL4Ty69AcAgXhO2WG2SBKaPW9SzU2jNo
         IvdYEEuifmwVvsOElZFutTTgZGj+M8TN5se/QvxcA+ClZbgvzLblsfZVQc3WsNTaryMj
         iPFkgYXbL8E2PqPmg9E8ErpYCyJoBKa0jVJq8cdVFl4wDGb9fYZZMz4efsrsk/7op2Bs
         mm467Bxc/UlH1VaVOFeF9cJ+P1YIN/Xsgqo4tkyV6fA4X/SDsgZYGCC4BhQISYd8+3hV
         6pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:references:from:to:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=nQxB7at3IpWv7uH7OreBIOApLAo8AGQz9NFGJWbRmkM=;
        b=4gj0ZWhg9u+xcFJGxgUJ2YOXTV4wCu3xXrwgy0FM9TcaL5LmZzNnDw/xeMhQR2tkkt
         JENwttTbOkqkYhNi0rf2OqUDKqJkGWaXbq7LEbWWZgEv8yez+70PLsgjm9jXL/J5t4BM
         A9TT2XHBmG7KJ9cTVmEtcTCVJceCnJ0+GoCmqhTd0uRgcgxlbKblP5URTKEE2527E6dH
         IizEej58Ez/vXtg9UwoWJR24NAs+Ake6agtJkhzIFHeZcmKFZ/5tRfuiOMwm9TdG+lsM
         0A/2P4Jkd5qmwxfM6vgXp/ud1vDjZlpJGhsR2tpNDgitiLuqqa5oYhITozkTEP0gaHKl
         47uQ==
X-Gm-Message-State: AOAM531945xYgEJFaAwbkPEr1sXgzNW7j57IZ/vBflq9uOIRejsZ1sE7
        gswcfXxq05WnC7zoH6irDsIJHPNWL5I=
X-Google-Smtp-Source: ABdhPJxLkhBJuX972t8FI484exrCFZgMZZjRUi166/juQO03EcJcL5/ZgsojMZwEBNDesST4uwKedw==
X-Received: by 2002:adf:f001:: with SMTP id j1mr8819024wro.351.1635508233089;
        Fri, 29 Oct 2021 04:50:33 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 126sm8360786wmz.28.2021.10.29.04.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 04:50:32 -0700 (PDT)
Subject: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Forwarded-Message-Id: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
Message-ID: <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
Date:   Fri, 29 Oct 2021 12:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------330DDFD1B2FB7DA1D0319E03"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------330DDFD1B2FB7DA1D0319E03
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi all


+CC linux-media and libcamera-devel, as it's probably a good time to
broaden this out. Also Andy because I'm hoping you can help :) The
background of the discussion is about how we identify and enumerate
(correctly, I.E. with a type matching the vcm driver's i2c_device_id,
and there are a few different vcm's in scope which seem encoded in the
SSDB buffer) which VCM module is linked to a sensor in Intel's IPU3
centric ACPI tables. The I2C address for the device is just a second
I2cSerialBusV2 against the sensor's acpi device rather than a separate
one, which is no awkward. We also need to get firmware created for the
VCM such that the sensor will link to it via the lens-focus property.

On 28/10/2021 09:57, Hans de Goede wrote:
> Hi,
>
> On 10/28/21 10:49, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> On Thu, Oct 28, 2021 at 09:51:08AM +0200, Hans de Goede wrote:
>>> On 10/28/21 09:10, Daniel Scally wrote:
>>>> On 27/10/2021 15:16, Hans de Goede wrote:
>>>>> On 10/27/21 12:07, Daniel Scally wrote:
>>>>>> On 26/10/2021 11:14, Hans de Goede wrote:
>>>>>>>>> So yesterday I already sorta guessed it would be the DW9714 because of
>>>>>>>>> the 0x0c address and I tried:
>>>>>>>>>
>>>>>>>>> i2ctransfer -y 2 w2@0x0c 0x00 0x00
>>>>>>>>>
>>>>>>>>> And the transfer fails, while according to the driver that is a valid
>>>>>>>>> value. So maybe we are missing a regulator enable? Or its not a DW9714.
>>>>>>>>>
>>>>>>>>> Also "i2cdetect -y -r 2" does not see anything at address 0x0c (but some of
>>>>>>>>> these VCMs seem to be write only...) it does OTOH see an unknown device at
>>>>>>>>> address 0x21.
>>>>>>>> Well, when debugging the necessary TPS68470 settings I used a poor man's
>>>>>>>> i2ctransfer on Windows whilst the camera was running to read the values
>>>>>>>> that were set for both the PMIC and the camera sensor. Using the same
>>>>>>>> program I can connect to and read values from a device at 0x0c,
>>>>>> Just as further testing I dumped the contents of the device at 0x0c,
>>>>>> which comes back as
>>>>>>
>>>>>> f1 1 2 1 61 0 40 60
>>>>>>
>>>>>> Byte 0 is given in the driver you linked as the ID field and expected to
>>>>>> be f1. The driver controls focus by writing to the 3rd and 4th byte
>>>>>> (with the 4th being the LSB); the only value that seemed to fluctuate
>>>>>> when running windows and moving my hand in front of the sensor was byte
>>>>>> 4 and testing it out I wrote values into that byte and the focus
>>>>>> changes. So the device at 0x0c is definitely the vcm and it sure looks
>>>>>> like it's the DW9719
>>>>>>
>>>>>> The device at 0x21 is only available on Windows when the camera is
>>>>>> running, I thought it was quite likely that one of the "spare"
>>>>>> regulators from the TPS68470. One line is called VCM, and sure enough
>>>>>> it's enabled whilst the world-facing camera is running. I switched to
>>>>>> linux and started streaming the back camera, then enabled that voltage
>>>>>> regulator via i2ctransfer:
>>>>>>
>>>>>> sudo i2ctransfer 2 w2@0x4d 0x3c 0x6d
>>>>>>
>>>>>> sudo i2ctransfer 2 w2@0x4d 0x44 0x01
>>>>>>
>>>>>> And now i2cdetect shows the device at 0x0c on bus 2 - so we need more
>>>>>> jiggery pokey to map that VCM regulator to this new device (once we've
>>>>>> gotten it enumerated...) and the driver needs to have a tweak to call
>>>>>> regulator get and do a power on at some point.
>>>>> Awesome, great job on figuring this out!
>>>>>
>>>>> As you know I can spend $dayjob time on this, so I'll take on the job
>>>>> of creating the i2c-client and hooking up the regulator in some
>>>>> upstreamable manner.
>>>> Okedokey cool. I'd probably start at the cio2-bridge, if only because we
>>>> already have the adev there and the SSDB buffer loaded, so should be
>>>> easy enough to add an enum for the vcm_type and a call to
>>>> i2c_acpi_new_device()...bit of a weird place for that though I guess.
>>> Ah, I was actually thinking about doing this int he int3472 code for
>>> a number of reasons:
>>>
>>> 1. We already have the regulator_init_data there and we will need to
>>> expand it for this.
>>>
>>> 2. It is sorta the central place where we deal with all this glue-stuff
>> I'm not too sure about that. The INT3472 model the "Intel camera PMIC"
>> (I don't remember the exact wording, but that's more or less how the
>> device is described in Windows, and it matches the intent we see in the
>> DSDT).
> I agree that the INT3472 models the PMIC, or whatever discrete bits
> which offer similar functionality.
>
>> Given that we already have cio2-bridge, and that it hooks up the
>> sensor to the CIO2, it seems to me that it would be a better central
>> place.
> Ok, I was sorta expecting you to want to keep glue code like this
> out of drivers/media. But I guess that only applies to putting ACPI
> specific stuff in sensor drivers; and since the cio2-bridge code is
> already x86/ACPI specific you are fine with adding ACPI code there?
>
> I'm fine with putting the VCM i2c-client instantiation in the
> cio2-bridge code, that may also make it easier to tie the 2 together
> at the media-controller level.


Having looked at this yesterday evening I'm more and more convinced it's
necessary. I hacked it into the ov8865 driver in the interim (just by
calling i2c_acpi_new_device() in probe) and then worked on that dw9719
code you found [1] to turn it into an i2c driver (attached, though still
needs a bit of work), which will successfully bind to the i2c client
enumerated by that i2c_acpi_new_device() call. From there though it
needs a way for the v4l2 subdev to be matched to the sensor's subdev.
This can happen automatically by way of the lens-focus firmware property
against the sensor - we currently build those in the cio2-bridge, so
adding another software node for the VCM and creating a lens-focus
property for the sensor's software_node with a pointer to the VCM's node
seems like the best way to do that.


To throw a spanner in the works though; I noticed this delightful _CRS
for the OV9734 sensor of a  Surface Laptop 1 earlier:


Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
{
    Name (SBUF, ResourceTemplate ()
    {
        I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
        I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
        I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
        I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
        I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
    })
    Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
}


How do we know which one's the VCM when there's more than just two like
that? Andy: don't suppose you can shed any light there?

[1]
https://github.com/ZenfoneArea/android_kernel_asus_zenfone5/blob/master/linux/modules/camera/drivers/media/i2c/imx/dw9719.c

--------------330DDFD1B2FB7DA1D0319E03
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-i2c-Add-driver-for-DW9719-VCM.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-media-i2c-Add-driver-for-DW9719-VCM.patch"

From 0f0e2fa09b1bf8260f0d5f3753ebc27bd2c74ad1 Mon Sep 17 00:00:00 2001
From: Daniel Scally <djrscally@gmail.com>
Date: Thu, 28 Oct 2021 21:55:16 +0100
Subject: [PATCH] media: i2c: Add driver for DW9719 VCM

Add a driver for the DW9719 VCM

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/dw9719.c | 376 +++++++++++++++++++++++++++++++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 drivers/media/i2c/dw9719.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 891189cecd51..3db7124c24ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5647,6 +5647,13 @@ T:	git git://linuxtv.org/media_tree.git
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
index dee06f535f2c..505483e7b1df 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1396,6 +1396,17 @@ config VIDEO_DW9714
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
index 011e90c1a288..6a8f55b6c6b9 100644
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
index 000000000000..9021caa915a3
--- /dev/null
+++ b/drivers/media/i2c/dw9719.c
@@ -0,0 +1,376 @@
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
+#define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
+
+struct dw9719_device {
+	struct device *dev;
+	struct i2c_client *client;
+	struct regulator *vdd;
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
+	if (i2c_transfer(client->adapter, msg, 2) != 2)
+		return -EIO;
+	*val = buf[1];
+
+	return 0;
+}
+
+static int dw9719_i2c_wr8(struct i2c_client *client, u8 reg, u8 val)
+{
+	struct i2c_msg msg;
+	u8 buf[2] = { reg, val };
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	if (i2c_transfer(client->adapter, &msg, 1) != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static int dw9719_i2c_wr16(struct i2c_client *client, u8 reg, u16 val)
+{
+	struct i2c_msg msg;
+	u8 buf[3] = { reg, (u8)(val >> 8), (u8)(val & 0xff)};
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	if (i2c_transfer(client->adapter, &msg, 1) != 1)
+		return -EIO;
+
+	return 0;
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
+	return regulator_disable(dw9719->vdd);
+}
+
+static int dw9719_power_up(struct dw9719_device *dw9719)
+{
+	int ret;
+
+	ret = regulator_enable(dw9719->vdd);
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
+	return dw9719_power_up(dw9719);
+}
+
+static int __maybe_unused dw9719_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct dw9719_device *dw9719 = to_dw9719_device(sd);
+
+	return dw9719_power_down(dw9719);
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
+static int dw9719_t_focus_rel(struct dw9719_device *dw9719, s32 value)
+{
+	s32 cur_val = dw9719->ctrls.focus->val;
+
+	return dw9719_t_focus_abs(dw9719, cur_val + value);
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
+	case V4L2_CID_FOCUS_RELATIVE:
+		ret = dw9719_t_focus_rel(dw9719, ctrl->val);
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
+	dw9719->vdd = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(dw9719->vdd)) {
+		dev_err(&client->dev, "Error getting regulator\n");
+		return PTR_ERR(dw9719->vdd);
+	}
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



--------------330DDFD1B2FB7DA1D0319E03--
