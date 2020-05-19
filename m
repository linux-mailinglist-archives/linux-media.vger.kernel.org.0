Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247291D92D6
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 11:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgESJAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 05:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESJAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 05:00:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FC5C061A0C;
        Tue, 19 May 2020 02:00:45 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00A5330C;
        Tue, 19 May 2020 11:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589878842;
        bh=Kg4rFgMzyV1+S1EY5zVK+GMsUZNb+Axkr0N9M+tXJ7o=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JTmxiflKg+Js7ztU2CfLc6uFa3rTYW/m/GxDCrxKSgXivzo9J3/f+zcZHT3RxvRk3
         Xl4Fqu/KgjnsK22ijKQ6xdljGvdBrdtP8qRdix4cL4vuJYLQACMqb5LjXlRjfsd12G
         rTOd8DrRzVB8YxVvs4sZO/OPdBk+RK+oZZpky2xE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] fixes! [max9286]: Validate link formats
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
 <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
 <20200519075601.wdykflbxgvqvfl3x@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fa0015dc-5d48-b8f8-c735-6a8e1d6d6489@ideasonboard.com>
Date:   Tue, 19 May 2020 10:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519075601.wdykflbxgvqvfl3x@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 19/05/2020 08:56, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Mon, May 18, 2020 at 05:11:59PM +0100, Kieran Bingham wrote:
>> Disallow setting a format on the source link, but enable link validation
>> by returning the format of the first bound source when getting the
>> format of the source pad.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index ef824d2b26b8..6c01595936d7 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -711,7 +711,10 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>>  	struct v4l2_mbus_framefmt *cfg_fmt;
>>
>> -	if (format->pad >= MAX9286_SRC_PAD)
>> +	/* \todo: Multiplexed streams support
> 
> I know where \todo comes from, but it's usually TODO.
> Also

to much time playing in doxygen ;-)

>         /*
>          * TODO:
> 
> if the comment is multiline
> 
>> +	 * Prevent setting the format on the shared multiplexed bus.
>> +	 */
>> +	if (format->pad == MAX9286_SRC_PAD)
>>  		return -EINVAL;
>>
>>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
>> @@ -743,11 +746,17 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>>  {
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>>  	struct v4l2_mbus_framefmt *cfg_fmt;
>> +	unsigned int pad = format->pad;
>>
>> -	if (format->pad >= MAX9286_SRC_PAD)
>> -		return -EINVAL;
>> +	/* \todo: Multiplexed Stream Support
>> +	 * Support link validation by returning the format of the first bound
>> +	 * link. All links must have the same format, as we do not support
>> +	 * mixing, and matching of cameras connected to the max9286.
>> +	 */
>> +	if (format->pad == MAX9286_SRC_PAD)
> 
> You can use pad

Sure ;-)
> 
>> +		pad = ffs(priv->bound_sources);
>>
>> -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
>> +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
> 
> Or you could add one entry to struct max9286_priv.fmt for the source
> pad format, set the format there when is set on one sink, and just
> drop the check on the pad index in get_fmt. Up to you.
> 

I'd prefer to  reference the actual first source, rather than
duplicating as that's the link that we're validating against.

> Please squash in v10

Thanks, v10 soon!.

Just need to determine the best route for the remaining dt cleanups.

--
Kieran

> Thanks
>   j
> 
>>  	if (!cfg_fmt)
>>  		return -EINVAL;
>>
>> --
>> 2.25.1
>>

