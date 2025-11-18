Return-Path: <linux-media+bounces-47299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD1C69F9A
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DF1A349B4E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 14:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB0E35A95C;
	Tue, 18 Nov 2025 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf7ERMtL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36798355050;
	Tue, 18 Nov 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475972; cv=none; b=CAoqG7fKrrnv3sUfvh76eXnZcNiyt5WGREP7VEQxMEy0W02ShWTwkACDYpApBQ/2kVquLyNDRHOt7H7BMtfkivlY8W+2Alt4soEvYybR2aX7DYXq2BtD5QezJj0X4lu0cTKpjzm29JNCnco4L8ZoWYYuimi9xQdBGxrFjA69+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475972; c=relaxed/simple;
	bh=ejoEfVQPWBYZ0PyLtQkJpAvcNWz5Xe4/WqTYaNUnAbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0UpobZYKyJbqhQi6BPeStwIuBqoIi3mvf7IkWm37JWcEvb34Bu2kqFqsdJNPOnLRP0zEZh8JgHGWH7yYgk7JA5sa4CsU0FfaPEgxsrRm+pIIHANSym6/S2ardfToU1WW0W2qpZ+GnWXNKRO8qI5W+YW0U5KfDXosH0CTZWa2U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf7ERMtL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA1DC4CEF1;
	Tue, 18 Nov 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475971;
	bh=ejoEfVQPWBYZ0PyLtQkJpAvcNWz5Xe4/WqTYaNUnAbM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uf7ERMtLHtJDvvwZbXYkIsMFKtBumBRhF0ksmCj4I/Jp9VKRBonN51gwp9X8ID5zV
	 oEUJ6sNJFOxRPUYLs4mVYQD4A2yVYg0+dGDefFRU85TokaOnM/gYRahEWUCkHkro0H
	 J25yg1RfTsTuuv+5K/RITI6PfQl9aatifYH1GPXmgvb23zQecbMj3ylcSxxMdCiluB
	 eFPiPeT+gzkBeqcBKc6Am9wxPpXEYiAZfhY0NCckOVvfNe7MYIue7X+HO1T+Dx86SR
	 tI+lJ1DwATG70Q3Tf28jooQU0uYDRwzc1+0ic7fBK/Xpiz4DEWT8fwwTPRdde1FfBf
	 ObBAPmnkRC1Rg==
Message-ID: <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
Date: Tue, 18 Nov 2025 15:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>, Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
 <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
 <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 18-Nov-25 12:14 PM, Gergo Koteles wrote:

..

>> Do you have a compelling use-case for turning off the privacy LED?
>>
> 
> As a pet camera, it is useful to be able to turn off the LED.
> In some cases, it can also eliminate unwanted reflections.
> Some cameras may have blue LED, and if someone hates blue LEDs..

And almost all cameras already do not allow manually overriding the LED
turning on while streaming. There is a very low-tech solution for this,
put some black isolation tape over the LED :)

>> My core goal is simple: if the camera is in use, the privacy LED must
>> be ON. If the LED is ON unexpectedly, it serves as a clear indication
>> that something unusual is happening.

...

>> No freedom is lost. This change simply increases the
>> trustworthiness/reliability of your device.
> 
> It will decrease to the extent that fewer people will know that such an
> option exists because they will not read the description of the
> module's parameters.

People currently already will not know that the option exists.

Seeing the current LED controls on Logitech cams requires 2 manual steps:

1. Install uvcdynctrl which maps the custom GUIDs to the LED controls
   Note distros do not install this be default
2. Use either a GUI v4l2-control app like qv4l2ucp or gtk-v4l, or
   v4l-ctrl -l to list controls and then change the setting.

So there already is close to 0 discoverability for this Logitech
only feature.

For the new MIPI cameras on laptops we have deliberately made it
impossible to disable the privacy LED while streaming even though
it is often controlled by a separate GPIO because of privacy reasons.

For the same privacy reasons I fully agree with Ricardo that this should
be behind a module option. Which replaces step 1. with creating
a /etc/modprobe.d/uvc.conf file, so just about as much work.

> And it's not possible to be sure that there isn't another undocumented
> option in the firmware to turn it off the LED.
> 
> A physical switch would be the best for this control, but that's not an
> option :(

Sure but remember perfect is the enemy of good. Having a v4l2-ctrl to
force the LED to always be off will make it a lot easier for an attacker
to use the camera without the LED turning on. Security is all about
layers / defense in depth and the module option is a nice and simple
way to make things harder for pervert spyware.

Regards,

Hans





