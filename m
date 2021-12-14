Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD9E474D60
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhLNVyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbhLNVyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:54:35 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64305C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:54:35 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u17so34810864wrt.3
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OkzGY8qIcdE8QjlVTYFUUUX4yC1Sk5o0DS20lJVrn8Y=;
        b=L2UFJvQIWO+RuG9g0p1ssehh8PzZ0IMi8HyuvpjDVw7i6LfHHPJEvyCjOOH3Q2izGz
         ir9jWpmAw+c3aFU36Q3t+84Uwqh7HjjSo2JjAcTfOvmp/kJ/c6bH7IcKcziB4Herg7hI
         kWxJ9HQyZu5PdsH8xB7DGSm5XdBZT6TtwsLgMosZHap7XPAB0rU+M7aiaYm/8iHkTmye
         +JEbZU2j1vVV9fweChPiGQrjWSmRdC+46MVh9/W32fjrYFnRwXnaLrPx3jW6/Kv07mf6
         nnBR9iChcBdnEtzLHcqhvW3cD8z5zLZwUM7/7jq0m7h6LQNynanyQYgqHAzFt8FPQ4ew
         GqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OkzGY8qIcdE8QjlVTYFUUUX4yC1Sk5o0DS20lJVrn8Y=;
        b=1mMi5QlqOjuKNT5FFXB3mUkfSqmOeNCx9ZMwlaGxqTHdQ3Zpy4JsNT/IEnhQgp+LDc
         +yJXJa7KQSsE7uxNsxPLzaBOECXJ/VtvPaw+1HSQ3f8SKS8FtxuYqCwi9wb/JyHVGeHR
         fgiu6/er6FgpSCx2uo2H5niXDhV2gU24tQka9XIPEwjrGrbLMN6qkJIbkaCZNaw689P2
         lQHatIp3E9GPpoTm6nTXvgtLs2uqq+X/I4NBfDnrH7qFlpH2hkkSb7kDbk0A4hvRNKf2
         KzIntK1Cr06s1ZbJSsRDW5Yc+OQKWgNLsNVIHK6B3VY17r5Xfe1ZrgzklCXIg3Y6kSF7
         2NQQ==
X-Gm-Message-State: AOAM5337s89XqTFmzhC8t+5UZ6+S2/CVQaLgNc21RqUaFLmq7q7TNL9U
        pgiu55626JiVRGWADjEmOe7jcK4es+o=
X-Google-Smtp-Source: ABdhPJx5ZrSoVAaqO63O8NM105t3zoIQMIqIKDoHW6GxRUmlv7J/TuWclmekA098csFWt9JZqur7HA==
X-Received: by 2002:adf:f587:: with SMTP id f7mr1654733wro.671.1639518873950;
        Tue, 14 Dec 2021 13:54:33 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id u15sm60513wmq.13.2021.12.14.13.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 13:54:33 -0800 (PST)
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-5-djrscally@gmail.com>
 <YbkL2V24TFdA5KHx@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6929c5a8-67dc-77c6-459e-6ce26a08fb73@gmail.com>
Date:   Tue, 14 Dec 2021 21:54:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkL2V24TFdA5KHx@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 14/12/2021 21:25, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Dec 13, 2021 at 11:28:48PM +0000, Daniel Scally wrote:
>> Add functions to create and destroy ancillary links, so that they
>> don't need to be manually created by users.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since the rfc:
>>
>> 	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
>> 	members
>> 	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
>> 	create function
>>
>>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
>>  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
>>  2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index aeddc3f6310e..4e39e100ea03 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -1052,3 +1052,33 @@ void media_remove_intf_links(struct media_interface *intf)
>>  	mutex_unlock(&mdev->graph_mutex);
>>  }
>>  EXPORT_SYMBOL_GPL(media_remove_intf_links);
>> +
>> +struct media_link *media_create_ancillary_link(struct media_entity *primary,
>> +					       struct media_entity *ancillary,
>> +					       u32 flags)
>> +{
>> +	struct media_link *link;
>> +
>> +	link = media_add_link(&primary->links);
>> +	if (!link)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	link->gobj0 = &primary->graph_obj;
>> +	link->gobj1 = &ancillary->graph_obj;
>> +	link->flags = flags | MEDIA_LNK_FL_ANCILLARY_LINK;
>> +
>> +	/* Initialize graph object embedded at the new link */
>> +	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
>> +			  &link->graph_obj);
>> +
>> +	return link;
>> +}
>> +EXPORT_SYMBOL_GPL(media_create_ancillary_link);
>> +
>> +void media_remove_ancillary_link(struct media_link *link)
>> +{
>> +	list_del(&link->list);
>> +	media_gobj_destroy(&link->graph_obj);
>> +	kfree(link);
>> +}
>> +EXPORT_SYMBOL_GPL(media_remove_ancillary_link);
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index fea489f03d57..f7b1738cef88 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -1104,6 +1104,35 @@ void media_remove_intf_links(struct media_interface *intf);
>>   * it will issue a call to @operation\(@entity, @args\).
>>   */
>>  
>> +/**
>> + * media_create_ancillary_link() - creates a link between two entities
>> + *
>> + * @primary:	pointer to the primary &media_entity
>> + * @ancillary:	pointer to the ancillary &media_entity
>> + * @flags:	Link flags, as defined in
>> + *		:ref:`include/uapi/linux/media.h <media_header>`
>> + *		( seek for ``MEDIA_LNK_FL_*``)
>> + *
>> + *
>> + * Valid values for flags:
>> + *
>> + * %MEDIA_LNK_FL_ENABLED
>> + *   Indicates that the two entities are connected pieces of hardware that form
>> + *   a single logical unit.
>> + *
>> + *   A typical example is a camera lens being linked to the sensor that it is
>> + *   supporting.
>> + *
>> + * %MEDIA_LNK_FL_IMMUTABLE
>> + *   Indicates that the link enabled state can't be modified at runtime. If
>> + *   %MEDIA_LNK_FL_IMMUTABLE is set, then %MEDIA_LNK_FL_ENABLED must also be
>> + *   set, since an immutable link is always enabled.
> What's the use case for both of the flags?
>
> I know the flags are there but what will they mean in practice for
> ancillary links?


Within the kernel, I don't think they have any effect now (without patch
#3 of this series the graph iteration would have tried to walk them). I
mostly intended that they would be set so that future userspace users
wouldn't be able to flag them as disabled.

>
>> + */
>> +struct media_link *
>> +media_create_ancillary_link(struct media_entity *primary,
>> +			    struct media_entity *ancillary,
>> +			    u32 flags);
>> +
>>  #define media_entity_call(entity, operation, args...)			\
>>  	(((entity)->ops && (entity)->ops->operation) ?			\
>>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
