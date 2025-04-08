Return-Path: <linux-media+bounces-29597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A0A7F981
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18E13189CCF6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FCC264FAC;
	Tue,  8 Apr 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DCzEOlPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E798219A8F
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104529; cv=none; b=thrTSb6lVhxsJTkA2OMlTv9Ivs3ogkIEaS4Y80EETdQzgQ9TjoguRJ18jI3AxjdsJvnWoL+tQdQYvcE+yyRr0Z0KHgo95/2PgPaY/oiEc9EU0/zGJgnJGfMNbAC8L/IZUsrLvEZ/GPaDdbpNwCZFwPS2Ns0ey/4iPuLSckQ5/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104529; c=relaxed/simple;
	bh=TIptc0wS3klHJ+S7GMA2dWgXdIbulgNcG3aloZCwI88=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=odg7bSo8bRqpTihTsXE9kDo88dtBcOsqQX9fhtQnWN2JeXENbmzRtituLqoKNwMqG6Gz17JKCIxuLxFknle6EN4MJgTuHMN32pq8pq0usXtgvrVcheWXM3SuRYtHCu5BBJjJoe9sytry+3NHFI+gJMbw9R/9jgz069UDayLb/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DCzEOlPN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbd96bef64so1041117566b.3
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744104525; x=1744709325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sbZpkyPqz83/TcnO8Na2BUVS7vOFfMNV2Rao0wXuEA=;
        b=DCzEOlPNuBmx2xQSSw9v/8ofCWdh1rEziDsTw8CJLRTLKXGB8Not9ZGwJg39hhjFvL
         59NUFqMimsooG49K8XAOTPnL/4AlkWgPZJllL0OUH3jqTEYljMA3zfpy0E8zhmhcz4nO
         hnumCDQ0xXISSPysiUkAxmkbVkO0CXCPh28ae5YWe7kIKrUf6Pz7EGRoTtneyMJjX9wt
         ko8yZQAL6lYhwCoqVeBzva6J7CrPE2bhxHCGegG0HWM/Y3Hu3qkxjA7tiQjp5dxgYZEe
         a5e1Yj1yo2p3Pd8BQ+MeJPwdq2jx36uqK9mXLAvR0N2IoFLeZSKVXByhsSFgYG8IK6fc
         HQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104525; x=1744709325;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sbZpkyPqz83/TcnO8Na2BUVS7vOFfMNV2Rao0wXuEA=;
        b=DjnQ3dPY+xHvoO0IPt7jan0LaMZhL9xRlifbGPsN71p8exvT1oxo2+FFqjAwyQCeYX
         qpGeC6+LEXGuN4QwLLVLlQrlqfap/95H5ymAVexxWY1onEly7hp8MbM5CrtmeQDaipTb
         p3O0JK7h2EqPRS0cDAGECKr6Kjv7c0+hRXRRw6zw8Rw9cmfW1ST6EQE2qVqbJUBk8Thw
         UrnNlOjVG7jGJdRq/NgFtWdWviOz4cS0Cp+Il2DRNMDCKReb6WNEc9iHWR8b+nHbBha4
         SxC3U5G0T+vrMO/QWdoIylEmoRfa/cwP1bQUA6WJbB5Mcu1v5HW4xCGn4yNLOnJAlfQX
         kRqA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Y6sWT5icTX4XRCI7ufwMOrSxptol/1BdoQQyZ2gwnSh9P9jQJQzvW7DrZuJ29NjnAlDaOtYU9zgakQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEPt6oEKA31LF2pIWAk05N3ZZD89jA3LrLBj9+uQ/MPLXg6+b
	vfic5fXZps4vr+hK//6VP6dzmprJclp7DAlEn6ATkRpTYJOkvzx0
X-Gm-Gg: ASbGncsvyH0/G4wNeGzrew/rk6W0pBPuUgvlmbJBDl0CEHrvxUVYyAnX+b9XM3q5P9K
	ZylD9yXG1nTvirmrKJECDrGGfyd/sgcKQDTp25biRMZ9bhjApUZTEfylKymI9od/oRGHzfBJRSk
	B0wLccefbPJsH5x/P7g1SjZB09IszKx38rgd6VuPWH66pPKDouC7rDfe8/O8ZMR+YbFDmfMyiXJ
	krIEPQFPhkd5rOgedvyYRluBeqXSmUGhOAnMpCubygZaq3kxQs/64zDqKL/S/i9crgidMhK/oGU
	LODunsekwKCcvY5UDuGVutTWzWTg38dfBiFCjhu8nMR02tWYTLjL7VRUyf9JSqIUBw8hU48AqhP
	Sz4z1to3DNvHnAfk=
X-Google-Smtp-Source: AGHT+IHEzNzC+urTL7j2a5GzhLc9iIZE3U41Ix5s7PFTm6PSuAN7GrVKBV+xY8uBQ/S0uZJ0GmV5yA==
X-Received: by 2002:a17:907:a05:b0:ac3:9587:f2ac with SMTP id a640c23a62f3a-ac7d19289fdmr1672188066b.33.1744104525066;
        Tue, 08 Apr 2025 02:28:45 -0700 (PDT)
Received: from ?IPV6:2a02:8109:862b:ec00:37e3:5a6:7966:5f93? ([2a02:8109:862b:ec00:37e3:5a6:7966:5f93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0185ba0sm877532266b.151.2025.04.08.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:28:44 -0700 (PDT)
From: Martin Hecht <mhecht73@googlemail.com>
X-Google-Original-From: Martin Hecht <mhecht73@gmail.com>
Message-ID: <225cea05-416f-4af2-a4a9-9e5ff28ed092@gmail.com>
Date: Tue, 8 Apr 2025 11:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit on
 May 13th in Nice, France
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 "Hecht, Martin (Avnet Silica)" <martin.hecht@avnet.eu>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
 <18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl>
Content-Language: en-US, de-DE
In-Reply-To: <18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

I'm would like to participate remotely this year.

BR Martin



On 3/28/25 14:58, Hans Verkuil wrote:
> Hi all,
> 
> Just a gentle reminder! If you plan to attend and haven't emailed me yet, please
> do so.
> 
> I currently have 7 confirmed in-person attendees, and 3 remote attendees.
> 
> I have three proposed topics as well.
> 
> It's early days yet, so I hope we'll get more attendees and topics to discuss.
> 
> The plan is to post a first draft agenda by mid-April, so more topics are welcome!
> 
> Regards,
> 
> 	Hans
> 
> On 14/03/2025 10:59, Hans Verkuil wrote:
>> Hi all,
>>
>> We will organize another Media Summit on Tuesday May 13th to coincide with
>> the Embedded Recipes Conference in Nice, France:
>>
>> https://embedded-recipes.org/2025/
>>
>> Note that there are also some workshops held after this conference:
>>
>> https://embedded-recipes.org/2025/workshops/
>>
>> And apparently a gStreamer event during the weekend. If anyone has more
>> details about this, please reply to this post.
>>
>> The Media Summit will be held at Hotel Campanile:
>>
>> https://nice-aeroport.campanile.com/en-us/
>>
>> It is close to the Airport and to the Embedded Recipes venue.
>>
>> The meeting room can hold up to 30 people and has video conferencing support.
>>
>> That said, I want to keep remote participation to a minimum. This yearly summit is meant
>> for active media developers to meet up face-to-face and to discuss media subsystem issues.
>> But if you are an active media developer and are really not able to attend in person, then
>> remote participation is an option.
>>
>> If you want to attend the meeting (either in person or remote), then send an email to me
>> directly. The deadline for that is May 2nd as the hotel needs to know the final number of
>> attendees by then. We have more seats available than last year, so I do not expect to run out.
>> In the unlikely case that this becomes a problem, then I will revisit this.
>>
>> There is no registration fee.
>>
>> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
>> It would be very much appreciated if you can also add a guesstimate of the time
>> you need for your topic.
>>
>> See last year's Media Summit Report as an example of what to expect:
>>
>> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
>>
>> There are two topics already for the upcoming Media Summit:
>>
>> Paul Kocialkowski:
>> Stateless video encoding uAPI
>>
>> Hans Verkuil:
>> Status of Media CI/Multi-committers
>> Duration guesstimate: 1 hour
>>
>> Regards,
>>
>> 	Hans
>>
> 
> 

