Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51645E8EF
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347192AbhKZIDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346223AbhKZIBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:01:40 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448BAC061758
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 23:58:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a18so16783775wrn.6
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 23:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tr4FEWzGiT+ZLj2+LL1G4qbJ0VzaYRR1yYmKykB9BnE=;
        b=hUQ8n0L3WaIEiSPCMzz+SusiJZlJLcbhcZc/bWQMWxiJVwHPapHwC8+NwkkgB8E/i0
         d+EgGKEu3AIZCLra15qtSAmOcFjOUhfqYw9Ylpdq45sdKChN/uNVmkiikpuqdP8nUJWv
         jIdRk4+VNeiUpFm9H8dkldVVdiLDoBPb0THFsCAP6EfY3rcvjUo549rktzNGPWiVLi9+
         sT8GwYACokjwH+B5LXO0KW9/nohjzFDvj+cEjwK0dFQ8CG5JuKDXMf2tuGmCY/JIaIZZ
         1To4h6pboMyaVGb0h8yGRmv6eBiVL4yibmGCoiMzBaENoezj8LzKPHfzm23/7h/x4xYn
         eHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tr4FEWzGiT+ZLj2+LL1G4qbJ0VzaYRR1yYmKykB9BnE=;
        b=5VaKxGiiDBMb1on4uSWppypXxCesQRVj5g6F3igDMqw3cgJ0oI1yPGoIX387DVQxvl
         1YWtt/QJkEDCcm3CslIY6q82QmUuxM/cgaLJ0/D2ZReVRN9jG7EdL/AMfowmEQG9TDG/
         w0Z+Jk5mv/YILj8M+brjnf/ym6k3Q2mAMPtiWTo5j+sfyJJGETeVGsPMqsKz3b8+eH/t
         cb/jePY3OkbwEP0/5/95qw6pqhf7DFDtW4OSbDJRvnDJ0aqMRRIIcIxu2eb5+ghXpAe+
         KgRcLf1rWUe7/eg3xVqGBKTI8hajr5KYg4tYtC7NQdo8Qs1TxsQbQWaWIuFsfibWqah/
         9/zw==
X-Gm-Message-State: AOAM531xp0ugv4Yh8xb1NUz4Oo7K74+cSCyGXJj63wmYLsYyLnxHlb/a
        a1slR6Oe8VhFQZHRkCYelNI=
X-Google-Smtp-Source: ABdhPJySRiA8XusfNjFmP4KQMk7+pklrLb2wilI4rvP8T9Qnmx18zaUmIWkR+4pJI6kWvQR16xxvvA==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr12018341wrn.603.1637913505821;
        Thu, 25 Nov 2021 23:58:25 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id z5sm13259163wmp.26.2021.11.25.23.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 23:58:25 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] media: entity: Add support for ancillary links
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
References: <20211126001603.41148-1-djrscally@gmail.com>
 <20211126001603.41148-2-djrscally@gmail.com>
 <YaBM1oiwHIcSQehg@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <06a52770-d524-28a6-0006-8e716335e810@gmail.com>
Date:   Fri, 26 Nov 2021 07:58:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaBM1oiwHIcSQehg@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 26/11/2021 02:56, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Fri, Nov 26, 2021 at 12:16:02AM +0000, Daniel Scally wrote:
>> To describe in the kernel the connection between devices and their
>> supporting peripherals (for example, a camera sensor and the vcm
>> driving the focusing lens for it), add a new type of media link
>> which connects two instances of struct media_entity.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>
>> I was tempted to 'fix' the spaces between # and define in
>> include/uapi/linux/media.h but eventually decided they were probably deliberate
>> but if that's not true I'd fix those too.
>>
>>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
>>  include/media/media-entity.h | 30 ++++++++++++++++++++++++++++++
>>  include/uapi/linux/media.h   |  1 +
>>  3 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index f40f41977142..9c18b974e117 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -1032,3 +1032,33 @@ void media_remove_intf_links(struct media_interface *intf)
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
>> +	link->primary = primary;
>> +	link->ancillary = ancillary;
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
>> index fea489f03d57..400b864857ee 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -119,12 +119,16 @@ struct media_pipeline {
>>   *		a pad. In that case, it represents the source pad.
>>   * @intf:	Part of a union. Used only if the first object (gobj0) is
>>   *		an interface.
>> + * @primary:	Part of a union. Used only if the first object (gobj0) is
>> + *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
>>   * @gobj1:	Part of a union. Used to get the pointer for the second
>>   *		graph_object of the link.
>>   * @sink:	Part of a union. Used only if the second object (gobj1) is
>>   *		a pad. In that case, it represents the sink pad.
>>   * @entity:	Part of a union. Used only if the second object (gobj1) is
>>   *		an entity.
>> + * @ancillary:	Part of a union. Used only if the second object (gobj1) is
>> + *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
>>   * @reverse:	Pointer to the link for the reverse direction of a pad to pad
>>   *		link.
>>   * @flags:	Link flags, as defined in uapi/media.h (MEDIA_LNK_FL_*)
>> @@ -137,11 +141,13 @@ struct media_link {
>>  		struct media_gobj *gobj0;
>>  		struct media_pad *source;
>>  		struct media_interface *intf;
>> +		struct media_entity *primary;
>>  	};
>>  	union {
>>  		struct media_gobj *gobj1;
>>  		struct media_pad *sink;
>>  		struct media_entity *entity;
>> +		struct media_entity *ancillary;
>>  	};
> Those unions are not very nice, but it's not your fault. I however
> wonder if we couldn't just use the gobj0 and gobj1 fields, and avoid
> adding primary and ancillary.


Maybe; I'll investigate doing it that way


> I'm sure we'll also nitpick on the names, especially when adding
> documentation. The concept seems fine to me though.


Hah; that's fine, naming things was never my strong suit.

>>  	struct media_link *reverse;
>>  	unsigned long flags;
>> @@ -1104,6 +1110,30 @@ void media_remove_intf_links(struct media_interface *intf);
>>   * it will issue a call to @operation\(@entity, @args\).
>>   */
>>  
>> +/**
>> + * media_create_ancillary_link() - creates a link between two entities
>> + *
>> + * @primary:	pointer to the primary %media_entity
>> + * @ancillary:	pointer to the ancillary %media_entity
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
> Is there any use case for an ancillary link that wouldn't be enabled ?


I couldn't think of one really.

> Should the IMMUTABLE flag be set as well ?


Yes; I'll add that here too, thanks

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
>> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
>> index 200fa8462b90..afbae7213d35 100644
>> --- a/include/uapi/linux/media.h
>> +++ b/include/uapi/linux/media.h
>> @@ -226,6 +226,7 @@ struct media_pad_desc {
>>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>>  #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
>>  #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
>> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
>>  
>>  struct media_link_desc {
>>  	struct media_pad_desc source;
