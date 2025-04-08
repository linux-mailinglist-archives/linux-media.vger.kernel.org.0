Return-Path: <linux-media+bounces-29585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CCA7F524
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A793A6C1F
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40FD25F985;
	Tue,  8 Apr 2025 06:43:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532732144AD
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094585; cv=none; b=Ard6sAjI02vsQhP4FW61/KA9/MuxV4mYQrA6S9xqNJsNY5klIMTYWlcpZK9v9fRkn69yoHo7+cge93ep04LDCaCpTnF5jybm+uXqUl++bh532L2a9Y4UZeEhWHfKTn+WiLn4FjC4Mt7Q8uf48gGGlTDeGneaMtti6lgVzGS2cJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094585; c=relaxed/simple;
	bh=tH9vMcRr/tM9RNdTtl8DueXqsTRHSIBRm/kKp1ZeQ/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1J8A+gmsq23JKgQMkLK0bwZRlQFm056MRgm/o5lRsKKMQ53S2ycLoiDogsANd3T5xT+wkuidJlssACJ1nt+mE2PKvKTfQvJrQUDkl7aWTRlfGB81bo1s0SPAkU3iEvWLW4U5RmI33qgTD06v3FRvZeUD2cX1vaRfmDNIjvQ75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08553C4CEE5;
	Tue,  8 Apr 2025 06:42:59 +0000 (UTC)
Message-ID: <8d07578f-4c12-477c-a973-9427faefc07a@xs4all.nl>
Date: Tue, 8 Apr 2025 08:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit on
 May 13th in Nice, France
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
 <20250407193909.GA17385@pendragon.ideasonboard.com>
 <20250408133142.030bd1cf@sal.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250408133142.030bd1cf@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2025 07:31, Mauro Carvalho Chehab wrote:
> Em Mon, 7 Apr 2025 22:39:09 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
>> I would like to propose the following topic.
>>
>> Review of the status of staging drivers
>>
>> We have a set of 11 drivers in drivers/staging/media/, with various
>> states of maturity and development activity.
> 
> On a quick look, we have there:
> 
> 1. source "drivers/staging/media/atomisp/Kconfig"
> 2. source "drivers/staging/media/av7110/Kconfig"
> 3. source "drivers/staging/media/imx/Kconfig"
> 4. source "drivers/staging/media/ipu3/Kconfig"
> 5. source "drivers/staging/media/max96712/Kconfig"
> 6. source "drivers/staging/media/meson/vdec/Kconfig"
> 7. source "drivers/staging/media/rkvdec/Kconfig"
> 8. source "drivers/staging/media/starfive/Kconfig"
> 9. source "drivers/staging/media/sunxi/Kconfig"
> 10. source "drivers/staging/media/tegra-video/Kconfig"
> 11. source "drivers/staging/media/deprecated/atmel/Kconfig"
> 
>> drivers/staging/ is not meant as a place for drivers to die,
> 
> It is, actually: we usually move things there before dropping,
> because, on most cases, they could be salvaged if someone is
> interested on it.
> 
>> we should nudge the relevant
>> maintainers and consider dropping drivers that show no hope of
>> progressing.
> 
> Fully agreed.
> 
> -
> 
> Yet, while it makes sense to have action plans for drivers on staging,
> I don't think that the Media Summit is the best place to discuss,
> as people that might be involved with them may not be able to
> participate there.

Actually, I think quite a few of the relevant people will be there.

And I think it doesn't hurt to go through the list once a year.

Regards,

	Hans

> 
> See, there are different situations there, like:
> 
> - platform drivers: at worse case, those should be removed when
>   the core/DT support for such platform is removed. We removed
>   several such drivers in the past. We can also remove them earlier,
>   if there are reasons for doing that and nobody is complaining;
> 
> - drivers like atomisp that takes a lot of efforts to be promoted.
>   As long as I see some progress (and we've been seeing progress
>   on every kernel version), I can't see any reason why removing it.
> 
> - drivers like ipu3, which is for an entire family of PC CPUs.
>   I prefer not dropping drivers like these unless we have very good
>   reasons to do so. On the other hand, we are seeing very little
>   progress on those.
> 
> Anyway, better to split this into different threads, copying
> the people involved on the recent changes for such drivers.
> 
> Regards,
> Mauro


