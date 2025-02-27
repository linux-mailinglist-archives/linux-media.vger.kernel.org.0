Return-Path: <linux-media+bounces-27145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E1A479C7
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E80B3B4421
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CDB228CBA;
	Thu, 27 Feb 2025 10:05:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D582225403
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650730; cv=none; b=t5xOcShKPesPDxUs8yAlvkC07LW03G76hr14pKAXOlC/jWA4ZgQsP5sBldd29JrdFlL2HucSMgQ2D5SR4d9s5bMtCoM7DpJIpD5qvt3tIfiRyD2L8QAZtR6TyiemNNzbl5LRtBLqY1vqzErWvZ+y/1YU3QjBmBs7L8DoLnS/WeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650730; c=relaxed/simple;
	bh=P532lOYezsHwut8pl362vYCM+FMDsmwe/b6WP0CMeX4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YmPcnc/ZTs5ywQxf5AbtIzdOKDBgi2hbs1kllm0cxWOVwUZy4sDrpX3SSpVNjEhVsBQDPZmt6M1M6wMHNqF9imODegJmM2gewJdN5E8+qE6fo5cVJR18oHlQfFud4Yhi8pDBXq7H2G0ObHtUDT+LsxvXQ+uC5W8Z4EYoTsl5R8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFC7C4CEDD;
	Thu, 27 Feb 2025 10:05:25 +0000 (UTC)
Message-ID: <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>
Date: Thu, 27 Feb 2025 11:05:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Just a friendly reminder to reply if you want to attend the Media Summit, and
if so, which place works for you.

Currently the preference seems to be Nice.

Regards,

	Hans

On 20/02/2025 11:24, Hans Verkuil wrote:
> [Repost because I mixed up a Lyon and Nice, and to provide more info on the other
>  events that take place in Nice. Also added Kevin Hilman to the CC list.]
> 
> Hi all,
> 
> We want to organize a Media Summit this year as well to meet each other face-to-face.
> We try to co-locate with an existing conference, and this year there are two options:
> 
> 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
> 
>    https://embedded-recipes.org/2025/
> 
>    So a media summit would probably take place on May 11 or 12.
> 
>    This conference is a one room, one track format. But the room holds up to 200
>    people and the expectation is that it is not a problem to get tickets for it.
>    And we might be able to reserve some tickets for us as well.
> 
>    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
>    GStreamer plans an event during the weekend after ER.
> 
> 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
> 
>    https://events.linuxfoundation.org/open-source-summit-europe/
> 
>    The Embedded Linux Conference Europe is part of that event. The summit would
>    probably be on August 24 or 28.
> 
> I know that getting permission to travel is still a problem for many, which is why we
> try to co-locate with a larger event.
> 
> So: if you are a core media maintainer or an active media developer, and want to join
> the Media Summit, which of these two options would work for you?
> 
> If possible, I would like to get an idea of what I can expect in about two weeks time.
> I'll send out a reminder in about a week as well.
> 
> Feel free to forward this if you know other people who might be interested.
> 
> If you haven't been to one of these Media Summits before, then you can find the report
> on last year's summit here:
> 
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> 
> That should give you an idea of what to expect.
> 
> Regards,
> 
> 	Hans
> 


