Return-Path: <linux-media+bounces-58708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLLwA3/j3WnDkwkAu9opvQ
	(envelope-from <linux-media+bounces-58708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:49:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A76203F63F3
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C84ED3008991
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 06:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89BE31717E;
	Tue, 14 Apr 2026 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emhjCLsg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC632FA1B
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149372; cv=none; b=kikgfubp8KwEAxFW0ZM9l65lVLcdo4fiEBmeshjVmPX4DPTyamlqquovM7v6tes8bhkPACVWyxQJXm5QxZyavHxg7wf+Zen7Xwd6ZZc+3VQqs6dJufK3/069OseYFhjUaJJBD0lIsV7loDrRpfGhNkAUG7XklgaiyPg6H2iMCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149372; c=relaxed/simple;
	bh=4QcqPIPKZyanVqQSJdDIz7tkwsobDHIZF/mNzGHc4v8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qWHjKutR+B6/DkbDwaj2SR9gIk0oEXlrnpJ4pyxKciMaHaySyylWFTQfS092fpVGNQ6vOoeYGjVnIu+ArMQcYj5i0r1F75gn3JlXgSpV4xW2APlTnOzltWnlMt+BA1jEIYUSXOEbIWwaUCuKsyRGxW7KpeeyEMaNz1GAVl2qVo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emhjCLsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F3AC19425;
	Tue, 14 Apr 2026 06:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149371;
	bh=4QcqPIPKZyanVqQSJdDIz7tkwsobDHIZF/mNzGHc4v8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=emhjCLsge5kic/E20ByK/p6VzCogwnz+SNNEGSD0qLAmOMeFp9io1Hr5558C1p5wn
	 y603fs84IN2wT//rUTaGZNN/cMK3fmCH6NodA3bdOtAo5k5JmP6s6G9cPC0N8y2PU7
	 khixSIfB9G3W+TXSB/c/uVLKsAe7DpnXiJDj4BJWw8ZFqjKBzpxe1i2Oa2qkEiLvMo
	 8t5PypVu0H/7qK1A1D0znqEir/0RgcYOAcarSlPBGfnr5odNyRmT23iT4MLk9C1EyS
	 LGRcl3uZ1lNZX/NAROjqmiwj3GrKgJy3ihiP2HjK8ePI7FdGueBgL6GZ+v9+o/61zI
	 JdhM8pZVnyBLA==
Message-ID: <2df51d19-5408-4dea-98ac-24bf3473d45b@kernel.org>
Date: Tue, 14 Apr 2026 08:49:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Michael Riesch <michael.riesch@collabora.com>,
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
 <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Brnich <b-brnich@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Devarsh Thakkar <devarsht@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar"
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <756a634a-9699-4118-90e1-4ce06844c369@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <756a634a-9699-4118-90e1-4ce06844c369@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58708-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: A76203F63F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/04/2026 11:57, Michael Riesch wrote:
> Hi Hans,
> 
> On 4/12/26 12:25, Hans Verkuil wrote:
>> [...]
>> Agenda (tentative):
>>
>> 8:45-9:20: Arrive, settle in
>>
>> 9:20-9:30: Short intro (Hans Verkuil)
>>
>> 9:30-9:45: Status of ISP support in V4L2
>> 	Presenter: Laurent Pinchart
>> 	Description: Summary of ISP-related development in V4L2 since the last
>> 	Linux Media Summit. This includes a brief overview of technical
>> 	developments, and a summary of the efforts to engage with vendors.
>>
>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
>> 	Presenter: Paul Kocialkowski
>> 	Description: An update on the ongonig work to support stateless codecs in V4L2.
>> 	Some of the remaining open topics will be presented and discussed.
>>
>> 10:45-11:00: break
>>
>> 11:00-11:30: Vulkan Video Codecs
>> 	Presenter: Nicolas Dufresne
>> 	Description: Vulkan video codecs: what are the viable options for Linux Media
>> 	and what is in preparation outside of our subsystem. The second aspect is
>> 	informative as these discussions don't seem to lean toward our subsystem as the
>> 	foundation. But I think it's rather useful for everyone to understand why and
>> 	what is included.
>>
>> 11:30-12:00: Protected Video playback on i.MX8MQ
>> 	Presenter: Rouven Czerwinski
>> 	Description: Introduction to protected video playback
>> 	on i.MX8MQ and missing bits for linux-media & protected heap interoperability.
>>
>> 12:00-13:30: Lunch
>>
>> 13:30-14:00: HDCP support for HDMI receivers
>> 	Presenter: Hans Verkuil
>> 	Description: I have been working on adding HDCP support for HDMI receivers.
>> 	Specifically the HDCP negotiation between sources and sinks.
>>
>> 14:00-14:30: AI patches
>> 	Presenter: Sakari Ailus
>> 	Description: What is our policy w.r.t. AI generated patches?
>>
>> 14:30-15:00 Overview of Media CI: where do pipelines run?
>> 	Presenter: Ricardo Ribalda
>> 	Description: How are jobs in pipelines assigned? How does the infrastructure
>> 	for Media CI work? Are there things that can be tweaked to make it more
>> 	reliable?
>>
>> 15:00-15:15: Break
>>
>> 15:15-16:15: Discussion of the media subsystem development process
>> 	Presenter: Hans Verkuil
>> 	Description: Review of the multi-committer model: current status and next steps.
>> 	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
>>
>> As you can see, there is still some available time for other topics.
> 
> If there is still a bit of time left, maybe we can reserve some 15-30
> minutes for the following:

I added this to the agenda. Thanks!

Regards,

	Hans

> 
> -------%<---snip--------------------------------------------------------
> 
> The Butterfly Effect or How Support for Complex Hardware may affect the uAPI
> 
> Video capture and camera hardware in recent SoCs is exceedingly complex
> and the assumption that there is one central V4L2 driver that registers
> the media device does not necessarily hold anymore. IMHO we need a
> central media device to rule them all and adaptations to the
> v4l2_{async,device}_register_subdev code. The discussion [0, 1] quickly
> escalated:
>  - Dynamic (de)registration of media entities is desired
>  - This requires considerations about the uAPI
>  - There is significant overlap with the notion of fault-tolerant V4L2
>  - There is also a ton of cleanup work, but the resulting patches must
>    not break anything existing
>  - So we need to talk about possible migration strategies in order to
>    achieve reasonable progress without interfering too much with
>    existing and working parts
> 
> TL;DR: This short talk outlines the effects of upstreaming Rockchip
> RK3588 video capture and camera support on the V4L2/MC uAPI and on the
> (linux-media) universe as we know it today.
> 
> [0]
> https://linuxtv.org/irc/oftc/irclogger_log/linux-media?date=2026-02-17,Tue&sel=72#l68
> [1]
> https://linuxtv.org/irc/oftc/irclogger_log/linux-media?date=2026-02-18,Wed&sel=14#l10
> 
> -------%<---snip--------------------------------------------------------
> 
> If desired, I'll try to find the time to describe the issue in more
> detail on the list *before* everyone travels to Nice. Then, we can use
> the time on site more effectively to discuss it.
> 
> Best regards,
> Michael


