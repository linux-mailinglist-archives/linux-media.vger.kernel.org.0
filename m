Return-Path: <linux-media+bounces-21541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 880AF9D14DE
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184D51F2302F
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 15:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C76E1A9B3D;
	Mon, 18 Nov 2024 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GE+GK3oW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608719885D
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731945566; cv=none; b=eMynxY8zcyYLYSBEreG206LItKzp3yW7ZhI/lht9qKJNDtORV+dZxLo1x+/adKbWN0Zd8e2oSQOOEWOyPfiwxaLJH5SQVXv1TT6w2zH+SqVyzJe3QirWKwHcij0sItkZfg/CIG0IHOIlnaJ7fPSTommoJMk/U7pUmE/bHarIeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731945566; c=relaxed/simple;
	bh=6kQID9o1vESz9vvdHUzfktt+J8QrvHzIgdusVRvav48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2WNtIMoxKhIifOx4n0uY2xX2AhRi2IjqIJyKaE/qtbZXHUjO+MI4rCbcUMMmIdyTO/4fABteutIznWdtJwROartAtJGLsVEMzAILPkB4ZTxMh6XOzVmbqXMHV0KuVJdhXUfmHylUfDNr3JVfWZVVrkV0xzmLeSW1OwvjLGUU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GE+GK3oW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731945563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsNkPYWyEStnM2GK6FQ11EPE1SL0LCNKdfqZC2SuQjs=;
	b=GE+GK3oWOZy/LEohAtoaSJ/LkrgfNbrRd69hYhvQ0qUuYWcat7WtDvFt+WCjJIrbjwe5Pp
	XEUR/ebfurFLk/f49+c/m2RPTE5KFVBEb5UJ6Wp/bF1rPgLKaqQ/vvfPmkM/Fn2W7vID47
	IMqOhWbBBP3kkC8imUwU2XKlOO7JahM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-gkFihdYJOQCnOYWIbfILDg-1; Mon, 18 Nov 2024 10:59:22 -0500
X-MC-Unique: gkFihdYJOQCnOYWIbfILDg-1
X-Mimecast-MFC-AGG-ID: gkFihdYJOQCnOYWIbfILDg
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5cfca4c0096so859683a12.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 07:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731945561; x=1732550361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsNkPYWyEStnM2GK6FQ11EPE1SL0LCNKdfqZC2SuQjs=;
        b=BKmW9yw8PvzGM8gm6UIr49gwdgZ9dO22jVTo+34vnX9/v5wE0Vxynu54Z60zcEr5qB
         rUBUWdG12ASKFaQPcQfPmSmKPJCmcoZWKjwJLEJCxAqwmHzQORm8wQTPQ9sBPcqm/qrT
         D2zKiRWhJp9bRoVnomRKzvHIXuYLV3DTASDaRuEBl9AaQvD2ufv0DNGhPotlEgwvxnGI
         4s85sUhRLBE7taBWLe4GfB+kR1t6RhHMQ3pIdDKwmHS5qbKhKCKo3+9Z1BanBiYbw05U
         6jV1werOoM9Wy6o/HuJYUIi0Ti0nVVVs+Q9/FBJNY0AXLTelD9Y09ykzKXc6zPLX3mIK
         VQEg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIMmH9GFHmN8XT+o+2pSS46IG8eSvxBtuiGRBXvOuGHvfIwfJ5ZIks9cnYieNtDHtF5Zgf0XlAAQ10A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRq/qFNU/xcuSn9EsGbrJAxFiwY/hEJiWYnKxbIlUsvpPfzzBc
	f62v2t6ZolnZEZWv634zuGhHaxsG99y2/gNIDIrTnEA54t7/ppqKLj2DP06254OwocsQ3V4/mk0
	CWdM/ZZERejM24RJHLGuzeGXytWZ9d/CvbbmPmXLlUMhNWiDZk19WgWmntJtg
X-Received: by 2002:a05:6402:2693:b0:5cf:68f4:e2db with SMTP id 4fb4d7f45d1cf-5cf8fc17c47mr9328011a12.9.1731945560812;
        Mon, 18 Nov 2024 07:59:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5IrmJz54uPT2cGG8O85VTjdZfry6BrJMzPosb9zG+DiITHBZefCJ/I5YSUhFD8N92tRibdA==
X-Received: by 2002:a05:6402:2693:b0:5cf:68f4:e2db with SMTP id 4fb4d7f45d1cf-5cf8fc17c47mr9328001a12.9.1731945560450;
        Mon, 18 Nov 2024 07:59:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfc2677c5csm1422970a12.72.2024.11.18.07.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 07:59:20 -0800 (PST)
Message-ID: <8151585c-cb4c-424d-a81c-939ee30d8e9d@redhat.com>
Date: Mon, 18 Nov 2024 16:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>, Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
 <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 14-Nov-24 9:03 PM, Ricardo Ribalda wrote:
> Hi Gergo
> 
> Sorry, I forgot to reply to your comment in v14.
> 
> On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
>>
>> Hi Ricardo,
>>
>> On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
>>>
>>> +     },
>>> +     {
>>> +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
>>> +             .entity         = UVC_GUID_UVC_CAMERA,
>>> +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
>>> +             .size           = 16,
>>> +             .offset         = 64,
>>> +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
>>> +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
>>> +             .name           = "Region Of Interest Auto Controls",
>>> +     },
>>>  };
>>>
>>
>> Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
> 
> If I create 8 Booleans, they will always be shown in the device. And
> the user will not have a way to know which values are available and
> which are not.
> 
> We will also fail the v4l2-compliance test, because there will be up
> to 7 boolean controls that will not be able to be set to 1, eventhough
> they are writable.

So why can't these other controls be set to 1? Because only one
of the options in the bitmask can be selected at a time ?

If only 1 bit in the UVC_CTRL_DATA_TYPE_BITMASK for this can be one
at the time, then this should be mapped to a V4L2_CTRL_TYPE_MENU
just like how that is done for V4L2_CID_EXPOSURE_AUTO already.

Actually looking at existing comments about UVC_CTRL_DATA_TYPE_BITMASK
in the driver there is this comment on top of uvc_mapping_get_menu_value()

 * For controls of type UVC_CTRL_DATA_TYPE_BITMASK, the UVC control value is
 * expressed as a bitmask and is thus guaranteed to have a single bit set.

Assuming this "guaranteed to have a single bit set" comment is valid for
the V4L2_CID_UVC_REGION_OF_INTEREST_AUTO part of UVC_CT_REGION_OF_INTEREST_CONTROL
too then I think we should simply map this to a menu similar to how
this is done for V4L2_CID_EXPOSURE_AUTO.

Note V4L2_CID_EXPOSURE_AUTO is the only existing user of UVC_CTRL_DATA_TYPE_BITMASK
at the moment.

Mapping this to a menu should nicely address Gergo's concerns here.

Regards,

Hans


