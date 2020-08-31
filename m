Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEF6257EAD
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 18:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgHaQZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 12:25:26 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1678 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgHaQZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 12:25:23 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d24450003>; Mon, 31 Aug 2020 09:24:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 09:25:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 31 Aug 2020 09:25:23 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 16:25:22 +0000
Subject: Re: [PATCH v3 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <824ced0f-7493-9d2f-10af-5242c7997631@nvidia.com>
Message-ID: <b4768e7a-7bde-ca39-1eea-155447d6e36d@nvidia.com>
Date:   Mon, 31 Aug 2020 09:25:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <824ced0f-7493-9d2f-10af-5242c7997631@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598891077; bh=HVhG/9k6RfZkuiazSjJbuAzH2Op2xhu+jwzeXMpO+zE=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dpGTDal4hR8lGzCTQ4vaBw1n5kppy/FTesAFBbajLpVA8scH6iL530GaNJspcRM3I
         mDQgGTj6gX4Sa6fIGwuMRBOtxV0qQcbqdPW6MGRzkXkfvfaE92E/J+CzD8DZ/7FyF9
         5n9HVTXZQHWgJ1ol3hLOKYViKipm/2R7ckM9iLRRJbktT5d4UMqjJK9ykSlvzVf0eA
         sXBixjMaxqyU5TkhX9IK2dVH0Dy38Qy3gYGqyDVZqQBuXc7+BNu6hRFEoZ8F146nWL
         Ojqxbcv9RLnTEYGyZ+ygkt6yvweHprH61S6U6wDegFi++SBwRM4OMRN6UVkDDj9fMp
         YcBZsBgYIQ4YA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/27/20 3:55 PM, Sowjanya Komatineni wrote:
>
> On 8/13/20 3:01 PM, Sakari Ailus wrote:
>> Hi Sowjanya,
>>
>> On Fri, Jul 31, 2020 at 09:34:15AM -0700, Sowjanya Komatineni wrote:
>>> On 7/31/20 9:26 AM, Sakari Ailus wrote:
>>>> Hi Sowjanya,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> On Mon, Jul 20, 2020 at 10:01:34AM -0700, Sowjanya Komatineni wrote:
>>>>> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
>>>>> and VDDL digital io 1.2V supply which are optional based on camera
>>>>> module design.
>>>>>
>>>>> IMX274 also need external 24Mhz clock and is optional based on
>>>>> camera module design.
>>>> The sensor appears to be able to use other frequencies, too. Could you
>>>> check in the driver the frequency is correct? This should be found=20
>>>> in DT
>>>> bindings, too.
>>> External input clock is not in DT. So added it as part of this series.
>>>
>>> We are mostly using 24Mhz I/P with IMX274 on designs we have and=20
>>> also on
>>> leopard module which has onboard XTAL for 24Mhz
>> Yes. This information still should be found in DT as the xtal isn't=20
>> part of
>> the sensor.
>>
>>>>> This patch adds support for IMX274 power on and off to enable and
>>>>> disable these supplies and external clock.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/media/i2c/imx274.c | 132=20
>>>>> +++++++++++++++++++++++++++++++++++++++++++--
>>>>> =C2=A0=C2=A0 1 file changed, 129 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>>>>> index 55869ff..7157b1d 100644
>>>>> --- a/drivers/media/i2c/imx274.c
>>>>> +++ b/drivers/media/i2c/imx274.c
>>>>> @@ -19,6 +19,7 @@
>>>>> =C2=A0=C2=A0 #include <linux/module.h>
>>>>> =C2=A0=C2=A0 #include <linux/of_gpio.h>
>>>>> =C2=A0=C2=A0 #include <linux/regmap.h>
>>>>> +#include <linux/regulator/consumer.h>
>>>>> =C2=A0=C2=A0 #include <linux/slab.h>
>>>>> =C2=A0=C2=A0 #include <linux/v4l2-mediabus.h>
>>>>> =C2=A0=C2=A0 #include <linux/videodev2.h>
>>>>> @@ -131,6 +132,15 @@
>>>>> =C2=A0=C2=A0 #define IMX274_TABLE_WAIT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>>>> =C2=A0=C2=A0 #define IMX274_TABLE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>>>>> +/* regulator supplies */
>>>>> +static const char * const imx274_supply_names[] =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 "VDDL",=C2=A0 /* IF (1.2V) supply */
>>>>> +=C2=A0=C2=A0=C2=A0 "VDIG",=C2=A0 /* Digital Core (1.8V) supply */
>>>>> +=C2=A0=C2=A0=C2=A0 "VANA",=C2=A0 /* Analog (2.8V) supply */
>>>>> +};
>>>>> +
>>>>> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
>>>> Please use ARRAY_SIZE() directly.
>>>>
>>>>> +
>>>>> =C2=A0=C2=A0 /*
>>>>> =C2=A0=C2=A0=C2=A0 * imx274 I2C operation related structure
>>>>> =C2=A0=C2=A0=C2=A0 */
>>>>> @@ -501,6 +511,8 @@ struct imx274_ctrls {
>>>>> =C2=A0=C2=A0=C2=A0 * @frame_rate: V4L2 frame rate structure
>>>>> =C2=A0=C2=A0=C2=A0 * @regmap: Pointer to regmap structure
>>>>> =C2=A0=C2=A0=C2=A0 * @reset_gpio: Pointer to reset gpio
>>>>> + * @supplies: imx274 analog and digital supplies
>>>>> + * @inck: input clock to imx274
>>>>> =C2=A0=C2=A0=C2=A0 * @lock: Mutex structure
>>>>> =C2=A0=C2=A0=C2=A0 * @mode: Parameters for the selected readout mode
>>>>> =C2=A0=C2=A0=C2=A0 */
>>>>> @@ -514,6 +526,8 @@ struct stimx274 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fract frame_interval=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gpio_desc *reset_gpio;
>>>>> +=C2=A0=C2=A0=C2=A0 struct regulator *supplies[IMX274_NUM_SUPPLIES];
>>>>> +=C2=A0=C2=A0=C2=A0 struct clk *inck;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex lock; /* mutex lock=
 for operations */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct imx274_mode *mode;
>>>>> =C2=A0=C2=A0 };
>>>>> @@ -767,6 +781,99 @@ static void imx274_reset(struct stimx274=20
>>>>> *priv, int rst)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(IMX274_RESET_DELAY1=
, IMX274_RESET_DELAY2);
>>>>> =C2=A0=C2=A0 }
>>>>> +/*
>>>>> + * imx274_power_on - Function called to power on the sensor
>>>>> + * @imx274: Pointer to device structure
>>>>> + */
>>>>> +static int imx274_power_on(struct device *dev)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct i2c_client *client =3D to_i2c_client(dev);
>>>>> +=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(cli=
ent);
>>>>> +=C2=A0=C2=A0=C2=A0 struct stimx274 *imx274 =3D to_imx274(sd);
>>>>> +=C2=A0=C2=A0=C2=A0 int i, ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable(imx274->inck);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&imx274->client->=
dev,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
Failed to enable input clock: %d\n", ret);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>> Could you use regulator_bulk_enable() instead? Same for disable.
>>> Using regulator_bulk_enable() makes these regulators mandatory.
>> How? regulator_bulk_enable() simply does call regulator_enable() on=20
>> all the
>> regulators.
>>
> regulator_bulk APIs uses regulator_bulk_data and so had to retrieve=20
> regulators from DT with devm_regulator_bulk_get() which don't use=20
> optional regulator get.
>
Sorry, please ignore my above comment. Yes, will fix in v4 to use=20
bulk_enable()
