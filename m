Return-Path: <linux-media+bounces-21985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E49D8612
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BB4DB2CA9D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7741D19F475;
	Mon, 25 Nov 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K99XEfgh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBD19CC37
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537916; cv=none; b=HbSBPbtUaZu8c1uQR953IQcF8TZXPBvZPLGkpqRbWf3bdvS/N0UYgAhTJetJ8r0cETsWMnGPQfn5UcIHAdTh2YMeJ85JXdV84Zm2bcerSVbSaBY1ijw6AHoVFIkRj0wktX3RcN0xdQNvygd7MheyJS58tkfve+wlNS7wtG2vElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537916; c=relaxed/simple;
	bh=MlGWKYH7laub5cwr4a1POZ/i0TJA7EJBnNcK4lHuA8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOr/qOAB3gzHp5bmJyOOGogQNBhtFhqJmKVLNx72Fw4O5iJ0t/9dysCjsi4uDpy8PMadMp9tNida2g1bjtfPCW+6fVks0Ee75T2bv9UcRWFHKWjq646dQjgT8QKUHOLq07eXyfNz0g1yRjrppgKdw1YNOT524i0QJZM9uHJJLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K99XEfgh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732537914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlGWKYH7laub5cwr4a1POZ/i0TJA7EJBnNcK4lHuA8A=;
	b=K99XEfghatWZRqbvF8O8MfF3pvsHj9hxkLHv2JjShfVapIHTOcw/Jbs6IdbYRwcKrpZX8a
	7at0TdLh5iQpjSYgEPMhGrDMr/w1y4GLNyBIaiYuO2oO+lnm9p7lVhZN8JYuE9jZAwyp7o
	JVEmfwmzMW4I8SY8ulCZEBtHrDAE8qA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-OkS9ebuJNgO9bQv--z0h2A-1; Mon, 25 Nov 2024 07:31:52 -0500
X-MC-Unique: OkS9ebuJNgO9bQv--z0h2A-1
X-Mimecast-MFC-AGG-ID: OkS9ebuJNgO9bQv--z0h2A
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa53116660fso169589866b.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 04:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537911; x=1733142711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlGWKYH7laub5cwr4a1POZ/i0TJA7EJBnNcK4lHuA8A=;
        b=PLvK8EhkDvAXcm66hQ432cBj+e0IAJjzaSpYh7gy2s4xguPKrto2h/8Fqctl3w6YCS
         6jmCw618zStq9XVjQ0d/ABmB9lrLgHAZ2F32EJPV/xpWw5i/J2VfPwDTvvcWEcRCaTiy
         x3Bgn290DAyZ25aR2z1YrVTOcwjU9yEHK7zWTQdBCJKpzmW4f2oU5WS9wD77sM/sxivl
         dnAbvVpbfC4HFWezgJcQ5j4iH9hhMIT4jcLZRii2S0PmTm7/XjCIWF6yeVARvS/Kgu+Q
         Tl8zdh9PPgeBJqorx5s5k03/O7IRkNP3Cj3TQrfsd7vrJaUPq/rj1CQqPmDzZoGtqicP
         47Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWwPDHsIYqi7T/rYc9G0L/JWH+ZRDjR2d8wMM7aaZuyy5xNP/EX7C0qMyhO8RkWau9tx8ZpazjS9teohw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPz6tCl7QKb7rGVsrpRRtFp410cZ8GUrUqODKqCgSAy0F8DOxm
	kbiyvGc8jjIT4GFrzIJHnF/eeJS9VaLPcz5W03yAGyutE0WrNe37/NgC3ACTQ6OEuaJ/ItC5ZHF
	Myjfp0T53LOuZckA8VBxUH+LmBPT29DC4j/TAlCrNxw/BMqMStf+rMM8SpqNY
X-Gm-Gg: ASbGnct4oSI4UssC64MEr+eyK3gqo3y4+vnKEwt6KFBGWIRQty/Uilei5V5DJBdh8dR
	z/oL1H4kxdUk6UzZwhsyIbQl/ASKp9K8yck4CJsL36sqPxDQ9AEYqtakUO1m7VAjwKVqAsEM72t
	VCVgtG705qnVfW/qDDkTdI8V8zDK10/Y9iiY+0rFtv/pgIfkStNKmTGy7XnJK18KC1tWKKDj64u
	wozzDjY7kPHZK87VqVUbveL3DpuYF4jYtYmh6oZQkgOVsxGhYCM1PdXmxfAIx/J4b+Txqg+mOBh
	xh/1Op0uiggE4B6O7LUkQIgZsFXQDGF52GHwt2uOe+Q5U5yjDbJOB6Px1usKJDHeaN815q3iqnR
	1T4jFh8jt3hc125L+Qfb/TUQW
X-Received: by 2002:a17:906:2181:b0:aa5:4434:2b27 with SMTP id a640c23a62f3a-aa544344282mr438526266b.40.1732537911681;
        Mon, 25 Nov 2024 04:31:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFgxo1eKpgUwSsnZNHO8CxH1zA9cD+M1XPuRg1H1qniBSzQEE/fXCmI8/VjhUzJWJ1udNrAA==
X-Received: by 2002:a17:906:2181:b0:aa5:4434:2b27 with SMTP id a640c23a62f3a-aa544344282mr438523866b.40.1732537911331;
        Mon, 25 Nov 2024 04:31:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa53683eafbsm302481366b.189.2024.11.25.04.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:31:50 -0800 (PST)
Message-ID: <f2638853-6c0a-49ee-9a80-28fb774cc678@redhat.com>
Date: Mon, 25 Nov 2024 13:31:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com>
 <CANiDSCuRbOEhWi8WtJpJSm5SOjzTRzpk=OTOV_jwbhUQMoXszw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCuRbOEhWi8WtJpJSm5SOjzTRzpk=OTOV_jwbhUQMoXszw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 10-Nov-24 5:04 PM, Ricardo Ribalda wrote:
> On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:

<snip>

>>> Can we start powering up the device during try/set fmt and then
>>> implement the format caching as an improvement?
>>
>> This sounds worth trying. We'll need to test it on a wide range of
>> devices though, both internal and external.

Ack, as mentioned in the other mail which I just send I think
this is worth trying.

> We still need a plan for asynchronous controls.

As I mentioned in that other email I think we can do the same there.

So basically delay powering up the camera from /dev/video# open till
the first moment we actually need to communicate to the camera and
track per file-handle if we did a usb_autopm_get_interface() for
that file-handle and if yes, then do the put-interface on file-handle
close.

> And we have to decide if we stop supporting the uvc button (maybe we
> can start by moving USB_VIDEO_CLASS_INPUT_EVDEV to staging and see
> what happens?)

As I mentioned in other threads I do not think that the button
only working changing from:

"only works when /dev/video# is open"

to:

"only works when streaming from /dev/video#"

(or actually only works when some action on the camera which
requires it to be powered-on has been done).

is a big deal, since most apps which open /dev/video# for
a longer time will almost always do so to actually do something
with the camera, at which point the button will work just as
before.

And for apps which only do a short-lived open of /dev/video#
the button does not work with the current code either.

TL;DR: IMHO it is fine if the button only works when streaming.

Regards,

Hans





