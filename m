Return-Path: <linux-media+bounces-27620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB5A4FFB0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780101894F71
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3556E248866;
	Wed,  5 Mar 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PO1jOSoz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146A2475C8
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179846; cv=none; b=TIZalwHk+mRVsVF+Lb/4abMFt87NiPmHpPpKKdkwGIDPbNCO0GTzPcVb9SP/9wYrib96UEz1w9W+6wgVSI/MKTq3dWac77Sg5uvYUFOf94GTfn0foYfQqhHvsVIuFZETPae2hrXrQsWpm4/MQOWHI9L8ZE92Fxxhj8odB8YDsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179846; c=relaxed/simple;
	bh=d2G3CW84w/M9hF4/KFmE43z5KE1aWPCuGSkwntVryh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miiLODKsbt50+7fs3CtDyybcwKvrJ2d7d2n6YhiXp3CzqiV0xrcHLAan8cgKWuY5cRTI1GIHTPppcW0EDS7JWepbJ5BQdzMWPkXRWQmwrp0cb8JF0n/fGgcJ2yjDLpdZAz3srH4lHq77VU8Q0BsEIpPMqpb/XppJn/VJJYcNlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PO1jOSoz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741179843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vebGEkglLbQGNvLgWBY01sr8S/XdHoDaZpIyllA6Xw=;
	b=PO1jOSozGVd8zvH4hQQve8LRRUln1YPsyAME4M94oxQ9432Xuck9Il0KRHCOu8bmneHfF7
	RE5OxP7JMppxSu9K04vLEOvXkV9HspK8cMadSzRa2/NBZEOVWLCQ1JqxmOgkBRw4t5yDM8
	Lg9air6aTtsIfI9gGWNgIbaBMtDqQw0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-ZSqO8fEgPi6RLnL7ySE5bg-1; Wed, 05 Mar 2025 08:04:01 -0500
X-MC-Unique: ZSqO8fEgPi6RLnL7ySE5bg-1
X-Mimecast-MFC-AGG-ID: ZSqO8fEgPi6RLnL7ySE5bg_1741179840
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac1dca8720cso174634766b.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741179840; x=1741784640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vebGEkglLbQGNvLgWBY01sr8S/XdHoDaZpIyllA6Xw=;
        b=ECze92HDg7eneDZr6nlMqz3j6OqSXvNnJlTKHrvWBTqwt6EH2gKmYj2bE54lWOfcWp
         qV/PG0ZVI7XSCuLnNDV5FPfeqpHsefQhJR/n0rVC+Qi0+RKfmR/IIvvyjPfdlFvwyo/J
         o5nA4S4dDIyaYOU5HgcHI4V22JllUMKFls8hM6bodecutC7HVz7i74P3OD9Snbw+lprV
         5CG6gZl79EAf7koARDZOTLqH+zuNqk6yfhn+/ACW5joCF1RDRYMt9Cnqplk3YNrnm62T
         lctS2QLdzIb3Jmx5YxbX44hsiN6/GEKwvqCfQBWI+7j/roTovI6utpnXqwA4AJ0AL65q
         sD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR+IXZZJxXEjIfv/wu7Kb8ITqO/TsPIq5bLCfT4N7qr5aHj7i/yz+fMrvj0Pi3AdLQaM45IR1wadgfVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbsThcxyOm1P5yzDDzeg85PKPKgw80UhCVD4X5jAXxDGfyAhp
	VDSXvd/i/dunATPr8NC/ImpJCKT2Cm/gHiAng29Da9g3V7aoXqByTZanJClHEzdwswYno+TAi/2
	FHLf5z81dh0dO38462zCTPxtMHKceBMbzBye1NPxeuOkoHSGpyJP7/wR2YZuZ
X-Gm-Gg: ASbGncup+k+muKdczEBNzAHD6LCOIucNrOc0b+wrQtFgilUnXo1ud7nmv5KNTIb0/Xw
	IQc1V7XwAgLCK8eRos/Szyi/JGAEZzWh3ocYYA0f9LM4HUMQFikiFvIwU+jtsajSiLh3cTHDFXj
	3yjRXzWJ03N2/QE1HeWprCCWdZ1Gike2lpuHQ9PY25XGR/br4QUTVxXiX+239689ZZPTS4xo2Nj
	Ovvu09847TkpDr44rzIgGQtoRuv3BzGfq8eJx3CKpoEqFBNHi+xFPK+gTJU50dJrwtLg0nFeYYm
	A42fBR2fviiqtTWExZEBVmAsWFHHy+1fMDuaZtg7BeISJYqik0YiAaW0vcyl5h5ygqmUZR9eGiT
	q2eRgkpX+wBfn5Cbw9/uwP4yyTLL/Ff6R2MTmhelg01DwvC3c/6U/O9Z5GuJZH/Gi6Q==
X-Received: by 2002:a17:906:f587:b0:ac1:e1e1:1f37 with SMTP id a640c23a62f3a-ac20da4dd5cmr312291266b.10.1741179839983;
        Wed, 05 Mar 2025 05:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFShHr2LzuqsAOqeJKefXa4r4HekaqcNv8nbDoeC6x2QQgLvVFTiX5O/hrBMPa48LhX9b89vg==
X-Received: by 2002:a17:906:f587:b0:ac1:e1e1:1f37 with SMTP id a640c23a62f3a-ac20da4dd5cmr312284866b.10.1741179839394;
        Wed, 05 Mar 2025 05:03:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf7b3882dfsm498864766b.143.2025.03.05.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 05:03:58 -0800 (PST)
Message-ID: <2897ce12-bb32-4445-b7ed-0a835e089f03@redhat.com>
Date: Wed, 5 Mar 2025 14:03:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
 <20250303151346.GC32048@pendragon.ideasonboard.com>
 <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
 <20250303161059.GA23684@pendragon.ideasonboard.com>
 <CANiDSCux1whD3yF+mPayajU6imE4t8yjtzeAjrpLPhqyLRc4OA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCux1whD3yF+mPayajU6imE4t8yjtzeAjrpLPhqyLRc4OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Mar-25 5:22 PM, Ricardo Ribalda wrote:
> On Mon, 3 Mar 2025 at 17:11, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Mon, Mar 03, 2025 at 04:43:50PM +0100, Hans de Goede wrote:
>>> On 3-Mar-25 16:13, Laurent Pinchart wrote:
>>>> On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
>>>>> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
>>>>>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
>>>>>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
>>>>>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
>>>>>> V4L2_META_FMT_D4XX copies the whole metadata section.
>>>>>>
>>>>>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
>>>>>> devices, but it is useful for any device where vendors include other
>>>>>> metadata, such as the one described by Microsoft:
>>>>>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
>>>>>>
>>>>>> This patch removes the UVC_INFO_META macro and enables
>>>>>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
>>>>>> to reflect the change.
>>>>>>
>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>
>>>>> Thanks, patch looks good to me:
>>>>>
>>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> I don't quite agree, sorry.
>>>>
>>>> The reason why the current mechanism has been implemented this way is to
>>>> ensure we have documentation for the metadata format of devices that
>>>> expose metadata to userspace.
>>>>
>>>> If you want to expose the MS metadata, you can create a new metadata
>>>> format for that, and enable it on devices that implement it.
>>>
>>> Looking at the long list of quirks this removes just for the D4xx
>>> cameras I do not believe that having quirked based relaying of
>>> which metadata fmt is used to userspace is something which scales
>>> on the long term. Given the large amount of different UVC cameras
>>> I really think we should move the USB VID:PID -> metadata format
>>> mapping out of the kernel.
>>
>> If we can find a solution to ensure the metadata format gets documented,
>> sure.
> 
> MS default metadata is already documented:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> I would not worry too much about vendors abusing the metadata for
> custom magic if that is your concern.
> This would not work with Windows default driver, and that is what most
> camera modules are tested against.
> 
> 
>>
>> When it comes to the MS metadata format, if I recall correctly, Ricardo
>> said there's an XU with a known GUID to detect the metadata format. We
>> therefore wouldn't need quirks.
> 
> There is MXSU control 	
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> But not all the vendors use it.

Right so I actually already checked:

https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5

yesterday before my udev hwdb suggestion I was wondering if there was a way
to just get if MSmetadata was used from the camera itself. What I found was this:

"UVC metadata is opt-in. Every IHV/OEM that needs metadata support must be enabled through a custom INF file."

which lead me to the udev + hwdb suggestion.

It is good to know that some cameras have a a way to fet this from a known XU GUID,
but the official way seems to be to have per camera info in .inf files. So for Linux
that would translate to having a list of vid:pid combinations somewhere.

The question then becomes where do we put the vid:pid list and IMHO hwdb is much
better (easier to maintain / update) then hardcoding this in the kernel.

Regards,

Hans



