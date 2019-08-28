Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1C379FFC7
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 12:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfH1KZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 06:25:40 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46651 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726259AbfH1KZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 06:25:40 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2v8wiSzjqThuu2v8ziHMwY; Wed, 28 Aug 2019 12:25:38 +0200
Subject: Re: [PATCH v2 4/6] rcar-vin: Do not reset the crop and compose
 rectangles in s_fmt
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-5-niklas.soderlund+renesas@ragnatech.se>
 <20190808083751.GF6055@pendragon.ideasonboard.com>
 <20190808133523.GA24385@bigcity.dyn.berto.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e461d293-a021-37f1-a5b9-9923caf93c26@xs4all.nl>
Date:   Wed, 28 Aug 2019 12:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808133523.GA24385@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG5eqDQTm/wd9F48HI7KeyrQRKenMyvV4DILTLiolYY5k19lERrYTQhFGYT9T+dTeoNGsnCGmzApxVtw7AFj85cnDyaCzzvTViFSMnKsYy2+1HA6tWRf
 y+Eyx+aYsxhlOIt4QMEoKId0CHUoSucm5xVoAggXXGYCP4l2nTQHJomLwzAqMkOrfbX8I6Zl/xkFQgdZd9Ux6ZIxzhwaxJAUKSzXhbmXuftvA7CZa4rAoBOD
 3v7DK/NKMsqPVydAwXf66uS9HPVwmYG8r4E0HdbPDkVDV55rMjOmwh6ogFPTwhPwPivqpFy04HtybjTAE29ft0Jh4JaVIlI/xBGeYbat6yy2HNApWGOzOX1y
 O8D7KjjR6ZXebJvESTg4C7+GY77rxEcUjY4ArrDNh+szKXkhimU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/8/19 3:35 PM, Niklas Söderlund wrote:
> Hi Laurent,
> 
> Thanks for your feedback.
> 
> On 2019-08-08 11:37:51 +0300, Laurent Pinchart wrote:
>> Hi Niklas,
>>
>> Thank you for the patch.
>>
>> On Thu, Aug 08, 2019 at 03:18:48AM +0200, Niklas Söderlund wrote:
>>> The crop and compose rectangles are reset when s_fmt is called
>>> resulting in potentially valid rectangles being lost when updating the
>>> format.
>>
>> Isn't this the expected behaviour ?
> 
> I though so to at first but I had a nagging feeling as I was not sure.  
> So I went and looked at vivid and it does do map the old crop/compose 
> rectangles inside the new limits vivid_s_fmt_vid_cap().
> 
> Please note that the variable names in this patch are horrible and are 
> fixed later in this series. In essence the current crop rectangle is 
> mapped inside the size of the video coming from the sensor and the 
> compose rectangle is mapped inside the new format set on the VIN video 
> device.

The only ioctls that completely reset everything are S_STD and S_DV_TIMINGS.

Ioctls such as S_FMT and S_SELECTION will try to keep as much of the
pre-existing configuration as possible.

So this patch is correct.

Regards,

	Hans

> 
> I'm open to dropping this patch, I just want this driver to get this 
> part right so I mimic vivid.
> 
>>
>>> Fix this by mapping the rectangles inside the new format.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> ---
>>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> index 8b30267f1636aaf1..5dcd787a9cf96ac9 100644
>>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> @@ -279,8 +279,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>>>  		return ret;
>>>  
>>>  	vin->format = f->fmt.pix;
>>> -	vin->crop = crop;
>>> -	vin->compose = compose;
>>> +	v4l2_rect_map_inside(&vin->crop, &crop);
>>> +	v4l2_rect_map_inside(&vin->compose, &compose);
>>>  	vin->src_rect = crop;
>>>  
>>>  	return 0;
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
> 

