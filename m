Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE992C006D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfI0Hwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:52:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38005 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbfI0Hwy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:52:54 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Dl3YiK9ku9D4hDl3ciArj6; Fri, 27 Sep 2019 09:52:52 +0200
Subject: Re: [PATCH v6 7/7] media: imx214: Add new control with
 V4L2_CID_UNIT_CELL_SIZE
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-8-ricardo@ribalda.com>
 <6e4c1969-a80d-4747-7a44-b7a46804fe12@xs4all.nl>
 <CAPybu_3ga6rJ8pzw3wAP=nMOHDqeQEWWa-reto7Xk_FzRFVLyw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3a5bdb3e-aad8-0f78-535e-c2ed431b4721@xs4all.nl>
Date:   Fri, 27 Sep 2019 09:52:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_3ga6rJ8pzw3wAP=nMOHDqeQEWWa-reto7Xk_FzRFVLyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEcTm6k513b/sTsCmph+VJMYlIinvV6fbhB3i50CSHmr+WNwTwsJLflCfq72bEAW9eHPAWiU5U+6xyFcnDbW0b1Ez0zyoZGtnGZhRvOXpnVl2h9fXdoX
 grspuQFErKFvHeBrd/M14cTXIdjtB8ReDRsMNK+wVx5ETGpMA+en0y3kMXT5d9RJUCQhm30Uv69p/+BNToWwh+HX7JZWCfKa8Je81EEAVXJphUA2GVcPIXIC
 6qz2cAVEFG/E0xrzJ3NvDk52bqYcjUJgHeQa3jfoZBHZmg1hxp2VBy5QV3ToKLY81eR+13uMA7HhmxYBG9h2Dk9pcF442fYET6mZAmU0Czw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/27/19 9:33 AM, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> On Fri, 27 Sep 2019, 09:14 Hans Verkuil, <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 9/20/19 3:51 PM, Ricardo Ribalda Delgado wrote:
>>> From: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>>
>>> According to the product brief, the unit cell size is 1120 nanometers^2.
>>>
>>> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>> ---
>>>  drivers/media/i2c/imx214.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
>>> index 159a3a604f0e..57562e20c4ca 100644
>>> --- a/drivers/media/i2c/imx214.c
>>> +++ b/drivers/media/i2c/imx214.c
>>> @@ -47,6 +47,7 @@ struct imx214 {
>>>       struct v4l2_ctrl *pixel_rate;
>>>       struct v4l2_ctrl *link_freq;
>>>       struct v4l2_ctrl *exposure;
>>> +     struct v4l2_ctrl *unit_size;
>>>
>>>       struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
>>>
>>> @@ -948,6 +949,13 @@ static int imx214_probe(struct i2c_client *client)
>>>       static const s64 link_freq[] = {
>>>               IMX214_DEFAULT_LINK_FREQ,
>>>       };
>>> +     struct v4l2_area unit_size = {
>>> +             .width = 1120,
>>> +             .height = 1120,
>>> +     };
>>> +     union v4l2_ctrl_ptr p_def = {
>>> +             .p_area = &unit_size,
>>> +     };
>>
>> Use static const for both.
>>
>> I think you should add a small static inline helper function to v4l2-ctrls.h that
>> takes a void pointer and returns a union v4l2_ctrl_ptr.
>>
>> Then you don't need to make a union v4l2_ctrl_ptr just to pass the unit_size pointer.
>>
> 
> That sounds useful, but can we warantee for all the arches that
> sizeof(v4l2_ctrl_ptr) <= sizeof (void *)

Yes. Everything in the union is a pointer, so sizeof(v4l2_ctrl_ptr) == sizeof (void *)

Regards,

	Hans

> 
> Of course, it sounds logic, that a union of pointers is the same size
> than a pointer... but you never know.
> 
> No matter what I will make the helper and resend. with all the changes
> from Jacopo
> 
> Thanks!
> 
>> Regards,
> 
> 
> 
>>
>>         Hans
>>
>>>       int ret;
>>>
>>>       ret = imx214_parse_fwnode(dev);
>>> @@ -1029,6 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
>>>                                            V4L2_CID_EXPOSURE,
>>>                                            0, 3184, 1, 0x0c70);
>>>
>>> +     imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
>>> +                                                    NULL,
>>> +                                                    V4L2_CID_UNIT_CELL_SIZE,
>>> +                                                    p_def);
>>>       ret = imx214->ctrls.error;
>>>       if (ret) {
>>>               dev_err(&client->dev, "%s control init failed (%d)\n",
>>>
>>

