Return-Path: <linux-media+bounces-27634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDAA5004E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23A2E7A4543
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313DD248870;
	Wed,  5 Mar 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQqASjSf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6A43166
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180872; cv=none; b=ou2QXsexPng2u1mk3+b2ARK+KeMkPtKiLwlRXOElc8aRURjZgwJH1L13b1VzLdrIb4Ilp3Dbq4RicVbkAh7gRs3ZcUKq0YzYI8N7xZsw3H8r4plKDUOBrSkQ8V7pYtL7Kp3Fya+jLZhK23l43ojBg62mR5DI42SR/4T38CGCPgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180872; c=relaxed/simple;
	bh=ufiuiueTS8H+yFuJXWNVF9N2q1bYbA3mx7SeKXThoEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbzfPiOsKfUF8gfNCTpyyBm0tddtlBhvNzR8Venhp30b3hYKsLv7Fg365syENLgv6YkHpU/ayAiPIiPTD2WKl1Bry+R8ABRCi8hZHg7bnO7MmSiGR6cc55seSjx5IbwjQyA8+/8tb2A0CXuNhvtKBQlEoAizaZaxfsZQ+abN/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQqASjSf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741180869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F26zELxB+XCWgdBuoCOeDJROHFnk5TBOYnV+hLKHl14=;
	b=DQqASjSfoVoSSFPFIIIwSDnlKJQKCBaRFw6/zD+GzmaD26cIItWdh3eUA1Gl5Jmsl40WKZ
	9OXQZAPeU/0H6dh9xI7ZZ6hIooOuu50Fvc46itSFcs7uQdbp/UuZvq8aQY65e6Tdm4dDzR
	iHD6g+qCzsq8NoDpp+dVhvsJcoF+KBA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-VUX3lYRIOuezh1iW9sbG0g-1; Wed, 05 Mar 2025 08:21:08 -0500
X-MC-Unique: VUX3lYRIOuezh1iW9sbG0g-1
X-Mimecast-MFC-AGG-ID: VUX3lYRIOuezh1iW9sbG0g_1741180867
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abf68178603so433433566b.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180867; x=1741785667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F26zELxB+XCWgdBuoCOeDJROHFnk5TBOYnV+hLKHl14=;
        b=Xc9EcAZsIodQqfoeRxac6ZY3Di8WfM4mryWz/J/YTHx5Ei+fRIX3MFD67ML2/BvANB
         khXHwNi8bLkkDL8UKCdoH/NFVBwpz+48gBlGJNtHMjAqADLYJYPmeJNQwG4GfqVM2QjK
         w6UDxB1gez52429kzkKOoi5i2GzKiD1OEF/3zO7ja1+x85sUsvnn40YrZxQbff5iE2PI
         Odag+rD1VGGH7lzU4d5mzafk/+vqQDLkNrmVp1rrHGJK6eXDA74/zSanQRYhQG9KgVlP
         l3PWhcd4KmRT62dQ4HOHqJTTL2rhxsyUYAJGwc8TTHVMitbzPZJReAdTCIkCqEJCjNnB
         x/dg==
X-Forwarded-Encrypted: i=1; AJvYcCUjtCEpmPLHpu9CbN36fBdop1r8yVYUwoQVhtOaPFCxHA1VLhKcEA3fKOr74k0LHKpgU/+cXSgKV49j9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIxjPbfaepkjr4fid4WGfUCvmySsVN247yubKeogB5pkl0ix1
	DUlDYw3gMno5123VDyLXBMS08Y/yFKoUGY3kbNOSU0T2c1IyNQIp8Mva/FmqC5eiCIpeHGBDVPi
	qMiML2qfAMENUu2X+IWNENv6CHgwMy2GNqLnWJM9SdnVZcbqNUeW6kDnmtfro
X-Gm-Gg: ASbGncs7J2+f1Acob97VHtUdqROrXggZd9wqYLZQeX0QsMBOf1FGfZbnOR2XBIkP3Rm
	i3VWb+7nbfDIDc2IWSht28zZwkNUyf9pxRnoOP0vIr0afWeMvfyYSDYJuDj0rAJqvfemZ3vtcnm
	mGMAR/1frityHBHX4kBxQiCrYwrQYHXtMn6hLZmf6OuLcWjONf5oCGNM1vPSHwRBQ22DFpKo6u6
	yoJstN6UtW26/0+FTs+xU7LEFwRVMrvVO6fwn6r2cOhYI3gqP3sIP3ktx+Dt80j80A1DnIg1+1Z
	77mP34ipkjpnNv/OiEmPzw8UCIgDxg5otPZzPZ/VW7XYI9Ws7bBnM6JfriGQQ5ChMVR0T+px6/I
	6jObH5AveaqIwwRZYr7+cXiYSC0+19ZaLyxOlyF6wEFPY9sQJGsHm6qPG0FU56jl3AQ==
X-Received: by 2002:a17:907:3d86:b0:ac2:8a4:b9db with SMTP id a640c23a62f3a-ac20d8bcab2mr271097766b.16.1741180867076;
        Wed, 05 Mar 2025 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrZRbLXyymfVe1LrGtYFfNZ9iSG17eRcczqBpXH6Na4jSmSA1qEoWcNrFO6iKdI6ABorfJIw==
X-Received: by 2002:a17:907:3d86:b0:ac2:8a4:b9db with SMTP id a640c23a62f3a-ac20d8bcab2mr271094966b.16.1741180866686;
        Wed, 05 Mar 2025 05:21:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75c6d4f3sm551922966b.184.2025.03.05.05.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 05:21:06 -0800 (PST)
Message-ID: <67c1a857-7656-421f-994c-751709b6ae01@redhat.com>
Date: Wed, 5 Mar 2025 14:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
 <20250303151346.GC32048@pendragon.ideasonboard.com>
 <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
 <20250303161059.GA23684@pendragon.ideasonboard.com>
 <CANiDSCux1whD3yF+mPayajU6imE4t8yjtzeAjrpLPhqyLRc4OA@mail.gmail.com>
 <2897ce12-bb32-4445-b7ed-0a835e089f03@redhat.com>
 <20250305131145.GC31618@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250305131145.GC31618@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Mar-25 2:11 PM, Laurent Pinchart wrote:
> On Wed, Mar 05, 2025 at 02:03:58PM +0100, Hans de Goede wrote:
>> On 3-Mar-25 5:22 PM, Ricardo Ribalda wrote:
>>> On Mon, 3 Mar 2025 at 17:11, Laurent Pinchart wrote:
>>>> On Mon, Mar 03, 2025 at 04:43:50PM +0100, Hans de Goede wrote:
>>>>> On 3-Mar-25 16:13, Laurent Pinchart wrote:
>>>>>> On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
>>>>>>> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
>>>>>>>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
>>>>>>>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
>>>>>>>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
>>>>>>>> V4L2_META_FMT_D4XX copies the whole metadata section.
>>>>>>>>
>>>>>>>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
>>>>>>>> devices, but it is useful for any device where vendors include other
>>>>>>>> metadata, such as the one described by Microsoft:
>>>>>>>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
>>>>>>>>
>>>>>>>> This patch removes the UVC_INFO_META macro and enables
>>>>>>>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
>>>>>>>> to reflect the change.
>>>>>>>>
>>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>>>
>>>>>>> Thanks, patch looks good to me:
>>>>>>>
>>>>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>
>>>>>> I don't quite agree, sorry.
>>>>>>
>>>>>> The reason why the current mechanism has been implemented this way is to
>>>>>> ensure we have documentation for the metadata format of devices that
>>>>>> expose metadata to userspace.
>>>>>>
>>>>>> If you want to expose the MS metadata, you can create a new metadata
>>>>>> format for that, and enable it on devices that implement it.
>>>>>
>>>>> Looking at the long list of quirks this removes just for the D4xx
>>>>> cameras I do not believe that having quirked based relaying of
>>>>> which metadata fmt is used to userspace is something which scales
>>>>> on the long term. Given the large amount of different UVC cameras
>>>>> I really think we should move the USB VID:PID -> metadata format
>>>>> mapping out of the kernel.
>>>>
>>>> If we can find a solution to ensure the metadata format gets documented,
>>>> sure.
>>>
>>> MS default metadata is already documented:
>>> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
>>>
>>> I would not worry too much about vendors abusing the metadata for
>>> custom magic if that is your concern.
>>> This would not work with Windows default driver, and that is what most
>>> camera modules are tested against.
>>>
>>>> When it comes to the MS metadata format, if I recall correctly, Ricardo
>>>> said there's an XU with a known GUID to detect the metadata format. We
>>>> therefore wouldn't need quirks.
>>>
>>> There is MXSU control 	
>>> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
>>> But not all the vendors use it.
>>
>> Right so I actually already checked:
>>
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
>>
>> yesterday before my udev hwdb suggestion I was wondering if there was a way
>> to just get if MSmetadata was used from the camera itself. What I found was this:
>>
>> "UVC metadata is opt-in. Every IHV/OEM that needs metadata support must be enabled through a custom INF file."
>>
>> which lead me to the udev + hwdb suggestion.
>>
>> It is good to know that some cameras have a a way to fet this from a known XU GUID,
>> but the official way seems to be to have per camera info in .inf files. So for Linux
>> that would translate to having a list of vid:pid combinations somewhere.
>>
>> The question then becomes where do we put the vid:pid list and IMHO hwdb is much
>> better (easier to maintain / update) then hardcoding this in the kernel.
> 
> Additional questions: where do we store documentation for the metadata
> format, 

hwdb config files typically have a comment block with which key:value pairs
that hwdb file will set. We can add known/supported formats + links to
the documentation per format there.

> how do we convey what format is supported to applications

This would be a udev property on the /dev/video# node.

> , and
> how do we enable metadata capture when a device is listed in the DB ?

The idea would be to at the kernel side just add a single new CUSTOM metadata
fmt and when that is set copy the entire length of the received metadata
to userspace like we are already doing for the D4xx format.

Yes this will also possibly send extra metadata in other formats to
userspace, without us having documented the format but I don't really think
this is a showstopper here. It is not like this metadata is going to hide
some highly secret processing info which we need to know on the Linux side,
since all the processing is already done on the camera and we get a ready
to use image out of the camera.

Regards,

Hans



