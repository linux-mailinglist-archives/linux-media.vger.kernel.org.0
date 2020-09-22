Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CFB27464C
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 18:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgIVQN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 12:13:58 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2079 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgIVQN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 12:13:58 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6a22980001>; Tue, 22 Sep 2020 09:13:12 -0700
Received: from [10.2.161.222] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 16:13:57 +0000
Subject: Re: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
 <20200922075501.GB3994831@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c79b6253-8476-c51b-ba32-10d464cfa4cb@nvidia.com>
Date:   Tue, 22 Sep 2020 09:13:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922075501.GB3994831@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600791192; bh=IJR+Q/vM8xX1U/gfMgaRcmarscwyB+VzRw0hYZ8DO0w=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=dH5Er+IISnTn6bdCW5Gc/Dxm2scLrwktMjIhtf4tNq87uAlxC2epyFfnctGN9LTOA
         oQCs8h8r2Ts/3fgfFdWYOqk53IGMBzFB6wDlheZZ8tbSOexTAMsfdrrVwSoliy28rb
         6n02WWi17ThfU0b9E7pJurFqroyqQYHTsbDYnblSftTh9TLo+JuQQlKY7NrAHvfp9p
         LN1h6O9MM1InsNZU1b0gk7RSrLJhkDFgPNDw6w+8YldD6+Es79YKCY8mib3dqdCYR9
         fn0yOyD+80rwixLeoi2PQEXtCsFEoCqjNzMz5xdWqQsSBp43CWo3rBGQ8Um8GfK9d1
         +Uqxhs+loPMdw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/22/20 12:55 AM, Thierry Reding wrote:
> On Mon, Sep 21, 2020 at 02:39:39PM -0700, Sowjanya Komatineni wrote:
>> IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl digital
>> io 1.2V supply which are optional based on camera module design.
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
>>   drivers/media/i2c/imx274.c | 184 +++++++++++++++++++++++++++++++++------------
>>   1 file changed, 134 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>> index 5e515f0..b3057a5 100644
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
> According to the device tree bindings these should be uppercase. Did I
> miss a patch that updates the bindings?
>
> I think the preference is for supply names to be lowercase and given
> that there are no users of this binding yet we could update it without
> breaking any existing device trees.
>
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
>> @@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274 *priv)
>>   {
>>   	int err = 0;
>>   
>> +	err = __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
>> +	if (err) {
>> +		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
>> +		return err;
>> +	}
>> +
>>   	/*
>>   	 * Refer to "Standby Cancel Sequence when using CSI-2" in
>>   	 * imx274 datasheet, it should wait 10ms or more here.
>> @@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv, int rst)
>>   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>>   }
>>   
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
>> +	udelay(2);
> This looks like some sort of extra delay to make sure all the supply
> voltages have settled. Should this perhaps be encoded as part of the
> regulator ramp-up times? Or is this really an IC-specific delay that
> is needed for some internal timing?
This is IC-specific delay after power on regulators before releasing reset.
>
>> +	imx274_reset(imx274, 1);
>> +
>> +	return 0;
>> +
>> +fail_reg:
>> +	clk_disable_unprepare(imx274->inck);
>> +	return ret;
>> +}
>> +
>> +static int imx274_power_off(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct stimx274 *imx274 = to_imx274(sd);
>> +
>> +	imx274_reset(imx274, 0);
>> +
>> +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
>> +
>> +	clk_disable_unprepare(imx274->inck);
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++)
>> +		imx274->supplies[i].supply = imx274_supply_names[i];
>> +
>> +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
>> +					imx274->supplies);
>> +}
>> +
>>   /**
>>    * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>>    * @ctrl: V4L2 control to be set
>> @@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>>   	struct stimx274 *imx274 = to_imx274(sd);
>>   	int ret = -EINVAL;
>>   
>> +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
>> +		return 0;
> I'm not sure I understand this, and sorry if this has been discussed
> earlier. Aren't there any other mechanisms in place to ensure that a
> control can only be configured when in use? If so, then is this even
> necessary?
>
> If not, silently ignoring at this point seems like it could cause subtle
> failures by ignoring some control settings and applying others if the
> timing is right.

With this patch, v4l2_ctrl setup is moved to start stream so all the 
control values selected gets programmed during stream start. So s_ctrl 
callback execution happens during that time after sensor rpm resume and 
I don't think we need here either but I see all sensor drivers with RPM 
enabled checking for this. So added just to make sure sensor programming 
don't happen when power is off.

Sakari/Jacob,

Can you please clarify if we can remove check pm_runtime_get_if_in_use() 
in s_ctrl callback as v4l2_ctrl handler setup happens during stream 
start where power is already on by then?

>> +
>>   	dev_dbg(&imx274->client->dev,
>>   		"%s : s_ctrl: %s, value: %d\n", __func__,
>>   		ctrl->name, ctrl->val);
>> @@ -811,6 +895,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>>   		break;
>>   	}
>>   
>> +	pm_runtime_put(&imx274->client->dev);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1269,10 +1355,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
>>    *
>>    * Return: 0 on success, errors otherwise
>>    */
>> -static int imx274_load_default(struct stimx274 *priv)
>> +static void imx274_load_default(struct stimx274 *priv)
>>   {
>> -	int ret;
>> -
>>   	/* load default control values */
>>   	priv->frame_interval.numerator = 1;
>>   	priv->frame_interval.denominator = IMX274_DEF_FRAME_RATE;
>> @@ -1280,29 +1364,6 @@ static int imx274_load_default(struct stimx274 *priv)
>>   	priv->ctrls.gain->val = IMX274_DEF_GAIN;
>>   	priv->ctrls.vflip->val = 0;
>>   	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
>> -
>> -	/* update frame rate */
>> -	ret = imx274_set_frame_interval(priv,
>> -					priv->frame_interval);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* update exposure time */
>> -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.exposure, priv->ctrls.exposure->val);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* update gain */
>> -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.gain, priv->ctrls.gain->val);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* update vflip */
>> -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.vflip, priv->ctrls.vflip->val);
>> -	if (ret)
>> -		return ret;
> This is not moved to somewhere else, so I assume the equivalent will
> happen somewhere higher up in the stack? Might be worth mentioning in
> the commit message why this can be dropped.
OK. Will add in commit message.
>
> Thierry
