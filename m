Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926B423493E
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 18:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgGaQeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 12:34:18 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11853 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgGaQeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 12:34:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2447da0000>; Fri, 31 Jul 2020 09:33:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 09:34:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 09:34:17 -0700
Received: from [10.2.167.221] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 16:34:16 +0000
Subject: Re: [PATCH v3 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
 <1595264494-2400-3-git-send-email-skomatineni@nvidia.com>
 <20200731162611.GB6401@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b8819080-6585-c953-e7ad-9b0a10f1d821@nvidia.com>
Date:   Fri, 31 Jul 2020 09:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731162611.GB6401@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596213211; bh=ImsShvZi2BlrnqE+BFzy6Y4uEy2DpiPRik5669MmGIc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=K9GZpXQXnCv8WivEnBxLw0sBJ1S5rjKStYb891lnSnL38vqFw4u2ttTpBJx5rWHzR
         maCxxFgSGLM3vFR3IuCJdt0+HSeRo4qo03mnRUTQGxuZs1CmEbkoXLO7YvxrhGsTov
         bWPadkQlcj/OsytTNRYFWdF3rmT+gXjMaURBHTrPGcQ1DPxggo8S1zcEX6J1qm76r+
         dPHrEEQD9aTUjKqpE31afKCLTkejb7ZVK2SH/ppInpVMfvAbfbOeJZ5tGKmjBCQUAF
         fa25AtY7LyxVDEtV2SyfOopep1S7FuwD2W04C4/c6hGVwpyFwikJbsj56t0I1DaA1R
         BlBTqS7QzYkHw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/31/20 9:26 AM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> Thanks for the patch.
>
> On Mon, Jul 20, 2020 at 10:01:34AM -0700, Sowjanya Komatineni wrote:
>> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
>> and VDDL digital io 1.2V supply which are optional based on camera
>> module design.
>>
>> IMX274 also need external 24Mhz clock and is optional based on
>> camera module design.
> The sensor appears to be able to use other frequencies, too. Could you
> check in the driver the frequency is correct? This should be found in DT
> bindings, too.

External input clock is not in DT. So added it as part of this series.

We are mostly using 24Mhz I/P with IMX274 on designs we have and also on=20
leopard module which has onboard XTAL for 24Mhz

>> This patch adds support for IMX274 power on and off to enable and
>> disable these supplies and external clock.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/media/i2c/imx274.c | 132 +++++++++++++++++++++++++++++++++++++=
++++++--
>>   1 file changed, 129 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>> index 55869ff..7157b1d 100644
>> --- a/drivers/media/i2c/imx274.c
>> +++ b/drivers/media/i2c/imx274.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of_gpio.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/slab.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <linux/videodev2.h>
>> @@ -131,6 +132,15 @@
>>   #define IMX274_TABLE_WAIT_MS			0
>>   #define IMX274_TABLE_END			1
>>  =20
>> +/* regulator supplies */
>> +static const char * const imx274_supply_names[] =3D {
>> +	"VDDL",  /* IF (1.2V) supply */
>> +	"VDIG",  /* Digital Core (1.8V) supply */
>> +	"VANA",  /* Analog (2.8V) supply */
>> +};
>> +
>> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> Please use ARRAY_SIZE() directly.
>
>> +
>>   /*
>>    * imx274 I2C operation related structure
>>    */
>> @@ -501,6 +511,8 @@ struct imx274_ctrls {
>>    * @frame_rate: V4L2 frame rate structure
>>    * @regmap: Pointer to regmap structure
>>    * @reset_gpio: Pointer to reset gpio
>> + * @supplies: imx274 analog and digital supplies
>> + * @inck: input clock to imx274
>>    * @lock: Mutex structure
>>    * @mode: Parameters for the selected readout mode
>>    */
>> @@ -514,6 +526,8 @@ struct stimx274 {
>>   	struct v4l2_fract frame_interval;
>>   	struct regmap *regmap;
>>   	struct gpio_desc *reset_gpio;
>> +	struct regulator *supplies[IMX274_NUM_SUPPLIES];
>> +	struct clk *inck;
>>   	struct mutex lock; /* mutex lock for operations */
>>   	const struct imx274_mode *mode;
>>   };
>> @@ -767,6 +781,99 @@ static void imx274_reset(struct stimx274 *priv, int=
 rst)
>>   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>>   }
>>  =20
>> +/*
>> + * imx274_power_on - Function called to power on the sensor
>> + * @imx274: Pointer to device structure
>> + */
>> +static int imx274_power_on(struct device *dev)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>> +	struct stimx274 *imx274 =3D to_imx274(sd);
>> +	int i, ret;
>> +
>> +	ret =3D clk_prepare_enable(imx274->inck);
>> +	if (ret) {
>> +		dev_err(&imx274->client->dev,
>> +			"Failed to enable input clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> Could you use regulator_bulk_enable() instead? Same for disable.

Using regulator_bulk_enable() makes these regulators mandatory.

But not all camera module designs expect power supply externally.

Leopard module don't need to enable these separately as their design has=20
onboard supplies that get enabled without SW control for individually=20
turning them on.

Some custom designs depend on sourcing externally and SW should enable=20
them like one of the other design module we have for Jetson TX1.=20
Depending on camera module design, these supplies can be optional.

>
>> +	for (i =3D 0; i < IMX274_NUM_SUPPLIES; i++) {
>> +		if (imx274->supplies[i]) {
>> +			ret =3D regulator_enable(imx274->supplies[i]);
>> +			if (ret < 0) {
>> +				dev_err(&imx274->client->dev,
>> +					"Failed to enable %s supply: %d\n",
>> +					imx274_supply_names[i], ret);
>> +				goto fail_reg;
>> +			}
>> +		}
>> +	}
>> +
>> +	usleep_range(1, 2);
> This is a very low value. Does that 1 =C2=B5s come from the sensor datash=
eet?
>
>> +	imx274_reset(imx274, 1);
>> +
>> +	return 0;
>> +
>> +fail_reg:
>> +	for (--i; i >=3D 0; i--) {
>> +		if (imx274->supplies[i])
>> +			regulator_disable(imx274->supplies[i]);
>> +	}
>> +
>> +	clk_disable_unprepare(imx274->inck);
>> +	return ret;
>> +}
>> +
>> +/*
>> + * imx274_power_off - Function called to power off the sensor
>> + * @imx274: Pointer to device structure
>> + */
>> +static int imx274_power_off(struct device *dev)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>> +	struct stimx274 *imx274 =3D to_imx274(sd);
>> +	int i;
>> +
>> +	imx274_reset(imx274, 0);
>> +
>> +	for (i =3D 0; i < IMX274_NUM_SUPPLIES; i++) {
>> +		if (imx274->supplies[i])
>> +			regulator_disable(imx274->supplies[i]);
>> +	}
>> +
>> +	clk_disable_unprepare(imx274->inck);
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx274_get_regulators(struct device *dev, struct stimx274 *i=
mx274)
>> +{
>> +	int i, err;
>> +	const char *supply;
>> +
>> +	for (i =3D 0; i < IMX274_NUM_SUPPLIES; i++) {
>> +		supply =3D imx274_supply_names[i];
>> +		imx274->supplies[i] =3D devm_regulator_get_optional(dev, supply);
>> +		if (!IS_ERR(imx274->supplies[i]))
>> +			continue;
>> +		err =3D PTR_ERR(imx274->supplies[i]);
>> +		if (err !=3D -ENODEV) {
>> +			if (err !=3D -EPROBE_DEFER)
>> +				dev_err(&imx274->client->dev,
>> +					"Failed to get %s supply: %d\n",
>> +					supply, err);
>> +			return err;
>> +		}
>> +
>> +		imx274->supplies[i] =3D NULL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>>    * @ctrl: V4L2 control to be set
>> @@ -1836,6 +1943,14 @@ static int imx274_probe(struct i2c_client *client=
)
>>  =20
>>   	mutex_init(&imx274->lock);
>>  =20
>> +	imx274->inck =3D devm_clk_get_optional(&client->dev, "inck");
>> +	ret =3D imx274_get_regulators(&client->dev, imx274);
>> +	if (ret) {
>> +		dev_err(&client->dev,
>> +			"Failed to get power regulators, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	/* initialize format */
>>   	imx274->mode =3D &imx274_modes[IMX274_DEFAULT_BINNING];
>>   	imx274->crop.width =3D IMX274_MAX_WIDTH;
>> @@ -1883,15 +1998,23 @@ static int imx274_probe(struct i2c_client *clien=
t)
>>   		goto err_me;
>>   	}
>>  =20
>> -	/* pull sensor out of reset */
>> -	imx274_reset(imx274, 1);
>> +	/* keep sensor in reset before power on */
>> +	imx274_reset(imx274, 0);
>> +
>> +	/* power on the sensor */
>> +	ret =3D imx274_power_on(&client->dev);
> This driver would really benefit from runtime PM support. I guess you
> usually don't want to leave the device powered on when it's not in use?
>
> Please see e.g. the ov8856 driver.
>
>> +	if (ret < 0) {
>> +		dev_err(&client->dev,
>> +			"%s : imx274 power on failed\n", __func__);
>> +		goto err_me;
>> +	}
>>  =20
>>   	/* initialize controls */
>>   	ret =3D v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
>>   	if (ret < 0) {
>>   		dev_err(&client->dev,
>>   			"%s : ctrl handler init Failed\n", __func__);
>> -		goto err_me;
>> +		goto err_power_off;
>>   	}
>>  =20
>>   	imx274->ctrls.handler.lock =3D &imx274->lock;
>> @@ -1958,6 +2081,8 @@ static int imx274_probe(struct i2c_client *client)
>>  =20
>>   err_ctrls:
>>   	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
>> +err_power_off:
>> +	imx274_power_off(&client->dev);
>>   err_me:
>>   	media_entity_cleanup(&sd->entity);
>>   err_regmap:
>> @@ -1975,6 +2100,7 @@ static int imx274_remove(struct i2c_client *client=
)
>>  =20
>>   	v4l2_async_unregister_subdev(sd);
>>   	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
>> +	imx274_power_off(&client->dev);
>>   	media_entity_cleanup(&sd->entity);
>>   	mutex_destroy(&imx274->lock);
>>   	return 0;
