Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AF8569AC1
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 08:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbiGGGw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 02:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234818AbiGGGwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 02:52:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846802CC96
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 23:52:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39B87B81D82
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB2DC3411E;
        Thu,  7 Jul 2022 06:52:18 +0000 (UTC)
Message-ID: <c8f5c146-10d2-dcc8-f492-62fa34a1d648@xs4all.nl>
Date:   Thu, 7 Jul 2022 08:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 37/55] media: mc-entity: Add a new helper function to get
 a remote pad
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-38-paul.elder@ideasonboard.com>
 <6a718a13-e441-f093-d86e-5480d0a46103@xs4all.nl>
 <Yrc/Qs7dtciy22dv@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Yrc/Qs7dtciy22dv@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/25/22 19:00, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jun 17, 2022 at 01:48:05PM +0200, Hans Verkuil wrote:
>> On 6/14/22 21:11, Paul Elder wrote:
>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> The media_entity_remote_pad() helper function returns the first remote
>>> pad it find connected to a given pad. Beside being possibly ill-named
>>> (as it operates on a pad, not an entity) and non-deterministic (as it
>>> stops at the first enabled link), the fact that it returns the first
>>> match makes it unsuitable for drivers that need to guarantee that a
>>> single link is enabled, for instance when an entity can process data
>>> from one of multiple sources at a time.
>>
>> Question: of all the callers of this function, are there any that really
>> need media_entity_remote_pad() instead of media_pad_remote_pad_unique()?
>>
>> Would it be possible to replace all callers of the old function with the
>> new function? If that's the case, then the _unique suffix can be dropped,
>> since that would effectively be the default. And if a function is needed
>> to handle the case where there are multiple enabled links, then a new
>> function should be created.
> 
> I don't think so. media_entity_remote_pad() operates on a pad, switching
> to media_pad_remote_pad_unique() wouldn't work on subdevs that have
> multiple sink or source pads with one active link each.

Do we have those today in the mainline kernel? Just checking...

Regards,

	Hans

> 
>> Also, media_entity_remote_pad() should really be renamed to
>> media_pad_remote_pad_first() or something like that, right? I'm not saying
>> you should, but that's really what it does, as I understand it.
> 
> Yes, I think that would make sense, and it would freethe
> media_entity_remote_pad() name, so the new function wouldn't need the
> _unique suffix. I'll give it a try.
> 
>>> For those use cases, add a new helper function,
>>> media_entity_remote_pad_unique(), that operates on an entity and returns
>>> a remote pad, with a guarantee that only one link is enabled. To ease
>>> its use in drivers, also add an inline wrapper that locates source pads
>>> specifically. A wrapper that locates sink pads can easily be added when
>>> needed.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  Documentation/driver-api/media/mc-core.rst |  4 +-
>>>  drivers/media/mc/mc-entity.c               | 38 ++++++++++++++++++
>>>  include/media/media-entity.h               | 45 ++++++++++++++++++++++
>>>  3 files changed, 85 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
>>> index 02481a2513b9..a2d1e32e3abb 100644
>>> --- a/Documentation/driver-api/media/mc-core.rst
>>> +++ b/Documentation/driver-api/media/mc-core.rst
>>> @@ -186,8 +186,8 @@ is required and the graph structure can be freed normally.
>>>  
>>>  Helper functions can be used to find a link between two given pads, or a pad
>>>  connected to another pad through an enabled link
>>> -:c:func:`media_entity_find_link()` and
>>> -:c:func:`media_entity_remote_pad()`.
>>> +(:c:func:`media_entity_find_link()`, :c:func:`media_entity_remote_pad()` and
>>> +:c:func:`media_entity_remote_source_pad()`).
>>>  
>>>  Use count and power handling
>>>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>>> index 11f5207f73aa..1febf5a86be6 100644
>>> --- a/drivers/media/mc/mc-entity.c
>>> +++ b/drivers/media/mc/mc-entity.c
>>> @@ -9,6 +9,7 @@
>>>   */
>>>  
>>>  #include <linux/bitmap.h>
>>> +#include <linux/list.h>
>>>  #include <linux/property.h>
>>>  #include <linux/slab.h>
>>>  #include <media/media-entity.h>
>>> @@ -920,6 +921,43 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
>>>  }
>>>  EXPORT_SYMBOL_GPL(media_entity_remote_pad);
>>>  
>>> +struct media_pad *
>>> +media_entity_remote_pad_unique(const struct media_entity *entity,
>>> +			       unsigned int type)
>>> +{
>>> +	struct media_pad *pad = NULL;
>>> +	struct media_link *link;
>>> +
>>> +	list_for_each_entry(link, &entity->links, list) {
>>> +		struct media_pad *local_pad;
>>> +		struct media_pad *remote_pad;
>>> +
>>> +		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
>>> +			continue;
>>> +
>>> +		if (type == MEDIA_PAD_FL_SOURCE) {
>>> +			local_pad = link->sink;
>>> +			remote_pad = link->source;
>>> +		} else {
>>> +			local_pad = link->source;
>>> +			remote_pad = link->sink;
>>> +		}
>>> +
>>> +		if (local_pad->entity == entity) {
>>> +			if (pad)
>>> +				return ERR_PTR(-ENOTUNIQ);
>>> +
>>> +			pad = remote_pad;
>>> +		}
>>> +	}
>>> +
>>> +	if (!pad)
>>> +		return ERR_PTR(-ENOLINK);
>>> +
>>> +	return pad;
>>> +}
>>> +EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
>>> +
>>>  static void media_interface_init(struct media_device *mdev,
>>>  				 struct media_interface *intf,
>>>  				 u32 gobj_type,
>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>> index a9a1c0ec5d1c..33d5f52719a0 100644
>>> --- a/include/media/media-entity.h
>>> +++ b/include/media/media-entity.h
>>> @@ -859,6 +859,51 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>>>   */
>>>  struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>>>  
>>> +/**
>>> + * media_entity_remote_pad_unique - Find a remote pad connected to an entity
>>> + * @entity: The entity
>>> + * @type: The type of pad to find (MEDIA_PAD_FL_SINK or MEDIA_PAD_FL_SOURCE)
>>> + *
>>> + * Search for and return a remote pad of @type connected to @entity through an
>>> + * enabled link. If multiple (or no) remote pads match these criteria, an error
>>> + * is returned.
>>> + *
>>> + * The uniqueness constraint makes this helper function suitable for entities
>>> + * that support a single active source or sink at a time.
>>> + *
>>> + * Return: A pointer to the remote pad, or one of the following error pointers
>>> + * if an error occurs:
>>> + *
>>> + * * -ENOTUNIQ - Multiple links are enabled
>>> + * * -ENOLINK - No connected pad found
>>> + */
>>> +struct media_pad *
>>> +media_entity_remote_pad_unique(const struct media_entity *entity,
>>> +			       unsigned int type);
>>> +
>>> +/**
>>> + * media_entity_remote_source_pad - Find a remote source pad connected to an entity
>>> + * @entity: The entity
>>> + *
>>> + * Search for and return a remote source pad connected to @entity through an
>>> + * enabled link. If multiple (or no) remote pads match these criteria, an error
>>> + * is returned.
>>> + *
>>> + * The uniqueness constraint makes this helper function suitable for entities
>>> + * that support a single active source at a time.
>>> + *
>>> + * Return: A pointer to the remote pad, or one of the following error pointers
>>> + * if an error occurs:
>>> + *
>>> + * * -ENOTUNIQ - Multiple links are enabled
>>> + * * -ENOLINK - No connected pad found
>>> + */
>>> +static inline struct media_pad *
>>> +media_entity_remote_source_pad(const struct media_entity *entity)
>>> +{
>>> +	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
>>> +}
>>> +
>>>  /**
>>>   * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
>>>   * @entity: The entity
> 
