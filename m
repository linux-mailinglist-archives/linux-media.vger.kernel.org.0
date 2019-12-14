Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA9511F409
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 21:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfLNUnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 15:43:09 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46300 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfLNUnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 15:43:09 -0500
Received: by mail-pf1-f195.google.com with SMTP id y14so3357972pfm.13
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2019 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5zkDRAkSzbCXUw5b3MvSIcz/h2wTSB1pVOABhsfWdWE=;
        b=owF2oajSFy28sxgr6A/L7XvdqaNN0eF5+aGXkS41uUihYNVxGbItY+wToQaUT7oNDd
         hUhyCxqSts6UsJUWyJuVZeeDYza77VOws/tHu1olg1MMNt+9oh/6XhAXLvxnCkuVnP3T
         +5VNr4WSDm0+X01uTsnAQh0FYLz4iY4nlyzV7PRojSDpfENBUnp9xs44OP/p4FWyjkFj
         XZAiP1C6pwZuBqwCU2rhV16Erw3Ln+fF3/tDGq0Xuk+3Tt6pCUalDThkfqRGp6j1kJ+I
         bvGx21UhBYmTWY46LMB8dZAkro6GeUlLtfp1nMpJRpurV9AcyELIZ5HvqyGqIOJm0530
         dYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5zkDRAkSzbCXUw5b3MvSIcz/h2wTSB1pVOABhsfWdWE=;
        b=RRmp5qLf6EZYhAC2Vl7jqe+gjCH4K/I3xaxYi7zBOB+PKDKGURToUa7yWQZYnFxD9t
         6Ygl7zitgq9yA4HUkNe85F5NpzvF/0e7HutKCMlCgPPk36H+bnYWaAhDv91XBEPU3e+s
         KktbtCxR0B2R04VP4ZFnFoz6uTk3U0GITy6rVaBHPktCCAikK4TVVAeJWycwiNqxK4+0
         5MFS8m4G6mc8gIWFuKUpibXuz8AWHZdZn9WjnQQjlIo+G6XO3vX0FKgJPREUlTPJkq93
         B4tnNjUoSFDFBn8sHhFAEDpt9j5Lb7n35oi1VQGwuLoh4f+ID0ujEM/8knTjvhR1feC3
         cZEQ==
X-Gm-Message-State: APjAAAUiMhtz8QiBMbL/Wv4AN0hLc3JgPzuej4EkD234ioERipeaZdnb
        dpfOHWcCz8sWO1Rkmk/lY140HBLN
X-Google-Smtp-Source: APXvYqyd0545TixT0M9vpVgUdL4Tmm/2vto1G1TmwcrVChU3UDyUUxYffRwhPD7EF9CbRAs1moykSA==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr7495870pgl.255.1576356188105;
        Sat, 14 Dec 2019 12:43:08 -0800 (PST)
Received: from [172.30.89.12] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j125sm16763156pfg.160.2019.12.14.12.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 12:43:07 -0800 (PST)
Subject: Re: [PATCH v2 06/23] media: adv748x: csi2: Implement get_fwnode_pad
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-7-slongerbeam@gmail.com>
 <20191128115345.k6mn6kjyleahvw7n@uno.localdomain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <928cb34f-3b00-93d8-3507-0ada51d303fe@gmail.com>
Date:   Sat, 14 Dec 2019 12:43:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128115345.k6mn6kjyleahvw7n@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 11/28/19 3:53 AM, Jacopo Mondi wrote:
> Hi Steve,
>
> On Sun, Nov 24, 2019 at 11:06:46AM -0800, Steve Longerbeam wrote:
>> If the given endpoint fwnode passed to the .get_fwnode_pad() op is
>> the adv748x-csi2 TXA/TXB source endpoint, return the associated media
>> pad index ADV748X_CSI2_SOURCE. The adv748x-csi2 has no other media pads
>> that are associated with fwnode endpoints.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/media/i2c/adv748x/adv748x-csi2.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
>> index 2091cda50935..810085a1f2f0 100644
>> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
>> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
>> @@ -228,6 +228,24 @@ static const struct v4l2_subdev_ops adv748x_csi2_ops = {
>>   	.pad = &adv748x_csi2_pad_ops,
>>   };
>>
>> +/* -----------------------------------------------------------------------------
>> + * media_entity_operations
>> + */
>> +
>> +static int adv748x_csi2_get_fwnode_pad(struct media_entity *entity,
>> +				       struct fwnode_endpoint *endpoint)
>> +{
>> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
>> +
>> +	return endpoint->local_fwnode == tx->sd.fwnode ?
>> +		ADV748X_CSI2_SOURCE : -ENXIO;
> Couldn't you check if the endpoint port is either 10 or 11, as those
> are the only port numbers that provide a CSI-2 source pad ?
>
> In that case you could drop extending get_fwnode_pad() with th entity
> argument, as it is only used here (this one is actually the first user
> in the whole code base of this operation)

I don't think that's a very good idea. Entities that implement 
.get_fwnode_pad() in the future will likely need access to themselves in 
order to do the work. This implementation is a good example of that and 
is a better approach to checking the port number, because it is actually 
verifying that the endpoint fwnode object is owned by this device.

Steve

>
>> +}
>> +
>> +static const struct media_entity_operations adv748x_csi2_entity_ops = {
>> +	.get_fwnode_pad = adv748x_csi2_get_fwnode_pad,
>> +};
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Subdev module and controls
>>    */
>> @@ -295,6 +313,9 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>>   	/* Register internal ops for incremental subdev registration */
>>   	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
>>
>> +	/* Register media_entity ops */
>> +	tx->sd.entity.ops = &adv748x_csi2_entity_ops;
>> +
>>   	tx->pads[ADV748X_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
>>   	tx->pads[ADV748X_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>>
>> --
>> 2.17.1
>>

