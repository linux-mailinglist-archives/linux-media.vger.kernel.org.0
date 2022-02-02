Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2E54A7A9D
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 22:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbiBBVtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 16:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBBVs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 16:48:59 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECC6C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 13:48:59 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id g18so728451wrb.6
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 13:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dKrNhjxZnRr3GwmN4wC37geXc+8FzlBlTKhpm5ZdPiA=;
        b=B6+pONywolt9Yo5cnElNiTpbB52ukKio34H/oBcksKnyE44krUh/rD+EVfAcOuQMgW
         Y1G8D/DHqcxXdUo315NNC8tjgKpv9XjO+W2jthjZFmXJrmUX0wKKdl85JW7UhQogi5Au
         HqQa1TfTgh/Z56811acw1F3thoLTSYIPor9bb5o9t8stMNOeRNe3dPH0Av76F1vT8xhi
         ItnFqmu9MesIfD9i5v1+snO1400MZjyR4o47WmzI2Xy2OioY7x/mhnOI+04RAun4D6pt
         JJ4OgscsFegmTOGCKWmPJ8mZqpObeluX6kMTyLzYDYWXl3XKpY4kElVwie/ztu5ZY4Ls
         jz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dKrNhjxZnRr3GwmN4wC37geXc+8FzlBlTKhpm5ZdPiA=;
        b=Ww5S0c3qqFSDdgzB6rTv1oQHzD2eKpOmu9+9bnZ2BpIKxSgJ68+PvLP6kD1n1BlLM0
         3RIwQwT6Mt3bk9QHL9sVfHJAuOYg7JFIBfcsY7EuqvpC2v6PXbnL7OBgaGTjHv8iRUL2
         XIKfrRQGi6JxpY8XlT9TUrORs2xPKGGBj5i8SvH3cEFHb/yhj9s9qB0YFfOq5pHM9wWw
         LrErp0OHxUSKcibYLXKOY7os4g1qP2xmlcVOkKu8LLCKTeg9PZx+wkwJG3tZ0FzdJV9B
         yHm3CL9Zl5kuLzbCmPUrB8ZzbqP6dBuMCzfMckonf1ElIqd/RsB4a7hYYM1z4pY0hsdR
         NRBQ==
X-Gm-Message-State: AOAM531D8+NtWbPAZIonSH5u4x6JyliJcFQqnudrsc/GjVh9MB4H3JG9
        Yx31qSeFIBP+dK3OkAJrtPE=
X-Google-Smtp-Source: ABdhPJwKoeMKgAp8csdr5fFOVxx3u6CBPGynoORELFM56rZyMjvEZAQyu4d6h5m//kK9g3ZATpw2Ug==
X-Received: by 2002:a5d:5352:: with SMTP id t18mr17353429wrv.247.1643838537796;
        Wed, 02 Feb 2022 13:48:57 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id z6sm5497243wmf.37.2022.02.02.13.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:48:57 -0800 (PST)
Message-ID: <a535c8c6-b09f-5be3-5465-9ea3be38bc02@gmail.com>
Date:   Wed, 2 Feb 2022 21:48:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/6] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-7-djrscally@gmail.com>
 <YfqzdowSDlF9VwFP@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YfqzdowSDlF9VwFP@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 02/02/2022 16:38, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the update.
>
> On Sun, Jan 30, 2022 at 11:58:21PM +0000, Daniel Scally wrote:
>> Upon an async fwnode match, there's some typical behaviour that the
>> notifier and matching subdev will want to do. For example, a notifier
>> representing a sensor matching to an async subdev representing its
>> VCM will want to create an ancillary link to expose that relationship
>> to userspace.
>>
>> To avoid lots of code in individual drivers, try to build these links
>> within v4l2 core.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since v1:
>>
>> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
>> 	- Some spelling and nomenclature cleanup (Laurent)
>>
>> Changes since the rfc:
>>
>> 	- None
>>
>>  drivers/media/v4l2-core/v4l2-async.c | 56 ++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 0404267f1ae4..8980534e755e 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -275,6 +275,50 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>>  static int
>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>>  
>> +static int
>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>> +				   struct v4l2_subdev *sd)
>> +{
>> +	struct media_link *link = NULL;
>> +
>> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>> +
>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
>> +		return -EINVAL;
>> +
>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity);
>> +
>> +#endif
>> +
>> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
>> +}
>> +
>> +/*
>> + * Create links on behalf of the notifier and subdev, where it's obvious what
>> + * should be done. At the moment, we only support cases where the notifier
>> + * is a camera sensor and the subdev is a lens controller.
> I think I'd rather change this so that ancillary links are created for lens
> and flash subdevs, independently of the function of the notifier subdev.
>
> Are there cases where this would go wrong currently, or in the future? I
> can't think of any right now at least. I guess we could add more
> information in the future to convey here if needed.
I don't think doing that would go wrong anyhow...at least not that I
could think of at the minute. My plan was to add a new function like
__v4l2_async_create_data_links() and call that (from
v4l2_async_try_create_links()) where the function of the notifier subdev
was MEDIA_ENT_F_VID_IF_BRIDGE...you think we shouldn't be doing that? Or
just that it should be separate?
>> + *
>> + * TODO: Create data links if the notifier's function is
>> + * MEDIA_ENT_F_VID_IF_BRIDGE and the subdev's is MEDIA_ENT_F_CAM_SENSOR.
>> + */
>> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
>> +				       struct v4l2_subdev *sd)
> How about calling this v4l2_async_create_ancillary_links()?


Sure

>
>> +{
>> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>> +
>> +	if (!notifier->sd)
>> +		return 0;
>> +
>> +	switch (notifier->sd->entity.function) {
>> +	case MEDIA_ENT_F_CAM_SENSOR:
>> +		return __v4l2_async_create_ancillary_link(notifier, sd);
>> +	}
>> +
>> +#endif
>> +	return 0;
>> +}
>> +
>>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>  				   struct v4l2_device *v4l2_dev,
>>  				   struct v4l2_subdev *sd,
>> @@ -293,6 +337,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>  		return ret;
>>  	}
>>  
>> +	/*
>> +	 * Depending of the function of the entities involved, we may want to
>> +	 * create links between them (for example between a sensor and its lens
>> +	 * or between a sensor's source pad and the connected device's sink
>> +	 * pad).
>> +	 */
>> +	ret = v4l2_async_try_create_links(notifier, sd);
>> +	if (ret) {
> The notifier's bound function has been called already. The unbound function
> needs to be thus called here, too.


Thank you, I'll do that in the next version

>
>> +		v4l2_device_unregister_subdev(sd);
>> +		return ret;
>> +	}
>> +
>>  	/* Remove from the waiting list */
>>  	list_del(&asd->list);
>>  	sd->asd = asd;
