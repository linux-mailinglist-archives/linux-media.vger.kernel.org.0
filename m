Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB10A474EA9
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 00:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbhLNXlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 18:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbhLNXla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 18:41:30 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45805C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 15:41:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v11so35071686wrw.10
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 15:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WBK9ujCDquphOcxIQprqcX8PBsYrqY9YsFZztCmyu+w=;
        b=J/+KgmOZx0YEhVBC7ORIVWiXCntUsExUoUlJkmWAGpGaguA5CDHCj8HEvwBPEgrbq3
         UrgZ6myH4S5nUSZGvfjwpFlVFFP0jBdyFKmDW/zrv+oCfB1WCWlrmOyKhyxgtkKJTyu1
         y4r7vgoqYU3cAoxKwMA69rC/y1/Cbbz6i4mR/dIPJI9YOCfigLz0GLW38MTo8z/OxgKc
         ecb0ArEQZUDXo2e8v8Lg8KREU6jxljy/zZSaY7dmTUMgQeNr56hwwG2ewStD4o3NTa8i
         0mC9i8U7Gtl5Tkojks19FhNwTb+DjogY51votEXtqGTcZFy2JGvoIPR0PYk5fr4B8XHm
         6MVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WBK9ujCDquphOcxIQprqcX8PBsYrqY9YsFZztCmyu+w=;
        b=3PKfqH697hOb5n0o7iJmYi3MHLaF2f14XG5J/EMjLGbEJ21uXvm6QnmZnPXHe9N0f5
         M2FSiISybORX1KUGqUm6O0tHqugp4ztr6mTCWn6+ASpfOfLa63xiN+hnoqceY/8uW3MN
         sHRy86E61hecEJyKZCh5dWfM7wR4/GHOrO0nPdxcVv5oFJIuvlD6uuMSS7S8Uv0JqRqr
         q0O95uhOAS39nJ88qWmDStsEGyT8NS7AZga0tqk9dn1PPVHX8+E7mgSMwlkPOuVBwThS
         mRBT4EjPzbBgP1TXcIOuMp/26XGMOK5z6ZWya/3fL15qREA0+2YR94VCs16Tv69Ni8HK
         b2SQ==
X-Gm-Message-State: AOAM531p1NRFZWXGgpcCrAL9+TDBNPA2p58+Tjp/0uSalC6BucrSPLOA
        K8aoo9dS7VnZzZcXTK4NgguI4fUARGQ=
X-Google-Smtp-Source: ABdhPJyrPUAXlrNwrLSNpDogiN1Qn8r4voz8GFUDBsOXg108m5oiR4+mErISzycCgyuU5FD8DHJ2Pg==
X-Received: by 2002:a05:6000:1788:: with SMTP id e8mr2073411wrg.45.1639525288776;
        Tue, 14 Dec 2021 15:41:28 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id z11sm44201wmf.9.2021.12.14.15.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 15:41:28 -0800 (PST)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <35553048-f338-8650-027f-708cfaac030d@gmail.com>
Date:   Tue, 14 Dec 2021 23:41:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkiOoHnl9duDjUR@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 14/12/2021 23:01, Laurent Pinchart wrote:
> Hi Daniel,
>
> On Tue, Dec 14, 2021 at 10:36:01PM +0000, Daniel Scally wrote:
>> On 14/12/2021 22:22, Laurent Pinchart wrote:
>>> On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
>>>> Upon an async fwnode match, there's some typical behaviour that the
>>>> notifier and matching subdev will want to do. For example, a notifier
>>>> representing a sensor matching to an async subdev representing its
>>>> VCM will want to create an ancillary link to expose that relationship
>>>> to userspace.
>>>>
>>>> To avoid lots of code in individual drivers, try to build these links
>>>> within v4l2 core.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>> Changes since the rfc:
>>>>
>>>> 	- None
>>>>
>>>>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>>>>  1 file changed, 51 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>>> index 0404267f1ae4..6575b1cbe95f 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>>> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>>>>  static int
>>>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>>>>  
>>>> +static int
>>>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>>>> +				   struct v4l2_subdev *sd)
>>>> +{
>>>> +	struct media_link *link;
>>>> +
>>>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>>>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
>>>> +		return -EINVAL;
>>>> +
>>>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
>>> Is there a guarantee at this point that notifier->sd->entity has already
>>> been registered with the media_device ? That's done by
>>> media_device_register_entity() called from
>>> v4l2_device_register_subdev().
>> v4l2_async_match_notify() calls v4l2_device_register_subdev() before the
>> point that I've added the call to v4l2_async_try_create_links(), so I
>> think that's covered there.
> It calls it on sd, not notifier->sd. It's the latter that concerns me.


Ah, you're right of course...I guess in that case the notifier->sd would
get registered during the v4l2_async_match_notify() where the sensor
driver's subdev is sd, but I don't think there's any guarantee that that
would happen first...I haven't traced it through but my guess is that it
would depend on the order in which the ipu3-cio2, sensor and lens
controller drivers probed. I'll check to try and be sure how it works
tomorrow

>
>>>> +					   MEDIA_LNK_FL_ENABLED |
>>>> +					   MEDIA_LNK_FL_IMMUTABLE);
>>>> +
>>>> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Setup links on behalf of the notifier and subdev, where it's obvious what
>>> s/Setup/Create/ ("link setup" refers to another operation, enabling and
>>> disabling links at runtime)
>> Yes, good point; although that too is a piece of terminology I find a
>> bit jarring to be honest; I would have named that function
>> media_entity_configure_link()
>>
>>>> + * should be done. At the moment, we only support cases where the notifier
>>>> + * is a sensor and the subdev is a lens.
>>> s/sensor/camera sensor/
>>> s/lens/lens controller/
>>>
>>>> + *
>>>> + * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
>>>> + * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
>>>> + */
>>>> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
>>>> +				       struct v4l2_subdev *sd)
>>>> +{
>>>> +	if (!notifier->sd)
>>>> +		return 0;
>>>> +
>>>> +	switch (notifier->sd->entity.function) {
>>>> +	case MEDIA_ENT_F_CAM_SENSOR:
>>>> +		return __v4l2_async_create_ancillary_link(notifier, sd);
>>>> +	default:
>>>> +		return 0;
>>>> +	}
>>>> +}
>>>> +
>>>>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>>  				   struct v4l2_device *v4l2_dev,
>>>>  				   struct v4l2_subdev *sd,
>>>> @@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> +	/*
>>>> +	 * Depending of the function of the entities involved, we may want to
>>>> +	 * create links between them (for example between a sensor and its lens
>>>> +	 * or between a sensor's source pad and the connected device's sink
>>>> +	 * pad)
>>> s/)/)./
>>>
>>>> +	 */
>>>> +	ret = v4l2_async_try_create_links(notifier, sd);
>>>> +	if (ret) {
>>>> +		v4l2_device_unregister_subdev(sd);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>>  	/* Remove from the waiting list */
>>>>  	list_del(&asd->list);
>>>>  	sd->asd = asd;
