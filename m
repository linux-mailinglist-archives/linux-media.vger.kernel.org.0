Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969071BE93E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 22:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgD2U4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 16:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgD2U4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 16:56:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC8FC03C1AE
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 13:56:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f7so1652082pfa.9
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h9KVLx8xifn5/fsVJXChdpNoBNhbvKA9yFQ4rlXdxMQ=;
        b=FJDfx8Yuo6vhqF7OoEdF56IVzfMgihHvZMIuYJO5ZPFqDhMlhBm4jbm93YRleaU4zo
         PeeSLQo4u1rqv5vZsWQvnYdgKF1k74qEGogL1T4M1gADimVaXjXkof1EGLURgiL3Ab6v
         UZC09XEd7O9PKnPBMk6yM4Sswtw+5q4UGKFxhSzqY1HGIa4suabFEpKwiKKEdxYnW0gT
         zGaRu8+wgKscjKt1xbrg36ewJEH1E6z3Blguyzxb1jqyHD3aB/eQb9fcv5Fe4FKE+Dtv
         gyAXG+ehb7kZdLNKb4ZRZ30UyZCcUPJqo617AdLr4UsFglzhIcJU9b6i989iKS+HiWiZ
         fKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h9KVLx8xifn5/fsVJXChdpNoBNhbvKA9yFQ4rlXdxMQ=;
        b=j4xJpCL90qdcbgf8cS+mUJc5hUqwuTfHXrOktzG8smDs+QjEoUx6DOGeYVMuEsfDoz
         be4YDJ/3gOfPKLr3IHjcuMe6QEB8x8tqPqUwmASY1129B9aeQ05UDlABZ3OfypeAFkKH
         SxDmroENQ7Q0LZL1NkZmDk5Le3VCW2rQFccXlUBzAdgnHp0g6V90lDIFLeeW2E+4mwq9
         LBahiZ7yfLmY1KzwOXBTJSN7YpoUA8AhUbgfXUFOhlxEULYIN577NQONJrpV4ohICMFy
         Ev+RnIldKgxjhL3CYRB0pdde0HlJMH+3sRNF9WlPF9GIC6pTzYGlF4FOk6jmebb55/Bi
         RtXw==
X-Gm-Message-State: AGi0PuYZ5gZ+6qPa7W8aP4wREFAu9ORHVw2AmuiMu6i4NqIxW6Kr4jMS
        a57oP7X1Ax8yJZCjtz9hifI=
X-Google-Smtp-Source: APiQypKbqO4ZFPamPygkap+D1UeBrqfPv3KpuoQjyftlmV4bq/Ra2Yae8U1OcIHbEqXzF85I1VYXvQ==
X-Received: by 2002:a62:16cb:: with SMTP id 194mr37960201pfw.78.1588193796044;
        Wed, 29 Apr 2020 13:56:36 -0700 (PDT)
Received: from [172.30.0.94] (nat-wv.mentorg.com. [192.94.38.34])
        by smtp.gmail.com with ESMTPSA id c12sm1657169pgk.11.2020.04.29.13.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 13:56:35 -0700 (PDT)
Subject: Re: [PATCH v5 02/23] media: entity: Modify default behavior of
 media_entity_get_fwnode_pad
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-3-slongerbeam@gmail.com>
 <20200429144203.GJ9190@paasikivi.fi.intel.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <5fe3b06f-ec94-8acf-0741-a29912030447@gmail.com>
Date:   Wed, 29 Apr 2020 13:56:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429144203.GJ9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/29/20 7:42 AM, Sakari Ailus wrote:
> Hi Steve,
>
> On Sun, Apr 19, 2020 at 05:39:09PM -0700, Steve Longerbeam wrote:
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
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
>>   include/media/media-entity.h |  6 ++++--
>>   2 files changed, 24 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 12b45e669bcc..b1e0259a58c5 100644
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
> Given the 3rd patch, is this one still meant to be here?

It's true, it's not needed anymore, at least for imx, since all the imx 
devices have implemented get_fwnode_pad. I decided to leave it here 
anyway, since it does make some sense. But I have no problem removing it 
and possibly revisit this later.

Steve

>
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
>> index cde80ad029b7..9316eb9f8486 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -871,8 +871,10 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>>    * mappings of media pads.
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

