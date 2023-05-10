Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C636FDDB1
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236982AbjEJMYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 08:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbjEJMYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 08:24:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C74AF1
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 05:24:08 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5A61547;
        Wed, 10 May 2023 14:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683721439;
        bh=Tq/E0D16LMa4khfwAPURm85utx+SG5Sc4UA5JxEc57s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KI6NVXxjBGiRqiBUkZfD/Kkrd9+J+biJAO86/xBYHpaMOFlZxYYZES2j2DNofHvZG
         2xlvDQU8RezuWNs8A/8l8aTeFoKLdxxUtbGeCTN5gwI5mQi+iScatdmM5SfczpIdaE
         yBcDMsXFd8WyEGmJmUZWo0z81M7u7WwDWSC7KgaI=
Message-ID: <83d132b4-827a-310f-806b-4ba58f6146c1@ideasonboard.com>
Date:   Wed, 10 May 2023 13:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] media: i2c: Propagate format from sink to source pad
Content-Language: en-US
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mickael Guene <mickael.guene@st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hugues.fruchet@foss.st.com, alain.volmat@foss.st.com
References: <20230502103547.150918-1-dan.scally@ideasonboard.com>
 <20230502103547.150918-3-dan.scally@ideasonboard.com>
 <67e9d3ee-88d9-c1d5-8b8d-928d047fb9f9@foss.st.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <67e9d3ee-88d9-c1d5-8b8d-928d047fb9f9@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Benjamin

On 10/05/2023 12:22, Benjamin Mugnier wrote:
> Hi Daniel,
>
> Thank you for your patch.
>
> On 5/2/23 12:35, Daniel Scally wrote:
>> When setting formats on the sink pad, propagate the adjusted format
>> over to the subdev's source pad. Use the MIPID02_SOURCE macro to fetch the pad's
>> try format rather than relying on the pad field of the format to facilitate
>> this - the function is specific to the source pad anyway.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/media/i2c/st-mipid02.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
>> index f20f87562bf1..04112f26bc9d 100644
>> --- a/drivers/media/i2c/st-mipid02.c
>> +++ b/drivers/media/i2c/st-mipid02.c
>> @@ -750,7 +750,7 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
>>   	if (format->which != V4L2_SUBDEV_FORMAT_TRY)
>>   		return;
>>   
>> -	*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
>> +	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) = format->format;
>>   }
>>   
>>   static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
>> @@ -768,6 +768,9 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
>>   		fmt = &bridge->fmt;
>>   
>>   	*fmt = format->format;
>> +
>> +	/* Propagate the format change to the source pad */
>> +	mipid02_set_fmt_source(sd, sd_state, format);
>>   }
>>   
>>   static int mipid02_set_fmt(struct v4l2_subdev *sd,
> By running checkpatch, I got 2 warnings :
>
> $ ./scripts/checkpatch.pl --strict --max-line-length=80
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> #7:
> over to the subdev's source pad. Use the MIPID02_SOURCE macro to fetch
> the pad's
>
> WARNING: line length of 83 exceeds 80 columns
> #25: FILE: drivers/media/i2c/st-mipid02.c:753:
> +	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) =
> format->format;
>
> Could you fix these in version 2 ? st-mipid02.c has other styling issues
> but I'd like not to add new ones ;)


Sure thing - thanks for the review

>
> Other than that, the code looks fine for me.
>
>
> Thank you.
>
