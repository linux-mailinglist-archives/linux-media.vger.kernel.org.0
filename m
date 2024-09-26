Return-Path: <linux-media+bounces-18600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16113986D8F
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9796E1F24BD5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 07:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE0618C03C;
	Thu, 26 Sep 2024 07:27:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85054186298
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335647; cv=none; b=Ec7XS8RsV2YnRYZjfeWrvTINiGbsnRlWrfGzx7rgTm7gUF3SQggJ+3MukRCFwGdkKc+AHKOsys6GG++4jH+BmpR2LGI8Hz8JhEMu1h26W1F2ql7QCvL6EJYdvXrmmD7zLFk1VHabObjMptMqUfnoQNqxxV9zk7AZVlSI58GapUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335647; c=relaxed/simple;
	bh=Ky/aAiaEpWOGTYGQT2Nx/HaOo9Q+RUmxqQbAnHAzDf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUgSzHykZ2NsY3N2XEf5+K5iMr0Yid3dMEuupSpQKv8TPx8wzLNAuUT2sexgN/3Q8gdpHgpiRQUPldO4XPnNAcBNc+hrGOQpRS8paegLcdsSgdK35OD9uenq1CG6hAbmq99NB83/N+AR7iBwo4Ryp07xpDqMiPkRWRfWKVtVVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD07C4CEC5;
	Thu, 26 Sep 2024 07:27:21 +0000 (UTC)
Message-ID: <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
Date: Thu, 26 Sep 2024 09:27:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Martin Hecht <martin.hecht@avnet.eu>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
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
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240925195843.GK30399@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 21:58, Laurent Pinchart wrote:
> Hi Mauro,
> 
> On Wed, Sep 18, 2024 at 09:24:54AM +0200, Mauro Carvalho Chehab wrote:
>> Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:
>>> On 9/17/24 11:17 AM, Sebastian Fricke wrote:
>>>> Greetings,
>>>>
>>>> I remember that we wanted to still define a couple of processes for the
>>>> multi-committer model for which we hadn't have the time on the media
>>>> summit. Just would like to gather who would be interested to meet for
>>>> that, where we meet (probably LPC venue) and when (Laurent just told me
>>>> that Friday is probably a good slot for that).  
>>>
>>> Can you refresh my memory which processes need more work?
>>
>> I have the same doubt. As discussed during the summit, Hans and I had some
>> discussions yesterday, to address a few details. For both of us the process
>> sounds well defined.
>>
>> From my personal notes, this will be the new process:
>>
>> - committers will merge patches at media-committers.git tree at fdo,
>>   provided that they'll follow the rules defined on a committers agreement
>>   and (partially?) enforced by media-ci checks;
>> - core committers follow the same rules, with a broader privilege of
>>   changing kernel API/ABI;
>> - committers will ensure that patchwork will reflect the review process of
>>   the patches;
>> - maintainers will double-check if everything is ok and, if ok, merge the
>>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
>>   being the main tree to be used for development;
>> - pull requests will keep using the same process as currently. The only
>>   change is that the media-stage.git tree will be renamed to "media.git";
>> - maintainers will periodically send patches upstream.
>>
>> The media-commiters.git tree at fdo might be rebased if needed; the 
>> media.git tree at linuxtv.org is stable. A large effort will be taken to
>> avoid rebasing it.
>>
>> We may need some helper scripts and/or use pwclient to keep patchwork
>> updated after committers reviews.
> 
> What will happen if we update the status of patches in patchwork when
> merging them to the fdo tree, and the tree is later rebased to drop
> commits ? Will the person rebasing handle updating patchwork to move the
> patches back from accepted to a different status ?

That should be the responsibility of the person doing the rebase. I think
that's what is done today as well in the rare cases we rebase.

Regards,

	Hans

> 
>> Such process will start after -rc1. 
>>
>> We intend to rename media-state to media at linuxtv after -rc1.
>>
>> It is up to maintainers to invite and decide who will be a committer.
>>
>> All committers/core-committers need to explicitly accept a committers
>> agreement. We may end starting without it at the beginning, but as soon
>> as a final version of such agreement is written, everyone with access to
>> the media-committers tree have to explicitly accept to keep their
>> commit rights on such tree.
>>
>> The only part that still require some work is the committers
>> agreement. I'm working on it together with Hans. As soon as we have
>> a version, we'll submit a patch to the kernel, to add it to the
>> media developer's profile[1].
>>
>> [1] Documentation/driver-api/media/maintainer-entry-profile.rst
>>
>>> For me I think Friday afternoon (probably after 14:00) is the only 
>>> option, or perhaps Thursday after the Camera MC.
>>
>> I can't meet on Friday afternoon. I probably will be on another
>> event on Thursday (Openeuler MC).
>>
>>>> On 11.09.2024 11:03, Hans Verkuil wrote:  
>>>>> Hi all,
>>>>>
>>>>> Here is my seventh and final version of the agenda for the media 
>>>>> summit. As always,
>>>>> all times (except lunch time) are guesstimates!
>>>>>
>>>>> The media summit will be held on Monday September 16th. Avnet Silica 
>>>>> has very
>>>>> kindly offered to host this summit at their Vienna office, which is 
>>>>> about 35
>>>>> minutes by public transport from the Open Source Summit Europe venue
>>>>> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>>>>>
>>>>> Avnet Silica Office Location:
>>>>>
>>>>> Schönbrunner Str. 297/307, 1120 Vienna, Austria
>>>>>
>>>>> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
>>>>>
>>>>> Refreshments are available during the day.
>>>>>
>>>>> Lunch is held at Schönbrunner Stöckl 
>>>>> (https://www.schoenbrunnerstoeckl.com/), close
>>>>> to the Avnet Silica office. The lunch is sponsored by Ideas on Board 
>>>>> and Cisco Systems
>>>>> Norway.
>>>>>
>>>>> Regarding the face mask policy: we will follow the same guidance that the
>>>>> Linux Foundation gives for the EOSS conference:
>>>>>
>>>>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
>>>>>
>>>>>
>>>>> In-Person Attendees:
>>>>>
>>>>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>>>>> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
>>>>> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera 
>>>>> AG)
>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel 
>>>>> Maintainer)
>>>>> Steve Cho <stevecho@chromium.org> (Google)
>>>>> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
>>>>> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
>>>>> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
>>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
>>>>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>>>>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>>>>> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
>>>>> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
>>>>> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
>>>>> Sean Young <sean@mess.org>
>>>>> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
>>>>>
>>>>> Remote Attendees (using MS Teams):
>>>>>
>>>>> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
>>>>> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
>>>>> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
>>>>> Tomasz Figa <tfiga@chromium.org> (Google)
>>>>> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
>>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
>>>>> Devarsh Thakkar <devarsht@ti.com> (TI)
>>>>>
>>>>> All remote participants listed above should have received an invite 
>>>>> with connection details.
>>>>> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
>>>>>
>>>>> If any information above is incorrect, or if I missed someone, then 
>>>>> please let me know.
>>>>>
>>>>> We have 18 confirmed in-person participants, so we're full.
>>>>> If you want to join remotely, then contact me and I'll add you to that 
>>>>> list.
>>>>>
>>>>> Draft agenda:
>>>>>
>>>>> 8:45-9:15: Get settled :-)
>>>>>
>>>>> 9:15-9:25: Hans: Quick introduction
>>>>>
>>>>> 9:25-11:00: Ricardo: multi-committer model using gitlab
>>>>>
>>>>> 11:00-11:15: break
>>>>>
>>>>> 11:15-12:15: Jacopo: Multi-context support in V4L2
>>>>>
>>>>> 12:15-13:30: Lunch at Schönbrunner Stöckl
>>>>>
>>>>> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and 
>>>>> the paths forward.
>>>>>
>>>>> 14:00-14:45: Laurent: subdevs, state, and usage of the media 
>>>>> controller device to submit requests.
>>>>>
>>>>> 14:45-15:00: break
>>>>>
>>>>> 15:00-15:30: Sean: new tooling for infrared:
>>>>>
>>>>> - What it is and what it can do (love to hear any feedback of course)
>>>>> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
>>>>> - What needs to be in place for a release?
>>>>> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
>>>>>
>>>>> 15:30-16:00: Daniel: Rust in the media subsystem
>>>>>
>>>>> 16:00-16:15: break
>>>>>
>>>>> 16:15-16:30: Hans: UVC maintenance
>>>>>
>>>>> 16:30-17:00: Steve Cho:
>>>>>
>>>>> - V4L2 testing on Chromium using virtual video decode driver (visl)
>>>>> - V4L2 video decoding testing with KernelCI
>>>>>
>>>>> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
>>>>> See here for more info:
>>>>> https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.ideasonboard.com/
>>>>>
>>>>> 17:30-18:00: Any other topics and feedback on what can be improved 
>>>>> next media summit.
>>>>>
>>>>> Hope to see you all on Monday!
> 


