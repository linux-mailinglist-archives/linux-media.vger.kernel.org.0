Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 831E19AA0A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 10:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732941AbfHWIRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 04:17:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38192 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732068AbfHWIRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 04:17:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id o70so5968000pfg.5
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UJ5CrYUiz5cu07Ev66iWTeB12cc8gtn2VmkD69rkO2g=;
        b=HsSmfql9/B5GE+0QDPL4SwKf+mX1hBHA4bDYK5DTzPiNiVDvHXbW+Jf2GGuHfqIys7
         bCMdJLp+k+9T2N8s5vlmBbXzYg2oTxxq+Y+5MLIsIEKMpKEuzbZY/KzjQES1FF6+K1yX
         vF5o1h96FwcoBvh8WQK3zmDt40wmDU58qZJHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UJ5CrYUiz5cu07Ev66iWTeB12cc8gtn2VmkD69rkO2g=;
        b=OEu3fqUd51qpIZEdXTdi2yQY4MyLMWfNaxjZipYiXEA+dFGpmv++9yv+UdQyJLdXB5
         5O5/1WXKZrmMe6+fWBt6fiJgxmXKOK+a2i9VkCmrmEz9WvouX8Tq72w7SKJ6GLGR/cWs
         2koLe5DPty1bNfcjfCBRRnfbcgq/ViXi+6+oizSahAC3+oaAMZbgN8i8hRg0o8qV6zM3
         0wDHX0f2g+2RTeaXuu26/7iqJx8YOwHWF2Hw8TtQ7TJ1cI9H5w8lqjjSQ9GEQBMjO6xd
         VYrxil3MxxCFP7e8Cwlx34Rg0pq4pqEYbwSAvmgxaMTl5hZrlMoxn6h4tvQsFcVsZFsY
         9Qww==
X-Gm-Message-State: APjAAAW3MOwI6XRPKVquBs4RaTRqf3DCYoQKdqPEIzJ067yy+dmTNMiC
        xz1S4fI4PoFhi54xzWs1q6AufQ==
X-Google-Smtp-Source: APXvYqySawiVHot3Nsn0vVTblqEOzzkNWKSCY5gRFerUhpUQRgoxA8Jzfa1dxAoDVQOWdXvVfqxfaA==
X-Received: by 2002:a62:ed10:: with SMTP id u16mr3753514pfh.179.1566548248695;
        Fri, 23 Aug 2019 01:17:28 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id j9sm1752810pfe.103.2019.08.23.01.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 01:17:27 -0700 (PDT)
Date:   Fri, 23 Aug 2019 17:17:23 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20190823081723.GA33937@chromium.org>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708100641.2702-3-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Mon, Jul 08, 2019 at 06:06:41PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
> 
> The DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> control of voice coil motor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 458 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 470 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 

Thanks for the patch! Please see my comments inline.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f6ac93..17152d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4877,6 +4877,7 @@ M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
>  L:	linux-media@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
> +F:	drivers/media/i2c/dw9768.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
>  
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7793358..8ff6c95 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1014,6 +1014,16 @@ config VIDEO_DW9714
>  	  capability. This is designed for linear control of
>  	  voice coil motors, controlled via I2C serial interface.
>  
> +config VIDEO_DW9768
> +	tristate "DW9768 lens voice coil support"
> +	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> +	depends on VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for the DW9768 camera lens voice coil.
> +	  DW9768 is a 10 bit DAC with 100mA output current sink
> +	  capability. This is designed for linear control of
> +	  voice coil motors, controlled via I2C serial interface.
> +
>  config VIDEO_DW9807_VCM
>  	tristate "DW9807 lens voice coil support"
>  	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d8ad9da..944fbf6 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
>  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
>  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
>  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
>  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> new file mode 100644
> index 0000000..f5b5591
> --- /dev/null
> +++ b/drivers/media/i2c/dw9768.c
> @@ -0,0 +1,458 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define DW9768_VOLTAGE_ANALOG			2800000

This is a platform detail and should be defined in the platform data, for
example DTS on platforms using DT.

> +#define DW9768_NAME				"dw9768"

The chip we seem to be using this driver for is called gt9769. Shouldn't we
call the driver the same?

> +#define DW9768_MAX_FOCUS_POS			1023
> +/*
> + * This sets the minimum granularity for the focus positions.
> + * A value of 1 gives maximum accuracy for a desired focus position
> + */
> +#define DW9768_FOCUS_STEPS			1
> +
> +#define DW9768_CTRL_DELAY_US			5000
> +
> +#define DW9768_REG_DAC_MSB			0x03
> +#define DW9768_REG_DAC_LSB			0x04
> +#define DW9768_REG_NULL				0xff
> +
> +#define DW9768_DAC_SHIFT			8
> +
> +#define DW9768_REG_VALUE_16BIT			2

This driver seems to always write 16-bit values. Can we simplify it to just
always assume so?

> +
> +/* dw9768 device structure */
> +struct dw9768_device {
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_subdev sd;
> +	struct regulator *analog_regulator;
> +	/*
> +	 * Serialize control access, get/set format, get selection
> +	 * and start streaming.
> +	 */
> +	struct mutex power_lock;
> +
> +	int power_count;
> +	bool standby;
> +};
> +
> +static inline struct dw9768_device *to_dw9768_vcm(struct v4l2_ctrl *ctrl)
> +{
> +	return container_of(ctrl->handler, struct dw9768_device, ctrls);
> +}
> +
> +static inline struct dw9768_device *sd_to_dw9768_vcm(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct dw9768_device, sd);
> +}
> +
> +static int dw9768_i2c_write(struct dw9768_device *dw9768_dev, u8 *data,
> +			    int size)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768_dev->sd);
> +	struct i2c_msg msg;
> +	u8 *w_buf = NULL;
> +	u8 retry_cnt = 3;
> +	int ret;
> +
> +	if (!client->adapter)
> +		return -ENODEV;

This isn't possible.

> +
> +	if (size != 1 && size != 2)
> +		return -EINVAL;

All the calls always pass 2.

> +
> +	memset(&msg, 0, sizeof(struct i2c_msg));
> +
> +	w_buf = kzalloc(size, GFP_KERNEL);
> +	if (!w_buf)
> +		return -1;

The size is fixed to 2. Is it necessary to allocate the buffer dynamically?

> +
> +	memcpy(w_buf, data, size);
> +
> +	msg.addr  = client->addr;
> +	msg.flags = 0;
> +	msg.len   = size;
> +	msg.buf   = w_buf;

Actually, why don't we just use data directly?

> +
> +	do {
> +		ret = i2c_transfer(client->adapter, &msg, 1);
> +		if (ret != 1)
> +			dev_err(&client->dev, "write fail, ret:%d, retry:%d\n",
> +				ret, retry_cnt);
> +		else
> +			break;
> +		retry_cnt--;
> +	} while (retry_cnt != 0);
> +
> +	if (retry_cnt == 0)	{
> +		dev_err(&client->dev, "i2c write fail(%d)\n", ret);
> +		return -EIO;
> +	}

Why do we need to handle retries here? I don't see the hardware datasheet
refer to any need to do those. Are you seeing some issues with transfers?

> +
> +	kfree(w_buf);
> +
> +	return 0;
> +}
> +
> +static int dw9768_release(struct dw9768_device *dw9768_dev)
> +{
> +	unsigned char i;
> +	int ret;
> +
> +	char puSendCmdArray[4][2] = {

Please use the correct kernel coding style.

> +		{0x02, 0x00}, {DW9768_REG_NULL, DW9768_REG_NULL},
> +		{0x01, 0x00}, {DW9768_REG_NULL, DW9768_REG_NULL},

We only check the first element for this specific value, so we don't need
to initialize the second one.

Also, could we call it DW9768_CMD_DELAY instead?

Also, please define macros for the magic values used in the array.

> +	};
> +
> +	for (i = 0; i < (sizeof(puSendCmdArray) / sizeof(char)) /
> +	     (sizeof(puSendCmdArray[0]) / sizeof(char)); i++) {

Wouldn't ARRAY_SIZE() work here?

> +		if (puSendCmdArray[i][0] != DW9768_REG_NULL) {
> +			ret = dw9768_i2c_write(dw9768_dev, puSendCmdArray[i],
> +					       DW9768_REG_VALUE_16BIT);
> +			if (ret < 0)
> +				return ret;

Hmm, isn't this command array actually a pair of addreses and values?
Please define a struct for the entries.

Could we just use i2c_smbus_write_byte_data() instead of the custom
dw9768_i2c_write()?

> +		} else {
> +			usleep_range(DW9768_CTRL_DELAY_US,
> +				     DW9768_CTRL_DELAY_US + 100);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int dw9768_init(struct dw9768_device *dw9768_dev)
> +{
> +	unsigned char i;
> +	int ret;
> +
> +	char puSendCmdArray[5][2] = {
> +		{0x02, 0x02}, {DW9768_REG_NULL, DW9768_REG_NULL},
> +		{0x06, 0x41}, {0x07, 0x39}, {DW9768_REG_NULL, DW9768_REG_NULL},
> +	};
> +
> +	for (i = 0; i < (sizeof(puSendCmdArray) / sizeof(char)) /
> +	     (sizeof(puSendCmdArray[0]) / sizeof(char)); i++) {
> +		if (puSendCmdArray[i][0] != DW9768_REG_NULL) {
> +			ret = dw9768_i2c_write(dw9768_dev, puSendCmdArray[i],
> +					       DW9768_REG_VALUE_16BIT);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			usleep_range(DW9768_CTRL_DELAY_US,
> +				     DW9768_CTRL_DELAY_US + 100);
> +		}
> +	}

The code here is duplicated, just different command array is used. Could we
move the command array handling to a helper function? (+ all the comments
I mentioned above)

> +
> +	return 0;
> +}
> +
> +/*
> + * Power handling
> + */
> +static int dw9768_power_off(struct dw9768_device *dw9768_dev, bool standby)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768_dev->sd);
> +	int ret;
> +
> +	/*
> +	 * Go to standby first as real power off my be denied by the hardware
> +	 * (single power line control for both dw9768_dev and sensor).

What do you mean here? The regulator subsystem already properly handles
reference counting.

> +	 */
> +	if (standby) {
> +		dw9768_dev->standby = true;
> +		ret = dw9768_release(dw9768_dev);
> +		if (ret)
> +			dev_err(&client->dev, "dw9768_release failed!\n");

Shouldn't we always call this when we power off?

> +	}
> +	ret = regulator_disable(dw9768_dev->analog_regulator);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int dw9768_power_on(struct dw9768_device *dw9768_dev, bool restore)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(dw9768_dev->analog_regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (restore) {
> +		/* Restore the hardware settings. */
> +		dw9768_dev->standby = false;
> +		ret = dw9768_init(dw9768_dev);
> +		if (ret < 0)
> +			goto fail;

Shouldn't we always call this when we power on, without any condition?

> +	}
> +
> +	return 0;
> +
> +fail:
> +	dw9768_dev->standby = true;
> +	regulator_disable(dw9768_dev->analog_regulator);
> +
> +	return ret;
> +}

The two functions above should be called from the runtime PM suspend/resume
callbacks.

> +
> +/*
> + * Calculate status word and write it to the device based on current
> + * values of V4L2 controls. It is assumed that the stored V4L2 control
> + * values are properly limited and rounded.
> + */
> +static int dw9768_update_hw(struct dw9768_device *dw9768_dev, u16 val)
> +{
> +	unsigned char i;
> +	int ret;
> +
> +	char puSendCmdArray[2][2] = {
> +		{DW9768_REG_DAC_MSB, (char)(val >> DW9768_DAC_SHIFT)},
> +		{DW9768_REG_DAC_LSB, (char)(val & 0xFF)},
> +	};
> +
> +	for (i = 0; i < (sizeof(puSendCmdArray) / sizeof(char)) /
> +	     (sizeof(puSendCmdArray[0]) / sizeof(char)); i++) {
> +		ret = dw9768_i2c_write(dw9768_dev, puSendCmdArray[i],
> +				       DW9768_REG_VALUE_16BIT);
> +		if (ret)
> +			return ret;
> +	}

Since the two registers are actually one after another, perhaps you could
use i2c_smbus_write_block_data() to batch them into one transfer?

> +
> +	return 0;
> +}
> +
> +static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dw9768_device *dw9768_dev = to_dw9768_vcm(ctrl);
> +
> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		return dw9768_update_hw(dw9768_dev, ctrl->val);

I think we could just inline the contents of that function here, because
this function doesn't do anything else.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops dw9768_vcm_ctrl_ops = {
> +	.s_ctrl = dw9768_set_ctrl,
> +};
> +
> +static int
> +dw9768_set_power(struct v4l2_subdev *subdev, int on)
> +{
> +	struct dw9768_device *dw9768_dev = sd_to_dw9768_vcm(subdev);
> +	int ret = 0;
> +
> +	mutex_lock(&dw9768_dev->power_lock);
> +
> +	/*
> +	 * If the power count is modified from 0 to != 0 or from != 0 to 0,
> +	 * update the power state.
> +	 */
> +	if (dw9768_dev->power_count == !on) {
> +		ret = on ? dw9768_power_on(dw9768_dev, true) :
> +			dw9768_power_off(dw9768_dev, true);
> +		if (ret < 0)
> +			goto done;
> +	}

If we use runtime PM, we get the reference count handling done for us by
the subsystem.

> +
> +	/* Update the power count. */
> +	dw9768_dev->power_count += on ? 1 : -1;
> +	WARN_ON(dw9768_dev->power_count < 0);
> +
> +done:
> +	mutex_unlock(&dw9768_dev->power_lock);
> +	return ret;
> +}
> +
> +static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return dw9768_set_power(sd, 1);

We could just call pm_runtime_get_sync() here.

> +}
> +
> +static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return dw9768_set_power(sd, 0);

And pm_runtime_put() here.

> +}
> +
> +static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
> +	.open = dw9768_open,
> +	.close = dw9768_close,
> +};
> +
> +static const struct v4l2_subdev_ops dw9768_ops = { };
> +
> +static void dw9768_subdev_cleanup(struct dw9768_device *dw9768_dev)
> +{
> +	v4l2_async_unregister_subdev(&dw9768_dev->sd);
> +	v4l2_ctrl_handler_free(&dw9768_dev->ctrls);
> +	media_entity_cleanup(&dw9768_dev->sd.entity);
> +}
> +
> +static int dw9768_init_controls(struct dw9768_device *dw9768_dev)
> +{
> +	struct v4l2_ctrl_handler *hdl = &dw9768_dev->ctrls;
> +	const struct v4l2_ctrl_ops *ops = &dw9768_vcm_ctrl_ops;
> +
> +	v4l2_ctrl_handler_init(hdl, 1);
> +
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> +			  0, DW9768_MAX_FOCUS_POS, DW9768_FOCUS_STEPS, 0);
> +
> +	if (hdl->error) {
> +		dev_err(dw9768_dev->sd.dev, "%s fail error: 0x%x\n",
> +			__func__, hdl->error);
> +		return hdl->error;
> +	}
> +
> +	dw9768_dev->sd.ctrl_handler = hdl;
> +
> +	return 0;
> +}
> +
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dw9768_device *dw9768_dev;

nit: Could we drop the _device and _dev suffixes to shorten the names?

> +	int rval;
> +
> +	dw9768_dev = devm_kzalloc(&client->dev, sizeof(*dw9768_dev),
> +				  GFP_KERNEL);
> +	if (!dw9768_dev)
> +		return -ENOMEM;
> +
> +	dw9768_dev->analog_regulator = devm_regulator_get(dev, "afvdd");

"avfdd" is the name on our camera module, not the chip. It should be "vdd".

> +	if (IS_ERR(dw9768_dev->analog_regulator)) {
> +		dev_err(dev, "cannot get analog regulator\n");
> +		return PTR_ERR(dw9768_dev->analog_regulator);
> +	}

We also need 1 more regulator here for the I2C interface. The datasheet
calls it "vin".

> +
> +	rval = regulator_set_voltage(dw9768_dev->analog_regulator,
> +				     DW9768_VOLTAGE_ANALOG,
> +				     DW9768_VOLTAGE_ANALOG);
> +	if (rval < 0) {
> +		dev_err(dev, "cannot set analog voltage\n");
> +		return rval;
> +	}

This should be set in the platform code. For example, on systems using DT
it can be done by setting the regulator min and max constraints in the DTS.

> +
> +	mutex_init(&dw9768_dev->power_lock);
> +
> +	v4l2_i2c_subdev_init(&dw9768_dev->sd, client, &dw9768_ops);
> +	dw9768_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	dw9768_dev->sd.internal_ops = &dw9768_int_ops;
> +
> +	rval = dw9768_init_controls(dw9768_dev);
> +	if (rval)
> +		goto err_cleanup;
> +
> +	rval = media_entity_pads_init(&dw9768_dev->sd.entity, 0, NULL);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	dw9768_dev->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	rval = v4l2_async_register_subdev(&dw9768_dev->sd);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	pm_runtime_set_active(dev);

We shouldn't call this if we didn't fully power up the device ourselves and
I don't see the code above enabling the regulator. Given the privacy LED
concerns, we actually shouldn't attempt to power on in probe.

> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);

Ditto for idle, which is not needed if the device was not set active.

> +
> +	return 0;
> +
> +err_cleanup:
> +	mutex_destroy(&dw9768_dev->power_lock);
> +	dw9768_subdev_cleanup(dw9768_dev);
> +	dev_err(dev, "Probe failed: %d\n", rval);
> +	return rval;
> +}
> +
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768_device *dw9768_dev = sd_to_dw9768_vcm(sd);
> +
> +	pm_runtime_disable(&client->dev);

Technically we need to check if (!pm_runtime_state_suspended()) and power
down manually and set_suspended if that was the case.

> +	dw9768_subdev_cleanup(dw9768_dev);
> +
> +	return 0;
> +}
> +
> +/*
> + * This function sets the vcm position, so it consumes least current
> + * The lens position is gradually moved in units of DW9768_CTRL_STEPS,
> + * to make the movements smoothly.
> + */
> +static int __maybe_unused dw9768_vcm_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768_device *dw9768_dev = sd_to_dw9768_vcm(sd);
> +
> +	if (!dw9768_dev->power_count)
> +		return 0;
> +
> +	return dw9768_power_off(dw9768_dev, false);
> +}
> +
> +/*
> + * This function sets the vcm position to the value set by the user
> + * through v4l2_ctrl_ops s_ctrl handler
> + * The lens position is gradually moved in units of DW9768_CTRL_STEPS,
> + * to make the movements smoothly.
> + */
> +static int __maybe_unused dw9768_vcm_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768_device *dw9768_dev = sd_to_dw9768_vcm(sd);
> +
> +	if (!dw9768_dev->power_count)
> +		return 0;
> +
> +	return dw9768_power_on(dw9768_dev, true);
> +}
> +
> +static const struct i2c_device_id dw9768_id_table[] = {
> +	{ DW9768_NAME, 0 },
> +	{ { 0 } }
> +};
> +MODULE_DEVICE_TABLE(i2c, dw9768_id_table);
> +
> +static const struct of_device_id dw9768_of_table[] = {
> +	{ .compatible = "dongwoon,dw9768" },
> +	{ { 0 } }
> +};
> +MODULE_DEVICE_TABLE(of, dw9768_of_table);
> +
> +static const struct dev_pm_ops dw9768_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dw9768_vcm_suspend, dw9768_vcm_resume)
> +	SET_RUNTIME_PM_OPS(dw9768_vcm_suspend, dw9768_vcm_resume, NULL)

Okay, so we already provided the callbacks, but we never called
pm_runtime_get/put().

Also, I'm not sure if we can provide the same callbacks for runtime and
system PM ops, but I think we could use pm_runtime_force_suspend() and
pm_runtime_force_resume() as system ones to achieve the same.

Best regards,
Tomasz
