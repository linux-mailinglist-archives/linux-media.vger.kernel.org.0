Return-Path: <linux-media+bounces-4415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC484250A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 13:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 221CBB2270A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2BA6A015;
	Tue, 30 Jan 2024 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/e8mpyw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CB6A00D
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618238; cv=none; b=fJ+65RoiR4gx66FIXzeKCry6IhgRqBpU/m1wQmqK/prT1GJyNr7+XMCORB981DgJ8y8m+lLtPVF82zFpZotVcCGlKx2ZhTqVxT8JFuAJ05WXNnPaQD1f+LUPxMhcJrRIDm9Teymc00c70CxfwCYNlngl8LDb+Ljq0l+HfC89eXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618238; c=relaxed/simple;
	bh=Rp8LhtnSIgruVziwjYfyHprkT8G9+I25eoGY5mfBOlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN4Ak59lDrWPMF0cx3t7ZV4aSKz0LVmRGaByb3rW7lX8/VXPyjsyAglT6co7iogwQBu75zTmTP/zTlhUH2/rp58Ga8zSgf1dQvdRABuQqIep4rTn2OpjoPtokIS8x9yfw/FhRyiA1XwJDZa66AaWLswvvH/B1epiMLu8uouZDuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/e8mpyw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706618235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec+mziI4bcT94BNOK28Splk+zRbf0Roo1Evck9LldBc=;
	b=H/e8mpywPSK6I14gDsB72wUUtZvfEQqX+LNOYlCX/ZNVyQ2X5EMJ3ktLipdbJxjK97mbRc
	+SShMhoIKmWy0uz5uvMxN3m9v6sSBw+ANQGmgUTdmQGjElS6/ym1pcimf797Z7RK5W7fwy
	dAdi3fcCNadsfc7qygdz8wVorhljkoU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-wAlshpqqMmGUzU7r0oDtvg-1; Tue, 30 Jan 2024 07:37:13 -0500
X-MC-Unique: wAlshpqqMmGUzU7r0oDtvg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a35a649c608so127656066b.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 04:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618232; x=1707223032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec+mziI4bcT94BNOK28Splk+zRbf0Roo1Evck9LldBc=;
        b=q0lIVbrH+UtjqiHIPtfSRJ7DlOBqEbB+J0kEkuAXmER3ZXawtqMcY6hjWaJMqGOvKD
         mYJKgCCvuwMkc8Xj0/eeo99ThaYFPQFP2bYzcXsFkHytUPGdkJeqKNmmb+/BO0QZQznV
         cC2mWGfAlIVpCuPbO/gDMhaPItdJiE/r5+tRwLaynHp3vr279pwDxionbi4WiKYNDjiI
         P+60UbUmo3iAKHgqLXu5ifY9nWUGheYNTfQMtueWoqKO1u7VPxTrZhPvSi6x3vhtGSxi
         X+UoVftiOyjqWn23t364j0iR/3EPwM9v9hEk99ICYCnVjkM1dkMpDks+PH233PvyJa/A
         bTNw==
X-Gm-Message-State: AOJu0YzfaGxPJVQbrFoFq24eMTpD1EhoNQ+vH204DvuIhnZvgGW92yJM
	oWseCXplDMeWXoIB7ValciDAEx5NpKqDY3Z19EkQq3BMXnJIl8QruQWtC3auuwb7p87n5tQRnQP
	Y2jz5vFC44ln5iOQeQXnJynJDhbdiKo/SD+m9I5abxgg1Qp+KagfidT/izLd/Rz1Bfkb/
X-Received: by 2002:a17:906:7f90:b0:a2c:3596:b0c1 with SMTP id f16-20020a1709067f9000b00a2c3596b0c1mr6875628ejr.75.1706618231974;
        Tue, 30 Jan 2024 04:37:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm45NTTJSJN/tJKdNiDxnep9V6XAbiM0ypYrsDeXSoSdXBLCXNTmhzQ0cwJGIv6pN6SKFysw==
X-Received: by 2002:a17:906:7f90:b0:a2c:3596:b0c1 with SMTP id f16-20020a1709067f9000b00a2c3596b0c1mr6875611ejr.75.1706618231591;
        Tue, 30 Jan 2024 04:37:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un3-20020a170907cb8300b00a3523d7d31bsm4296710ejc.155.2024.01.30.04.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:37:10 -0800 (PST)
Message-ID: <c3fe0e8c-0aca-4688-ace4-b43fbaf64182@redhat.com>
Date: Tue, 30 Jan 2024 13:37:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
 <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
 <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>
 <ZbfxId264Ect_wpb@kekkonen.localdomain>
 <348016db-d2ee-4bc3-b1f6-faf545f3c805@redhat.com>
 <Zbjk19khasCsScz-@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zbjk19khasCsScz-@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/24 13:00, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jan 30, 2024 at 11:29:20AM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 1/29/24 19:40, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Jan 29, 2024 at 06:18:08PM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 1/29/24 15:45, Jacopo Mondi wrote:
>>>>> Hi Hans
>>>>>
>>>>> +dave, laurent and sakari
>>>>>
>>>>> On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
>>>>>> Hi Jacopo,
>>>>>>
>>>>>> On 1/29/24 13:05, Jacopo Mondi wrote:
>>>>>>> Hi Hans
>>>>>>>
>>>>
>>>> <snip (getting too long)>
>>>>
>>>>>> OTOH I do believe that we want a simple default for vblank which gets
>>>>>> set on every set_mode call to keep things KISS.
>>>>>>
>>>>>> How about something like this: (based on your doc patch):
>>>>>>
>>>>>> """
>>>>>> The vblank control default value is reset so that the sensor runs
>>>>>> at 30 fps. Except when 30 fps cannot be achieved, in that case
>>>>>> the vblank control default value is reset to the control's minimum.
>>>>>>
>>>>>> After adjusting the range, the vblank control's value must be set to its
>>>>>> new default value for consistent behavior after applying a new frame size.
>>>>>> """
>>>>>>
>>>>>
>>>>> Sorry but I'm not super excited about blessing 30fps as the
>>>>> preferred or suggested setting in the documentation. For some use
>>>>> cases 30fps might be extremely slow or extremely fast, if a sensor or
>>>>> a mode cannot achieve this we then suggest the minimum... not sure
>>>>> what's best. What's others opinion here ?
>>>>
>>>> I'm fine with loosing the 30 fps language. I was actually
>>>> already thinking about dropping specifying 30 fps myself.
>>>>
>>>> In the pending documentation patch you write:
>>>>
>>>> "The value used to initialize the vertical and horizontal blanking controls
>>>> should be selected in order to realize, in association with the driver default
>>>> format and default pixel rate, a reasonable frame rate output, usually one of
>>>> the standard 15, 30 or 60 frame per second."
>>>>
>>>> How about:
>>>>
>>>> "When a new frame size is applied on the subdevice, sensor drivers are required
>>>> to update the limits of their blankings controls.
>>>>
>>>> ... part about calling __v4l2_ctrl_modify_range()...
>>>>
>>>> The control's default value is adjusted to achieve a reasonable framerate
>>>> again and the control's value is set to the new default for consistent
>>>> behavior after applying a new frame size."
>>>>
>>>> ?
>>>>
>>>> This basically blesses the existing ov5693 driver's behavior :)
>>>
>>> What would be the purpose of this? Presumably the user space will set the
>>> vblank value based on its needs in any case, before starting streaming.
>>
>> As I mentioned currently libcamera's sensor class sets vblank to its
>> default value at initialization time and some pipelines simply leave
>> it there so having a somewhat sane default is important to not have
>> a very high fps / have low max exposure for modes with a low height.
>>
>>> It would require changing many that currently don't have this. Changing
>>> this could also adversely affect some user space software but presumably is
>>> unlikely to break it.
>>
>> This is mostly to have clear guidelines for when adding vblank support
>> to existing drivers without vblank support.
>>
>> Existing drivers often have a fixed vts value independend of the mode /
>> amount of cropping so that they always run at a fixed fps.
>>
>> Ideally we would not change the behavior of these drivers when adding
>> vblank control. Having these drivers pick a default vblank value
>> (when adjusting the range) so that the old fixed vts is again achieved
>> and then resetting vblank to that default value ensures that the behavior
>> of the driver does not change for userspace which does not touch vblank.
> 
> Agreed. The text should also say that, then, so new drivers wouldn't need
> to bother. The complexity of adding that is trivial only on entirely
> register list based drivers which we prefer to get rid of anyway,
> eventually.

So what should new drivers use as default vblank value? The min
supported value as in Jacopo's current
"[PATCH v2 1/2] documentation: media: camera_sensor: Document blankings handling"
patch ?

Regards,

Hans





