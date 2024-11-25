Return-Path: <linux-media+bounces-22004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F319D89C3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55F2FB2E645
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD5B1B0F15;
	Mon, 25 Nov 2024 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ax0RyJkY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C74185B54
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544839; cv=none; b=mHfn4Savquhz5vsVBdYo/esrnam4J2xG1P1lL6dKvOCZBd+2WI5z/T/02hFQj4GrEMJbyqyt28AcK+UTuMprCYNlYHb/OBvDfZKtOnQR4ID9v6jgzu6EOsrB9Lnk2ALqn/R+6RKGBYjo578zUU+KEnoIBXGFc37u+g3Z13wmy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544839; c=relaxed/simple;
	bh=oUNLLrOvUk7GUO7hw7mVEQKb+9YIVdJVf6Mqqd6I3+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcjUkEdYdBj7Zv4JW8qQFb9U0dKFQGaiE7hMY65Rx+KTN3gXb8PCLCrFj9+H96+N81MA2mkHrXPf763QH1+sevEQKB2xGjWZl2lcM2HjeS+MXflqZXZak5pvaEsytzV9FfQr+BmxJFfqAj4t6X4ooJaJkEuXqRWHmScQZtNlDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ax0RyJkY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732544835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGZrysg7fuqI5aGdLbFC1c9JvQtx3dqIg1g5HRmDQ5Y=;
	b=ax0RyJkYDhKR4tiBfEEJ9IBqOJa/syAPWuUnvAWt3ObPlichMnuqbwKSXTob8UrATA72p+
	b/25bwvhshnDIDD23OMivool88K42JDVcrn5g/SLaKImWm2HBREX4Hnlx4CX1IACVrm1fv
	xccoUbdmK6duUtRI7q3SIpO1r+L8xPM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-SXv7dHdcMoa5mxA3lEgNnQ-1; Mon, 25 Nov 2024 09:27:13 -0500
X-MC-Unique: SXv7dHdcMoa5mxA3lEgNnQ-1
X-Mimecast-MFC-AGG-ID: SXv7dHdcMoa5mxA3lEgNnQ
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-53de4ded14bso657261e87.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544832; x=1733149632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGZrysg7fuqI5aGdLbFC1c9JvQtx3dqIg1g5HRmDQ5Y=;
        b=tEXgpW9FMchr3YpcOVhdKLvHvrAgtF9Arf9s7kkwAe5oUNwe+nEuZNMJ9dfYmy0qHP
         H65iBywjyFdJbXOw100AtkDKO5Evj+jJtfASXs+pLJ2PG1nIT94FnJaUVgIOneKENALS
         1ZnvGBoarb7I3A9uSOsQlgTh9YrB2OaSjwf0OeK3OkbS0TAA7+jjOxSxsHAPXrhBlLpA
         jpKD5JePnkzHn2KDUScEIAcaaoGYOvavuQN6Krfvlv8LfyiMHBxmcH8elsYH2AGRCG6b
         oJazeDtNFiVBM7RsjHZxBbnxsO9bWocNk8AF3eq8SjX++FvNvwP41P13ZFZMP5jLaEuw
         1xJA==
X-Forwarded-Encrypted: i=1; AJvYcCVJPUnXmgrJNtpDbm9plUbS9Qg0uwi+/1APb41OQPqZUFFOOvVpWRbnh1CrsMTc/UIuU0wa40a6CP84uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylP0XdH83QTWGCfwqPUhHOWFrxFc7GNC8j9L/k7BqJtZLshfsU
	aVRV1pY1i4+nhmviJLW4rJljzZbvk4e7Fh9KVFxDG0k9d3aWh0jwt7KXQi/NZeEO/H9l0Bl+wBt
	ncHNMA6mfk+QNZEVjFU8frqiTtP6AzA6wzpHv8F7kkaNvDE95CmCZCduVtMiY
X-Gm-Gg: ASbGncvZFqTxAR5PbFw7guEjR69cX6BnvnHrG5KXBeJyCFscSYeMqkPKthSF47g3uh2
	KSdlBfJQhmuJw6rZLL36WOuh4fmS4XQiLP1aL7KUi+jHMzASq3xnRfLzTXVyS9YQbIWhi9LIi8R
	E2P8yGp5yrDAur0/QT7Or3lZYuYJwLy0ytBIZKjb6O2pq8Q5zVSkWTEloT0yiDB2pgJuONCugDa
	vNhOoGijj6QR7lZmtxYSUTYODYEZixQYVCedxTzHt1nwjIaSuiSMbfpZDQflVTwJ0DkzVQWBwFn
	2+St7snb2qwGZfs5P6AOdbV6JrTL+BxobpwZiOP+FAW11DeLCAu9ZhfYPMUN9wH/Us+IOG9PWSQ
	mcuuKoj0SBRTS0y8XSvont+1/
X-Received: by 2002:a05:6512:308f:b0:53d:de1b:b058 with SMTP id 2adb3069b0e04-53dde1bb06bmr4299286e87.10.1732544832338;
        Mon, 25 Nov 2024 06:27:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdJrzqgj81yRPSVDMDgEm5P/jF/L84WGLyRxQgMhlWl3irQpeqvr6CxneJKwVZwiDgKLpkow==
X-Received: by 2002:a05:6512:308f:b0:53d:de1b:b058 with SMTP id 2adb3069b0e04-53dde1bb06bmr4299255e87.10.1732544831933;
        Mon, 25 Nov 2024 06:27:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57d4d5sm468800566b.163.2024.11.25.06.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:27:11 -0800 (PST)
Message-ID: <b545b163-0ead-42d6-8f4a-c12ef7d589ce@redhat.com>
Date: Mon, 25 Nov 2024 15:27:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Gergo Koteles <soyer@irl.hu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
 <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
 <8151585c-cb4c-424d-a81c-939ee30d8e9d@redhat.com>
 <CAPybu_14EcOZw6C65ZWVGoa5bcZe1XCZbMghNzUG+wFF7affdg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPybu_14EcOZw6C65ZWVGoa5bcZe1XCZbMghNzUG+wFF7affdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On 18-Nov-24 5:16 PM, Ricardo Ribalda Delgado wrote:
> Hi
> 
> On Mon, Nov 18, 2024 at 4:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ricardo,
>>
>> On 14-Nov-24 9:03 PM, Ricardo Ribalda wrote:
>>> Hi Gergo
>>>
>>> Sorry, I forgot to reply to your comment in v14.
>>>
>>> On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
>>>>
>>>> Hi Ricardo,
>>>>
>>>> On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
>>>>>
>>>>> +     },
>>>>> +     {
>>>>> +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
>>>>> +             .entity         = UVC_GUID_UVC_CAMERA,
>>>>> +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
>>>>> +             .size           = 16,
>>>>> +             .offset         = 64,
>>>>> +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
>>>>> +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
>>>>> +             .name           = "Region Of Interest Auto Controls",
>>>>> +     },
>>>>>  };
>>>>>
>>>>
>>>> Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
>>>
>>> If I create 8 Booleans, they will always be shown in the device. And
>>> the user will not have a way to know which values are available and
>>> which are not.
>>>
>>> We will also fail the v4l2-compliance test, because there will be up
>>> to 7 boolean controls that will not be able to be set to 1, eventhough
>>> they are writable.
>>
>> So why can't these other controls be set to 1? Because only one
>> of the options in the bitmask can be selected at a time ?
>>
>> If only 1 bit in the UVC_CTRL_DATA_TYPE_BITMASK for this can be one
>> at the time, then this should be mapped to a V4L2_CTRL_TYPE_MENU
>> just like how that is done for V4L2_CID_EXPOSURE_AUTO already.
>>
>> Actually looking at existing comments about UVC_CTRL_DATA_TYPE_BITMASK
>> in the driver there is this comment on top of uvc_mapping_get_menu_value()
>>
>>  * For controls of type UVC_CTRL_DATA_TYPE_BITMASK, the UVC control value is
>>  * expressed as a bitmask and is thus guaranteed to have a single bit set.
>>
>> Assuming this "guaranteed to have a single bit set" comment is valid for
>> the V4L2_CID_UVC_REGION_OF_INTEREST_AUTO part of UVC_CT_REGION_OF_INTEREST_CONTROL
>> too then I think we should simply map this to a menu similar to how
>> this is done for V4L2_CID_EXPOSURE_AUTO.
>>
>> Note V4L2_CID_EXPOSURE_AUTO is the only existing user of UVC_CTRL_DATA_TYPE_BITMASK
>> at the moment.
>>
>> Mapping this to a menu should nicely address Gergo's concerns here.
> 
> The UVC standard is not very clear re bmAutoControls. It says:
> """
> The bmAutoControls bitmask determines which, if any, on board features
> should track to the region of interest. To detect if a device supports
> a particular Auto Control, use GET_MAX which returns a mask indicating
> all supported Auto Controls.
> GET_CUR returns the current Region of Interest (RoI) being employed by
> the device. This RoI should be the same as specified in most recent
> SET_CUR except in the case where the ‘Auto Detect and Track’ and/or
> ‘Image Stabilization’ bit have been set.
> """
> 
> Which makes me believe that you can set another Auto value + one of
> these ones. So I do not think that we can assume "guaranteed to have a
> single bit set".

I see I already was afraid it would be something like this but
it would have been nice if we could have turned this into a menu control.

> The behaviour will vary module to module. So I'd rather take a
> conservative approach here and let the hardware clamp the value and
> not us.

Agreed.

Regards,

Hans


