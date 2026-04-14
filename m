Return-Path: <linux-media+bounces-58712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPy5IWvs3WmulAkAu9opvQ
	(envelope-from <linux-media+bounces-58712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:27:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28A3F69ED
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD1030D00A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BCE37D13E;
	Tue, 14 Apr 2026 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="KKipZ5Wo"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3EC2E8B81
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151310; cv=pass; b=axiZEx1xUm9t6h2kNRAsFaaNDBZB1zwbnazv77syKbKf2VEmj5OoS6Vx4WGa/wBsGvU7pKYho/trTYFiClk8wFBWP8H/zrV3NoiJAQQJgN9cFIRPtfzHnlbMxUl1vefKpiSJRbTOl3yTbSzoIwirbMYumu0e9wptov/qvmmEiVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151310; c=relaxed/simple;
	bh=FXCy/c0Zvn4AoT0407SMGTT2X83Cjidl2KHmW/BiGjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjXuqoBMcGBj45FcuFsqZMcUk2aMIwhbkM3CQgNxOcDbiAFkMsKgBadT2GHRxtEIx32P6nwtPXyDcx3ocKotIY+YHnMDmM6yeXJJxImJ6VXyjxOW8pg6y098nhoYROh06L1g6TRaJtxmL/Qlq+GDMDH+DBsLlB9ZC4Wl8AxsRpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=KKipZ5Wo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776151266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N8HmSvy7tgJmEa4mr7wp+T4YFYGSxmD8h/EX/ZlmyPrAQ7I9f1n2kdzVpj5SYovSyD1kLV+x7WeqjgelHiZVND/R+Kwc89zTpFYm9AUNzoE8xFun3/ql8ZA2BSSLgZvl6vKSHXWcGJqVu6YtP5CSXfOmrQAQ9flQWs7HkxNuCME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776151266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vh0DfUjxqAuszo4p5fqEn528sw8HL+hGfLBWhHD5afw=; 
	b=l2/oy894b+gTJEjK2yUSZrI7C2JldNbhbr00dJ12lU1s3gkjWQF8zjGRA+H8gr+tStIOq6/xfEE6W6aAwBNhqWQkwyZMexkbtM+sQa42igXsonc1tuAFxFG0z+WOjtJD4txWY14AW0oM8v4Kl+KnFO3yju67aSG3tPBPk3bmBGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776151266;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vh0DfUjxqAuszo4p5fqEn528sw8HL+hGfLBWhHD5afw=;
	b=KKipZ5WoT+D4ejI4VNau4R+cdLFvWm+ZYBlNC8jfFYmXBPyyb9neAhk5HisGb8/t
	JYE0OfFXd533IDrhZwWxb5mFIxpGpuKQzYdLid0eK7uqgrwjBpw4vFXWbcICGjswuc/
	9PZ+FFoSfN5yQAPZ3GkUtrj+Ot4vnmfzQukmeo9U=
Received: by mx.zohomail.com with SMTPS id 1776151264970821.7447080967735;
	Tue, 14 Apr 2026 00:21:04 -0700 (PDT)
Message-ID: <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
Date: Tue, 14 Apr 2026 09:20:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
 <20260413201907.GD4034@killaraus.ideasonboard.com>
 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com>
 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58712-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC28A3F69ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

On 4/14/26 08:55, Ricardo Ribalda wrote:
> Hi
> 
> On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> On 13/04/2026 23:16, Laurent Pinchart wrote:
>>> On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrote:
>>>> Le lundi 13 avril 2026 à 23:19 +0300, Laurent Pinchart a écrit :
>>>>> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> I would be happy to discuss this if a slot is available:
>>>>>>
>>>>>> Title: Generic V4L2 ISP M2M framework
>>>>>> Presenter: Loic Poulain
>>>>>> Time estimate: ~20min
>>>>>> Description: During early development of a Qualcomm Offline Image
>>>>>> Processing Engine (OPE), we relied on the V4L2 memory‑to‑memory
>>>>>> (v4l2‑m2m) framework, which is widely used and provides solid support
>>>>>> for buffer management and scheduling. However, applying it to an ISP
>>>>>> use case exposes limitations: ISP engines often require a richer media
>>>>>> graph, with multiple pads and metadata flows, similar to inline ISP
>>>>>> pipelines (params, stats, outputs). This talk proposes discussing the
>>>>>> need for and design of a common V4L2 ISP M2M framework to factor out
>>>>>> shared functionality across drivers, particularly around buffer/queue
>>>>>> management and job scheduling.

It seems that we share some pain points.. :-) :-/

Over the last year, some ideas have been brewing in my mind. Not
necessarily *my* ideas, mind you, rather ideas that have been around in
linux-media for quite a while, actually. What I would like to prepare
for the Media Summit goes along the same lines.

>>>>> That's well aligned with the v4l2-isp framework that Jacopo started, and
>>>>> to the multi-context and media-jobs APIs that we have proposed. I
>>>>> wonder, however, if a short session at the media summit will be enough,
>>>>> or if we should try to organize a half day brainstorming workshop at
>>>>> some point. Depending on when the people interested in this topic plan
>>>>> to arrive, Monday could be an option.
>>>>
>>>> I'm also/still interested in the multi-context for m2m decoders that have inline
>>>> post-processing capabilities (current model forces us to waste a lot of RAM). We
>>>> just restarted some design discussion with the team, with an increased
>>>> confidence that multi-context is the way. The scheduler could come handy in the
>>>> future if we get to deal with more multi-stage codecs in the future. I'll be in
>>>> Nice all day Monday.
>>>
>>> I will unfortunately be available only until 15:00 on Monday, but Jacopo
>>> should be available through the day. Let's see who would be interested
>>> and available, and try to organize something.
>>
>> I'm available on Monday as well. I think this is a topic that is well suited
>> to a brainstorm session.
> 
> I am also available on Monday and would like to attend the session.

I'd be interested too. Right now the plan is to arrive on Monday
afternoon. Depending on what time you agree on it may work out anyway.
It would be great to know the exact time this session will start (as I
might need to adjust my travel arrangements).

> 
> Regards!
> 
>>
>> The agenda for the media summit is getting quite full, and I agree with Laurent
>> that 20 minutes is likely not enough. If we can so a session on Monday instead,
>> then that would be a good solution.

Apart from the time and date the scope of this session would be interesting.

Will this be a birds of a feather session in which the next generation
kernel ISP framework will be discussed? Or even the next generation
kernel video processing framework, where video processing is image
signal processing, encoding/decoding, 2D graphics processing (fisheye
correction units, 2D GPU such as the Rockchip RGA3, ...)?

>>
>> I have never been very enthusiastic about the m2m framework: it's fine for e.g.
>> simple scalers, but it's awkward to use for codecs let alone ISPs.
>>
>> I always felt that we really need variants of the m2m framework that are customized
>> to specific use-cases: i.e. a codec m2m framework, and (perhaps) an ISP m2m framework.
>>
>> The big problem with that is of course who will do the work. Making new frameworks
>> is difficult and takes a long time.

This may be naive and overly optimistic, but I feel there is quite a
number of people sharing the same pain points (which are similar to
those Loic pointed out). Maybe (hopefully) this birds of a feather
session leads to the formation of some work group?

Best regards,
Michael


>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>>>> On Sun, Apr 12, 2026 at 12:25 PM Hans Verkuil wrote:
>>>>>>>
>>>>>>> (Please pass this on to anyone you think might be interested in this!)
>>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> This is the fourth version of this announcement, updating the list of
>>>>>>> attendees
>>>>>>> and the tentative agenda at the end: please let me know if you see
>>>>>>> mistakes.
>>>>>>> Note that there is still time for one or two other topics. Also please
>>>>>>> check
>>>>>>> the agenda if you need more (or perhaps less) time for your topic.
>>>>>>>
>>>>>>> This year's Media Summit will be held on Tuesday May 26th the day before
>>>>>>> the
>>>>>>> Embedded Recipes Conference in Nice, France:
>>>>>>>
>>>>>>> https://embedded-recipes.org/2026/
>>>>>>>
>>>>>>> The Media Summit will be held at Hotel Campanile and in the same meeting
>>>>>>> room
>>>>>>> as last year (Nikaia):
>>>>>>>
>>>>>>> https://nice-aeroport.campanile.com/en-us/
>>>>>>>
>>>>>>> It is close to the Airport and to the Embedded Recipes venue.
>>>>>>>
>>>>>>> The meeting room can hold up to 30 people and I will provide video
>>>>>>> conferencing support,
>>>>>>> just like last year. The location and the meeting room was quite nice last
>>>>>>> year, so
>>>>>>> I saw no need to change it.
>>>>>>>
>>>>>>> That said, in-person participation is very much preferred. This yearly
>>>>>>> summit is meant
>>>>>>> for active media developers to meet face-to-face and to discuss media
>>>>>>> subsystem issues.
>>>>>>>
>>>>>>> And it is also a good opportunity to talk to each other during the
>>>>>>> Embedded Recipes
>>>>>>> conference to discuss topics in a smaller group. But if you are an active
>>>>>>> media developer
>>>>>>> and are really not able to attend in person, then remote participation is
>>>>>>> an option.
>>>>>>>
>>>>>>> If you want to attend the meeting (either in person or remote), then send
>>>>>>> an email to me
>>>>>>> directly. The deadline for in-person attendance is May 14 as the hotel
>>>>>>> needs to know the
>>>>>>> final number of attendees by then.
>>>>>>>
>>>>>>> There is no registration fee, the meeting room is sponsored by Cisco and
>>>>>>> Collabora, and
>>>>>>> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors,
>>>>>>> it's very much
>>>>>>> appreciated.
>>>>>>>
>>>>>>> If you have a topic that you want to discuss, just 'Reply All' to this
>>>>>>> announcement
>>>>>>> and give the topic title, a short description and a guesstimate of the
>>>>>>> time you need
>>>>>>> for your topic.
>>>>>>>
>>>>>>> See last year's Media Summit Report as an example of what to expect:
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>>         Hans
>>>>>>>
>>>>>>> PS: Be aware that May 24 and 25 are public holidays in France. So many
>>>>>>> shops may be
>>>>>>> closed those days.
>>>>>>>
>>>>>>> In-person attendees:
>>>>>>> Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
>>>>>>> Brandon Brnich <b-brnich@ti.com>
>>>>>>> Rouven Czerwinski <rouven.czerwinski@linaro.org>
>>>>>>> Mehdi Djait <mehdi.djait@linux.intel.com>
>>>>>>> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>> Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>>> Marco Felsch <m.felsch@pengutronix.de>
>>>>>>> Paul Kocialkowski <paulk@sys-base.io>
>>>>>>> Jai Luthra <jai.luthra@ideasonboard.com>
>>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>>>>> Beleswar Padhi <b-padhi@ti.com>
>>>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>> Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>> Sven Püschel <s.pueschel@pengutronix.de>
>>>>>>> Ricardo Ribalda <ribalda@chromium.org>
>>>>>>> Michael Riesch <michael.riesch@collabora.com>
>>>>>>> Devarsh Thakkar <devarsht@ti.com>
>>>>>>> Michael Tretter <m.tretter@pengutronix.de>
>>>>>>> Hans Verkuil <hverkuil@kernel.org>
>>>>>>>
>>>>>>> Remote attendees:
>>>>>>> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>>>>> Rishikesh Donadkar <r-donadkar@ti.com>
>>>>>>> Jackson Lee <jackson.lee@chipsnmedia.com>
>>>>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
>>>>>>>
>>>>>>>
>>>>>>> Agenda (tentative):
>>>>>>>
>>>>>>> 8:45-9:20: Arrive, settle in
>>>>>>>
>>>>>>> 9:20-9:30: Short intro (Hans Verkuil)
>>>>>>>
>>>>>>> 9:30-9:45: Status of ISP support in V4L2
>>>>>>>         Presenter: Laurent Pinchart
>>>>>>>         Description: Summary of ISP-related development in V4L2 since the
>>>>>>> last
>>>>>>>         Linux Media Summit. This includes a brief overview of technical
>>>>>>>         developments, and a summary of the efforts to engage with vendors.
>>>>>>>
>>>>>>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
>>>>>>>         Presenter: Paul Kocialkowski
>>>>>>>         Description: An update on the ongonig work to support stateless
>>>>>>> codecs in V4L2.
>>>>>>>         Some of the remaining open topics will be presented and discussed.
>>>>>>>
>>>>>>> 10:45-11:00: break
>>>>>>>
>>>>>>> 11:00-11:30: Vulkan Video Codecs
>>>>>>>         Presenter: Nicolas Dufresne
>>>>>>>         Description: Vulkan video codecs: what are the viable options for
>>>>>>> Linux Media
>>>>>>>         and what is in preparation outside of our subsystem. The second
>>>>>>> aspect is
>>>>>>>         informative as these discussions don't seem to lean toward our
>>>>>>> subsystem as the
>>>>>>>         foundation. But I think it's rather useful for everyone to
>>>>>>> understand why and
>>>>>>>         what is included.
>>>>>>>
>>>>>>> 11:30-12:00: Protected Video playback on i.MX8MQ
>>>>>>>         Presenter: Rouven Czerwinski
>>>>>>>         Description: Introduction to protected video playback
>>>>>>>         on i.MX8MQ and missing bits for linux-media & protected heap
>>>>>>> interoperability.
>>>>>>>
>>>>>>> 12:00-13:30: Lunch
>>>>>>>
>>>>>>> 13:30-14:00: HDCP support for HDMI receivers
>>>>>>>         Presenter: Hans Verkuil
>>>>>>>         Description: I have been working on adding HDCP support for HDMI
>>>>>>> receivers.
>>>>>>>         Specifically the HDCP negotiation between sources and sinks.
>>>>>>>
>>>>>>> 14:00-14:30: AI patches
>>>>>>>         Presenter: Sakari Ailus
>>>>>>>         Description: What is our policy w.r.t. AI generated patches?
>>>>>>>
>>>>>>> 14:30-15:00 Overview of Media CI: where do pipelines run?
>>>>>>>         Presenter: Ricardo Ribalda
>>>>>>>         Description: How are jobs in pipelines assigned? How does the
>>>>>>> infrastructure
>>>>>>>         for Media CI work? Are there things that can be tweaked to make it
>>>>>>> more
>>>>>>>         reliable?
>>>>>>>
>>>>>>> 15:00-15:15: Break
>>>>>>>
>>>>>>> 15:15-16:15: Discussion of the media subsystem development process
>>>>>>>         Presenter: Hans Verkuil
>>>>>>>         Description: Review of the multi-committer model: current status
>>>>>>> and next steps.
>>>>>>>         Are there any bottlenecks, any ideas for improvements, w.r.t. the
>>>>>>> development process?
>>>>>>>
>>>>>>> As you can see, there is still some available time for other topics.
>>>
>>
> 
> 


