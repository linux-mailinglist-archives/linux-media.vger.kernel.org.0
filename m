Return-Path: <linux-media+bounces-20125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DB9ACE26
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 17:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA29B1C209BA
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 15:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A51C830D;
	Wed, 23 Oct 2024 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRLCctIl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B81AC428
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695753; cv=none; b=WTdMjequp+ti2g+fwS5aBtJivcZEUlaot3mRB7noBzz2W32ZagcYtguUSaoTf9loPiI3oBIytbJwGWihQbzjIiPa8lmRM1bJEruuD9ZqGmpIv/7JvjzJdlIVIBWmARNSCQzsSiYKX650Qpg4rOTG3/XlMt2uVLW6mmdDSRp38F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695753; c=relaxed/simple;
	bh=OIOpONY0Z6vcMG6iBJz00KWCO35iq/nN7NAoqdZBqQY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WEBFRX6AqLIuosnmLmUMm/FAg57/NZ2jC34slfgWlSKylsygO5lMANamBJ2TQkP1o4jUl5vcjGsuX7x6riTiJuY+5SGhEJfgCAYv7UEDyRksWDsJ79NczSeXoWcIfSTqBV68W8u38P6y3xSLVSpq7ZImsl5k1QyUpJs1I30DKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRLCctIl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729695750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ev0kxkSpiSHbriY2NaV1OZqAKUBDU9EQFgepQjyDAU=;
	b=PRLCctIlDpECyTeUEYJQQf5VlsSr0pX/2ojl+CS7N5/4YndM2WS9zNefiBl1R3UWTpLeRx
	JlbcLiQfJYVyIv7KwOiiD42mFdvbJIqpLDIXC7Cg0g2CMjIzxsb6zzW5iC46pTVePo/7ob
	k9m7FX8bd9/05zp4PZO8BxDxR1zOAaQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-hde43kp1MAuaQVU_8B0_pw-1; Wed, 23 Oct 2024 11:02:28 -0400
X-MC-Unique: hde43kp1MAuaQVU_8B0_pw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99fa9f0c25so396538366b.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 08:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695748; x=1730300548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ev0kxkSpiSHbriY2NaV1OZqAKUBDU9EQFgepQjyDAU=;
        b=c1NsFGqoawhL8NpGmw3B2dvkHtP1JkIv8Tydusa6UTOBfyQQFDw8gO4AHiQedAuFdn
         iKEv1XviHKhKwvmPHMtnw1oSN8W6vT8QnML3cnucncYt9ziubcwRFs4GwD+eZgomnU6h
         O6aFTUEJHmw5uK8BeyfdRuXGBekUromvhb8FGYLyux+d+uqPYBLX5OpIsCdLzAiLgnMw
         RhYniluCjOocbrjAKOSFHvffIld1KAUjWdkwI6Z7SQQdScDDlXI3qQkA8Ru9mb96LVq0
         bcid8aT0v1TEfWLFxEkUKuAb0lpXgB+HQGg0wBL1X4yqVXK+Y1JK3uqnWf0CBVdEj62D
         WL2w==
X-Forwarded-Encrypted: i=1; AJvYcCWKdFViZSw8J4zXAT2nRFhUwKvnLef8jxkzeeuR5+mTQ6BrWj+KoRybXTVxom53XUQv9PvTThKNjxlbog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8jtSfwDonSeDpy0cLogHlQT6u9p32hTc2JC/T8xwKIG4Tl+C9
	vpARB+oVquk7cIVuuwmpujmGoBL1SBWKs82oBskEbqYatO06t5nwYxr/eUing35PRrL94ggR0T5
	bO1yzP8u6Rs6oq2vaitfnrQQvyGKD1wigMC/cq3cu+fPc42Vq/EvRNKqRv8Ki
X-Received: by 2002:a17:907:1ca3:b0:a9a:6477:bd03 with SMTP id a640c23a62f3a-a9abf8a5023mr217067466b.38.1729695745969;
        Wed, 23 Oct 2024 08:02:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq1mERRIHyOWttMwqR6/mqZd8C3gCeWilsBwWbFVzPUg1ESvx4WFHWvcutQc1rxZt/GUV6OQ==
X-Received: by 2002:a17:907:1ca3:b0:a9a:6477:bd03 with SMTP id a640c23a62f3a-a9abf8a5023mr217061366b.38.1729695745188;
        Wed, 23 Oct 2024 08:02:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a915a2df1sm488994666b.225.2024.10.23.08.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 08:02:24 -0700 (PDT)
Message-ID: <78b60848-3c28-4a9b-a002-5c2ec841e97f@redhat.com>
Date: Wed, 23 Oct 2024 17:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: v4l: Call s_stream() on VCM when it is called
 on the associated sensor
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240901211834.145186-1-hdegoede@redhat.com>
 <20240901211834.145186-2-hdegoede@redhat.com>
 <20240901212829.GA25983@pendragon.ideasonboard.com>
 <92bf3d6b-018e-409c-93ae-80d4404d4d44@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <92bf3d6b-018e-409c-93ae-80d4404d4d44@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

p.s.

On 23-Oct-24 2:48 PM, Hans de Goede wrote:
> Hi Laurent,
> 
> On 1-Sep-24 11:28 PM, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Sun, Sep 01, 2024 at 11:18:33PM +0200, Hans de Goede wrote:
>>> Currently VCM drivers power-up the VCM as soon as the VCM's /dev node
>>> is opened and through the runtime-pm device-link to the sensor this
>>> also powers up the sensor.
>>>
>>> Powering up the VCM and sensor when the /dev node is opened is undesirable,
>>> without a VCM sensors delay powering up until s_stream(1) is called. This
>>> allows querying / negotiating capabilities without powering things up.
>>>
>>> Sometimes a long running daemon like pipewire may keep the /dev node open
>>> all the time. The kernel should still be able to powerdown the VCM + sensor
>>> in this scenario.
>>>
>>> VCM drivers should be able to do the same as sensor drivers and only
>>> power-up the VCM when s_stream(1) is called on the VCM subdev, but this
>>> requires that s_stream() is actually called on the VCM when the sensor
>>> starts / stops streaming.
>>
>> .s_stream() doesn't conceptually make sense for VCMs. Furthermore,
>> .s_stream() is being replaced with .enable_streams() and
>> .disable_streams(), which will make even less sense. We need a different
>> API.
> 
> We can discuss how to call the subdev ops for this once we know
> what the overal design for this is going to be. So lets postpone
> the discussion about naming the subdev ops for this till later.
> 
>>> The s_stream() call on sensor subdevs is done by CSI-receiver/ISP drivers.
>>> To avoid needing to change all these call sites to also call s_stream()
>>> on the VCM (if there is one) handle the VCM in the v4l2-core similar to how
>>> the core takes care of turning on/off the privacy LED.
>>
>> This needs to come with a design rationale, documented in
>> Documentation/. The design needs to explain the use cases. Lens motion
>> may take time, which I expect will influence how we will need to handle
>> power management.
>>
>> I'm not very comfortable handling this in v4l2-subdev.c, it seems that
>> we'll hardcode use cases. Without a clear and detailed designed
>> rationale, this patch feels we'll paint ourselves in a corner. We have
>> enough badly designed (or not designed at all) APIs for cameras, it's
>> time to do better.
> 
> Design wise I roughly see 3 options:
> 
> a. Stick with the current design of powering on on open of /dev/v4l-subdev
> 
> b. Add explicit calls userspace can make to power-on the device
> 
> c. My current proposal to automatically power-on when the sensor associated
> with the VCM.
> 
> Since this patch series implements 3, I'm going to discuss that option
> here now. But if that hits a dead end we can look at 2. too.
> 
> Talking about use-cases, lets simplify things by looking at use-cases
> solely from a VCM power on/off point of view. Looking at it that way
> I really only see 2 orthogonal groupings for all use-cases (so 4
> possible combinations of groupings, but I think we can discuss each
> of the 2 axis separately):
> 
> Grouping i: amount of sensor stream start/stops in a single "use"
> 
> 1. The sensor starts streaming once and then the stream stops for
> a significant period of time; vs
> 
> 2. The stream is sometimes stopped to change settings and then
> restarted within a single use-case.
> 
> For 1. automatically powering on the VCM on stream start is fine.
> For 2. we do not want the VCM to turn off and then back on again
> while changing settings. We can use auto-suspend with a long enough
> auto-suspend delay (we could default to 1s) for this. There might
> be some special cases where we need to change the auto-suspend delay.
> We could add some V4L2 API (ctrl?) for this, or use the existing
> sysfs API through e.g. a udev rule.
> 
> To me using autosuspend-delays here seems workable and having
> the v4l2-subdev code manage the power has the advantage that it does
> not break any userspace APIs. IOW things will just work while
> saving power for existing users and things will also just work
> for new use-cases without requiring userspace to have to do
> extra work for this.

Note that apparently even with the existing power-on on open()
there are issues where the VCM powers-down when change modes
and people are already submitting patch to work around this, e.g. :

https://patchwork.linuxtv.org/project/linux-media/patch/20240831055328.22482-1-zhi.mao@mediatek.com/

> Grouping ii: Does the VCM need to be turned on before the stream
> starts:
> 
> 3. A small delay at startup for the power-on (on the first start
> stream, not when switching modes) is fine /  having the first few
> frames being out of focus while the lens moves is fine, they typically
> will be anyways until the autofocus algorithm has locked; vs
> 
> 4. A small delay at startup for the power-on is undesirable /
> the focus value is known beforehand and the lens must be in position
> before capturing the first frame.
> 
> 4. will clearly not work well when the v4l2-subdev code manage
> the power. But this seems like a rather corner case scenario; and
> one which we could still make work by simply disabling runtime-pm
> for the VCM through sysfs in this case.
> 
> In conclusion to me it seems that having the v4l2-subdev code
> manage the power seems like it would work well. The only really
> problematic scenario which I can come up with is 4. and that seems
> a bit of a corner case. If this ever becomes a problem we could
> can make it work by either disabling runtime-pm through sysfs or
> by offering some API to prime the VCM which turns it on before
> the first stream-start (and it will still get automatically turned
> off after stream-stop + timeout).
> 
> We could even mix option b) and c) from the "Design wise I roughly
> see 3 options" options above and offer explicit power-management
> for apps which want that; while still automatically increasing
> the power-on count on sensor streaming, with any power-on
> count > 1 turning the VCM on.
> 
> This way apps/use-cases which want to make sure the VCM is on
> early or stays on during mode switching can use the explicit APIs
> while simpler use-cases (and existing use-cases since we cannot
> break userspace API) can rely on the automatic powering on done
> by the v4l2-subdev core.
> 
> The only downside which I can see of using a power-on counter
> and combining explicit + automatic control is that it will be
> impossible to turn the VCM off while streaming.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-async.c  | 20 +++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++------
>>>  include/media/v4l2-subdev.h           |  2 ++
>>>  3 files changed, 44 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index ee884a8221fb..9b854f1d1051 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -330,6 +330,11 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>>>  		return 0;
>>>  	}
>>>  
>>> +	if (sd->entity.function == MEDIA_ENT_F_LENS) {
>>> +		dev_dbg(n->sd->dev, "Using %s VCM\n", dev_name(sd->dev));
>>> +		n->sd->vcm = sd;
>>> +	}
>>> +
>>>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>>>  
>>>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
>>> @@ -871,6 +876,21 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>>  	if (!sd->async_list.next)
>>>  		return;
>>>  
>>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>>> +	if (sd->entity.function == MEDIA_ENT_F_LENS && sd->v4l2_dev && sd->v4l2_dev->mdev) {
>>> +		struct media_entity *entity;
>>> +
>>> +		media_device_for_each_entity(entity, sd->v4l2_dev->mdev) {
>>> +			struct v4l2_subdev *it = media_entity_to_v4l2_subdev(entity);
>>> +
>>> +			if (it->vcm == sd) {
>>> +				dev_dbg(it->dev, "Clearing VCM\n");
>>> +				it->vcm = NULL;
>>> +			}
>>> +		}
>>> +	}
>>> +#endif
>>> +
>>>  	v4l2_subdev_put_privacy_led(sd);
>>>  
>>>  	mutex_lock(&list_lock);
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index 7c5812d55315..24a68d90f686 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -148,17 +148,33 @@ static int subdev_close(struct file *file)
>>>  }
>>>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>>>  
>>> -static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
>>> +static void v4l2_subdev_enable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>>>  {
>>>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>>>  		led_set_brightness(sd->privacy_led,
>>>  				   sd->privacy_led->max_brightness);
>>>  #endif
>>> +
>>> +	if (sd->vcm && !sd->vcm_enabled &&
>>> +	    v4l2_subdev_has_op(sd->vcm, video, s_stream)) {
>>> +		int ret;
>>> +
>>> +		ret = v4l2_subdev_call(sd->vcm, video, s_stream, 1);
>>> +		if (ret)
>>> +			dev_err(sd->vcm->dev, "Error powering on VCM: %d\n", ret);
>>> +		else
>>> +			sd->vcm_enabled = true;
>>> +	}
>>>  }
>>>  
>>> -static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
>>> +static void v4l2_subdev_disable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>>>  {
>>> +	if (sd->vcm && sd->vcm_enabled) {
>>> +		v4l2_subdev_call(sd->vcm, video, s_stream, 0);
>>> +		sd->vcm_enabled = false;
>>> +	}
>>> +
>>>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>>>  		led_set_brightness(sd->privacy_led, 0);
>>> @@ -466,9 +482,9 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>>>  		sd->s_stream_enabled = enable;
>>>  
>>>  		if (enable)
>>> -			v4l2_subdev_enable_privacy_led(sd);
>>> +			v4l2_subdev_enable_privacy_led_and_vcm(sd);
>>>  		else
>>> -			v4l2_subdev_disable_privacy_led(sd);
>>> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>>>  	}
>>>  
>>>  	return ret;
>>> @@ -2289,7 +2305,7 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>>>  	 * for all cases.
>>>  	 */
>>>  	if (!use_s_stream && !already_streaming)
>>> -		v4l2_subdev_enable_privacy_led(sd);
>>> +		v4l2_subdev_enable_privacy_led_and_vcm(sd);
>>>  
>>>  done:
>>>  	if (!use_s_stream)
>>> @@ -2382,7 +2398,7 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>>  done:
>>>  	if (!use_s_stream) {
>>>  		if (!v4l2_subdev_is_streaming(sd))
>>> -			v4l2_subdev_disable_privacy_led(sd);
>>> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>>>  
>>>  		v4l2_subdev_unlock_state(state);
>>>  	}
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index bd235d325ff9..6568a0cc070b 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -1094,6 +1094,7 @@ struct v4l2_subdev {
>>>  	 */
>>>  
>>>  	struct led_classdev *privacy_led;
>>> +	struct v4l2_subdev *vcm;
>>>  
>>>  	/*
>>>  	 * TODO: active_state should most likely be changed from a pointer to an
>>> @@ -1104,6 +1105,7 @@ struct v4l2_subdev {
>>>  	struct v4l2_subdev_state *active_state;
>>>  	u64 enabled_pads;
>>>  	bool s_stream_enabled;
>>> +	bool vcm_enabled;
>>>  };
>>>  
>>>  
>>
> 


