Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DD71BE917
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 22:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgD2Utl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 16:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgD2Utk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 16:49:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A598FC03C1AE
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 13:49:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so1281813plo.7
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 13:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dDfsPjc2eafyO/4KPYv20ArmQvNr+tvi92kvu1zdsKM=;
        b=bbd3fFOeP3ETWnnwMa3xDvPhIrJML31fB5CZcl7tfsi27paXAjpXFXgWJi3Y+n7UTx
         rfQfZ8X9aDzvtRXLpCxjP4KYMkqIkDLC7j6ryQB5IG1sNa2yW2cx41U0ISK7k8jivjH5
         g49oMS6l1oh9DQ0DiYe8jRPjcaUukL1H4HT0i7oFv782hH2k6M6kRDgUbSCU0eqsJRzC
         hPaiZ7/zvphI72SKtZh+yizn049WyPGKPeMziefs+AtGL7/9REoUFnENNMZUcxTDPb2P
         7kWt9Uf2hSBKoRw4Vljfy+BG65jUBgEIY/x5SDkqqG3HLyMlhFRvM553+6ZxijMF5VQV
         8G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dDfsPjc2eafyO/4KPYv20ArmQvNr+tvi92kvu1zdsKM=;
        b=fc2ysSDc3G2koSZppJxv6qIorHv25oBgfpak0ippxvuFIO3x9wDhs1Xx6G21l6ECwe
         MeuKgvVrNxUOB7hc4i/W74ciWjtnPjEi0+IjqMFNINj40Uuw0QtvL/ZFHmVmIowahNj0
         kRTEM/kUaMNKmKOLqVlRl86TH333ZBnZUmoS00KrrzSxCvqQXbdvR5YbHWL9idSXjak/
         p8zGD2saD0XOwnPTOjvSvLBsyje6See47f6SPAla4juxSkIutfOH+L8pCFPiOELL7gWl
         dEYD5mwgaHuNs7n4h++PfH1lNfIoZsjqkOYK21oV0BHKwCWpI6e5qsi2hmdPNRM2voPu
         gsKQ==
X-Gm-Message-State: AGi0PuYAmakR7LfwovODIF0UeShUsip/iES8TK7LNSABzGo1GC7XehJ+
        iR1e84ME1pMsoQrk6y32BWU=
X-Google-Smtp-Source: APiQypIO6gVWkorVl2+vrzUG7+QIDQsdtlid/Q8T6a+uIbWpjuBQoq+1kLIiwiN5YnTdNMJcIZZvdA==
X-Received: by 2002:a17:902:24b:: with SMTP id 69mr244898plc.52.1588193379003;
        Wed, 29 Apr 2020 13:49:39 -0700 (PDT)
Received: from [172.30.0.94] (nat-wv.mentorg.com. [192.94.38.34])
        by smtp.gmail.com with ESMTPSA id z60sm147884pjj.14.2020.04.29.13.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 13:49:38 -0700 (PDT)
Subject: Re: [PATCH v5 03/23] media: v4l2-subdev: add
 v4l2_subdev_get_fwnode_pad_default
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-4-slongerbeam@gmail.com>
 <20200429143946.GI9190@paasikivi.fi.intel.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <62e91ae8-7099-6f1d-9c8a-9255d90c3db9@gmail.com>
Date:   Wed, 29 Apr 2020 13:49:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429143946.GI9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 4/29/20 7:39 AM, Sakari Ailus wrote:
> Hi Steve,
>
> On Sun, Apr 19, 2020 at 05:39:10PM -0700, Steve Longerbeam wrote:
>> Add a convenience function that can be used as the .get_fwnode_pad
>> operation for subdevices that map port numbers and pad indexes 1:1.
>> The function verifies the endpoint is owned by the subdevice, and if
>> so returns the endpoint port number.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 17 +++++++++++++++++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index a376b351135f..d5b5cd7a6049 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -696,6 +696,31 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>>   };
>>   
>>   #ifdef CONFIG_MEDIA_CONTROLLER
>> +
>> +int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
>> +				       struct fwnode_endpoint *endpoint)
>> +{
>> +	struct fwnode_handle *ep;
>> +	struct v4l2_subdev *sd;
>> +
>> +	if (!is_media_entity_v4l2_subdev(entity))
>> +		return -EINVAL;
>> +
>> +	sd = media_entity_to_v4l2_subdev(entity);
>> +
>> +	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), ep) {
>> +		if (ep != endpoint->local_fwnode)
>> +			continue;
> If the purpose is just to check a given endpoint belongs to a device, could
> it be done in a more simple way? E.g.:
>
> 	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
> 	fwnode_handle_put(fwnode);
>
> 	if (dev_fwnode(sd->dev) == fwnode)
> 		return endpoint->port;
>
> 	return -ENXIO;

Sorry you are right, I was stuck on confirming the endpoint itself is 
one of the devices endpoints, but yes, above is all that is needed to 
confirm the endpoint is owned by the device, I'll make that change.

Steve


>
>> +
>> +		fwnode_handle_put(ep);
>> +
>> +		return endpoint->port;
>> +	}
>> +
>> +	return -ENXIO;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fwnode_pad_default);
>> +
>>   int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>>   				      struct media_link *link,
>>   				      struct v4l2_subdev_format *source_fmt,
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index a4848de59852..940181323427 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1027,6 +1027,23 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
>>   
>>   #ifdef CONFIG_MEDIA_CONTROLLER
>>   
>> +/**
>> + * v4l2_subdev_get_fwnode_pad_default - Get pad number from a subdev fwnode
>> + *                                      endpoint, assuming 1:1 port:pad
>> + *
>> + * @entity - Pointer to the subdev entity
>> + * @endpoint - Pointer to a parsed fwnode endpoint
>> + *
>> + * This function can be used as the .get_fwnode_pad operation for
>> + * subdevices that map port numbers and pad indexes 1:1. If the endpoint
>> + * is owned by the subdevice, the function returns the endpoint port
>> + * number.
>> + *
>> + * Returns the endpoint port number on success or a negative error code.
>> + */
>> +int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
>> +				       struct fwnode_endpoint *endpoint);
>> +
>>   /**
>>    * v4l2_subdev_link_validate_default - validates a media link
>>    *

