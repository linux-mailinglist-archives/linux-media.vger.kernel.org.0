Return-Path: <linux-media+bounces-22021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C19D899E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37A5284B2E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC7944E;
	Mon, 25 Nov 2024 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lu1RNqn+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695E28689
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732549575; cv=none; b=KK1NH3kppME2QdlP2R78UoHsK47RL5uj+XQpqEfQIizk3xobAsnOVZT/xobWdlX4WGQRRQ3MPjyYOKXnGi0R3YciXoLdPK1N+6kacj7pYUmAzl9ury8neCLw45HJJX0l+fb3GVV2fg3o0IwdVcdSAV/piSaFI18H60/XZhHUcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732549575; c=relaxed/simple;
	bh=SupYXAlr0qFHFZ6JEA/DkVyN/nqKdB3rTEuf9oDUvHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/KQMSMkIuU/CpqCQ1VxcfRenaekq5e5UGhLhvwZJzUrFSLVyDCNZ2mg9OVJh8ZjVJg0Eyl0KFijpTiebeVgxMkiGFWF0u/n53EThSLiddDPR+Ywxeg+AOjZl1AYvpKl4oB7M4m50PjCYwNmyNVp6VmAnTsPFSt64yYHO6KDN2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lu1RNqn+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732549572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Moi/9kY3hsu3blYNKyKbP8MNPzPK4z7Gj96yIc153Ok=;
	b=Lu1RNqn+fKfSCwKgbNBw7mzgbouiYE3dywAJYuEE4bmYrTGa6NhiMeEhMCddvdcyaE6Xwe
	b34afTRWHmNaYUCMWMxWu0JZtpiFFQHElaQqeD0ZTQdzN5fM+rwX8awUlhtbqpkasvKAAJ
	w5k/CW8feHvFRwaek+PWhCdb76J4lLo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-SpOdFBnwPEy6w92XU0Q9UQ-1; Mon, 25 Nov 2024 10:46:09 -0500
X-MC-Unique: SpOdFBnwPEy6w92XU0Q9UQ-1
X-Mimecast-MFC-AGG-ID: SpOdFBnwPEy6w92XU0Q9UQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa50cf10593so245076966b.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 07:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732549568; x=1733154368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Moi/9kY3hsu3blYNKyKbP8MNPzPK4z7Gj96yIc153Ok=;
        b=I5dp7SPhV8NR5AHGRrZTWPjwLzjS3yN9UY1wvAn5vA3skBfxybYLBhfXYg49Q6o3aH
         2kULohVR+FS7aoRbViZ2WFK1TVk4SB3N5Xo+N9BIefUGYbsqVbsWqlDrYJ99lzRLklAj
         NUWRy4fDUVfaq/dmerucPg2kgpESoNrfoxahTtlTANkcWpRq4TUtUkyMtJgMnuRDzsxz
         73A1T8boOq1DFj/BwGZI/GjaI1Ab8Szl2+TLvNNL4J9LYQvjoQFGYv7yTb9I4XUBULkc
         iFnR+JQ/NtEVxFQmkUVn9d6ugvAepDP60UlxtgABCJjwpYQF8X2xaTd9QJj1ejpK1ade
         3kNA==
X-Forwarded-Encrypted: i=1; AJvYcCXb4DtK3rsYBWp4oiJYVqiCZKxN/SLBdrKIRmDUdFoEhsJFxvHApFmQUdIhRt96WBifvVKxnv1E0ZdR1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YykgIrmEKzjkjrCFu2OpY0MBWZgSdl/eTmwvo8OUCw6xyABHKOm
	ZmgOCtTAVSFdRppkEOa/0LrO4AHDf/BKlwDhI2aDglf3PJdVIwrHmmyh9WVWOwbJ7pODkqwr3q+
	071k/KtMhiNLzLx5q6PxDuY9vLSqPlAA/45TtqoVMLbR/ft1e67gHdSGTgXEr
X-Gm-Gg: ASbGncvOaYuG96yHv6J0V2WET0RF+SYV7oL1MrK34dYCoabxh/K/0rruWA9597yDPNh
	Rv2LBHsr6TGo5NEP07BWeZFAIV6YDv3cocvaOUTn3rEKKVvRdVjW726S59wWF/pWwzs49v9vUQa
	dNPfM7hYauJuoQMGnlBg2jNze37enaETcb/wz7tZRUft3KGlbVa+itbTpZQMrRCE1+hbSPjUyU3
	5dS7RNT0eFPMylt7iK5y7Mdxkg60/8mKhl8TGKGI+f5YDh+u+f2SNjGdaBF1X+0O9H7T3pq0LL2
	GlXVZcUl7umrYriaMNgz1rsXqbqcxyML6eHpx5tbY7UjWFt83utDvWjrZZQ4PJLHvjIOTt2jhMe
	E4+CoN8aMYPh19H3R21p4Rn6X
X-Received: by 2002:a17:907:7759:b0:aa5:2ec5:369b with SMTP id a640c23a62f3a-aa52ec539cbmr773533866b.17.1732549567724;
        Mon, 25 Nov 2024 07:46:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERT7m6ex0sbMI2VYQrQaT68enathgE89C30stb6bdS0FUb0hAeSaQCJfW4oG02NtpvRI7uzQ==
X-Received: by 2002:a17:907:7759:b0:aa5:2ec5:369b with SMTP id a640c23a62f3a-aa52ec539cbmr773531766b.17.1732549567322;
        Mon, 25 Nov 2024 07:46:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa534ca196esm332102866b.193.2024.11.25.07.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:46:06 -0800 (PST)
Message-ID: <0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com>
Date: Mon, 25 Nov 2024 16:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: uvcvideo: Factor out gpio functions to its
 own file
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <20241112-uvc-subdev-v3-2-0ea573d41a18@chromium.org>
 <7da09249-f2ff-4a0c-8a06-1594b02ce87a@redhat.com>
 <CANiDSCsQ3Rp55+9WbporH37W_-XHaXCR0iww6n6kHXngKh67TQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCsQ3Rp55+9WbporH37W_-XHaXCR0iww6n6kHXngKh67TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Nov-24 4:10 PM, Ricardo Ribalda wrote:
> On Mon, 25 Nov 2024 at 15:45, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ricardo,
>>
>> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
>>> This is just a refactor patch, no new functionality is added.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> I guess this patch may need to change depending on if we want
>> to keep the GPIO handling as a UVC entity or not.
> 
> I have a v4 that removes the virtual uvc entity. Still with that
> approach IMHO this patch makes sense.

Right I was not suggesting dropping it, but atm it is moving
the uvc entity creation around. I was wondering if that
moving around before removing it still makes sense ?

Note I have no preference either way if first moving it
and then dropping it is cleaner, or just easier because
of the history of this patch-set then IMHO either way
is fine.

> I was planning to send it today, I am testing it right now.
> 
>>
>> Laurent what is your take on this, should this stay as
>> a struct uvc_entity; or should the gpio_desc and input_device
>> be stored directly inside struct uvc_device as is done for
>> the snapshot-button input_device?
>>
>>
>> Also de we want a separate input_device for this or do
>> we re-use the snapshot button one ?
>>
>> Since my plan is to open-up the permission on the device with
>> the SW_CAMERA_LENS_COVER to be equal to the /dev/video#
>> permissions sharing has the downside of allowing keylogging
>> of the snapshot button.
> 
> A downside of having 2 devices is that userspace will have to either
> figure out what evdev they want to use or listen to both....

Right, so both would be picked up by the compositor and the
snapshot button is just another multimedia-key then, while
the compositor can use SW_CAMERA_LENS_COVER for its OSD.

The other would be of interest to libcamera.

I'm think we may need a naming convention for the evdev
with SW_CAMERA_LENS_COVER something like "* camera privacy"
or whatever then we can have a udev rule matching on that for
uaccess + libcamera can do a strstr on the name for
"camera privacy" and ignore other evdevs.

Regards,

Hans



