Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D05255162
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 00:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgH0W4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 18:56:16 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2881 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbgH0W4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 18:56:15 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4839e40000>; Thu, 27 Aug 2020 15:55:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Aug 2020 15:56:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 27 Aug 2020 15:56:15 -0700
Received: from [10.2.174.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Aug
 2020 22:56:14 +0000
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
 <b8819080-6585-c953-e7ad-9b0a10f1d821@nvidia.com>
 <20200813220147.GJ840@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <824ced0f-7493-9d2f-10af-5242c7997631@nvidia.com>
Date:   Thu, 27 Aug 2020 15:55:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813220147.GJ840@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598568932; bh=7y2B9liBdt6/JW2O3wpgrVPduvEhHwTR5pP93AhCNSM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=feSgNFGDLTmc/qw7jU9BAhKdNnlYMDtsC+GFxZlBIOGnq/mDRBjCDk65KBhX+CSfl
         dK7TaAtdTTExbYlECn9bP3cGrHuKXvE3YztWWpfXThWcSdM7SdMT2i+V6gwEkhOW/2
         HCXBUwdQYo/Vo6Cw8toEAcRh2t+wI/AbAgton2j4vSVdmy5dMilj0rqLpNpU+04Njq
         Z1BlRJmBfF4eCWBYhlnDKFh6eMP6NkcMB7/EPvq13QkqzgHdxzK6ZuLheXZM+qk3kX
         eKAL7W8fH+x4B+a430DKmB+Hr9DeEov5CvNOqZaHUuruk9jcQH1IVQEsIx2zqFccRt
         ty6B9RFfJvrpg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/13/20 3:01 PM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> On Fri, Jul 31, 2020 at 09:34:15AM -0700, Sowjanya Komatineni wrote:
>> On 7/31/20 9:26 AM, Sakari Ailus wrote:
>>> Hi Sowjanya,
>>>
>>> Thanks for the patch.
>>>
>>> On Mon, Jul 20, 2020 at 10:01:34AM -0700, Sowjanya Komatineni wrote:
>>>> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
>>>> and VDDL digital io 1.2V supply which are optional based on camera
>>>> module design.
>>>>
>>>> IMX274 also need external 24Mhz clock and is optional based on
>>>> camera module design.
>>> The sensor appears to be able to use other frequencies, too. Could you
>>> check in the driver the frequency is correct? This should be found in DT
>>> bindings, too.
>> External input clock is not in DT. So added it as part of this series.
>>
>> We are mostly using 24Mhz I/P with IMX274 on designs we have and also on
>> leopard module which has onboard XTAL for 24Mhz
> Yes. This information still should be found in DT as the xtal isn't part of
> the sensor.
>
>>>> This patch adds support for IMX274 power on and off to enable and
>>>> disable these supplies and external clock.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    drivers/media/i2c/imx274.c | 132 +++++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 129 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>>>> index 55869ff..7157b1d 100644
>>>> --- a/drivers/media/i2c/imx274.c
>>>> +++ b/drivers/media/i2c/imx274.c
>>>> @@ -19,6 +19,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/of_gpio.h>
>>>>    #include <linux/regmap.h>
>>>> +#include <linux/regulator/consumer.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/v4l2-mediabus.h>
>>>>    #include <linux/videodev2.h>
>>>> @@ -131,6 +132,15 @@
>>>>    #define IMX274_TABLE_WAIT_MS			0
>>>>    #define IMX274_TABLE_END			1
>>>> +/* regulator supplies */
>>>> +static const char * const imx274_supply_names[] = {
>>>> +	"VDDL",  /* IF (1.2V) supply */
>>>> +	"VDIG",  /* Digital Core (1.8V) supply */
>>>> +	"VANA",  /* Analog (2.8V) supply */
>>>> +};
>>>> +
>>>> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
>>> Please use ARRAY_SIZE() directly.
>>>
>>>> +
>>>>    /*
>>>>     * imx274 I2C operation related structure
>>>>     */
>>>> @@ -501,6 +511,8 @@ struct imx274_ctrls {
>>>>     * @frame_rate: V4L2 frame rate structure
>>>>     * @regmap: Pointer to regmap structure
>>>>     * @reset_gpio: Pointer to reset gpio
>>>> + * @supplies: imx274 analog and digital supplies
>>>> + * @inck: input clock to imx274
>>>>     * @lock: Mutex structure
>>>>     * @mode: Parameters for the selected readout mode
>>>>     */
>>>> @@ -514,6 +526,8 @@ struct stimx274 {
>>>>    	struct v4l2_fract frame_interval;
>>>>    	struct regmap *regmap;
>>>>    	struct gpio_desc *reset_gpio;
>>>> +	struct regulator *supplies[IMX274_NUM_SUPPLIES];
>>>> +	struct clk *inck;
>>>>    	struct mutex lock; /* mutex lock for operations */
>>>>    	const struct imx274_mode *mode;
>>>>    };
>>>> @@ -767,6 +781,99 @@ static void imx274_reset(struct stimx274 *priv, int rst)
>>>>    	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>>>>    }
>>>> +/*
>>>> + * imx274_power_on - Function called to power on the sensor
>>>> + * @imx274: Pointer to device structure
>>>> + */
>>>> +static int imx274_power_on(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct stimx274 *imx274 = to_imx274(sd);
>>>> +	int i, ret;
>>>> +
>>>> +	ret = clk_prepare_enable(imx274->inck);
>>>> +	if (ret) {
>>>> +		dev_err(&imx274->client->dev,
>>>> +			"Failed to enable input clock: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>> Could you use regulator_bulk_enable() instead? Same for disable.
>> Using regulator_bulk_enable() makes these regulators mandatory.
> How? regulator_bulk_enable() simply does call regulator_enable() on all the
> regulators.
>
regulator_bulk APIs uses regulator_bulk_data and so had to retrieve 
regulators from DT with devm_regulator_bulk_get() which don't use 
optional regulator get.

