Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8325C6BA
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgICQ0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:26:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18098 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgICQ0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:26:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f51192e0000>; Thu, 03 Sep 2020 09:26:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 03 Sep 2020 09:26:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 03 Sep 2020 09:26:36 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Sep
 2020 16:26:35 +0000
Subject: Re: [PATCH v5 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <sakari.ailus@iki.fi>, <hverkuil@xs4all.nl>,
        <jacopo+renesas@jmondi.org>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-4-git-send-email-skomatineni@nvidia.com>
 <20200903144713.fyhmhs2bfcz5br6d@uno.localdomain>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <094073f1-ef58-a2fd-bed4-7fa3b99dd120@nvidia.com>
Date:   Thu, 3 Sep 2020 09:25:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903144713.fyhmhs2bfcz5br6d@uno.localdomain>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599150382; bh=ZMt4H+qrKNmPid6nY7Rb19UWnk3XyktkBLTuv+2GelQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=iqRFRyKJdyLidc/38I5RJd3iRCAPS5yMK82BhoEKnQZ0Kat6y7aso63/NtkdffE/B
         OfQ8ZclPhNNZb9CdgjfnEaB3cE71vznwMNDetwEl5e76gAMSraTKjReqdL+oXrlUml
         H9wtVBicR51x5BtNqjEYkgevZN09mrqNgsueP7TZxlatbRWnW/KCxfwdOZnoNLWsaU
         b9fRCKwjbdK3Y4m1s3nE3irjwtlbREt8ShcUgUPZe046sWdhV2YouYwD6KGsnP/+H2
         rm84M2/TMyDO/7eTmO+X6UQLcZdpGDunBLEB+B3iUTna66NuHDPM1WjEdeeeZHDowp
         EnsMR8Yd1PDjQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/3/20 8:03 AM, Jacopo Mondi wrote:
> Hello,
>
> On Tue, Sep 01, 2020 at 07:04:38PM -0700, Sowjanya Komatineni wrote:
>> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
>> and VDDL digital io 1.2V supply which are optional based on camera
>> module design.
>>
>> IMX274 also need external 24Mhz clock and is optional based on
>> camera module design.
>>
>> This patch adds support for IMX274 power on and off to enable and
>> disable these supplies and external clock.
>>
>> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/media/i2c/imx274.c | 134 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 131 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>> index a4b9dfd..79bfac3c6 100644
>> --- a/drivers/media/i2c/imx274.c
>> +++ b/drivers/media/i2c/imx274.c
>> @@ -18,7 +18,9 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/of_gpio.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/slab.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <linux/videodev2.h>
>> @@ -131,6 +133,15 @@
>>   #define IMX274_TABLE_WAIT_MS			0
>>   #define IMX274_TABLE_END			1
>>
>> +/* regulator supplies */
>> +static const char * const imx274_supply_names[] = {
>> +	"vddl",  /* IF (1.2V) supply */
>> +	"vdig",  /* Digital Core (1.8V) supply */
>> +	"vana",  /* Analog (2.8V) supply */
>> +};
>> +
>> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
>> +
>>   /*
>>    * imx274 I2C operation related structure
>>    */
>> @@ -501,6 +512,8 @@ struct imx274_ctrls {
>>    * @frame_rate: V4L2 frame rate structure
>>    * @regmap: Pointer to regmap structure
>>    * @reset_gpio: Pointer to reset gpio
>> + * @supplies: List of analog and digital supply regulators
>> + * @inck: Pointer to sensor input clock
>>    * @lock: Mutex structure
>>    * @mode: Parameters for the selected readout mode
>>    */
>> @@ -514,6 +527,8 @@ struct stimx274 {
>>   	struct v4l2_fract frame_interval;
>>   	struct regmap *regmap;
>>   	struct gpio_desc *reset_gpio;
>> +	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
>> +	struct clk *inck;
>>   	struct mutex lock; /* mutex lock for operations */
>>   	const struct imx274_mode *mode;
>>   };
>> @@ -767,6 +782,75 @@ static void imx274_reset(struct stimx274 *priv, int rst)
>>   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>>   }
>>
>> +/*
>> + * imx274_power_on - Function called to power on the sensor
>> + * @imx274: Pointer to device structure
>> + */
> Can I say this does not bring much value ? :)
> Also the parameter name is wrong
>
>> +static int imx274_power_on(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct stimx274 *imx274 = to_imx274(sd);
>> +	int ret;
>> +
>> +	/* keep sensor in reset before power on */
>> +	imx274_reset(imx274, 0);
>> +
>> +	ret = clk_prepare_enable(imx274->inck);
>> +	if (ret) {
>> +		dev_err(&imx274->client->dev,
>> +			"Failed to enable input clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->supplies);
>> +	if (ret) {
>> +		dev_err(&imx274->client->dev,
>> +			"Failed to enable regulators: %d\n", ret);
>> +		goto fail_reg;
>> +	}
>> +
>> +	usleep_range(1, 2);
> usleep_range() allows you to provide an interval in which your timeout
> can be coalesced with others. Giving a [1usec, 2usec] range kind of
> defeat the purpose. And most than everything, does sleeping for 2usec
> serve any real purpose ?

Following delay recommendation from DS for power on sequence.

>
>
>> +	imx274_reset(imx274, 1);
>> +
>> +	return 0;
>> +
>> +fail_reg:
>> +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
> regulator_bulk_enable() disables all the regulators that were enabled
> before the one that failed, so I don't think you need this one here
>
>> +	clk_disable_unprepare(imx274->inck);
>> +	return ret;
>> +}
>> +
>> +/*
>> + * imx274_power_off - Function called to power off the sensor
>> + * @imx274: Pointer to device structure
>> + */
> Same as the above one
>
>> +static int imx274_power_off(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct stimx274 *imx274 = to_imx274(sd);
>> +
>> +	imx274_reset(imx274, 0);
>> +
> Is reset before power-off necessary ?

Its recommended power off sequence as per data sheet.

Safe to keep sensor in reset before powering down one regulator at a time.

>
>> +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
>> +
>> +	clk_disable_unprepare(imx274->inck);
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
> For symmetry with the regulators API I would call this
> imx274_regulators_get(). Up to you :)
>
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++)
>> +		imx274->supplies[i].supply = imx274_supply_names[i];
>> +
>> +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
>> +					imx274->supplies);
>                                         ^ not sure if it's my email
>                                         client but you might have a
>                                         wrong indent here
>
> Also, the regulators are optional in the bindings, how do the
> regulators API cope with that ? I had a look around and they seems to
> assume regulators are provided. I might be mistaken though

Yes these are optional regulators and based on feedback from sakari 
changed to use regulator_bulk_get() here.

regulator_bulk_get() uses NORMAL_GET and in case if supplies is not 
found it will use dummy regulator.

>> +}
>> +
>>   /**
>>    * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>>    * @ctrl: V4L2 control to be set
>> @@ -781,6 +865,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>>   	struct stimx274 *imx274 = to_imx274(sd);
>>   	int ret = -EINVAL;
>>
>> +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
>> +		return 0;
>> +
> Right, but then you should call __v4l2_ctrl_handler_setup() in the
> s_stream(1) call path to have controls updated (after
> pm_runtime_get_sync() call for power on). I had a look at it seems
> only exposure is updated.

Existing driver does v4l2_ctrl_handler_setup() in probe(). So, sensor 
power on happens prior to that in probe() and then powers down during idle.

>
>>   	dev_dbg(&imx274->client->dev,
>>   		"%s : s_ctrl: %s, value: %d\n", __func__,
>>   		ctrl->name, ctrl->val);
>> @@ -811,6 +898,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>>   		break;
>>   	}
>>
>> +	pm_runtime_put(&imx274->client->dev);
>> +
>>   	return ret;
>>   }
>>
>> @@ -1327,6 +1416,13 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>>   	mutex_lock(&imx274->lock);
>>
>>   	if (on) {
>> +		ret = pm_runtime_get_sync(&imx274->client->dev);
>> +		if (ret < 0) {
>> +			pm_runtime_put_noidle(&imx274->client->dev);
>> +			mutex_unlock(&imx274->lock);
>> +			return ret;
>> +		}
>> +
>>   		/* load mode registers */
>>   		ret = imx274_mode_regs(imx274);
>>   		if (ret)
>> @@ -1362,6 +1458,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>>   		ret = imx274_write_table(imx274, imx274_stop);
>>   		if (ret)
>>   			goto fail;
>> +		pm_runtime_put(&imx274->client->dev);
>>   	}
>>
>>   	mutex_unlock(&imx274->lock);
>> @@ -1369,6 +1466,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>>   	return 0;
>>
>>   fail:
>> +	pm_runtime_put(&imx274->client->dev);
>>   	mutex_unlock(&imx274->lock);
>>   	dev_err(&imx274->client->dev, "s_stream failed\n");
>>   	return ret;
>> @@ -1834,6 +1932,14 @@ static int imx274_probe(struct i2c_client *client)
>>
>>   	mutex_init(&imx274->lock);
>>
>> +	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
> clk_get_optional() might return error. I would check this with IS_ERR
>
>> +	ret = imx274_get_regulators(&client->dev, imx274);
>> +	if (ret) {
>> +		dev_err(&client->dev,
>> +			"Failed to get power regulators, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	/* initialize format */
>>   	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
>>   	imx274->crop.width = IMX274_MAX_WIDTH;
>> @@ -1881,15 +1987,23 @@ static int imx274_probe(struct i2c_client *client)
>>   		goto err_me;
>>   	}
>>
>> -	/* pull sensor out of reset */
>> -	imx274_reset(imx274, 1);
>> +	/* power on the sensor */
>> +	ret = imx274_power_on(&client->dev);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev,
>> +			"%s : imx274 power on failed\n", __func__);
>> +		goto err_me;
>> +	}
> Doesn't pm_runtime_get calls the poweron function for you ?
>
> But anyway, I don't see the device being probed for, in example,
> querying it's VID/PID for identification during the driver's probe
> routine. Do you need to power on ?

existing driver does v4l2_ctrl handler setup and loads sensor default 
control values during probe.

So doing sensor power_on here prior to setup. Power off happens during idle.

>
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_enable(&client->dev);
>>
>>   	/* initialize controls */
>>   	ret = v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
>>   	if (ret < 0) {
>>   		dev_err(&client->dev,
>>   			"%s : ctrl handler init Failed\n", __func__);
>> -		goto err_me;
>> +		goto err_disable_rpm;
>>   	}
>>
>>   	imx274->ctrls.handler.lock = &imx274->lock;
>> @@ -1951,11 +2065,16 @@ static int imx274_probe(struct i2c_client *client)
>>   		goto err_ctrls;
>>   	}
>>
>> +	pm_runtime_idle(&client->dev);
>> +
>>   	dev_info(&client->dev, "imx274 : imx274 probe success !\n");
>>   	return 0;
>>
>>   err_ctrls:
>>   	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
>> +err_disable_rpm:
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>>   err_me:
>>   	media_entity_cleanup(&sd->entity);
>>   err_regmap:
>> @@ -1973,14 +2092,23 @@ static int imx274_remove(struct i2c_client *client)
>>
>>   	v4l2_async_unregister_subdev(sd);
>>   	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
>> +
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>> +
>>   	media_entity_cleanup(&sd->entity);
>>   	mutex_destroy(&imx274->lock);
>>   	return 0;
>>   }
>>
>> +static const struct dev_pm_ops imx274_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(imx274_power_off, imx274_power_on, NULL)
>> +};
>> +
>>   static struct i2c_driver imx274_i2c_driver = {
>>   	.driver = {
>>   		.name	= DRIVER_NAME,
>> +		.pm = &imx274_pm_ops,
>>   		.of_match_table	= imx274_of_id_table,
>>   	},
>>   	.probe_new	= imx274_probe,
>> --
>> 2.7.4
>>
