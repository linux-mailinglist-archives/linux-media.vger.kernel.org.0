Return-Path: <linux-media+bounces-20118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCF9ACA88
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 14:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC556B23209
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 12:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43861AB50C;
	Wed, 23 Oct 2024 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RwoY1h0o"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC1130AF6
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687704; cv=none; b=VaTNm5awVtRSr2jrEdO6yWoLxV8APEUgdsNTMtdkdtfwEL3qVmcHgwUxIFzWfOR2fXtDpx9DAE5FDbid28GA9BQpNOirpiIPFwCK20xlQKMo0vtELAX9KQVzySjHeqir7nj+sFuPgf6du01X9XYcSrvWoH47t5YbUsc6WGB5hAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687704; c=relaxed/simple;
	bh=4BWD5Zewj4xQtlZkqlxzwWMw4mMiijPKHbRYT4U/fys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/ir13UVbuoASX4qOiWJmonRe3A0sfqpd8bzDLhrNzxAmj/sf7BTKke5dNPfNSricQL0vHRlvH1FW0IdxCnmEP4lwTh5PQe05ArotijlsRDpYrwWrkMqtgL0jRylcHgbCNCLvHUIuPYE4VRaCSgujzrkLxeNKOscpRZsLBY3oas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RwoY1h0o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729687701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRz9+CLIMI9d6PmQ1sWkXrL05WhmwMP0cjpSYzCOwIQ=;
	b=RwoY1h0o6MbihuMXbvZEWRR2Z9LFNKAMkPkp/HqqF7OSGwsFVqTGHHq31mwkfRSWwxBdw0
	2FZhpcMzG5HRpTmF74fZs9/BGyAj2FYczTzU/1FTCTuPTM+0eQ2h3sLiif4hDMAMk7DCvU
	LdsNrJlSG7O3c/PofqXHoOWEXg47o+c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ytSZoHwtN9a3jR7vJx2eIA-1; Wed, 23 Oct 2024 08:48:20 -0400
X-MC-Unique: ytSZoHwtN9a3jR7vJx2eIA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539fe4e75c4so6456526e87.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687698; x=1730292498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRz9+CLIMI9d6PmQ1sWkXrL05WhmwMP0cjpSYzCOwIQ=;
        b=k60moSU+T3pTltGXMAZm0Xq32fOd1fRRWGXdJOU9idZe+wr2JS/GzcAjtt1J4bAMaP
         +WGJcJdJraNDkK5ZGI9lL33Lk0/iwTXd+5EiullF7v+xfxF9ZychQ9PZMlkEgl31kiws
         tJWwwxmOozs/hzESfe/CT5PlVbBStG8+UFqwV03q1bWdQK7or6rWlhuTuBVkeEwYrqXQ
         on9a12w1+uek6lqRN7pro9YkP6/tv7XX0beqWSrwyutnHrymVlFLV4Pe1wQKLXqpa/Ik
         JZaDQcAz3droH6FUJg2blRnaYS0TvbHB3vdzmYAj47Hm2Y4lRpJwvgXmd+HLaMLiUTqR
         HJCA==
X-Forwarded-Encrypted: i=1; AJvYcCUzcr9u+fOQIy7oxXnXZnw/W69YkfJVoZogQJ/gYz1e0SFB8W2+YdbAln9SILzMdYnF8ZBoaB8hOpZk1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiIaSR4UBxKntmOWTxKgNeeUozVzYhQKmwn4vl25uN1nztZs3R
	DTUFaLDCzHR2XhAYSKuONgZ2KQpkYTklXrgMqmAG9zSjf4Wu7T1He0L4K/PskXb3rNJfzmWXvEm
	lbV7Ob+gvJr3/4gcaSuwvODeBGXdtLeHHxrMS0bH0zdUJWW0XGH9adEJYmyU3
X-Received: by 2002:a05:6512:3f1b:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-53b1a315e45mr2104320e87.5.1729687698187;
        Wed, 23 Oct 2024 05:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERc8r88vlPeqoBH3yilEe0iowMB6FQC+JDbPvSb92cP3/0dqa0GvvWabTRPLXW3UOgBlV7Vw==
X-Received: by 2002:a05:6512:3f1b:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-53b1a315e45mr2104288e87.5.1729687697598;
        Wed, 23 Oct 2024 05:48:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d65a2sm482820366b.15.2024.10.23.05.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:48:17 -0700 (PDT)
Message-ID: <92bf3d6b-018e-409c-93ae-80d4404d4d44@redhat.com>
Date: Wed, 23 Oct 2024 14:48:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: v4l: Call s_stream() on VCM when it is called
 on the associated sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240901211834.145186-1-hdegoede@redhat.com>
 <20240901211834.145186-2-hdegoede@redhat.com>
 <20240901212829.GA25983@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240901212829.GA25983@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 1-Sep-24 11:28 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sun, Sep 01, 2024 at 11:18:33PM +0200, Hans de Goede wrote:
>> Currently VCM drivers power-up the VCM as soon as the VCM's /dev node
>> is opened and through the runtime-pm device-link to the sensor this
>> also powers up the sensor.
>>
>> Powering up the VCM and sensor when the /dev node is opened is undesirable,
>> without a VCM sensors delay powering up until s_stream(1) is called. This
>> allows querying / negotiating capabilities without powering things up.
>>
>> Sometimes a long running daemon like pipewire may keep the /dev node open
>> all the time. The kernel should still be able to powerdown the VCM + sensor
>> in this scenario.
>>
>> VCM drivers should be able to do the same as sensor drivers and only
>> power-up the VCM when s_stream(1) is called on the VCM subdev, but this
>> requires that s_stream() is actually called on the VCM when the sensor
>> starts / stops streaming.
> 
> .s_stream() doesn't conceptually make sense for VCMs. Furthermore,
> .s_stream() is being replaced with .enable_streams() and
> .disable_streams(), which will make even less sense. We need a different
> API.

We can discuss how to call the subdev ops for this once we know
what the overal design for this is going to be. So lets postpone
the discussion about naming the subdev ops for this till later.

>> The s_stream() call on sensor subdevs is done by CSI-receiver/ISP drivers.
>> To avoid needing to change all these call sites to also call s_stream()
>> on the VCM (if there is one) handle the VCM in the v4l2-core similar to how
>> the core takes care of turning on/off the privacy LED.
> 
> This needs to come with a design rationale, documented in
> Documentation/. The design needs to explain the use cases. Lens motion
> may take time, which I expect will influence how we will need to handle
> power management.
> 
> I'm not very comfortable handling this in v4l2-subdev.c, it seems that
> we'll hardcode use cases. Without a clear and detailed designed
> rationale, this patch feels we'll paint ourselves in a corner. We have
> enough badly designed (or not designed at all) APIs for cameras, it's
> time to do better.

Design wise I roughly see 3 options:

a. Stick with the current design of powering on on open of /dev/v4l-subdev

b. Add explicit calls userspace can make to power-on the device

c. My current proposal to automatically power-on when the sensor associated
with the VCM.

Since this patch series implements 3, I'm going to discuss that option
here now. But if that hits a dead end we can look at 2. too.

Talking about use-cases, lets simplify things by looking at use-cases
solely from a VCM power on/off point of view. Looking at it that way
I really only see 2 orthogonal groupings for all use-cases (so 4
possible combinations of groupings, but I think we can discuss each
of the 2 axis separately):

Grouping i: amount of sensor stream start/stops in a single "use"

1. The sensor starts streaming once and then the stream stops for
a significant period of time; vs

2. The stream is sometimes stopped to change settings and then
restarted within a single use-case.

For 1. automatically powering on the VCM on stream start is fine.
For 2. we do not want the VCM to turn off and then back on again
while changing settings. We can use auto-suspend with a long enough
auto-suspend delay (we could default to 1s) for this. There might
be some special cases where we need to change the auto-suspend delay.
We could add some V4L2 API (ctrl?) for this, or use the existing
sysfs API through e.g. a udev rule.

To me using autosuspend-delays here seems workable and having
the v4l2-subdev code manage the power has the advantage that it does
not break any userspace APIs. IOW things will just work while
saving power for existing users and things will also just work
for new use-cases without requiring userspace to have to do
extra work for this.

Grouping ii: Does the VCM need to be turned on before the stream
starts:

3. A small delay at startup for the power-on (on the first start
stream, not when switching modes) is fine /  having the first few
frames being out of focus while the lens moves is fine, they typically
will be anyways until the autofocus algorithm has locked; vs

4. A small delay at startup for the power-on is undesirable /
the focus value is known beforehand and the lens must be in position
before capturing the first frame.

4. will clearly not work well when the v4l2-subdev code manage
the power. But this seems like a rather corner case scenario; and
one which we could still make work by simply disabling runtime-pm
for the VCM through sysfs in this case.

In conclusion to me it seems that having the v4l2-subdev code
manage the power seems like it would work well. The only really
problematic scenario which I can come up with is 4. and that seems
a bit of a corner case. If this ever becomes a problem we could
can make it work by either disabling runtime-pm through sysfs or
by offering some API to prime the VCM which turns it on before
the first stream-start (and it will still get automatically turned
off after stream-stop + timeout).

We could even mix option b) and c) from the "Design wise I roughly
see 3 options" options above and offer explicit power-management
for apps which want that; while still automatically increasing
the power-on count on sensor streaming, with any power-on
count > 1 turning the VCM on.

This way apps/use-cases which want to make sure the VCM is on
early or stays on during mode switching can use the explicit APIs
while simpler use-cases (and existing use-cases since we cannot
break userspace API) can rely on the automatic powering on done
by the v4l2-subdev core.

The only downside which I can see of using a power-on counter
and combining explicit + automatic control is that it will be
impossible to turn the VCM off while streaming.

Regards,

Hans






> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-async.c  | 20 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++------
>>  include/media/v4l2-subdev.h           |  2 ++
>>  3 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index ee884a8221fb..9b854f1d1051 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -330,6 +330,11 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>>  		return 0;
>>  	}
>>  
>> +	if (sd->entity.function == MEDIA_ENT_F_LENS) {
>> +		dev_dbg(n->sd->dev, "Using %s VCM\n", dev_name(sd->dev));
>> +		n->sd->vcm = sd;
>> +	}
>> +
>>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>>  
>>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
>> @@ -871,6 +876,21 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>  	if (!sd->async_list.next)
>>  		return;
>>  
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	if (sd->entity.function == MEDIA_ENT_F_LENS && sd->v4l2_dev && sd->v4l2_dev->mdev) {
>> +		struct media_entity *entity;
>> +
>> +		media_device_for_each_entity(entity, sd->v4l2_dev->mdev) {
>> +			struct v4l2_subdev *it = media_entity_to_v4l2_subdev(entity);
>> +
>> +			if (it->vcm == sd) {
>> +				dev_dbg(it->dev, "Clearing VCM\n");
>> +				it->vcm = NULL;
>> +			}
>> +		}
>> +	}
>> +#endif
>> +
>>  	v4l2_subdev_put_privacy_led(sd);
>>  
>>  	mutex_lock(&list_lock);
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 7c5812d55315..24a68d90f686 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -148,17 +148,33 @@ static int subdev_close(struct file *file)
>>  }
>>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>>  
>> -static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
>> +static void v4l2_subdev_enable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>>  {
>>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>>  		led_set_brightness(sd->privacy_led,
>>  				   sd->privacy_led->max_brightness);
>>  #endif
>> +
>> +	if (sd->vcm && !sd->vcm_enabled &&
>> +	    v4l2_subdev_has_op(sd->vcm, video, s_stream)) {
>> +		int ret;
>> +
>> +		ret = v4l2_subdev_call(sd->vcm, video, s_stream, 1);
>> +		if (ret)
>> +			dev_err(sd->vcm->dev, "Error powering on VCM: %d\n", ret);
>> +		else
>> +			sd->vcm_enabled = true;
>> +	}
>>  }
>>  
>> -static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
>> +static void v4l2_subdev_disable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>>  {
>> +	if (sd->vcm && sd->vcm_enabled) {
>> +		v4l2_subdev_call(sd->vcm, video, s_stream, 0);
>> +		sd->vcm_enabled = false;
>> +	}
>> +
>>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>>  		led_set_brightness(sd->privacy_led, 0);
>> @@ -466,9 +482,9 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>>  		sd->s_stream_enabled = enable;
>>  
>>  		if (enable)
>> -			v4l2_subdev_enable_privacy_led(sd);
>> +			v4l2_subdev_enable_privacy_led_and_vcm(sd);
>>  		else
>> -			v4l2_subdev_disable_privacy_led(sd);
>> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>>  	}
>>  
>>  	return ret;
>> @@ -2289,7 +2305,7 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>>  	 * for all cases.
>>  	 */
>>  	if (!use_s_stream && !already_streaming)
>> -		v4l2_subdev_enable_privacy_led(sd);
>> +		v4l2_subdev_enable_privacy_led_and_vcm(sd);
>>  
>>  done:
>>  	if (!use_s_stream)
>> @@ -2382,7 +2398,7 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>  done:
>>  	if (!use_s_stream) {
>>  		if (!v4l2_subdev_is_streaming(sd))
>> -			v4l2_subdev_disable_privacy_led(sd);
>> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>>  
>>  		v4l2_subdev_unlock_state(state);
>>  	}
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index bd235d325ff9..6568a0cc070b 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1094,6 +1094,7 @@ struct v4l2_subdev {
>>  	 */
>>  
>>  	struct led_classdev *privacy_led;
>> +	struct v4l2_subdev *vcm;
>>  
>>  	/*
>>  	 * TODO: active_state should most likely be changed from a pointer to an
>> @@ -1104,6 +1105,7 @@ struct v4l2_subdev {
>>  	struct v4l2_subdev_state *active_state;
>>  	u64 enabled_pads;
>>  	bool s_stream_enabled;
>> +	bool vcm_enabled;
>>  };
>>  
>>  
> 


