Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D30F48F9D6
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 01:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233931AbiAPABv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 19:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbiAPABu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 19:01:50 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DB7C061574
        for <linux-media@vger.kernel.org>; Sat, 15 Jan 2022 16:01:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so11259970wmj.2
        for <linux-media@vger.kernel.org>; Sat, 15 Jan 2022 16:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rpjlmYlLEZWQedrA0ENP51FyVWn5wNIXw+Twa+rxyHU=;
        b=RHFTLFHpPHmUuWZ+5HSV7DG3enArYrQneFf5SiIfDU/YzlMISa2CFFzY7y3m73NXZe
         sTQFo/YNm43sEmoTnZUl5Sd5WgA67hHn9BpfMNhydf6NjIa+d6vsQKnlyeqUFgITHfum
         vRWWkXpugNpyn9ECVQll9wTJhnEWRazalaf3vYk2K75aBdS4BgfwMsZd0oFugrQnLUXA
         wKuabGD9FPbxdkTTJRtVjjOZQHGMyfE4P/clGjaA9jASmxI4Ezf3ZZa2jyARPgfQGbDL
         D2qfYgb4tbJoLjv5ZmusUdepNe6SwQUFeFAPNSgJnxImObuxZOFRYk9xpkyL1BgCpxp6
         c08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rpjlmYlLEZWQedrA0ENP51FyVWn5wNIXw+Twa+rxyHU=;
        b=t6slwjdGwmuXANnb5VuESo9NcIkZDmAGBnMoUxIs8OPp8P54WGkbaTuGnTDf5qnq9p
         JO+Rg6mdtE2qvU82iaOCTLBmLUx7L/CtjDVW5KcwEuzFRl8ISXbkPBq9jIxNMmxH9OYb
         bkqdRDPlAFbhlcVE8uKAirKvO6WxF7nT/8yQsK0VEg0knuepitAWkSPoo5j5G8p9hghV
         uyP3sCOT2ALv2eu/PnvxKYGZyPehU8lqLZ79VeHez+Q+tOhvBTyLKhe6bWV2dTY1qylZ
         zPJMu6KQZEr7amqt1xlGC+kZrQNoijSakrDVCu8F+vlT5qiZnTv1HMq/Uk41FMGKdwGv
         Extg==
X-Gm-Message-State: AOAM531GuATUxAbtAFvRK+fLsbaW4Eq1WT4T40H2di+UYQxUFnIcrmI0
        HWveUsIuXN2sd6M0rQkqFmg=
X-Google-Smtp-Source: ABdhPJzQL50kRnX2MYG8K37nHrnYVFMTrWJlRQsKPRqYLwGcsbY1ehzc8qQVvPLvLKC73qqWfwvRcA==
X-Received: by 2002:adf:e810:: with SMTP id o16mr2559777wrm.148.1642291308768;
        Sat, 15 Jan 2022 16:01:48 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id j9sm9869012wms.0.2022.01.15.16.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 16:01:48 -0800 (PST)
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-6-djrscally@gmail.com>
 <YbkZEDKHP2gyKjqd@pendragon.ideasonboard.com>
 <73e56a19-13a8-2c76-386f-dbc5e1babce7@gmail.com>
 <YbkiOoHnl9duDjUR@pendragon.ideasonboard.com>
 <35553048-f338-8650-027f-708cfaac030d@gmail.com>
 <YbmvrHzvM9UzmwcV@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <9487f650-370f-7cd5-af93-4af7f8afed2c@gmail.com>
Date:   Sun, 16 Jan 2022 00:01:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbmvrHzvM9UzmwcV@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 15/12/2021 09:04, Laurent Pinchart wrote:

A month to the day! Sorry about the delay - more on that below...

> Hi Dan,
>
> On Tue, Dec 14, 2021 at 11:41:27PM +0000, Daniel Scally wrote:
>> On 14/12/2021 23:01, Laurent Pinchart wrote:
>>> On Tue, Dec 14, 2021 at 10:36:01PM +0000, Daniel Scally wrote:
>>>> On 14/12/2021 22:22, Laurent Pinchart wrote:
>>>>> On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
>>>>>> Upon an async fwnode match, there's some typical behaviour that the
>>>>>> notifier and matching subdev will want to do. For example, a notifier
>>>>>> representing a sensor matching to an async subdev representing its
>>>>>> VCM will want to create an ancillary link to expose that relationship
>>>>>> to userspace.
>>>>>>
>>>>>> To avoid lots of code in individual drivers, try to build these links
>>>>>> within v4l2 core.
>>>>>>
>>>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>>>> ---
>>>>>> Changes since the rfc:
>>>>>>
>>>>>> 	- None
>>>>>>
>>>>>>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>>>>>>  1 file changed, 51 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>>>>> index 0404267f1ae4..6575b1cbe95f 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>>>>> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>>>>>>  static int
>>>>>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>>>>>>  
>>>>>> +static int
>>>>>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>>>>>> +				   struct v4l2_subdev *sd)
>>>>>> +{
>>>>>> +	struct media_link *link;
>>>>>> +
>>>>>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>>>>>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
>>>>> Is there a guarantee at this point that notifier->sd->entity has already
>>>>> been registered with the media_device ? That's done by
>>>>> media_device_register_entity() called from
>>>>> v4l2_device_register_subdev().
>>>> v4l2_async_match_notify() calls v4l2_device_register_subdev() before the
>>>> point that I've added the call to v4l2_async_try_create_links(), so I
>>>> think that's covered there.
>>> It calls it on sd, not notifier->sd. It's the latter that concerns me.
>> Ah, you're right of course...I guess in that case the notifier->sd would
>> get registered during the v4l2_async_match_notify() where the sensor
>> driver's subdev is sd, but I don't think there's any guarantee that that
>> would happen first...I haven't traced it through but my guess is that it
>> would depend on the order in which the ipu3-cio2, sensor and lens
>> controller drivers probed. I'll check to try and be sure how it works
>> tomorrow
> I was looking at media_device_register_entity(), and it sets
>
> 	INIT_LIST_HEAD(&entity->links);
> 	entity->num_links = 0;
> 	entity->num_backlinks = 0;
>
> If we create links before that, things may go bad.


It looks like there _is_ a guarantee of ordering actually. When the
ov8865's notifier is registered in v4l2_async_register_subdev_sensor(),
v4l2_async_nf_try_all_subdevs() is called against it, but at that point
v4l2_async_nf_find_v4l2_dev() won't find anything for the ov8865's
notifier even if the dw9719 has already probed and has it's async_subdev
waiting because the notifier has no parent and no directly assigned
v4l2_dev, so the function exits before trying to match anything (this
same logic guards all calls to v4l2_async_find_match()). Very shortly
after that v4l2_async_register_subdev() is called for the ov8865's
subdev which will match to ipu3-cio2's notifier. In
v4l2_async_match_notify() for that match the ipu3-cio2's notifier is
assigned as parent to the ov8865's notifier, but _after_
v4l2_device_register_subdev() is called for the ov8865. From that point
on v4l2_async_nf_find_v4l2_dev() will return a pointer and the matching
for the dw9719 will work correctly. So unless I've missed something, I
think it's ok.

This took me a long time to figure out, because I reset libcamera to
master for some reason and then totally forgot that I had done
that...which meant the auto-focus wasn't working when I tested it and I
convinced myself that my deliberate screwing of the probe ordering _did_
break it. After tearing my hair out for an embarrassing amount of time I
eventually figured out what I had done and got to the bottom of it -
sorry for the delay!

>
>>>>>> +					   MEDIA_LNK_FL_ENABLED |
>>>>>> +					   MEDIA_LNK_FL_IMMUTABLE);
>>>>>> +
>>>>>> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Setup links on behalf of the notifier and subdev, where it's obvious what
>>>>> s/Setup/Create/ ("link setup" refers to another operation, enabling and
>>>>> disabling links at runtime)
>>>> Yes, good point; although that too is a piece of terminology I find a
>>>> bit jarring to be honest; I would have named that function
>>>> media_entity_configure_link()
>>>>
>>>>>> + * should be done. At the moment, we only support cases where the notifier
>>>>>> + * is a sensor and the subdev is a lens.
>>>>> s/sensor/camera sensor/
>>>>> s/lens/lens controller/
>>>>>
>>>>>> + *
>>>>>> + * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
>>>>>> + * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
>>>>>> + */
>>>>>> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
>>>>>> +				       struct v4l2_subdev *sd)
>>>>>> +{
>>>>>> +	if (!notifier->sd)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	switch (notifier->sd->entity.function) {
>>>>>> +	case MEDIA_ENT_F_CAM_SENSOR:
>>>>>> +		return __v4l2_async_create_ancillary_link(notifier, sd);
>>>>>> +	default:
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>>>>  				   struct v4l2_device *v4l2_dev,
>>>>>>  				   struct v4l2_subdev *sd,
>>>>>> @@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>>>>  		return ret;
>>>>>>  	}
>>>>>>  
>>>>>> +	/*
>>>>>> +	 * Depending of the function of the entities involved, we may want to
>>>>>> +	 * create links between them (for example between a sensor and its lens
>>>>>> +	 * or between a sensor's source pad and the connected device's sink
>>>>>> +	 * pad)
>>>>> s/)/)./
>>>>>
>>>>>> +	 */
>>>>>> +	ret = v4l2_async_try_create_links(notifier, sd);
>>>>>> +	if (ret) {
>>>>>> +		v4l2_device_unregister_subdev(sd);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>>  	/* Remove from the waiting list */
>>>>>>  	list_del(&asd->list);
>>>>>>  	sd->asd = asd;
