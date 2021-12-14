Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8167474DF3
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 23:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbhLNWgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 17:36:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhLNWgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 17:36:05 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EA3C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 14:36:05 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i22so5119598wrb.13
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 14:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jd8H/ss1tY2RZQujVlK9cQ65SRUkbsyN0fjB8qEQAH4=;
        b=RDcd9yHBA8CSAsfEMENSG0B2Xx1FBfNoUuOtDEEo0U9QP3zbOcxPC4zxxGfOkKjlJI
         gC9LGpM+TGjMF1ahM609/RPwWfvCkn3xfGMOaxxLSqnNERvKTaodZa1ZaKokQR0LqHPR
         tN72sW8+7FK8MBqgZ+EQWgkodkHIunBwopslFN59bPV4pdOSebtN1X+B/aE9//Vmm2ys
         r6vEWc/dxmnVXtXrK9kFVr74lhURu3jzPldXjSLDtFOHy8Ghpj8cM/IXQ7/Q6cyjGWo4
         oEyAaCw0IXXJ1HCEi3IXbbI/jiHGuARoucpRo2H1XRPiEkNBKMUyqZxwNn1p9Qw4vm81
         W+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jd8H/ss1tY2RZQujVlK9cQ65SRUkbsyN0fjB8qEQAH4=;
        b=6DOd1SurA1FdTrIFAuc1G76Y+icX9XJfcVX0Zioi5qwVREDWvyiJwNB+iU6ZbZSRMS
         GhgCtRiIvPFc45i323JvpXE+Jgj0wvoeqYqknywkhvZ4rggMZXC5wWH/sfcKTDOFgWsp
         rOVyQmHjtNWaGBFyjb5e8NwLMlr07HV432Q70ivGwTtJuitLd5ho818rhj4AL/+4P9Hs
         Zc6EvfU9xW4I2t2zi0JTF87qwT4xuToS9Xd5yVS+kSxtXYJ8WnTxNeKijj5Ci34GjmDt
         BY5f1ypwZsJ+lWlmzZ9RbBtPg9XfxbHVwCKsAfZIrLZ+xkhoF73wJFj0jN51SE1sJxE6
         H0Zw==
X-Gm-Message-State: AOAM532T1lwZQWlwE+fy9H27oJkyCaOclsgoHd24j4KUqumNDv/Nnv5U
        kh/7UZpEIEn8Cshtao8zm+EPHY7SXWg=
X-Google-Smtp-Source: ABdhPJz7kF7FtCBrgbLD/u1TI2970NsvX2ShwYfQc7KkdW/MitLbutnIch66/rQ2EEtQyJAAnI07Gg==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr1797688wrm.610.1639521363683;
        Tue, 14 Dec 2021 14:36:03 -0800 (PST)
Received: from [192.168.0.16] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id t127sm3809854wma.9.2021.12.14.14.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 14:36:03 -0800 (PST)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <73e56a19-13a8-2c76-386f-dbc5e1babce7@gmail.com>
Date:   Tue, 14 Dec 2021 22:36:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkZEDKHP2gyKjqd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 14/12/2021 22:22, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
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
>> Changes since the rfc:
>>
>> 	- None
>>
>>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 0404267f1ae4..6575b1cbe95f 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>>  static int
>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>>  
>> +static int
>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>> +				   struct v4l2_subdev *sd)
>> +{
>> +	struct media_link *link;
>> +
>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
>> +		return -EINVAL;
>> +
>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
> 
> Is there a guarantee at this point that notifier->sd->entity has already
> been registered with the media_device ? That's done by
> media_device_register_entity() called from
> v4l2_device_register_subdev().

v4l2_async_match_notify() calls v4l2_device_register_subdev() before the
point that I've added the call to v4l2_async_try_create_links(), so I
think that's covered there.

>> +					   MEDIA_LNK_FL_ENABLED |
>> +					   MEDIA_LNK_FL_IMMUTABLE);
>> +
>> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
>> +}
>> +
>> +/*
>> + * Setup links on behalf of the notifier and subdev, where it's obvious what
> 
> s/Setup/Create/ ("link setup" refers to another operation, enabling and
> disabling links at runtime)

Yes, good point; although that too is a piece of terminology I find a
bit jarring to be honest; I would have named that function
media_entity_configure_link()

> 
>> + * should be done. At the moment, we only support cases where the notifier
>> + * is a sensor and the subdev is a lens.
> 
> s/sensor/camera sensor/
> s/lens/lens controller/
> 
>> + *
>> + * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
>> + * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
>> + */
>> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
>> +				       struct v4l2_subdev *sd)
>> +{
>> +	if (!notifier->sd)
>> +		return 0;
>> +
>> +	switch (notifier->sd->entity.function) {
>> +	case MEDIA_ENT_F_CAM_SENSOR:
>> +		return __v4l2_async_create_ancillary_link(notifier, sd);
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>  				   struct v4l2_device *v4l2_dev,
>>  				   struct v4l2_subdev *sd,
>> @@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>>  		return ret;
>>  	}
>>  
>> +	/*
>> +	 * Depending of the function of the entities involved, we may want to
>> +	 * create links between them (for example between a sensor and its lens
>> +	 * or between a sensor's source pad and the connected device's sink
>> +	 * pad)
> 
> s/)/)./
> 
>> +	 */
>> +	ret = v4l2_async_try_create_links(notifier, sd);
>> +	if (ret) {
>> +		v4l2_device_unregister_subdev(sd);
>> +		return ret;
>> +	}
>> +
>>  	/* Remove from the waiting list */
>>  	list_del(&asd->list);
>>  	sd->asd = asd;
> 
