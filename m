Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741EB126628
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 16:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfLSPxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 10:53:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48802 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfLSPxt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 10:53:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D28F929301A
Message-ID: <a3fac083ff8ee55368ed1cd2e57aae1277fb886a.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX219 sensor
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dave.stevenson@raspberrypi.com, peter.griffin@linaro.org
Date:   Thu, 19 Dec 2019 12:53:38 -0300
In-Reply-To: <a9f585c8-7033-7eb9-6db5-cb2ea2aa63b1@linaro.org>
References: <20191211115441.10637-1-andrey.konovalov@linaro.org>
         <20191211115441.10637-3-andrey.konovalov@linaro.org>
         <3edcc4d5fc694c497bd67e9c3b8294a681c47ac1.camel@collabora.com>
         <a9f585c8-7033-7eb9-6db5-cb2ea2aa63b1@linaro.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-12-19 at 01:29 +0300, Andrey Konovalov wrote:
> Hi Ezequiel,
> 
> Thank you for reviewing the patch!
> 
> 
[..]
> > > +/* Stop streaming */
> > > +static int imx219_stop_streaming(struct imx219 *imx219)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > +	int ret;
> > > +
> > > +	/* set stream off register */
> > > +	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > > +			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
> > > +	if (ret)
> > > +		dev_err(&client->dev, "%s failed to set stream\n", __func__);
> > > +
> > > +	/*
> > > +	 * Return success even if it was an error, as there is nothing the
> > > +	 * caller can do about it.
> > > +	 */
> > 
> > Just change this function return to void, instead?
> 
> Maybe something like that (functionally the same, but probably more self-explaining):
> 
> -----8<-----
> @@ -798,11 +796,7 @@ static int imx219_stop_streaming(struct imx219 *imx219)

I don't know if I'm missing something, but why can't we have:

static void imx219_stop_streaming(struct imx219 *imx219) ?

Since the return value is not used anywhere, it doesn't make sense
to return it.

>          if (ret)
>                  dev_err(&client->dev, "%s failed to set stream\n", __func__);
> 
> -       /*
> -        * Return success even if it was an error, as there is nothing the
> -        * caller can do about it.
> -        */
> -       return 0;
> +       return ret;
>   }
> 
>   static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> @@ -832,7 +826,7 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>                  if (ret)
>                          goto err_rpm_put;
>          } else {
> -               imx219_stop_streaming(imx219);
> +               (void)imx219_stop_streaming(imx219);
>                  pm_runtime_put(&client->dev);
>          }
> -----8<-----
> 
> ?
> 
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&imx219->mutex);
> > > +	if (imx219->streaming == enable) {
> > > +		mutex_unlock(&imx219->mutex);
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (enable) {
> > > +		ret = pm_runtime_get_sync(&client->dev);
> > > +		if (ret < 0) {
> > > +			pm_runtime_put_noidle(&client->dev);
> > > +			goto err_unlock;
> > > +		}
> > > +
> > > +		/*
> > > +		 * Apply default & customized values
> > > +		 * and then start streaming.
> > > +		 */
> > > +		ret = imx219_start_streaming(imx219);
> > > +		if (ret)
> > > +			goto err_rpm_put;
> > > +	} else {
> > > +		imx219_stop_streaming(imx219);
> > > +		pm_runtime_put(&client->dev);
> > > +	}
> > > +
> > > +	imx219->streaming = enable;
> > > +
> > > +	/* vflip and hflip cannot change during streaming */
> > > +	__v4l2_ctrl_grab(imx219->vflip, enable);
> > > +	__v4l2_ctrl_grab(imx219->hflip, enable);
> > > +
> > > +	mutex_unlock(&imx219->mutex);
> > > +
> > > +	return ret;
> > > +
> > > +err_rpm_put:
> > > +	pm_runtime_put(&client->dev);
> > > +err_unlock:
> > > +	mutex_unlock(&imx219->mutex);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/* Power/clock management functions */
> > > +static int imx219_power_on(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> > > +				    imx219->supplies);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> > > +			__func__);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(imx219->xclk);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "%s: failed to enable clock\n",
> > > +			__func__);
> > > +		goto reg_off;
> > > +	}
> > > +
> > > +	gpiod_set_value_cansleep(imx219->xclr_gpio, 1);
> > > +	msleep(IMX219_XCLR_DELAY_MS);
> > > +
> > > +	return 0;
> > > +reg_off:
> > > +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx219_power_off(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +
> > > +	gpiod_set_value_cansleep(imx219->xclr_gpio, 0);
> > > +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > +	clk_disable_unprepare(imx219->xclk);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused imx219_suspend(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +
> > > +	if (imx219->streaming)
> > > +		imx219_stop_streaming(imx219);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused imx219_resume(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	int ret;
> > > +
> > > +	if (imx219->streaming) {
> > > +		ret = imx219_start_streaming(imx219);
> > > +		if (ret)
> > > +			goto error;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	imx219_stop_streaming(imx219);
> > > +	imx219->streaming = 0;
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx219_get_regulators(struct imx219 *imx219)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > +	int i;
> > > +
> > > +	for (i = 0; i < IMX219_NUM_SUPPLIES; i++)
> > > +		imx219->supplies[i].supply = imx219_supply_name[i];
> > > +
> > > +	return devm_regulator_bulk_get(&client->dev,
> > > +				       IMX219_NUM_SUPPLIES,
> > > +				       imx219->supplies);
> > > +}
> > > +
> > > +/* Verify chip ID */
> > > +static int imx219_identify_module(struct imx219 *imx219)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > +	int ret;
> > > +	u32 val;
> > > +
> > > +	ret = imx219_power_on(imx219->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = imx219_read_reg(imx219, IMX219_REG_CHIP_ID,
> > > +			      IMX219_REG_VALUE_16BIT, &val);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "failed to read chip id %x\n",
> > > +			IMX219_CHIP_ID);
> > > +		goto power_off;
> > > +	}
> > > +
> > > +	if (val != IMX219_CHIP_ID) {
> > > +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> > > +			IMX219_CHIP_ID, val);
> > > +		ret = -EIO;
> > > +	}
> > > +
> > 
> > I wonder if this is not a bit obscure: it's not obvious
> > from a first read that the device is left powered on successful
> > identification.
> > 
> > Perhaps you can have:
> > 
> >      return 0;
> > 
> > And then goto err_power_off on the error paths.
> > This way, it's clear that powering off is only
> > to be done on error.
> 
> OK. Makes sense. Will fix in v2.
> 
> > OTOH, why do we need to leave the device powered on probe?
> 
> Let me try what happens if I leave powering the sensor on and off
> to dev_pm_ops. (Seems like it *should* work in theory, but maybe
> there were some hidden problems.)
> (Also I would only be able to check if the sensor works or not - can't
> do the electrical signals or power consumption measurements etc.)
> 
> Anyway, leaving the sensor powered on shouldn't hurt, as the sensor
> is kept in lower power mode when it is not streaming (MIPI signals
> are passive - the indication on that is the "clock-noncontinuous"
> property in the DT bindings; also there is no code in the driver
> to change that, then the imx219 sensor must always "turn off"
> MIPI lines when it is not streaming - with the reg setting currently
> used at least).
> 

Right, the sensor being in LP state is a good point. IMHO, it's
totally fine is the sensor needs to be powered. It would be
nice to have a nice comment, if only for resource tracking reasons.

Thanks,
Ezequiel

