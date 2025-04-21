Return-Path: <linux-media+bounces-30636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2152A9555D
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 19:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D5116E814
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA371E573F;
	Mon, 21 Apr 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O8LKShYq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F311C8611
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257163; cv=none; b=VNS2XtFhwuuMswqM/Ha+XXDeYDb5AzZgpFO3dxok1QVc9gjaw9Me2jITjFqSNb7jfClxtKxAbH6XxNMtd0n+AE1K8fXyHvpUywsPBbPgNL+aXaColvkBgcmF9aYr4t3c/3qezh2dypi41RG2JteWdTCEj3KmqJZjUPMPkzgkppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257163; c=relaxed/simple;
	bh=rgGJoOtOO9sQVp+KiBRaNUVC7+IZfUdSkvdCRNq8t90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0Dm1GYTCLgAKbaX2sQzPSgxca+7xo/70u9kNZ6OVSnvd3QA/I4AVzp79bVtzRdsNLVqScLLXDRWmJ4MUcJH1xKqZINRkWhC6t/paPQlPwToQ1HKt4S+KSwhZGdTeuSq9psX5wvCj4PD8eZmb/QX0l2axfMDRaiBD2cR5eHiTUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O8LKShYq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745257160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywaPb4TMaxfPoP89il7fDDps1XZtg6EhvxyJXxxLxmw=;
	b=O8LKShYqVUONALeMtGjoMkWggFpYw3HrYcW4Jt47putfgAVW1GXkoaPYbin1gRPa0/IhhH
	JvkAI9kJ9rG4QgY/qDHwk3A5jfGWQD3sgfy+fE0WFszffpAIkFbuxZNuG2vPZUcScM/UTl
	Hq4JKt4Pc9gsZoO+XAL2RwZ6MLdRUMc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-3qcBOc70MouvZFdmCOyeGg-1; Mon, 21 Apr 2025 13:39:19 -0400
X-MC-Unique: 3qcBOc70MouvZFdmCOyeGg-1
X-Mimecast-MFC-AGG-ID: 3qcBOc70MouvZFdmCOyeGg_1745257158
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso155682466b.1
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 10:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257158; x=1745861958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywaPb4TMaxfPoP89il7fDDps1XZtg6EhvxyJXxxLxmw=;
        b=RYnV0fv//7Ii5r/nVrodK7oJpaJpTIo7AlV/ZyYXhKXNdvQxrK4jriY7lWXegNODPo
         9U2+G0IYwuVogvqOd2iBQ0rH+1GibYa5Q5/+G7P5/189aF13F3axOqMZo5qR/ck9ICTl
         kvzffoqd4tSUS9TgcgXMpBC+LI9Tq/ocOoczmn3aa8TkeS591ipuGUdLf10Lh9dk3lNI
         8AN9Q/nA0c1E1YY37Cwa4/PbAPCyeLNQZivSKO2thfvS+h85Nz7Gpd4Of2CIuMjzJ8iz
         J/x35VEreGSg/yCrZLBkyNjRY7Y+Xq2cTshqYsI1XbQ6hwKxoYISQtxIeJmLoaRdkXJw
         Oj5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5fJJRrM+AqrPBAwHxT7MzKdFC9Iexv0/SAe1+6f0sq2PxRzDEaq6Lv3Z10/5uoIi2jCmkLAk1wopMaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxerDDBVdzpDHOikFFgBHW1yxOwTOC8HirfNOQte82XZ4dSisWk
	Bp1W3ySJ1Pat0D8wsP1J5VVne++ejWjHIxGZMCYZPU+bYc1basG6/iiCyiZT3WVwuOvc/aRwXVm
	1wAQyzwT0Acu0Rz7aMRDUbAuC/ZOfh+y/cNcbNIdX6TstioHjsJJKG4CjMv0Q
X-Gm-Gg: ASbGncsIqKGQlBFtS/YyQZyotQK0j/Ar6ma56VxVxjLEjeLdUun9K/djC1nGYNV+NZa
	ge9gXBR2knXDAMo3cTr2sGaiG5/POnpZUeIjZxHK06r0WamQ4ZLG2vGW3xyU0sjmArl8RrAEYOx
	qe7yg+keSPnFSXCPVUP8sJEeka35MnBpisD0b6RX/ypcld9iQrxecHXGyubDxNW+8SDZ6ySWZo8
	W96cbAHTi0xgx7KnteWeEdObfYeNkqT5I+msci0Ck2L2E11h7EwmHJIkpS5r4m4+lMczDKwslJB
	nIYOQBiwmVyHBEh050t5dFDgNOuX0SWqyjRkXL1locqyKhXOthysrBeTKO7t3imiN8n1BMdyEWb
	6c5YahHK0YdDh0tO6tFIePwyqKkGP1t7DceG5zBZ5pPjffOfa2Oko1QrSzTP4aw==
X-Received: by 2002:a17:907:9712:b0:ac7:16ef:e994 with SMTP id a640c23a62f3a-acb74e19569mr912873166b.56.1745257157787;
        Mon, 21 Apr 2025 10:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCglgIN1WLtgLhOmlUVhHH0fI/qTluZHXRxH9rNqhhc6ocs2VrCPmrQpHHHVzT5JG7gQZOSg==
X-Received: by 2002:a17:907:9712:b0:ac7:16ef:e994 with SMTP id a640c23a62f3a-acb74e19569mr912871566b.56.1745257157298;
        Mon, 21 Apr 2025 10:39:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4c6b5sm527467866b.49.2025.04.21.10.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:39:16 -0700 (PDT)
Message-ID: <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
Date: Mon, 21 Apr 2025 19:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Hans Verkuil <hans@jjverkuil.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Apr-25 2:31 PM, Hans Verkuil wrote:
> Hi all,
> 
> Here is my v2 of the draft agenda for the media summit. The only changes
> are dropping Sebastian's email and fixing Devarsh' email.
> 
> As always, this draft agenda is subject to change and all times are guesstimates!
> 
> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
> please let me know and just send it to the old email (that won't go away).
> 
> The Media Summit will be held Tuesday May 13th to coincide with
> the Embedded Recipes Conference in Nice, France:
> 
> https://embedded-recipes.org/2025/
> 
> Note that there are also some workshops held after this conference:
> 
> https://embedded-recipes.org/2025/workshops/
> 
> And a gStreamer hackfest:
> 
> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
> 
> The Media Summit will be held at Hotel Campanile:
> 
> https://nice-aeroport.campanile.com/en-us/
> 
> It is close to the Airport and to the Embedded Recipes venue.
> 
> The meeting room can hold up to 30 people and has video conferencing support; it is
> sponsored by Collabora and Cisco Systems Norway.
> 
> We currently have the following confirmed in-person attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> Hans de Goede <hdegoede@redhat.com> (RedHat)
> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Maxime Ripard <mripard@redhat.com> (RedHat)
> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> 
> As you can see, there is enough room for more people, so don't hesitate to
> register by sending an email to me. The deadline is May 2nd.
> 
> And the following remote participants:
> 
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> 
> Note: information on how to connect remotely will come later.
> 
> If any information above is incorrect, or if I missed someone, then please let me know asap.
> 
> Draft Agenda:
> 
> 9:00-9:30: Get settled :-)
> 
> 9:30-9:40: Hans Verkuil: Quick introduction
> 
> 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
> 
> 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
> 
> 11:15-11:30: break
> 
> 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
> 
> 12:15-13:30: lunch TBD
> 
> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
> 
> 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
> 
> 15:00-17:00: TDB

As discussed here:

https://lore.kernel.org/linux-media/6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com/

there are a bunch of V4L2 (subdev) API things which need
to be specified better (without leaving room for interpretation)
surrounding sensors. One of these is how to calculate the pixelrate
(and thus the FPS) for sensors when e.g. binning is used.

For non binning the pixelrate in pixels/second is:

pixelrate = (format.width + hblank) * (format.height + vblank) * fps

But what about binning, should the sensor driver then report the
skipped pixels as extra vblank (AFAICT that is what it looks like
on the CSI-2 bus) or should userspace know binning is happening and do:

(format.width * hscale + hblank) * (format.height *vscale + vblank)

and in that case how can userspace know hscale / vscale since atm
it cannot explicitly set those, but this is determined by the sensor
drivers.

There are a number of questions like these surrounding the V4L2 subdev
API for sensors, which IMHO would be good to discuss.

Regards,

Hans



