Return-Path: <linux-media+bounces-18330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75A97B064
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D6EEB20A3C
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 12:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9996E174EEB;
	Tue, 17 Sep 2024 12:52:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F1916F824
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577547; cv=none; b=sKhRN0WDLf/g5yFmRHHhAcOIAmq3ufOd0rDeTZlMTr+1U/bO/e6oQR1/reFGrc/x1Nt6dwc8HEfK0eqTjSFoFEy3qONLo3YXEP+xBhAbNhGHNbGMpCQ1jHRHcXOtVU/8B0alkASk/hsm5DiNC+3XMuo6yWGJ1dx0Y5CosLjB9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577547; c=relaxed/simple;
	bh=7adAhp9KomAz80dCJ2q5TZ6xYR3e8UW+NN4jWuhG9y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKgJUPGyE+hLRPFLqE80PbWTCRaENuygOcbdFxXWn7uZBNHP6J24MjdkTxy1TvEkOY4+wGXX3sWN7B+vAZ1TUzaQrBJ8wCMDm0ORRq8SusVDLNW4+m7TAzBajTJmC1PVpQWF1tmC64MdqZaxBN7PYAzf57Pmcxxpxp30EuV7HiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A85C4CEC5;
	Tue, 17 Sep 2024 12:52:21 +0000 (UTC)
Message-ID: <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
Date: Tue, 17 Sep 2024 14:52:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Martin Hecht <martin.hecht@avnet.eu>,
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
 Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sebastian,

On 9/17/24 11:17 AM, Sebastian Fricke wrote:
> Greetings,
> 
> I remember that we wanted to still define a couple of processes for the
> multi-committer model for which we hadn't have the time on the media
> summit. Just would like to gather who would be interested to meet for
> that, where we meet (probably LPC venue) and when (Laurent just told me
> that Friday is probably a good slot for that).

Can you refresh my memory which processes need more work?

For me I think Friday afternoon (probably after 14:00) is the only 
option, or perhaps Thursday after the Camera MC.

Regards,

	Hans

> 
> Regards,
> Sebastian
> 
> On 11.09.2024 11:03, Hans Verkuil wrote:
>> Hi all,
>>
>> Here is my seventh and final version of the agenda for the media 
>> summit. As always,
>> all times (except lunch time) are guesstimates!
>>
>> The media summit will be held on Monday September 16th. Avnet Silica 
>> has very
>> kindly offered to host this summit at their Vienna office, which is 
>> about 35
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
>> Lunch is held at Schönbrunner Stöckl 
>> (https://www.schoenbrunnerstoeckl.com/), close
>> to the Avnet Silica office. The lunch is sponsored by Ideas on Board 
>> and Cisco Systems
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
>> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera 
>> AG)
>> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel 
>> Maintainer)
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
>> All remote participants listed above should have received an invite 
>> with connection details.
>> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
>>
>> If any information above is incorrect, or if I missed someone, then 
>> please let me know.
>>
>> We have 18 confirmed in-person participants, so we're full.
>> If you want to join remotely, then contact me and I'll add you to that 
>> list.
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
>> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and 
>> the paths forward.
>>
>> 14:00-14:45: Laurent: subdevs, state, and usage of the media 
>> controller device to submit requests.
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
>> 17:30-18:00: Any other topics and feedback on what can be improved 
>> next media summit.
>>
>> Hope to see you all on Monday!
>>
>> Regards,
>>
>>     Hans
>>
>>
>>
> Sebastian Fricke
> Consultant Software Engineer
> 
> Collabora Ltd
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales no 5513718.

