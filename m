Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1E111F43D
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 22:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfLNV35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 16:29:57 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38656 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLNV35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 16:29:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so2654729wrh.5
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2019 13:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TJrA9oAPz4eGhGZNYWWPrI74Pt5m1kH1qATsjmm3teQ=;
        b=MWzufr7lJegwS+hkPW3tvYCvLMrBJU/0dtlOMGbZ85LOApRl1qhF9DYZ1KdfrZ/ofU
         k/Yvv4/d/i85dALCoS1f9wOSllnvi8evA3ZUA5EkwrvKvu1IFDciSlKGiDIPQHRYFAmw
         kXAJL4FhmIh4bbhdjr77d/5g5Ho1C+F7b6odWdQj+39z34H9pqitqTasVbp0cqNTGJ6F
         6oUkk8xfkmlLDPohSBPIHCK7hLk62wvmH+3bCvATgHqgjHT4u6YxWBhC9bMbGsrWDIxq
         +5KVhZi+3pIVzJmYP2ga0i8iXdIHlmDW6NmCoD9/eiKRCyOhr+dc3FHQ5qPovGZwIJcw
         emZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TJrA9oAPz4eGhGZNYWWPrI74Pt5m1kH1qATsjmm3teQ=;
        b=gUYColsqcMBydGZFFKdS93sXv/I1XUrGl0vdXhuis+lUq0hIGsluvp/4m6km41fr20
         ERm/tlqrcRqCW8Vdxhyvg8c8QMexo+wFFklOckOpolKpasoJXSXRLuRFGRZd4y/gU+D9
         HMcpNv1VdkrE0PMXxXPukqOM2V3V62JwJc5HX3JgXQ6jDXXMNt4djPbTOxEytrTGsreP
         +EFegzI/YLLcayQWzqzwEzJKTKTV+xc67aLyIw7ntHaM6KryMiMgwgGdMjnUWOKdAhC/
         cz++Vjy5OQLfumVK+ZpFlLutMrheE6sQMJpBo8te9lFeJZ6feZgfNh7J7/sG3UVXcUUh
         zZaQ==
X-Gm-Message-State: APjAAAU2kkC2yD4kqsaQ2vmyjZPXY32qgmDGQbSHFiPDE5/be6HLVQ++
        YczGukWCDj2KZhyp+ye1ZjyTysZ2
X-Google-Smtp-Source: APXvYqxR3nuKNi3T/ti5uS+K4mS17yrWYP/JSC1y4p4u0ek0iZJEp/yMmb5+4T+9wF8iz7BF5Lg8bQ==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr19598228wrr.32.1576358993819;
        Sat, 14 Dec 2019 13:29:53 -0800 (PST)
Received: from [172.30.89.12] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id i8sm15474357wro.47.2019.12.14.13.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 13:29:53 -0800 (PST)
Subject: Re: [PATCH v2 02/23] media: entity: Modify default behavior of
 media_entity_get_fwnode_pad
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-3-slongerbeam@gmail.com>
 <20191128120411.x7avm62lyq36gdya@uno.localdomain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6d20027f-3c54-77ca-45be-7457edea4e1b@gmail.com>
Date:   Sat, 14 Dec 2019 13:29:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128120411.x7avm62lyq36gdya@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 11/28/19 4:04 AM, Jacopo Mondi wrote:
> Hi Steve,
>
> On Sun, Nov 24, 2019 at 11:06:42AM -0800, Steve Longerbeam wrote:
>> Modify the default behavior of media_entity_get_fwnode_pad() (when the
>> entity does not provide the get_fwnode_pad op) to first assume the entity
>> implements a 1:1 mapping between fwnode port number and media pad index.
>>
>> If the 1:1 mapping is not valid, e.g. the port number falls outside the
>> entity's pad index range, or the pad at that port number doesn't match the
>> given direction_flags, fall-back to the previous behavior that searches
>> the entity for the first pad that matches the given direction_flags.
>>
>> The previous default behavior can choose the wrong pad for entities with
>> multiple sink or source pads. With this change the function will choose
>> the correct pad index if the entity implements a 1:1 port to pad mapping
>> at that port.
>>
>> Add some comments to the @get_fwnode_pad operation to make it more clear
>> under what conditions entities must implement the operation.
>>
> I understand the rationale behind this, but this is not better than
> assuming the first pad with a matching direction flag is the right
> one imho.
>
> This should help for subdevices with multiple sink/sources, but they
> should really implement get_fwnode_pad() instead of relying on yet another
> assumption as we had "the first pad with matching direction is the right
> one" and now we also have "the pad at index endpoint.port is the right
> one".

I don't see the second assumption as really an assumption. If the given 
endpoint's port number falls within the entity's pad index range (it's a 
valid pad index), and the pad at that index matches the requested 
direction, then it _must_ be the correct pad.


>   As you've been testing it, how many of the current mailine
> supported devices actually need this and could not:
> 1) Implement get_fwnode_pad() as you are doing for adv748x
> 2) Keep assuming the first pad with a matching flag is the correct one

Well, this patch reduces the number of devices that need to implement 
get_fwnode_pad():

Before: devices do NOT need implement the op if they have just one pad 
of a given direction (one sink pad, one source pad, or one of each).

After: devices do NOT need to implement the op if they have just one pad 
of a given direction, OR all of their pad indexes match their fwnode 
port numbers.

Steve

>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
>>   include/media/media-entity.h | 21 +++++++++++++++------
>>   2 files changed, 35 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index c333320f790a..47a39d9383d8 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>>   				unsigned long direction_flags)
>>   {
>>   	struct fwnode_endpoint endpoint;
>> -	unsigned int i;
>>   	int ret;
>>
>> +	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
>> +	if (ret)
>> +		return ret;
>> +
>>   	if (!entity->ops || !entity->ops->get_fwnode_pad) {
>> +		unsigned int i;
>> +
>> +		/*
>> +		 * for the default case, first try a 1:1 mapping between
>> +		 * fwnode port number and pad index.
>> +		 */
>> +		ret = endpoint.port;
>> +		if (ret < entity->num_pads &&
>> +		    (entity->pads[ret].flags & direction_flags))
>> +			return ret;
>> +
>> +		/*
>> +		 * if that didn't work search the entity for the first
>> +		 * pad that matches the @direction_flags.
>> +		 */
>>   		for (i = 0; i < entity->num_pads; i++) {
>>   			if (entity->pads[i].flags & direction_flags)
>>   				return i;
>>   		}
>>
>> +		/* else fail */
>>   		return -ENXIO;
>>   	}
>>
>> -	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
>> -	if (ret)
>> -		return ret;
>> -
>>   	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
>>   	if (ret < 0)
>>   		return ret;
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index cde80ad029b7..ed00adb4313b 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -199,6 +199,12 @@ struct media_pad {
>>    * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
>>    *			a negative value on error. This operation can be used
>>    *			to map a fwnode to a media pad number. Optional.
>> + *			Entities do not need to implement this operation
>> + *			unless two conditions are met:
>> + *			- the entity has more than one sink and/or source
>> + *			  pad, _and_
>> + *			- the entity does not implement a 1:1 mapping of
>> + *			  fwnode port numbers to pad indexes.
>>    * @link_setup:		Notify the entity of link changes. The operation can
>>    *			return an error, in which case link setup will be
>>    *			cancelled. Optional.
>> @@ -858,21 +864,24 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>>   struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>>
>>   /**
>> - * media_entity_get_fwnode_pad - Get pad number from fwnode
>> + * media_entity_get_fwnode_pad - Get pad number from an endpoint fwnode
>>    *
>>    * @entity: The entity
>> - * @fwnode: Pointer to the fwnode_handle which should be used to find the pad
>> + * @fwnode: Pointer to the endpoint fwnode_handle which should be used to
>> + *          find the pad
>>    * @direction_flags: Expected direction of the pad, as defined in
>>    *		     :ref:`include/uapi/linux/media.h <media_header>`
>>    *		     (seek for ``MEDIA_PAD_FL_*``)
>>    *
>>    * This function can be used to resolve the media pad number from
>> - * a fwnode. This is useful for devices which use more complex
>> - * mappings of media pads.
>> + * an endpoint fwnode. This is useful for devices which use more
>> + * complex mappings of media pads.
>>    *
>>    * If the entity does not implement the get_fwnode_pad() operation
>> - * then this function searches the entity for the first pad that
>> - * matches the @direction_flags.
>> + * then this function first assumes the entity implements a 1:1 mapping
>> + * between fwnode port number and media pad index. If the 1:1 mapping
>> + * is not valid, then the function searches the entity for the first pad
>> + * that matches the @direction_flags.
>>    *
>>    * Return: returns the pad number on success or a negative error code.
>>    */
>> --
>> 2.17.1
>>

