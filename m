Return-Path: <linux-media+bounces-18303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB541979AC0
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 07:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C171F223E7
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 05:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB9341A8F;
	Mon, 16 Sep 2024 05:27:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C384084E
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726464453; cv=none; b=cHUq5eU9GAm+R3z8rp5ej2Yi6ZwttS57d4XdlHVNeJqJUMpiDGj402tZmrA5p2qQBQ7mOKwEzd/qZVli26dCcaexFWLzwk0gq0PXcUVdgBw4vp/vOV/Cizi25w+H+FSJrxs//p+lHyCnAM02jbXsaIj0ZJoMCfLFZ/IWEV9VXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726464453; c=relaxed/simple;
	bh=r7YmK9fFPNmJ2zPvcBeT58iIQFvc+o3P0IMfloGEfGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=pZ10hh5eoWFt4YgGIovhKUx4hgVF8LZ8e2g7TWargI1+5GQIYqNbukpQfTrgNxpQgkVIek27eTpfwwQLQMiIF0uBqtKJPMNf4cSTVukke/P7HI0cuaS+8GgdwpkmC9gMH/cFqY1mIox1wr9Xoufa+b6ofhaJN4AuxmwmcY1eV0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23001C4CEC4;
	Mon, 16 Sep 2024 05:27:24 +0000 (UTC)
Message-ID: <496a875e-e65b-4e43-a92e-0fd84678aa7d@xs4all.nl>
Date: Mon, 16 Sep 2024 07:27:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
To: "Hecht, Martin (Avnet Silica)" <Martin.Hecht@avnet.eu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
 Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Devarsh Thakkar <devarsht@ti.com>, "r-donadkar@ti.com" <r-donadkar@ti.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <87a594e0-7f3e-495f-af49-d8816870bac9@xs4all.nl>
 <FR4P281MB3434D01975FAC00E49F70CEAFD672@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: linux-media@vger.kernel.org
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <FR4P281MB3434D01975FAC00E49F70CEAFD672@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+linux-media

Sorry, I'd removed that in my previous reply, but some people may not 
have access to their company email while on the road, but are subscribed 
to linux-media with their private email.

So read the instructions below on where to find the Avnet office, and 
use WienMobil app to determine the route to the office, since Google 
Maps still thinks the U4 U-Bahn can get there, which isn't true due to 
flooding.

Regards,

	Hans

On 9/16/24 1:03 AM, Hecht, Martin (Avnet Silica) wrote:
> Hi all,
> 
> please apologize the late update.
> 
> When you arrive at Schoenbrunner Strasse 297 please use the vehicle entry to enter the area und walk through the tunnel to pass the first building. Turn to right and walk until you see the entrance of the building in the second row of that area labelled with "Grunbergstrasse 15 - Stiege 1" above a glass door. This is the correct entry and you will see a white plate showing the names "Avnet" and "EBV".
> Please take the lift and go up to meet us in the Avnet office at Level 4.
> 
> If you need further assistance, please don't hesitate to send me an email or call me on my mobile phone +491728906019.
> 
> BR Martin
> 
> 
> ________________________________________
> Von: Hans Verkuil <hverkuil@xs4all.nl>
> Gesendet: Sonntag, 15. September 2024 17:10
> An: Sakari Ailus; Daniel Almeida; Mauro Carvalho Chehab; Sebastian Fricke; Hecht, Martin (Avnet Silica); Tommaso Merciai; Jacopo Mondi; Benjamin Mugnier; Laurent Pinchart; Ricardo Ribalda; Michael Tretter; Alain Volmat; Sean Young; Steve Cho; Tomasz Figa; Hidenori Kobayashi; Hu, Jerry W; Suresh Vankadara; Devarsh Thakkar; r-donadkar@ti.com; Dave Stevenson; Mehdi Djait; Nicolas Dufresne; Salahaldeen Altous
> Betreff: [External]Re: [ANN] Media Summit September 16th: Final Agenda (v7)
> 
> Hi all,
> 
> The large amount of rain in Vienna affected the public transport, in
> particular the U4 U-Bahn is partially closed, including the station
> closest to the Avnet office. I noticed that Google Maps still doesn't
> take that into account when calculating the route to take. Instead I
> advice to use the WienMobil app, that is kept up to date.
> 
> For me it means 15-20 minutes extra travel time.
> 
> Another problem is that I couldn't find the entrance to the Avnet office
> when I went there on Saturday (scouting the place!). Schönbrunner Str.
> 297 is easy enough to find, but I couldn't find Avnet mentioned on the
> list of companies at either entrance.
> 
> Martin Hecht will try to figure that out, so hopefully he can give an
> update later today.
> 
> Regards,
> 
>          Hans
> 
> On 9/11/24 11:03 AM, Hans Verkuil wrote:
>> Hi all,
>>
>> Here is my seventh and final version of the agenda for the media summit. As always,
>> all times (except lunch time) are guesstimates!
>>
>> The media summit will be held on Monday September 16th. Avnet Silica has very
>> kindly offered to host this summit at their Vienna office, which is about 35
>> minutes by public transport from the Open Source Summit Europe venue
>> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>>
>> Avnet Silica Office Location:
>>
>> Schönbrunner Str. 297/307, 1120 Vienna, Austria
>>
>> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
>>
>> Refreshments are available during the day.
>>
>> Lunch is held at Schönbrunner Stöckl (https://www.schoenbrunnerstoeckl.com/), close
>> to the Avnet Silica office. The lunch is sponsored by Ideas on Board and Cisco Systems
>> Norway.
>>
>> Regarding the face mask policy: we will follow the same guidance that the
>> Linux Foundation gives for the EOSS conference:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
>>
>>
>> In-Person Attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
>> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera AG)
>> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintainer)
>> Steve Cho <stevecho@chromium.org> (Google)
>> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
>> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
>> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
>> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
>> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
>> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
>> Sean Young <sean@mess.org>
>> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
>>
>> Remote Attendees (using MS Teams):
>>
>> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
>> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
>> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
>> Tomasz Figa <tfiga@chromium.org> (Google)
>> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
>> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
>> Devarsh Thakkar <devarsht@ti.com> (TI)
>>
>> All remote participants listed above should have received an invite with connection details.
>> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
>>
>> If any information above is incorrect, or if I missed someone, then please let me know.
>>
>> We have 18 confirmed in-person participants, so we're full.
>> If you want to join remotely, then contact me and I'll add you to that list.
>>
>> Draft agenda:
>>
>> 8:45-9:15: Get settled :-)
>>
>> 9:15-9:25: Hans: Quick introduction
>>
>> 9:25-11:00: Ricardo: multi-committer model using gitlab
>>
>> 11:00-11:15: break
>>
>> 11:15-12:15: Jacopo: Multi-context support in V4L2
>>
>> 12:15-13:30: Lunch at Schönbrunner Stöckl
>>
>> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and the paths forward.
>>
>> 14:00-14:45: Laurent: subdevs, state, and usage of the media controller device to submit requests.
>>
>> 14:45-15:00: break
>>
>> 15:00-15:30: Sean: new tooling for infrared:
>>
>> - What it is and what it can do (love to hear any feedback of course)
>> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
>> - What needs to be in place for a release?
>> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
>>
>> 15:30-16:00: Daniel: Rust in the media subsystem
>>
>> 16:00-16:15: break
>>
>> 16:15-16:30: Hans: UVC maintenance
>>
>> 16:30-17:00: Steve Cho:
>>
>> - V4L2 testing on Chromium using virtual video decode driver (visl)
>> - V4L2 video decoding testing with KernelCI
>>
>> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
>> See here for more info:
>> https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.ideasonboard.com/
>>
>> 17:30-18:00: Any other topics and feedback on what can be improved next media summit.
>>
>> Hope to see you all on Monday!
>>
>> Regards,
>>
>>        Hans
>>
>>
>>
> 
> We continuously commit to comply with the applicable data protection laws and ensure fair and transparent processing of your personal data.
> Please read our privacy statement including an information notice and data protection policy for detailed information on our website.

