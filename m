Return-Path: <linux-media+bounces-31715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FBAA96DD
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 17:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F011B60250
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 15:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A3525CC61;
	Mon,  5 May 2025 15:00:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D1258CE8
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457228; cv=none; b=P2EQexogpzygZM0kl00NN8PzQKAnYHUkUdcF1I4wLauiuNdEgeEEbJrBONV8aw/WQZwwHqDFMkr/I0+Pjm7S3lwhQHkGqFl1yiRcTl9DcFkJOZufiDX28wFdakLaLrXJqA6JyJlbEP3SCVW8C4Mczorrj4vOTSgVmXGTOkS8oFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457228; c=relaxed/simple;
	bh=Y8aNnlS7SWYfpI/5iO4tOdUHzXze8k7SD6RZ7ZHiRVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4BwMoMfHmqN2+0oFSvEF7B8a86uyNzXW40qq4vcNfEGSMk5hUNG4nfG/sLrt91ACq6o9yz9Qh+XGEPVsV0ncf5fEHxfK9QZvsXixiE/SLpZta1wRNZw/eKTnH9bEEyZGfrlEGlfNCzIqWZMre+M477OtGlGkdQWpbY3biDMzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FE8C4CEF1;
	Mon,  5 May 2025 15:00:21 +0000 (UTC)
Message-ID: <b53087ac-4754-4adf-86f1-260255575d6b@xs4all.nl>
Date: Mon, 5 May 2025 17:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
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
 Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede
 <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Stefan Klug <stefan.klug@ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <87v7qf5drb.fsf@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <87v7qf5drb.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/5/25 16:32, Mattijs Korpershoek wrote:
> Hello,
>
> On ven., mai 02, 2025 at 10:15, Hans Verkuil <hans@jjverkuil.nl> wrote:
>
>> Hi all,
>>
>> Here is my v4 of the draft (close to final) agenda for the media summit.
>>
>> Changes since v3: added more attendees, added a new topic (cgroups) from Maxime.
>> Please note that I slightly reduced the length of some of the topics since we
>> have a packed agenda. Please let me know if you think you need more (or less!)
>> time then I put you down for in the agenda. My experience is that it tends to
>> average out (some topics take more time than expected, some less), but a good
>> estimate helps. I also updated the lunch information.
>>
>> One important notice: it turned out that the meeting room does not actually have
>> dedicated video conference equipment. I'm trying to figure out a solution for this,
>> but for those that registered for remote attendance, be aware that it might not
>> work out or be of poor quality. I hope to have more information for you next week.
>>
>> We have 18 in-person attendees, which is in line with previous summits, even though
>> the time since the last summit is less than usual and we are co-located with a
>> different conference. It's good to know that those changes didn't impact the turn-out.
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
>> The meeting room is sponsored by Collabora and Cisco Systems Norway.
>> The lunch is sponsored by Ideas on Board. Many thanks to our sponsors
>> for making this Media Summit possible!
>>
>> We have the following confirmed in-person attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
>> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
>> Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
>> Hans de Goede <hdegoede@redhat.com> (Red Hat)
>> Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
>> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
>> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
>> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Maxime Ripard <mripard@redhat.com> (Red Hat)
>> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
>> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
>> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
>> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> I know the deadline was friday, but I'm only certain since today that
> I'll be able to travel :(
>
> Is it still possible to join or is it too late for this year?

That's why I allowed for late submissions :-)

I'll add you to the in-person attendee list.

See you next week!

    Hans

>
>> And the following remote participants:
>>
>> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
>> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
>> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
>> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
>> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>>
>> Note: information on how to connect remotely will come later. See also the notice
>> at the top of this email.
>>
>> If any information above is incorrect, or if I missed someone, then please let me know asap.
>>
>> Agenda:
>>
>> 9:00-9:30: Get settled :-)
>>
>> 9:30-9:40: Hans Verkuil: Quick introduction
>>
>> 9:40-10:25: Paul Kocialkowski: Stateless video encoding uAPI
>>
>> 10:25-11:15: Jai Luthra: Per-stream V4L2 controls
>>
>> 11:15-11:30: break
>>
>> 11:30-12:15: Sakari Ailus: Identifying camera modules
>>
>> 12:15-13:30: Lunch at L'Azur Bistrot Niçois
>>
>> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
>>
>> 14:00-14:50: Hans de Goede: Discuss V4L2 subdev API ambiguities
>>
>> 14:50-15:10: Jacopo Mondi: Unify the multi-context support with the m2m context handling
>>
>> 15:10-15:25: break
>>
>> 15:25-15:50: Maxime Ripard: V4L2 & cgroups memory accounting
>>
>> 15:50-16:35: Ricardo Ribalda: Openness Framework for ISPs
>>
>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
>>
>> Please reply with corrections, questions, etc. to the agenda.
>>
>> Regards,
>>
>> 	Hans


