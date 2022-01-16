Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F355448FFA6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 00:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbiAPXwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 18:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbiAPXwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 18:52:05 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352C6C061574
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 15:52:05 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id v123so16914274wme.2
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 15:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qdk3IrB8eVb4EXJwVIhekKHxFo45GX1zbCMhwvA2Jnk=;
        b=WHo4P/NiB+U5hYlDhzRGTPKO9KZrDmvsIvrnxWsKKpRgVH2Bz169g52OPCT9TX86dU
         5M5P+XAdY+v/7yznT/kQ6Lq/nV2eO5NqufV1FrKynOPSduDkx14iNsRcq7wIAuHcPSL1
         3+I2ZpYXDPqdb9lccoc5Aymw+HntKSykxFLbf6snUU6ZzyLj0oDgXDQBDaBMwmJOhS7u
         OI/7jXstTvP6htIqpy5ainvEWE7m4B2IdTfcPPcgnbjxma2rBJFaEjC5bpiyb0T2BmPk
         RAfGcqq0tHyL7O3t0NUT7AS96SKQYuhluKIUCfVVvCbZ1u5jHg1AJ2K8fM7gg1wAUl2e
         HB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qdk3IrB8eVb4EXJwVIhekKHxFo45GX1zbCMhwvA2Jnk=;
        b=bfvDGuZkT97TE6BLsaYGeTKvlwOzhcZFl6DdF7VqWZcsWAr7Nav/0Ba9QvgEUFlWm3
         wg+/t0Fcz+cmctOq0v9IcnvqpyRPYpr+dKjlGv5VW55rWL5gXyOE8IB2UY4IpqiAszrm
         A4dh2wK7Rv3MqBY7gEOb8/ywaSIMLY4Ioew3ROVfzjCsB7/BqznBc6++UkDn/B/WwTAv
         +7GFr51c0C1CrD0rYDQOijZ5GBBCHFnbGGkbPQeJpcperCLqxIX8xrBQtkuAlyKbCu7/
         CfHgeex+9Skddv9YFuxFaEeXQadl4wXBS7zSQ9qOQjDsv0n9UJTkURm2DUgFxBrgx65W
         ZFJA==
X-Gm-Message-State: AOAM531DJUqP1X+Zt8TvbTp8uQn7gX+4eK+LjEDNs7ad7NIDjZk25EeF
        1AHEt5hYNbn4Et4PCFiX3xxfx+RR3v0=
X-Google-Smtp-Source: ABdhPJyvwBiuzeM+0rueS0XWV/7z2QFJ0+mDJwVBh08FQUDS2jIfD3WBW1NbmCGWntmFRu9MYMFrrw==
X-Received: by 2002:a1c:e909:: with SMTP id q9mr17138933wmc.184.1642377123792;
        Sun, 16 Jan 2022 15:52:03 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k10sm12155797wrz.113.2022.01.16.15.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 15:52:03 -0800 (PST)
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-5-djrscally@gmail.com>
 <YbkL2V24TFdA5KHx@paasikivi.fi.intel.com>
 <6929c5a8-67dc-77c6-459e-6ce26a08fb73@gmail.com>
 <YbkXRs/RUnc/JmAZ@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e99b42fe-e162-864a-c024-d0419a3f1ed2@gmail.com>
Date:   Sun, 16 Jan 2022 23:52:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkXRs/RUnc/JmAZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, sorry - realised I never replied to this one

On 14/12/2021 22:14, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Tue, Dec 14, 2021 at 09:54:32PM +0000, Daniel Scally wrote:
>> On 14/12/2021 21:25, Sakari Ailus wrote:
>>> On Mon, Dec 13, 2021 at 11:28:48PM +0000, Daniel Scally wrote:
>>>> Add functions to create and destroy ancillary links, so that they
>>>> don't need to be manually created by users.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>> Changes since the rfc:
>>>>
>>>> 	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
>>>> 	members
>>>> 	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
>>>> 	create function
>>>>
>>>>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
>>>>  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
>>>>  2 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>>>> index aeddc3f6310e..4e39e100ea03 100644
>>>> --- a/drivers/media/mc/mc-entity.c
>>>> +++ b/drivers/media/mc/mc-entity.c
>>>> @@ -1052,3 +1052,33 @@ void media_remove_intf_links(struct media_interface *intf)
>>>>  	mutex_unlock(&mdev->graph_mutex);
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(media_remove_intf_links);
>>>> +
>>>> +struct media_link *media_create_ancillary_link(struct media_entity *primary,
>>>> +					       struct media_entity *ancillary,
>>>> +					       u32 flags)
>>>> +{
>>>> +	struct media_link *link;
>>>> +
>>>> +	link = media_add_link(&primary->links);
> Not a candidate for this series, but returning an error pointer from
> media_add_link() could be nice.
>
>>>> +	if (!link)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	link->gobj0 = &primary->graph_obj;
>>>> +	link->gobj1 = &ancillary->graph_obj;
>>>> +	link->flags = flags | MEDIA_LNK_FL_ANCILLARY_LINK;
>>>> +
>>>> +	/* Initialize graph object embedded at the new link */
> s/embedded at/embedded in/ ?
>
>>>> +	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
>>>> +			  &link->graph_obj);
>>>> +
>>>> +	return link;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(media_create_ancillary_link);
>>>> +
>>>> +void media_remove_ancillary_link(struct media_link *link)
>>>> +{
>>>> +	list_del(&link->list);
>>>> +	media_gobj_destroy(&link->graph_obj);
>>>> +	kfree(link);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(media_remove_ancillary_link);
> Non-static (and especially exported) functions must be declared in a
> header file. You don't seem to use this function anywhere in this series
> though, is it a leftover ?
>
>>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>>> index fea489f03d57..f7b1738cef88 100644
>>>> --- a/include/media/media-entity.h
>>>> +++ b/include/media/media-entity.h
>>>> @@ -1104,6 +1104,35 @@ void media_remove_intf_links(struct media_interface *intf);
>>>>   * it will issue a call to @operation\(@entity, @args\).
>>>>   */
>>>>  
>>>> +/**
>>>> + * media_create_ancillary_link() - creates a link between two entities
> s/link/ancillary link/
>
>>>> + *
>>>> + * @primary:	pointer to the primary &media_entity
>>>> + * @ancillary:	pointer to the ancillary &media_entity
>>>> + * @flags:	Link flags, as defined in
>>>> + *		:ref:`include/uapi/linux/media.h <media_header>`
>>>> + *		( seek for ``MEDIA_LNK_FL_*``)
>>>> + *
>>>> + *
>>>> + * Valid values for flags:
>>>> + *
>>>> + * %MEDIA_LNK_FL_ENABLED
>>>> + *   Indicates that the two entities are connected pieces of hardware that form
>>>> + *   a single logical unit.
>>>> + *
>>>> + *   A typical example is a camera lens being linked to the sensor that it is
>>>> + *   supporting.
>>>> + *
>>>> + * %MEDIA_LNK_FL_IMMUTABLE
>>>> + *   Indicates that the link enabled state can't be modified at runtime. If
>>>> + *   %MEDIA_LNK_FL_IMMUTABLE is set, then %MEDIA_LNK_FL_ENABLED must also be
>>>> + *   set, since an immutable link is always enabled.
>>> What's the use case for both of the flags?
>>>
>>> I know the flags are there but what will they mean in practice for
>>> ancillary links?
>> Within the kernel, I don't think they have any effect now (without patch
>> #3 of this series the graph iteration would have tried to walk them). I
>> mostly intended that they would be set so that future userspace users
>> wouldn't be able to flag them as disabled.
> How about removing the flags parameter, hardcoding both
> MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE inside the function, and
> specifying in the userspace API documentation that both flags are always
> set of ancillary links ?


This is ok by me

>
> Thinking a bit further, what would be the implications of changing this
> rule in the future ? I don't know what use cases may require that, but
> let's assume we start exposing mutable ancillary links, or mutable and
> disabled ancillary links. How will existing userspace react to that, do
> we need to specify rules in the uAPI documentation to tell userspace how
> to prepare for the future ?


Yeah maybe; at the moment my libcamera implementation wouldn't treat a
disabled link any differently, and for a lens at least I can't really
see any situation where a disabled link would be valid. Perhaps multiple
LED drivers supporting the same sensor for different flash modes might
be a thing though, in which case it might be helpful to disable one of
the ancillary links so that you can flag a particular driver as the
active one, or something long those lines.


So perhaps the uAPI docs should explain that both ENABLED and IMMUTABLE
are currently hardcoded, but that userspace should still check for an
enabled link before following it.

>
>>>> + */
>>>> +struct media_link *
>>>> +media_create_ancillary_link(struct media_entity *primary,
>>>> +			    struct media_entity *ancillary,
>>>> +			    u32 flags);
>>>> +
>>>>  #define media_entity_call(entity, operation, args...)			\
>>>>  	(((entity)->ops && (entity)->ops->operation) ?			\
>>>>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
