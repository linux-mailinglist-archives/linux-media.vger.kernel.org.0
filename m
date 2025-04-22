Return-Path: <linux-media+bounces-30681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BFA96061
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7C816BEC7
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B823E2405F5;
	Tue, 22 Apr 2025 08:01:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F922D4C0
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308906; cv=none; b=g9fjgAsbzAp6xgAfyEZ5gqGTkJ/Qnv/2S2LBZpvRvJ/9jGjSKjFgAf4gA+r8yr+Hfj+TDlt61ckw7het0uvD7OFdCeLiboswg+w1zvc+TA8m+T6kwVmR5ak9ALAjws6XTUmxYHpHWaHQlCQdAd3iWg3WxVlGydBqWlYtmgUzGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308906; c=relaxed/simple;
	bh=X2E6EALBVD/x8l2BBSZrGbgqSKhwrrrj3ontGmK5QIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxZ0usCNr5Fzm8cRI1TLuFhgkNCq7TzoLcufcsk21D067YeYXcfa/nJz61Gp40ED+sI0U1lwt/AiOkPNhOOMAkj12J4VXMWCUHagj2VoV7BDgRwYF6eE56iUOyaCTrmobnDpJvNart1Nh2a45JZsnHB0PrVnP3qAHLJzl1c3dzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8108AC4CEEA;
	Tue, 22 Apr 2025 08:01:40 +0000 (UTC)
Message-ID: <cb9be4d7-f74a-44b8-b480-6f7ae68d64b6@jjverkuil.nl>
Date: Tue, 22 Apr 2025 10:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Hans de Goede <hdegoede@redhat.com>,
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
 <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSBIYW5zIFZlcmt1
 aWwgPGhhbnNAamp2ZXJrdWlsLm5sPsLBlAQTAQoAPhYhBAUs3nvCFQU7aJ8byr0tYUhmFDtM
 BQJoBTEAAhsDBQkX+5V7BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0tYUhmFDtMb8EQ
 AK6Ecb5mGBanCa0R+J/WkWxGVsgqsaTjNU6nS5sl9lkiY64Tad6nF8RNO9YKRyfuokm2pxAD
 a91Tk92DFstszKGwiisEG7PQ3zXHEJTqxIosy9ueLbHTOvB4CnWVChcvaBWZ2uilyKFsWNTq
 mbDQf3/0UC3LxbEvGsYNU1Q6Pz+h+Pdv7GgdOJhYGKSLCpQyPYOyaU9tenHDKx6aNedNG4ZI
 2OAM18nDfKrEplSjDF9E9Ras65/n9iWQfGoUdxSlGrxM/t3EVgi1FXEq14FaCi6HhvreBZuw
 3NTHg4Za6bqnYsZnbyHY36bgnxi2YJYxKlh+IMT/TpfEh8nf2nnJTgs3bsNIVVaaYxJtl4w/
 Y48gKt6YzcWsHR6l0CSMQhZXQqp/Ljpi+/xtE6JJ/tJnG9Wyi3+hA11GFQ50uciXTpp9/w8s
 fScrv8qrfRiUsd+zfd0MC6EJmHSlW7qSVQjEauWDsdCFmsER8y/ab3DQb5uhrsyuooB+V7uj
 476vUbH/fM3KMrvh8HOTUBoAE/Mf82/bMlrduuU5PkbO+3/PcUR0WFUSK2yRK32GX/Tt2tD+
 YJq0RnyR8UeYslVLzyehrt8Cgc9KgHa8VUi/vkSTenjieYJYxgrd+oTYXB38gKlADnhw+zyp
 CsqeGGZu+SS2qrPUyUkeruRX7kC2tQ6gNoYpzsFNBFQ84W0BEADcy4iOoB5CIQUCnkGmLKdk
 kqhfXPvvSzsucep20OLNF96EymjBnwWboipJFOjZxwkmtAM+UnEVi2kRrtT844HFcM5eTrA2
 sEdQbThv16D0TQdt+dT0afvlvE1qNr4mGGNLiRyhRzC/pLvatD/jZHU8xRiSz/oZ+8dEUwzG
 4Skxztx9sSc+U1zRPc0ybiHxgM90oQ6Yo782InmN99Ac2WH6YLwpZQ1TOROF4HxeBfzfdMFi
 rudHzANNbn8LvvfRhMExVRtms+U/Ul3e730oEUpM18u4XJ8Y+CITnzOk7POfwYzHiKXqskw3
 bLnrQYF/QzDFsTFpewS3ojMzBq35CeLb5aH9LFY7q14m04m2cn8hkdq4nIPIk2x8hWgM19rh
 VaGWj8a6e7nQ30PerH89IXrBfWYvHezZzZzGG1JlLWktPNy/5dhAyrwiJIUo3ePFxfmjvFYa
 wn211qRkWi3GP4MYtk10WBvcQmuzyDYM/Usjt+LC+k3hT0mZ+Gz0FeTtY/OQ4+IwXnAdZM9m
 q88JVlijGVG0dOB03gLrr2LwihDJ31twAc3aJ4e9EHaiW6UBnwBdqeP4ghEylrqnn4jmJ6Uf
 D6qEANQ2L97e8vQyDeScP/Do+cDnhMm8Or0zAdK658fiWl78Xh0pRcx4g+opfwoQw5CfSf3o
 wh1ECJeNMC0g0QARAQABwsF8BBgBCgAmAhsMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU
 3McFCRf7ldoACgkQvS1hSGYUO0zJTw//aaYKzeGfYF7WvSHUvGvtBO5Y/3XNC5xfU+jDKmlA
 vghX304jqDQ5314fLH7Kk4wE+dE7FaXZR+mMj5W1ORUfGwvMJ7ayemUVg3RyYggy6jQP5Rlb
 SCj9WFvHwNNbYTHFVMkAnVVKpwcjCYiUA82WK1/hP2ClE4dkS+WHtH6ABhO0hs32WoCNAzmT
 fdsOfXtSYN8wYWF0CI8wW4RiMu7rAX7xPPNhnVGz9vWyn06XDipCSIDuivsPNg/9XeUzjUg9
 eOvlMkphJ42MRyPJAWGmSeLm8mKwxoF094yAT6vIvYmT9yUnmf9BfVCJV+CnjEhvMpoAkUqi
 9cvaZfUdnsAnqQmoRJE0+yInhlMyWc+3xlGsa0snsTxNfqjaLH61CLt8oUQOgCI4cD4rJWks
 A8SyOqlgxEHnljUGmFEhCBUOV5GcXf1TfCXjMBiAKtex5cpvic4wZIJJtS1fS18PQ/DEC3vL
 UnhF1/AWSHp+sv8vlNgnncxLDCho8uVjZrn4jzswd6ticBUAsPAKDYnO7KDzfQlQhIHdq10v
 jlGW/FbxA1UUiuWH+/Ub3qh75oQHTTlYe9H+Qr8Ef231/xItks8c+OyoWV6Z9ZcZnHbOmy2I
 0wGRdGp8puOL7LzhLkIN66sY/+x4s+ANxyJK6U1nJVeq7tbbhqf2Se2mPG3b87T9ik8=
In-Reply-To: <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/04/2025 19:39, Hans de Goede wrote:
> Hi,
> 
> On 21-Apr-25 2:31 PM, Hans Verkuil wrote:
>> Hi all,
>>
>> Here is my v2 of the draft agenda for the media summit. The only changes
>> are dropping Sebastian's email and fixing Devarsh' email.
>>
>> As always, this draft agenda is subject to change and all times are guesstimates!
>>
>> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
>> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
>> please let me know and just send it to the old email (that won't go away).
>>
>> The Media Summit will be held Tuesday May 13th to coincide with
>> the Embedded Recipes Conference in Nice, France:
>>
>> https://embedded-recipes.org/2025/
>>
>> Note that there are also some workshops held after this conference:
>>
>> https://embedded-recipes.org/2025/workshops/
>>
>> And a gStreamer hackfest:
>>
>> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
>>
>> The Media Summit will be held at Hotel Campanile:
>>
>> https://nice-aeroport.campanile.com/en-us/
>>
>> It is close to the Airport and to the Embedded Recipes venue.
>>
>> The meeting room can hold up to 30 people and has video conferencing support; it is
>> sponsored by Collabora and Cisco Systems Norway.
>>
>> We currently have the following confirmed in-person attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
>> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
>> Hans de Goede <hdegoede@redhat.com> (RedHat)
>> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
>> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Maxime Ripard <mripard@redhat.com> (RedHat)
>> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
>> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
>> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
>>
>> As you can see, there is enough room for more people, so don't hesitate to
>> register by sending an email to me. The deadline is May 2nd.
>>
>> And the following remote participants:
>>
>> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
>> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
>> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
>> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
>> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>>
>> Note: information on how to connect remotely will come later.
>>
>> If any information above is incorrect, or if I missed someone, then please let me know asap.
>>
>> Draft Agenda:
>>
>> 9:00-9:30: Get settled :-)
>>
>> 9:30-9:40: Hans Verkuil: Quick introduction
>>
>> 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
>>
>> 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
>>
>> 11:15-11:30: break
>>
>> 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
>>
>> 12:15-13:30: lunch TBD
>>
>> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
>>
>> 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
>>
>> 15:00-17:00: TDB
> 
> As discussed here:
> 
> https://lore.kernel.org/linux-media/6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com/
> 
> there are a bunch of V4L2 (subdev) API things which need
> to be specified better (without leaving room for interpretation)
> surrounding sensors. One of these is how to calculate the pixelrate
> (and thus the FPS) for sensors when e.g. binning is used.
> 
> For non binning the pixelrate in pixels/second is:
> 
> pixelrate = (format.width + hblank) * (format.height + vblank) * fps
> 
> But what about binning, should the sensor driver then report the
> skipped pixels as extra vblank (AFAICT that is what it looks like
> on the CSI-2 bus) or should userspace know binning is happening and do:
> 
> (format.width * hscale + hblank) * (format.height *vscale + vblank)
> 
> and in that case how can userspace know hscale / vscale since atm
> it cannot explicitly set those, but this is determined by the sensor
> drivers.
> 
> There are a number of questions like these surrounding the V4L2 subdev
> API for sensors, which IMHO would be good to discuss.

Thank you. I added this topic to the draft agenda. Do you have a guesstimatefor the time you need for this?

Regards,

	Hans

