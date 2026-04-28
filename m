Return-Path: <linux-media+bounces-59850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDxiDuWy8GnsXQEAu9opvQ
	(envelope-from <linux-media+bounces-59850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:15:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F3485A5F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECD3530BF97E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C101943E486;
	Tue, 28 Apr 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXgZQng4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A53FD159
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381255; cv=none; b=A528Ly65j5v0WwgnM0rBMBdhzRW2wRNIshRN1MYT+DuttafM8CVVx099jNUKdEDW1A5USzFZTpMbGk2KnmwyzHLLRF7pKoPyBOj7Wrh6pHopbDEA37xjzQyu7erDK7H5LrXlfan9RNMiu85uu925zwuuPLYJQQrxw8k3u2JkBNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381255; c=relaxed/simple;
	bh=ieb2r/twWnV/isBnzuwPMiRmz8sg8UZIvfG51cjzCps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvP/zp6iUMLIG9rTB+NzDcHYjlkiBUT7WcQL0XLJ7uXg+1+L7vMbX6x5Wv+pM+jIAmWLNNp1nFAdHw9TNUfW7ejxC9feAnIheEY16JKgL9t7c7HJlr7awgUPTBdv9jEbqWgu0kojd3b3cqRUMHErUCvwg5K7KIjA+zxdJCeM6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXgZQng4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F162C2BCAF;
	Tue, 28 Apr 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777381253;
	bh=ieb2r/twWnV/isBnzuwPMiRmz8sg8UZIvfG51cjzCps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fXgZQng4x0qqqlaRX7YTFAhT1s3UtMc9V7b4yEGEULHMcsUhuNq+0l/kznWDAC8K9
	 3xkNQsIakjqKkx7pPBASfn8Dytw+keXMFvHItmGt6QlarMLX9G3ZyuM1ECZ3Iiu/Nt
	 nIltKjVyfz2ncgORJI4wS4uunpVH6lKwMf8bYGleoKX0x6egtojLLznWzHbuPWpjNg
	 TY1xS+eEdyjkck6mf78AB+fgF0jJYRnbmktQ+hq5rtnPX3PaXq5E1+bRomZWod11Xm
	 5YMVrJbAMWCIW9nwg52Qon2iWBYbvccgCpZlzDgsnM6lsvM8stlTf+Sfme9BWId8wQ
	 FqW7ApGAGg4mQ==
Message-ID: <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org>
Date: Tue, 28 Apr 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Brnich <b-brnich@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Devarsh Thakkar <devarsht@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar"
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <Anthony.McGivern@arm.com>
References: <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
 <20260413201907.GD4034@killaraus.ideasonboard.com>
 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com>
 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
 <20260414074230.GB4061@killaraus.ideasonboard.com>
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
 <20260414084259.GC4061@killaraus.ideasonboard.com> <afCmQhSbQLDb6gvo@zed>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <afCmQhSbQLDb6gvo@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9A7F3485A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-59850-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[39];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/28/26 14:30, Jacopo Mondi wrote:
> Hello
> 
> On Tue, Apr 14, 2026 at 11:42:59AM +0300, Laurent Pinchart wrote:
>> On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
>>> On Tue, Apr 14, 2026 at 9:42 AM Laurent Pinchart wrote:
>>>> On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
>>>>> On 4/14/26 08:55, Ricardo Ribalda wrote:
>>>>>> On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>>>>>> On 13/04/2026 23:16, Laurent Pinchart wrote:
>>>>>>>> On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrote:
>>>>>>>>> Le lundi 13 avril 2026 à 23:19 +0300, Laurent Pinchart a écrit :
>>>>>>>>>> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
>>>>>>>>>>> Hi Hans,
>>>>>>>>>>>
>>>>>>>>>>> I would be happy to discuss this if a slot is available:
>>>>>>>>>>>
>>>>>>>>>>> Title: Generic V4L2 ISP M2M framework
>>>>>>>>>>> Presenter: Loic Poulain
>>>>>>>>>>> Time estimate: ~20min
>>>>>>>>>>> Description: During early development of a Qualcomm Offline Image
>>>>>>>>>>> Processing Engine (OPE), we relied on the V4L2 memory‑to‑memory
>>>>>>>>>>> (v4l2‑m2m) framework, which is widely used and provides solid support
>>>>>>>>>>> for buffer management and scheduling. However, applying it to an ISP
>>>>>>>>>>> use case exposes limitations: ISP engines often require a richer media
>>>>>>>>>>> graph, with multiple pads and metadata flows, similar to inline ISP
>>>>>>>>>>> pipelines (params, stats, outputs). This talk proposes discussing the
>>>>>>>>>>> need for and design of a common V4L2 ISP M2M framework to factor out
>>>>>>>>>>> shared functionality across drivers, particularly around buffer/queue
>>>>>>>>>>> management and job scheduling.
>>>>>
>>>>> It seems that we share some pain points.. :-) :-/
>>>>>
>>>>> Over the last year, some ideas have been brewing in my mind. Not
>>>>> necessarily *my* ideas, mind you, rather ideas that have been around in
>>>>> linux-media for quite a while, actually. What I would like to prepare
>>>>> for the Media Summit goes along the same lines.
>>>>>
>>>>>>>>>> That's well aligned with the v4l2-isp framework that Jacopo started, and
>>>>>>>>>> to the multi-context and media-jobs APIs that we have proposed. I
>>>>>>>>>> wonder, however, if a short session at the media summit will be enough,
>>>>>>>>>> or if we should try to organize a half day brainstorming workshop at
>>>>>>>>>> some point. Depending on when the people interested in this topic plan
>>>>>>>>>> to arrive, Monday could be an option.
>>>>>>>>>
>>>>>>>>> I'm also/still interested in the multi-context for m2m decoders that have inline
>>>>>>>>> post-processing capabilities (current model forces us to waste a lot of RAM). We
>>>>>>>>> just restarted some design discussion with the team, with an increased
>>>>>>>>> confidence that multi-context is the way. The scheduler could come handy in the
>>>>>>>>> future if we get to deal with more multi-stage codecs in the future. I'll be in
>>>>>>>>> Nice all day Monday.
>>>>>>>>
>>>>>>>> I will unfortunately be available only until 15:00 on Monday, but Jacopo
>>>>>>>> should be available through the day. Let's see who would be interested
>>>>>>>> and available, and try to organize something.
>>>>>>>
>>>>>>> I'm available on Monday as well. I think this is a topic that is well suited
>>>>>>> to a brainstorm session.
>>>>>>
>>>>>> I am also available on Monday and would like to attend the session.
>>>>>
>>>>> I'd be interested too. Right now the plan is to arrive on Monday
>>>>> afternoon. Depending on what time you agree on it may work out anyway.
>>>>> It would be great to know the exact time this session will start (as I
>>>>> might need to adjust my travel arrangements).
>>>
>>> I can arrive on Monday, with a preference for the afternoon.
>>>
>>>> We need a volunteer to organize this, as in finding and booking a
>>>> meeting space. Note that Monday is a public holiday in France (Monday
>>>> the 25th of May in particular, not all Mondays).
>>>>
>>>> If the number of attendees was small I was thinking of hosting the event
>>>> in the place where the Ideas on Board team will be staying, but it looks
>>>> like we're already reaching a fair number of people.
>>>>
> 
> Are we still considering this BoF session ?
> 
> We would someone to volunteer organizing this, at @IoB we're quite
> full for the week and we might have an hard time organizing this one
> on top of the libcamera workshop.
> 
> As Laurent said, that Monday is a public holiday in France, and
> getting a room somewhere might be complicated.
> 
> We can host some people in the location where we're having the yearly IoB
> get-together, but you should arrange your travel there (35 minutes
> from Nice by car).
> 
> If we get a volunteer we can should maybe a dedicated mail thread as this one
> was about the Media Summit ?

If the number of people can be kept low (say <= 6), then it shouldn't be a
problem to just find a hotel restaurant or similar, close to the place of
the media summit, and just sit together.

Who would be the key people for this? And who are 'nice to have'? :-)
I think I probably fit more in the latter category than the first.

Regards,

	Hans

> 
> 
>>>>>> Regards!
>>>>>>
>>>>>>> The agenda for the media summit is getting quite full, and I agree with Laurent
>>>>>>> that 20 minutes is likely not enough. If we can so a session on Monday instead,
>>>>>>> then that would be a good solution.
>>>>>
>>>>> Apart from the time and date the scope of this session would be interesting.
>>>>>
>>>>> Will this be a birds of a feather session in which the next generation
>>>>> kernel ISP framework will be discussed? Or even the next generation
>>>>> kernel video processing framework, where video processing is image
>>>>> signal processing, encoding/decoding, 2D graphics processing (fisheye
>>>>> correction units, 2D GPU such as the Rockchip RGA3, ...)?
>>>>
>>>> I would focus on Loic's original scope. If the solution can be used for
>>>> other devices that's great too. I believe that the current multi-context
>>>> patch series is a good fit for codecs. If we broaden the scope too much
>>>> right away we'll achieve nothing.
>>>>
>>>>>>> I have never been very enthusiastic about the m2m framework: it's fine for e.g.
>>>>>>> simple scalers, but it's awkward to use for codecs let alone ISPs.
>>>>>>>
>>>>>>> I always felt that we really need variants of the m2m framework that are customized
>>>>>>> to specific use-cases: i.e. a codec m2m framework, and (perhaps) an ISP m2m framework.
>>>>>>>
>>>>>>> The big problem with that is of course who will do the work. Making new frameworks
>>>>>>> is difficult and takes a long time.
>>>
>>> A couple of weeks ago, I submitted an initial driver for a Qualcomm
>>> Offline ISP based on the standard v4l2-m2m framework. Following
>>> discussions around which parts could be generalized, I started
>>> migrating this work to a new v4l2-isp-m2m framework:
>>> (https://github.com/loicpoulain/linux/commit/5d575d7eff8f2371e91d8237148ffdb44b0af5b0).
>>
>> I definitely want to discuss this, but I will be available on Monday
>> until 15:00 only.
>>
>>> The API and overall logic closely mirror v4l2-m2m.c, but are extended
>>> to address ISP‑specific requirements such as multi‑device support and
>>> multiple queue handling.
>>
>> That part I don't like. The V4L2 M2M framework is a big mid-layer that
>> prevents drivers from having control of how operations are handled. It
>> does too much, and doesn't give enough flexibility to drivers. It may
>> have been fine when the framework was designed, for the devices we had
>> back then, but today it's just painful. I want to turn this around and
>> give control to the drivers, with helpers they can use to implement
>> parts that are not driver-specific. This needs to be opt-in, not a layer
>> that takes completely control between the uAPI and driver operations.
>>
>> Let's not reproduce the design mistakes made in the V4L2 M2M framework.
>>
>> I also think you need to decouple the context handling and scheduling in
>> two separate components. They need to work together, but shouldn't be
>> bundled into a monolithic system. Very importantly, a driver should be
>> able to implement contexts with the multi-context helpers, and implement
>> custom scheduling itself.
>>
>>> I am planning to submit this work as an RFC
>>> before the Media Summit. At this stage, the framework is still fairly
>>> basic and primarily tailored to the Qualcomm use case. There is
>>> definitely room for improvement, for example, integrating Jacopo’s
>>> multi‑context support, since for now, the Qualcomm driver simply
>>> instantiates a single ISP‑M2M context.
>>>
>>> As I am still getting familiar with the media subsystem, this work may
>>> overlap with or conflict with ongoing efforts. Synchronizing seems
>>> indeed important. Based on my current understanding, there are several
>>> related areas of work that appear either complementary or orthogonal:
>>> - Multi‑context support, to instantiate multiple processing sessions
>>> on shared hardware/driver.
>>> - Media jobs, to synchronize work across multiple drivers within the
>>> same media pipeline.
>>> - ISP M2M, aiming to provide a v4l2-m2m‑like framework specifically
>>> for memory‑to‑memory ISP devices.
>>>
>>>>> This may be naive and overly optimistic, but I feel there is quite a
>>>>> number of people sharing the same pain points (which are similar to
>>>>> those Loic pointed out). Maybe (hopefully) this birds of a feather
>>>>> session leads to the formation of some work group?
>>>>>
>>>>>>>>>>> On Sun, Apr 12, 2026 at 12:25 PM Hans Verkuil wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> (Please pass this on to anyone you think might be interested in this!)
>>>>>>>>>>>>
>>>>>>>>>>>> Hi all,
>>>>>>>>>>>>
>>>>>>>>>>>> This is the fourth version of this announcement, updating the list of attendees
>>>>>>>>>>>> and the tentative agenda at the end: please let me know if you see mistakes.
>>>>>>>>>>>> Note that there is still time for one or two other topics. Also please check
>>>>>>>>>>>> the agenda if you need more (or perhaps less) time for your topic.
>>>>>>>>>>>>
>>>>>>>>>>>> This year's Media Summit will be held on Tuesday May 26th the day before the
>>>>>>>>>>>> Embedded Recipes Conference in Nice, France:
>>>>>>>>>>>>
>>>>>>>>>>>> https://embedded-recipes.org/2026/
>>>>>>>>>>>>
>>>>>>>>>>>> The Media Summit will be held at Hotel Campanile and in the same meeting room
>>>>>>>>>>>> as last year (Nikaia):
>>>>>>>>>>>>
>>>>>>>>>>>> https://nice-aeroport.campanile.com/en-us/
>>>>>>>>>>>>
>>>>>>>>>>>> It is close to the Airport and to the Embedded Recipes venue.
>>>>>>>>>>>>
>>>>>>>>>>>> The meeting room can hold up to 30 people and I will provide video conferencing support,
>>>>>>>>>>>> just like last year. The location and the meeting room was quite nice last year, so
>>>>>>>>>>>> I saw no need to change it.
>>>>>>>>>>>>
>>>>>>>>>>>> That said, in-person participation is very much preferred. This yearly summit is meant
>>>>>>>>>>>> for active media developers to meet face-to-face and to discuss media subsystem issues.
>>>>>>>>>>>>
>>>>>>>>>>>> And it is also a good opportunity to talk to each other during the Embedded Recipes
>>>>>>>>>>>> conference to discuss topics in a smaller group. But if you are an active media developer
>>>>>>>>>>>> and are really not able to attend in person, then remote participation is an option.
>>>>>>>>>>>>
>>>>>>>>>>>> If you want to attend the meeting (either in person or remote), then send an email to me
>>>>>>>>>>>> directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
>>>>>>>>>>>> final number of attendees by then.
>>>>>>>>>>>>
>>>>>>>>>>>> There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
>>>>>>>>>>>> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
>>>>>>>>>>>> appreciated.
>>>>>>>>>>>>
>>>>>>>>>>>> If you have a topic that you want to discuss, just 'Reply All' to this announcement
>>>>>>>>>>>> and give the topic title, a short description and a guesstimate of the time you need
>>>>>>>>>>>> for your topic.
>>>>>>>>>>>>
>>>>>>>>>>>> See last year's Media Summit Report as an example of what to expect:
>>>>>>>>>>>>
>>>>>>>>>>>> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>>
>>>>>>>>>>>>         Hans
>>>>>>>>>>>>
>>>>>>>>>>>> PS: Be aware that May 24 and 25 are public holidays in France. So many
>>>>>>>>>>>> shops may be
>>>>>>>>>>>> closed those days.
>>>>>>>>>>>>
>>>>>>>>>>>> In-person attendees:
>>>>>>>>>>>> Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>>>>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
>>>>>>>>>>>> Brandon Brnich <b-brnich@ti.com>
>>>>>>>>>>>> Rouven Czerwinski <rouven.czerwinski@linaro.org>
>>>>>>>>>>>> Mehdi Djait <mehdi.djait@linux.intel.com>
>>>>>>>>>>>> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>>>>>>> Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>>>>>>>> Marco Felsch <m.felsch@pengutronix.de>
>>>>>>>>>>>> Paul Kocialkowski <paulk@sys-base.io>
>>>>>>>>>>>> Jai Luthra <jai.luthra@ideasonboard.com>
>>>>>>>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>>>>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>>>>>>>>>> Beleswar Padhi <b-padhi@ti.com>
>>>>>>>>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>>>>>>> Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>>>>>> Sven Püschel <s.pueschel@pengutronix.de>
>>>>>>>>>>>> Ricardo Ribalda <ribalda@chromium.org>
>>>>>>>>>>>> Michael Riesch <michael.riesch@collabora.com>
>>>>>>>>>>>> Devarsh Thakkar <devarsht@ti.com>
>>>>>>>>>>>> Michael Tretter <m.tretter@pengutronix.de>
>>>>>>>>>>>> Hans Verkuil <hverkuil@kernel.org>
>>>>>>>>>>>>
>>>>>>>>>>>> Remote attendees:
>>>>>>>>>>>> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>>>>>>>>>> Rishikesh Donadkar <r-donadkar@ti.com>
>>>>>>>>>>>> Jackson Lee <jackson.lee@chipsnmedia.com>
>>>>>>>>>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Agenda (tentative):
>>>>>>>>>>>>
>>>>>>>>>>>> 8:45-9:20: Arrive, settle in
>>>>>>>>>>>>
>>>>>>>>>>>> 9:20-9:30: Short intro (Hans Verkuil)
>>>>>>>>>>>>
>>>>>>>>>>>> 9:30-9:45: Status of ISP support in V4L2
>>>>>>>>>>>>         Presenter: Laurent Pinchart
>>>>>>>>>>>>         Description: Summary of ISP-related development in V4L2 since the last
>>>>>>>>>>>>         Linux Media Summit. This includes a brief overview of technical
>>>>>>>>>>>>         developments, and a summary of the efforts to engage with vendors.
>>>>>>>>>>>>
>>>>>>>>>>>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
>>>>>>>>>>>>         Presenter: Paul Kocialkowski
>>>>>>>>>>>>         Description: An update on the ongonig work to support stateless codecs in V4L2.
>>>>>>>>>>>>         Some of the remaining open topics will be presented and discussed.
>>>>>>>>>>>>
>>>>>>>>>>>> 10:45-11:00: break
>>>>>>>>>>>>
>>>>>>>>>>>> 11:00-11:30: Vulkan Video Codecs
>>>>>>>>>>>>         Presenter: Nicolas Dufresne
>>>>>>>>>>>>         Description: Vulkan video codecs: what are the viable options for Linux Media
>>>>>>>>>>>>         and what is in preparation outside of our subsystem. The second aspect is
>>>>>>>>>>>>         informative as these discussions don't seem to lean toward our subsystem as the
>>>>>>>>>>>>         foundation. But I think it's rather useful for everyone to understand why and
>>>>>>>>>>>>         what is included.
>>>>>>>>>>>>
>>>>>>>>>>>> 11:30-12:00: Protected Video playback on i.MX8MQ
>>>>>>>>>>>>         Presenter: Rouven Czerwinski
>>>>>>>>>>>>         Description: Introduction to protected video playback
>>>>>>>>>>>>         on i.MX8MQ and missing bits for linux-media & protected heap interoperability.
>>>>>>>>>>>>
>>>>>>>>>>>> 12:00-13:30: Lunch
>>>>>>>>>>>>
>>>>>>>>>>>> 13:30-14:00: HDCP support for HDMI receivers
>>>>>>>>>>>>         Presenter: Hans Verkuil
>>>>>>>>>>>>         Description: I have been working on adding HDCP support for HDMI receivers.
>>>>>>>>>>>>         Specifically the HDCP negotiation between sources and sinks.
>>>>>>>>>>>>
>>>>>>>>>>>> 14:00-14:30: AI patches
>>>>>>>>>>>>         Presenter: Sakari Ailus
>>>>>>>>>>>>         Description: What is our policy w.r.t. AI generated patches?
>>>>>>>>>>>>
>>>>>>>>>>>> 14:30-15:00 Overview of Media CI: where do pipelines run?
>>>>>>>>>>>>         Presenter: Ricardo Ribalda
>>>>>>>>>>>>         Description: How are jobs in pipelines assigned? How does the infrastructure
>>>>>>>>>>>>         for Media CI work? Are there things that can be tweaked to make it more
>>>>>>>>>>>>         reliable?
>>>>>>>>>>>>
>>>>>>>>>>>> 15:00-15:15: Break
>>>>>>>>>>>>
>>>>>>>>>>>> 15:15-16:15: Discussion of the media subsystem development process
>>>>>>>>>>>>         Presenter: Hans Verkuil
>>>>>>>>>>>>         Description: Review of the multi-committer model: current status and next steps.
>>>>>>>>>>>>         Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
>>>>>>>>>>>>
>>>>>>>>>>>> As you can see, there is still some available time for other topics.
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 


