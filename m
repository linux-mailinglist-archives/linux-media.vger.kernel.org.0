Return-Path: <linux-media+bounces-30813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE6A98A7D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C65B3176A5C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 13:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A6F57C93;
	Wed, 23 Apr 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fn2gm2jv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD17404E
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413665; cv=none; b=hptO5xCMBreCTI3OfSfWtwwemETcXeQnmvNBQ/ldk7xQOczGzcd323CwuRFTm3zMR48Ko8NnvA6RJb6ne9w3sQ0i/TnYnXFZSyGL6j6fzYgdgyvWS/SmBvLxEvSH0OgmyCZVDxVGgYSmN0njL3gW972xNioFDkw/ZBp14ppwwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413665; c=relaxed/simple;
	bh=Qt4hpTFli3aiDDg7mIJCA4pr0xrzfVuvtllHEPcw488=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIIQy/3rL/gZZ0vwFSMp+cINYgh0MeSQ2Vb+zFlBiJMXspwR5POZsJ/jCBdEuLetkFg8ZyuqrX7rc3G77cUxonoeYB/86btrTkYgbKgQyY1GTcHI/N8ZPXd0pW0LAxQx+XFEqKxmbRYggXE/F6t8CpEesbkzbnBgtp21AlxTYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fn2gm2jv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745413661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdxP61S5kbSBpSY2IGDXoICN1Lf10gx5u06xL67dyME=;
	b=Fn2gm2jv+rhP2sZgSthSA76rHPj6cL54bh1GcjtXFB2Etob94wWn+hBx4pLJ37cxvZc4ac
	A1l1KIOvBBvx47f64b92fh0AnIcinGdFUGaQ3hiH8gca10BBYdRavNz4m9ddCZ7pY2dudX
	XAuyS3G9Qb84FVLrhzOUbOBMHBhIpl4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-eP6FeE6fMkeUvWDhC8stSw-1; Wed, 23 Apr 2025 09:07:39 -0400
X-MC-Unique: eP6FeE6fMkeUvWDhC8stSw-1
X-Mimecast-MFC-AGG-ID: eP6FeE6fMkeUvWDhC8stSw_1745413658
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3db5469fbso459359666b.0
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 06:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413658; x=1746018458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdxP61S5kbSBpSY2IGDXoICN1Lf10gx5u06xL67dyME=;
        b=lVKVCcMonkpdX2YKPSbAJEiJSBopufPfQ71ji4v8g1jvq8ezlWlF/WgNNzq66eW96o
         YdlLLYtMSNF3Fnczzdqwq0f2lST5ITMfwL5F2SSXx7vDZGgBPPoRqliLmyUsnURJ3llW
         J9KnoUW9C6QE3Zo4CRWPTIxO5VQ266GP0ayKCFjEbahHWAJ92rDRYiQiMe3z7cmeZ5h1
         ahY80JtFwCqdIKTmuISrbnH20Wf8q+4UbnnlkQYUcYJrLy3yIyIpKCTtg/xis1bJFexP
         uXCKWR4UKFexXz/FrdsO4Rla9pcl6NXXYVoHoTOFQmAUJ1nHxbGMiZ2XPWwO8tQh0tWW
         gudA==
X-Forwarded-Encrypted: i=1; AJvYcCUyv6p855DJVQ1cNS6TvmD8T06nGYTEVngU+AwVWxVzvx8b+20qGgpt7OiSiMsExy8ExA5kDVGRUAmR7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL8FRzFs4ykU28302pbtZeVZiL263tZVf1NAWFeqojCUZP0WjI
	7lYUaI08EUzzarHe9w3uYEOl2T5KkfxjwJmqE+CC4AKYLVGq8o+s8pafOkYvG/pmgYda161a/LB
	pKeFn0XqYyIHo4xutl/lWoO+0eHWT1uHf0aoWzUOQ5OO8hCKLK9gCCmsDF9N7
X-Gm-Gg: ASbGncsNP5ea0FqVWerh5l71Vl5FKfz6QtrIbethz7AoFwVxNC+9HA48U/sdQT9Ru5y
	TQZLH3jmQHwbSAIjBimbyU+q8FcnDDMhX43be2iWT0R+xq7WdBxggC1VI+bRYBgUmjP/Z4hERAO
	HvD9nQnyVpd1BY2fed4jiEt6MphzYVudpIZkGI5uPGfllEku5V80q3VxTFqPIfxPXV+fzLrZbor
	4kNVnCXac/xJgy1PcJ1rymwNqu9NZ2gwpP1fritqdzfQjoxdfHYG3ZbPYn9Vw9HWCwX/Ylh1xhF
	BW/5iy71CGuYzwH7IpFrZhar+PrFg29aZu0Q0sa1M9pbp7Ju3rqIb/LuQj8lyEKYn5HhsYt3+Ae
	TIHbcPi0vMyWLW68rLWRo3MYyUf5r1/ppgCrTSCFn76Nl4uy3Xh9namnrxbjr/Q==
X-Received: by 2002:a17:907:9718:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-acb74bdb2a5mr1542967366b.36.1745413657399;
        Wed, 23 Apr 2025 06:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKjc/MOBqBPU2bKi0AvLe0rggXncpyhUh08gDcqMFI6LdmF6Mh/Tyt2OLWH2uvUx/iRYfVqQ==
X-Received: by 2002:a17:907:9718:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-acb74bdb2a5mr1542959566b.36.1745413656635;
        Wed, 23 Apr 2025 06:07:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec50607sm801108566b.71.2025.04.23.06.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:07:36 -0700 (PDT)
Message-ID: <99d92fe7-c4ec-4d44-83ab-6e9fadb3681f@redhat.com>
Date: Wed, 23 Apr 2025 15:07:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>,
 Maxime Ripard <mripard@kernel.org>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
 <aAdqT1ufZnrRBH1j@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aAdqT1ufZnrRBH1j@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 22-Apr-25 12:07 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Apr 21, 2025 at 07:39:15PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 21-Apr-25 2:31 PM, Hans Verkuil wrote:
>>> Hi all,
>>>
>>> Here is my v2 of the draft agenda for the media summit. The only changes
>>> are dropping Sebastian's email and fixing Devarsh' email.
>>>
>>> As always, this draft agenda is subject to change and all times are guesstimates!
>>>
>>> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
>>> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
>>> please let me know and just send it to the old email (that won't go away).
>>>
>>> The Media Summit will be held Tuesday May 13th to coincide with
>>> the Embedded Recipes Conference in Nice, France:
>>>
>>> https://embedded-recipes.org/2025/
>>>
>>> Note that there are also some workshops held after this conference:
>>>
>>> https://embedded-recipes.org/2025/workshops/
>>>
>>> And a gStreamer hackfest:
>>>
>>> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
>>>
>>> The Media Summit will be held at Hotel Campanile:
>>>
>>> https://nice-aeroport.campanile.com/en-us/
>>>
>>> It is close to the Airport and to the Embedded Recipes venue.
>>>
>>> The meeting room can hold up to 30 people and has video conferencing support; it is
>>> sponsored by Collabora and Cisco Systems Norway.
>>>
>>> We currently have the following confirmed in-person attendees:
>>>
>>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
>>> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
>>> Hans de Goede <hdegoede@redhat.com> (RedHat)
>>> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
>>> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
>>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>>> Maxime Ripard <mripard@redhat.com> (RedHat)
>>> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
>>> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
>>> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
>>>
>>> As you can see, there is enough room for more people, so don't hesitate to
>>> register by sending an email to me. The deadline is May 2nd.
>>>
>>> And the following remote participants:
>>>
>>> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
>>> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
>>> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
>>> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
>>> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
>>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>>>
>>> Note: information on how to connect remotely will come later.
>>>
>>> If any information above is incorrect, or if I missed someone, then please let me know asap.
>>>
>>> Draft Agenda:
>>>
>>> 9:00-9:30: Get settled :-)
>>>
>>> 9:30-9:40: Hans Verkuil: Quick introduction
>>>
>>> 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
>>>
>>> 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
>>>
>>> 11:15-11:30: break
>>>
>>> 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
>>>
>>> 12:15-13:30: lunch TBD
>>>
>>> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
>>>
>>> 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
>>>
>>> 15:00-17:00: TDB
>>
>> As discussed here:
>>
>> https://lore.kernel.org/linux-media/6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com/
>>
>> there are a bunch of V4L2 (subdev) API things which need
>> to be specified better (without leaving room for interpretation)
>> surrounding sensors. One of these is how to calculate the pixelrate
>> (and thus the FPS) for sensors when e.g. binning is used.
>>
>> For non binning the pixelrate in pixels/second is:
>>
>> pixelrate = (format.width + hblank) * (format.height + vblank) * fps
>>
>> But what about binning, should the sensor driver then report the
>> skipped pixels as extra vblank (AFAICT that is what it looks like
>> on the CSI-2 bus) or should userspace know binning is happening and do:
>>
>> (format.width * hscale + hblank) * (format.height *vscale + vblank)
>>
>> and in that case how can userspace know hscale / vscale since atm
>> it cannot explicitly set those, but this is determined by the sensor
>> drivers.
>>
>> There are a number of questions like these surrounding the V4L2 subdev
>> API for sensors, which IMHO would be good to discuss.
> 
> If we discuss this topic in the Media summit, then it be discussed in the
> context of the metadata patch series
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata> and
> especially the Common raw sensor model rather than the current state of
> affair. We know what's in upstream right now is insufficient and what is
> documented there isn't fully supported in current drivers.

Hans, as Laurent says I think we can easily fill an hour with this,
so sat 45 min or 1 hour ?

Sakari, I agree we should probably base the dicussions on the new common
raw sensor model. I will make sure to have read all the current code / docs
on that before the summit. Can you maybe prepare some discussion points
for the summit based on this ?

Regards,

Hans





