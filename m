Return-Path: <linux-media+bounces-21994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37C9D8680
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4CB28406C
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695001AB6FA;
	Mon, 25 Nov 2024 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISDkCGFD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D48191F9E
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541742; cv=none; b=RCP0+XvpJnw8bapXF37qEF5JAxbQ8A1h2LtuL90K3hpNppK8RvuP+bXdaf0qyLwcnETHnWsajItjIQNaQEoOnbrQ/FV34+g0DOhH3TrLQVL0/YhjGuXsMdiCfBoO4Vzp8Yvm9/Ui+mX+jQ1RPuPcmM53j+Rmt3XBGFAWU3rCht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541742; c=relaxed/simple;
	bh=cad3l12T+TvWHuFm1K0Ch40itouM5UEZZNP2k0qG2yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U11snFc0unGtJ9kifw+UScV31nxd2X57e+vHOssQL1T//GQ0xwl6d/+ckPLO3xIA3qVB+jSk3+3Lsw/YvKZld3Mr6EdmXytAufe0FHP2l/PoI7bkEbJS1/kIQDXAAnt+ERa+y0fgtPp7T0xpz9qSVvbFDw9jpsE9yiQJ+8OT5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISDkCGFD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732541740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDTmwp90jKm3TNX5lId2PjTwHKOcHTKosh1yC449G1s=;
	b=ISDkCGFDSDckq4aWdEBDRoq7rXiJQmitlmRKIAfmswrbL9wDvTiNY0UZw7+/JmD4pnt0i3
	hJsdHsXZosS2XSU53eUoBnEbfvUNszq/EtNBXglmOTissMo3JZqOrVXU0s6+fn39AlmpoX
	iNcXBj4CPEDy900DOpSAoaSFw+571Lw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-HAwO0OQVM-iBFZ5dZMGrpQ-1; Mon, 25 Nov 2024 08:35:38 -0500
X-MC-Unique: HAwO0OQVM-iBFZ5dZMGrpQ-1
X-Mimecast-MFC-AGG-ID: HAwO0OQVM-iBFZ5dZMGrpQ
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa5295aa5b1so202657966b.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541737; x=1733146537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDTmwp90jKm3TNX5lId2PjTwHKOcHTKosh1yC449G1s=;
        b=YQfXhyhJLzZdWL5377fivDgOizlmCMuZG882zOz7e8gVC3qO0y8o9lv0DvfL74PUbA
         q1Xs3cug+76wMeMbDcwU+J2JKR0CWlnqI/lw2AlCfFJ21ZWgwdKYiKoWHnLH5Ht2DMCj
         WA9RhJiJJqai/sKtYeIsgZ5Nfm0WlBBsU4o5I7E51y7rptlo0puLIu8+k/7Ut9QEavp7
         Mlhw/znTv3QNjVk114ONQU3S0el0J2ZsNAlCCcKVu+hp4FGoqXkHLn7Nc/psKmVhGpM4
         KwHCaWPk/g6jh7Dj3qD76hSpxex6ryOkRHR774z+rypaak3DhjBdaQjLejanHcsCMxV+
         EMqw==
X-Forwarded-Encrypted: i=1; AJvYcCW4B//DDFCKGwYmPFLKT3+VxHbYf6Nk+vuX2NnmdmJj8scxV+b/cyoMdT8Np5BRGwjQb4jODGcJoOz0Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjzQrDC1wj2ZMhHXuqA5IG81Z2YNP4PqldYbieZw9vyxyuUx5b
	u+nOy5jj7FrZ6ED8vh3LDwK9L+IdoStwRoMFdDreyp01oRWtLEaGpnkZoM5kr74b4yviiCCgIbK
	al6bOi2hciydzWaJV5rTox+9TIcDOEXuy6zsnt7eJKpUKXpW/vbnx2zZczyOb
X-Gm-Gg: ASbGncvbllDISysYGHdl69aWjFEgUdKoRqcq/ntseEEDf2K3HZGnJDkE+Td3ptdLAWs
	j6Fqbbw6wlcI8S2GSUzd8BrHd4MI9kkTcclRLQdDyLLHP0HDoFF42KTsbYaiKTScBPTpbQ6c2LO
	VcvEhts6bAsu7LqJ2ilyvYSF6X6Q0KkUpuUEpp7dptNtrdq/BY05XS4dyFjvq2o2sz7b3B6v4tE
	2ckzIixMqejzEgxj4bp8IZwTV38lK0xPURIOlwISsKA/sm/dvIW2oEmSDmMEXuFLKEs4JryCirV
	94C9wN3rMcvZhxwyssKUy7vYHgYVFkgiiUOZQkbCqh9xrmHh+BcdAOMazOhQCMmePKUoGXynLH2
	KrXy234if41RcPDfzB/Zd8hMf
X-Received: by 2002:a17:906:31d4:b0:aa5:2a5d:a9ae with SMTP id a640c23a62f3a-aa52a5daa30mr1025809766b.18.1732541737634;
        Mon, 25 Nov 2024 05:35:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPeAcU3srRHAPRLHz6gKNDrae655Mw8opObwcyeH9RznXxR3H6hMx38IGvg80xkP3qKQ6N8w==
X-Received: by 2002:a17:906:31d4:b0:aa5:2a5d:a9ae with SMTP id a640c23a62f3a-aa52a5daa30mr1025807266b.18.1732541737310;
        Mon, 25 Nov 2024 05:35:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57bd96sm467413366b.148.2024.11.25.05.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:35:36 -0800 (PST)
Message-ID: <ef51192b-4791-4e40-a27a-75318cada779@redhat.com>
Date: Mon, 25 Nov 2024 14:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com>
 <CANiDSCuRbOEhWi8WtJpJSm5SOjzTRzpk=OTOV_jwbhUQMoXszw@mail.gmail.com>
 <f2638853-6c0a-49ee-9a80-28fb774cc678@redhat.com>
 <20241125125629.GB32280@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241125125629.GB32280@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Nov-24 1:56 PM, Laurent Pinchart wrote:
> On Mon, Nov 25, 2024 at 01:31:49PM +0100, Hans de Goede wrote:
>> Hi Ricardo,
>>
>> On 10-Nov-24 5:04 PM, Ricardo Ribalda wrote:
>>> On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart wrote:
>>
>> <snip>
>>
>>>>> Can we start powering up the device during try/set fmt and then
>>>>> implement the format caching as an improvement?
>>>>
>>>> This sounds worth trying. We'll need to test it on a wide range of
>>>> devices though, both internal and external.
>>
>> Ack, as mentioned in the other mail which I just send I think
>> this is worth trying.
>>
>>> We still need a plan for asynchronous controls.
>>
>> As I mentioned in that other email I think we can do the same there.
>>
>> So basically delay powering up the camera from /dev/video# open till
>> the first moment we actually need to communicate to the camera and
>> track per file-handle if we did a usb_autopm_get_interface() for
>> that file-handle and if yes, then do the put-interface on file-handle
>> close.
>>
>>> And we have to decide if we stop supporting the uvc button (maybe we
>>> can start by moving USB_VIDEO_CLASS_INPUT_EVDEV to staging and see
>>> what happens?)
>>
>> As I mentioned in other threads I do not think that the button
>> only working changing from:
>>
>> "only works when /dev/video# is open"
>>
>> to:
>>
>> "only works when streaming from /dev/video#"
>>
>> (or actually only works when some action on the camera which
>> requires it to be powered-on has been done).
>>
>> is a big deal, since most apps which open /dev/video# for
>> a longer time will almost always do so to actually do something
>> with the camera, at which point the button will work just as
>> before.
>>
>> And for apps which only do a short-lived open of /dev/video#
>> the button does not work with the current code either.
>>
>> TL;DR: IMHO it is fine if the button only works when streaming.
> 
> I'm fine with that, we can reconsider if people complain. It would be
> painful though, as it could mean reverting everything we'll build
> related to power management from now on until someone notices the new
> behaviour, which could easily take a year. The risk is low, but the
> consequences serious.

I think that if some users complain we can just add a default off module
option to restore the old behavior for use-cases which somehow depend
on that.

Doing an extra usb_autopm_get_interface() + usb_autopm_put_interface()
at open/close() time if the option is set is easy, and that will just
render out other get() and put() calls into no-ops.

So we always have that route as an escape-hatch.

Regards,

Hans



