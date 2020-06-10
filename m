Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861921F5B4A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 20:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgFJSgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 14:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729082AbgFJSgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 14:36:05 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578F5C03E96F
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 11:36:04 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g10so2748638wmh.4
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GAKX/BkxTn/LJgWRS+1X11Mbc2rWzrpG7EzLbVyHFc0=;
        b=RPnWMutX/QRRcz0TMYMoRUA578kiy7PU2Vm88l+RS5gO/Pknvm5sWAtth+EliUqh38
         C/UAvvkRwHxWgIhri0FAZGPcCri1wJvxiuiEWMwfPRcAtMNrizZUhQ5wz7rYsUUYyvaJ
         FtZB75PSjzL6hvGkf/JJzuRYcux77pdBbkM+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GAKX/BkxTn/LJgWRS+1X11Mbc2rWzrpG7EzLbVyHFc0=;
        b=ix5RV3uckjmt9OxKvQQCWCkCt7SLv5GV+rRc1X6ZsDCVE9EvoO9OdtCJGdTGCljlU5
         C1apxD2VLCgqWdq0fs+8GRiF5dsHOYCA0SXh1bwhxWcs8NcVfijeEVZ4zx0gw0pM3gaO
         NG6ahStCJGmoGOuSCyUCR5fpO7mQ6ot7oRURNcf1CwzxZ+PP+LS5CWJg56XsYDf0DJP3
         BarNioPKVwOsw3TGyE0LRqSFUQKHAhJj6PgvugH6bCfS+wo4Psxj96IB8HTBJCdqLFKu
         zhzv4gcJ0Awyje0ptSFGRoUl/nDJWUG0GClo1vURP8AWv1ssWDQbtpPIlJRvefUqpUVZ
         XmSA==
X-Gm-Message-State: AOAM5320nSRXcRrUaaVWWdt7L4RDIHv2Im9I0zAosUWGzOrFL+Jis5C3
        79fl0MvpWVQWrFstoM+IrKOATw==
X-Google-Smtp-Source: ABdhPJy74R1qCnO28Ip6GBZKnzUcwExOKJX50OLQZG2OUIsPlzuJOoCoKc9XcVZG+a5TOL8W/oWneQ==
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr4322110wmg.17.1591814162734;
        Wed, 10 Jun 2020 11:36:02 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d5sm981424wrb.14.2020.06.10.11.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 11:36:02 -0700 (PDT)
Date:   Wed, 10 Jun 2020 18:36:00 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200610183600.GI201868@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590209415.8804.431.camel@mhfsdcap03>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 23, 2020 at 12:50:15PM +0800, Dongchun Zhu wrote:
> Hi Tomasz,
> 
> Thanks for the review. My replies are as below.
> 
> On Thu, 2020-05-21 at 19:32 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
[snip]
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +	int ret;
> > > +
> > > +	gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> > > +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> > > +
> > > +	ret = clk_prepare_enable(ov02a10->eclk);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to enable eclk\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to enable regulators\n");
> > > +		goto disable_clk;
> > > +	}
> > > +	usleep_range(5000, 6000);
> > > +
> > > +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
> > 
> > This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
> > powered on.
> > 
> 
> The value set by gpiod_set_value_cansleep() API actually depends upon
> GPIO polarity defined in DT.
> Since I set GPIO_ACTIVE_LOW to powerdown,
> gpiod_set_value_cansleep(gpio_desc, value) would set !value to
> gpio_desc.
> Thus here powerdown would be low-state when sensor is powered on.
> For GPIO polarity, I also post a comment to the binding patch.
>

That's true. However, this makes the driver really confusing. If someone
reads this code and compares with the datasheet, it looks incorrect,
because in the datasheet the powerdown GPIO needs to be configured low
for the sensor to operate.

I'd recommend defining the binding in a way that makes it clear in the driver code
that it implementes the power sequencing as per the datasheet.

[snip]
> > > +/*
> > > + * ov02a10_set_exposure - Function called when setting exposure time
> > > + * @priv: Pointer to device structure
> > > + * @val: Variable for exposure time, in the unit of micro-second
> > > + *
> > > + * Set exposure time based on input value.
> > > + *
> > > + * Return: 0 on success
> > > + */
> > > +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > 
> > How does this page switch work? According to the documentation I have, the
> > register allows selecting between a few different pages. However, there
> > should be two page pointers - one for the AP and the other for the sensor,
> > so that when the AP is programming page X, the sensor can have consistent
> > settings from page Y. But here we only set one register and always with
> > page 1.
> > 
> 
> Thanks for the carefully observation.
> The style or requirement of register setting here is suggested by OV
> vendor.
> From hardware signal behavior and effect-test, this setting should be
> right.
> But for your concern, we can also dig into it with OV.
> Let's have time to talk with OV.
> 
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_H,
> > > +					val >> OV02A10_EXP_SHIFT);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_L, val);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > 
> > This patch defines REG_GLOBAL_EFFECTIVE to 0x01. I don't see such register
> > mentioned in the documentation.
> > 
> 
> There may be several editions of sensor documentation.
> From OV, 0x01 is one register shall be updated to keep
> exposure/gain/test pattern... register settings effective.
>

Okay, let's try to get some explanation of this offline.

> > > +}
> > > +
> > > +static int ov02a10_set_gain(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN, val);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > > +}
> > > +
> > > +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	u32 vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > +					vts >> OV02A10_VTS_SHIFT);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > > +}
> > > +
> > > +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	if (pattern)
> > > +		pattern = OV02A10_TEST_PATTERN_ENABLE;
> > 
> > Is this necessary? Our control can be 0 for disabled and 1 for color bars.
> > The latter is the same as the above macro.
> > 
> 
> Yes. It looks redundant here.
> Fixed in next release.
> 
> > [snip]
> > > +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	const struct ov02a10_mode *mode;
> > > +	struct v4l2_ctrl_handler *handler;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	u64 exposure_max;
> > > +	u32 pixel_rate, h_blank;
> > > +	int ret;
> > > +
> > > +	handler = &ov02a10->ctrl_handler;
> > > +	mode = ov02a10->cur_mode;
> > > +	ret = v4l2_ctrl_handler_init(handler, 7);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	handler->lock = &ov02a10->mutex;
> > > +
> > > +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
> > > +				      link_freq_menu_items);
> > > +	if (ctrl)
> > > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	pixel_rate = to_pixel_rate(0);
> > > +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0, pixel_rate, 1,
> > > +			  pixel_rate);
> > > +
> > > +	h_blank = mode->hts_def - mode->width;
> > > +	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> > > +					    h_blank, h_blank, 1, h_blank);
> > > +	if (ov02a10->hblank)
> > > +		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > 
> > Do we need to hold a pointer to this control? We don't seem to ever access
> > it anywhere else in the driver.
> > 
> 
> No.
> These lines would be removed in next release.
> 
> > > +	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					    V4L2_CID_VBLANK, mode->vts_def -
> > > +					    mode->height,
> > > +					    OV02A10_VTS_MAX - mode->height, 1,
> > > +					    mode->vts_def - mode->height);
> > > +
> > 
> > Ditto.
> > 
> 
> These lines would be removed in next release.
> 
> > > +	exposure_max = mode->vts_def - 4;
> > > +	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					      V4L2_CID_EXPOSURE,
> > > +					      OV02A10_EXPOSURE_MIN,
> > > +					      exposure_max,
> > > +					      OV02A10_EXPOSURE_STEP,
> > > +					      mode->exp_def);
> > > +
> > > +	ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					       V4L2_CID_ANALOGUE_GAIN,
> > > +					       OV02A10_GAIN_MIN,
> > > +					       OV02A10_GAIN_MAX,
> > > +					       OV02A10_GAIN_STEP,
> > > +					       OV02A10_GAIN_DEFAULT);
> > 
> > Ditto.
> > 
> 
> Fields: exposure and anal_gain would be removed in next release.
> But v4l2_ctrl_new_std remains, as user may set exp/gain. 
> 

I don't mean removing the controls, but just not storing the returned
pointers inside driver data.

Best regards,
Tomasz
