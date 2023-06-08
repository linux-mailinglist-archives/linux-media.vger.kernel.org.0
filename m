Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D54728103
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbjFHNR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 09:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbjFHNRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 09:17:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A821BD6
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686230229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/FNjp5Ec56Wc0xx/EwnuWM1/BFNIiJMjIHY+dLjxpPY=;
        b=UfKcFgEoP/YOFDyzjDxip+Sq+sjlZw/+bPsh7eP9MeBDoLZiOMAc4slCHAw7GCdRKK+VTh
        M+BUz0rKNsBiRfqFXyStgw7UPI3l6QfOHLmF2QNEYM5eNudDSnd9xFYwumJUIiR9/qW+rJ
        IsJYVHb0N0TeAjMAT89LULwRDOaj+m4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-JgLWKpKrMGqi177sonVlkQ-1; Thu, 08 Jun 2023 09:17:08 -0400
X-MC-Unique: JgLWKpKrMGqi177sonVlkQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-97542592eb9so65821566b.2
        for <linux-media@vger.kernel.org>; Thu, 08 Jun 2023 06:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230226; x=1688822226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FNjp5Ec56Wc0xx/EwnuWM1/BFNIiJMjIHY+dLjxpPY=;
        b=jrtBiGlJjF24lsgO0gkKlP+DNTx3lkPxENzXtHzb8B25pu0rvRTM3f6WS+vvOGJDPA
         71cGzWRzSuJe3DvTLKeB0JfNEBicz1lDZYo9zIMRbHEUc8al/O5K4IWrzfcOBHLke14G
         55WSB7vL4xOZTNIKZkZOq+VPzq/F06uRcjDdMtfMgdZi4nrIvDrq//moVVk5PlpSBMdj
         h0BtK0JlMFCUTNIr/qj3iKFEfCyjLDMYXA6mahJBwqJi386UOheBlJXF/EzY0yxRyAQp
         Y62Ug8rp0GQS80SirVSNWV5jUyiM8R72oTOV9VNLjJjydUBFtxEdI0mf97qXhaRZUog7
         rGJg==
X-Gm-Message-State: AC+VfDxAPA5LioAban9Z1a4ZVJ5zzGaHRv5WNotNJxe/997flU/inANG
        09uXoSau1G3aBlXvxrn1yTD7bI6BIBMLWB30gjo4xVJ415cvfzw367WUUDrNuRY9BNxSRNFctxu
        chDtJ8jM43MCQIj2NV/zQN2nGD4Cc4ww=
X-Received: by 2002:a17:907:3da1:b0:94f:7edf:8fa1 with SMTP id he33-20020a1709073da100b0094f7edf8fa1mr11974258ejc.32.1686230226729;
        Thu, 08 Jun 2023 06:17:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xzGbybp/BFtr/ICE/QKaAapIQgEL2HoqBBsVJd8Wp5YM2vyFi8PH82uw69yB/QK3gTp2D3w==
X-Received: by 2002:a17:907:3da1:b0:94f:7edf:8fa1 with SMTP id he33-20020a1709073da100b0094f7edf8fa1mr11974237ejc.32.1686230226436;
        Thu, 08 Jun 2023 06:17:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906370d00b00977d0f1c5bcsm684174ejc.69.2023.06.08.06.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:17:05 -0700 (PDT)
Message-ID: <989e1e71-47d3-e9aa-6b0e-c1dcc78bf843@redhat.com>
Date:   Thu, 8 Jun 2023 15:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/28] media: ov2680: Don't take the lock for try_fmt
 calls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-6-hdegoede@redhat.com>
 <ZIHNQ4JngKVJKMYu@kekkonen.localdomain>
 <20230608124830.GR5058@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230608124830.GR5058@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/8/23 14:48, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jun 08, 2023 at 12:44:51PM +0000, Sakari Ailus wrote:
>> On Wed, Jun 07, 2023 at 06:46:49PM +0200, Hans de Goede wrote:
>>> On ov2680_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
>>> ov2680_set_fmt() does not talk to the sensor.
>>>
>>> So in this case there is no need to lock the sensor->lock mutex or
>>> to check that the sensor is streaming.
>>>
>>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/media/i2c/ov2680.c | 20 +++++++++-----------
>>>  1 file changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>> index d90bbca6e913..a26a6f18f4f1 100644
>>> --- a/drivers/media/i2c/ov2680.c
>>> +++ b/drivers/media/i2c/ov2680.c
>>> @@ -592,24 +592,22 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>>>  	if (format->pad != 0)
>>>  		return -EINVAL;
>>>  
>>> -	mutex_lock(&sensor->lock);
>>> -
>>> -	if (sensor->is_streaming) {
>>> -		ret = -EBUSY;
>>> -		goto unlock;
>>> -	}
>>> -
>>>  	mode = v4l2_find_nearest_size(ov2680_mode_data,
>>>  				      ARRAY_SIZE(ov2680_mode_data), width,
>>>  				      height, fmt->width, fmt->height);
>>> -	if (!mode) {
>>> -		ret = -EINVAL;
>>> -		goto unlock;
>>> -	}
>>> +	if (!mode)
>>> +		return -EINVAL;
>>>  
>>>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>>  		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>>>  		format->format = *try_fmt;
>>
>> Access to sd_state needs to be serialised, so mutex should be held here.
> 
> This operation should be called with the state lock held already, so I
> don't think any extra locking is needed.

Right sd_state is allocated per v4l2-subdev fd so I would expect
the caller to take care of any necessary locking here.

Regards,

Hans




> 
>>> +		return 0;
>>> +	}
>>> +
>>> +	mutex_lock(&sensor->lock);
>>> +
>>> +	if (sensor->is_streaming) {
>>> +		ret = -EBUSY;
>>>  		goto unlock;
>>>  	}
>>>  
> 

