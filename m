Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736CA4B19D2
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 00:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243479AbiBJXv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 18:51:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244468AbiBJXv2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 18:51:28 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DF25F6E
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 15:51:28 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i14so12259507wrc.10
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 15:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=gkIX3A/FoIg8Nja/Sur+AvfZK5v27QkBAhmPJ3w3H4M=;
        b=gjkb7DY06yaMlZpeP/B/ZDbiVKrrzoA8UvaZX0b+zqP1ppPu7SIeKxcLV2TV8Y61a4
         OyjnXydrWQzbh2LJgzDMGWskhqdDpiOZY6AbKWfCjeepb0ch6Pc0X95EQsUhCzUaC3yM
         iXxc+frq3meP4zyEL3nGXgvlrfJ0aV1l/HLoPlkhxnZxKeZ62LjFQoMo8I6eJ1wwi3Pj
         2bzrtOdE9NrOvOTS8L6mweP2i1bdXjaDi9ZJwMINc0k9pxzzIHdNURcxXd5JBC65dgxa
         7T0Znp6v2nnhrPyhz6R0+bzmZxM0OAqSwKK7JrXepwtg48XSVGXkjUOz22XlNVZeTvvZ
         3D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=gkIX3A/FoIg8Nja/Sur+AvfZK5v27QkBAhmPJ3w3H4M=;
        b=1NGerdt/BRLRo+d3maIglqM2DMDQ2e9dmJ9GUYhVTL4JQFK1m3MTLDw7huvJ1g3fyt
         H7cVkPyEYAsxFa0JgHofERQPHOB1VYwPAN1n/ABkAfU15c2RGMpOJLKnJFVGRCs1QSkw
         AZHdDbCVLakE7h/60XY50ID06sAju++/NJWHm9uJ49VVBKncjEByDzLSTKRa1owRKHQU
         NEQPeyJAfei/1yv7JgJyyJOMUskndy+VR7lDuJUT+4GhFDzoAP433QUFYzn6WytFimvD
         H4Hklb7+DX3c3Zw7yGxRs1W4fMQORtgaizczVjR7Jv1WlfmjGLY873mVdzYjcDNzYwft
         J6gg==
X-Gm-Message-State: AOAM531iMiWLUscxJqFdibi6CipHfBNsS63kSkSLA8UGdBZmJPkJAFeJ
        Js2jbtByRDzGHFPJGeYQXxY=
X-Google-Smtp-Source: ABdhPJySnCheXL9DXTbAoK/BBR9+4B8W6qt2VMG7VFsJrQ13XjldN2yDF+dTrrbCkWsaktccjkBkDw==
X-Received: by 2002:a05:6000:1545:: with SMTP id 5mr8144555wry.443.1644537086853;
        Thu, 10 Feb 2022 15:51:26 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p8sm13669412wro.106.2022.02.10.15.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 15:51:25 -0800 (PST)
Message-ID: <5dbc76de-0802-3410-135e-be8e25d622be@gmail.com>
Date:   Thu, 10 Feb 2022 23:51:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/6] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Content-Language: en-US
From:   Daniel Scally <djrscally@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-7-djrscally@gmail.com>
 <YfqzdowSDlF9VwFP@paasikivi.fi.intel.com>
 <a535c8c6-b09f-5be3-5465-9ea3be38bc02@gmail.com>
In-Reply-To: <a535c8c6-b09f-5be3-5465-9ea3be38bc02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 02/02/2022 21:48, Daniel Scally wrote:
> Hi Sakari
>
> On 02/02/2022 16:38, Sakari Ailus wrote:
>> Hi Daniel,
>>
>> Thanks for the update.
>>
>> On Sun, Jan 30, 2022 at 11:58:21PM +0000, Daniel Scally wrote:
>>> Upon an async fwnode match, there's some typical behaviour that the
>>> notifier and matching subdev will want to do. For example, a notifier
>>> representing a sensor matching to an async subdev representing its
>>> VCM will want to create an ancillary link to expose that relationship
>>> to userspace.
>>>
>>> To avoid lots of code in individual drivers, try to build these links
>>> within v4l2 core.
>>>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>> Changes since v1:
>>>
>>> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
>>> 	- Some spelling and nomenclature cleanup (Laurent)
>>>
>>> Changes since the rfc:
>>>
>>> 	- None
>>>
>>>  drivers/media/v4l2-core/v4l2-async.c | 56 ++++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index 0404267f1ae4..8980534e755e 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -275,6 +275,50 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>>>  static int
>>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>>>  
>>> +static int
>>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>>> +				   struct v4l2_subdev *sd)
>>> +{
>>> +	struct media_link *link = NULL;
>>> +
>>> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>>> +
>>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
>>> +		return -EINVAL;
>>> +
>>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity);
>>> +
>>> +#endif
>>> +
>>> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
>>> +}
>>> +
>>> +/*
>>> + * Create links on behalf of the notifier and subdev, where it's obvious what
>>> + * should be done. At the moment, we only support cases where the notifier
>>> + * is a camera sensor and the subdev is a lens controller.
>> I think I'd rather change this so that ancillary links are created for lens
>> and flash subdevs, independently of the function of the notifier subdev.
>>
>> Are there cases where this would go wrong currently, or in the future? I
>> can't think of any right now at least. I guess we could add more
>> information in the future to convey here if needed.
> I don't think doing that would go wrong anyhow...at least not that I
> could think of at the minute. My plan was to add a new function like
> __v4l2_async_create_data_links() and call that (from
> v4l2_async_try_create_links()) where the function of the notifier subdev
> was MEDIA_ENT_F_VID_IF_BRIDGE...you think we shouldn't be doing that? Or
> just that it should be separate?


Gentle ping for this part :)

>>> + *
>>> + * TODO: Create data links if the notifier's function is
>>> + * MEDIA_ENT_F_VID_IF_BRIDGE and the subdev's is MEDIA_ENT_F_CAM_SENSOR.
>>> + */
>>> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
>>> +				       struct v4l2_subdev *sd)
>> How about calling this v4l2_async_create_ancillary_links()?
>
> Sure
>
>>> +{
>>> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>>> +
>>> +	if (!notifier->sd)
>>> +		return 0;
>>> +
>>> +	switch (notifier->sd->entity.function) {
>>> +	case MEDIA_ENT_F_CAM_SENSOR:
>>> +		return __v4l2_async_create_ancillary_link(notifier, sd);
>>> +	}
>>> +
>>> +#endif
>>> +	return 0;
>>> +}
>>> +
>>>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>  				   struct v4l2_device *v4l2_dev,
>>>  				   struct v4l2_subdev *sd,
>>> @@ -293,6 +337,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>  		return ret;
>>>  	}
>>>  
>>> +	/*
>>> +	 * Depending of the function of the entities involved, we may want to
>>> +	 * create links between them (for example between a sensor and its lens
>>> +	 * or between a sensor's source pad and the connected device's sink
>>> +	 * pad).
>>> +	 */
>>> +	ret = v4l2_async_try_create_links(notifier, sd);
>>> +	if (ret) {
>> The notifier's bound function has been called already. The unbound function
>> needs to be thus called here, too.
>
> Thank you, I'll do that in the next version
>
>>> +		v4l2_device_unregister_subdev(sd);
>>> +		return ret;
>>> +	}
>>> +
>>>  	/* Remove from the waiting list */
>>>  	list_del(&asd->list);
>>>  	sd->asd = asd;
