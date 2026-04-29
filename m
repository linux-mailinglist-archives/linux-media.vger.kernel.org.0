Return-Path: <linux-media+bounces-59913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAbIKiek8WnxjAEAu9opvQ
	(envelope-from <linux-media+bounces-59913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:24:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13A48FBA3
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D3D4302B3AD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB0637BE94;
	Wed, 29 Apr 2026 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLerbMEs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600334F492
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443873; cv=none; b=mUDK3N4D2zORbSXbhccjOn9MvTlW5MYumQHGen2Hmw5zfFdriYjpbwPadFXvwnTskB5/2V2QoPp3W3Wl0rGU+zP0IhacMjXZw3JXEMuL+n3oVS646XVA2jimwp/Gve/r+WrN+dXIbfptrgrXD99nwLqygcyO3rvfkbIuCIQ9kp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443873; c=relaxed/simple;
	bh=F/i/pLiRlAwSTiYVMaoIMNRLwp3J3pZtc7O4chm5ANM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=J8P4dBPVdG0RT6RW3r0dScTPfA5D7Wrmri6XcPTDEiz/RyXgNNx7/ovDaecd+M9gA25rpfL0J0rzcokU/GXMWnochlt3048OKHzGs52s4WgVP2xhA6SfxwknB0CIfO6nQiV19OkE0H0moTB8XMBMpo+wPkLSnHPvPo/skyf1/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLerbMEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33961C19425;
	Wed, 29 Apr 2026 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777443872;
	bh=F/i/pLiRlAwSTiYVMaoIMNRLwp3J3pZtc7O4chm5ANM=;
	h=Date:From:Subject:To:Cc:From;
	b=jLerbMEsbyeoEy/H5hk/zVP0h4uYOWU9kGAUFMLYHP/qNWNcQdCu5fVx4dJuPq/SO
	 CthFffI347tCKhv1pb40bnSCPHHpU/UEGNfAr74IQuzBa0qNWXL3F75MttsOSLjeok
	 EHcA8yJQmHpcTreKKLDwj3YzkWHiQUFwrLT0oslvAWBu3ZrTRG1V6eDrgXzHWrYnzQ
	 2WCBeyqz0z+/jd+u7nnVx1zGrtBBeq9Qr7IZ9FS4yFvRZo4IAGEI3JzrtM6+nLxBdP
	 HmpjUthwBZWClTHYlwO7mjsCe5SdCV/7Pc1u3Ejfobl2QhzfF4dNO9RSf3XF2AsjXK
	 cZ0XOogEb8dzw==
Message-ID: <8c0fe854-145e-46d6-83b2-180e495fde95@kernel.org>
Date: Wed, 29 Apr 2026 08:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANNv5] Media Summit on May 26th in Nice, France
To: Linux Media Mailing List <linux-media@vger.kernel.org>
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
 Michael Riesch <michael.riesch@collabora.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar"
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Robert Mader <robert.mader@collabora.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE13A48FBA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-59913-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,mess.org,linux.intel.com,chromium.org,collabora.com,ragnatech.se,foss.st.com,linaro.org,raspberrypi.com,pengutronix.de,baylibre.com,sys-base.io,ti.com,oss.qualcomm.com,chipsnmedia.com,gmail.com,fooishbar.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[39];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

(Please pass this on to anyone you think might be interested in this!)

Hi all,

This is the fifth version of this announcement, updating the list of attendees
and the tentative agenda at the end: please let me know if you see mistakes.

This year's Media Summit will be held on Tuesday May 26th the day before the
Embedded Recipes Conference in Nice, France:

https://embedded-recipes.org/2026/

The Media Summit will be held at Hotel Campanile and in the same meeting room
as last year (Nikaia):

https://nice-aeroport.campanile.com/en-us/

It is close to the Airport and to the Embedded Recipes venue.

The meeting room can hold up to 30 people and I will provide video conferencing support,
just like last year. The location and the meeting room was quite nice last year, so
I saw no need to change it.

That said, in-person participation is very much preferred. This yearly summit is meant
for active media developers to meet face-to-face and to discuss media subsystem issues.

And it is also a good opportunity to talk to each other during the Embedded Recipes
conference to discuss topics in a smaller group. But if you are an active media developer
and are really not able to attend in person, then remote participation is an option.

If you want to attend the meeting (either in person or remote), then send an email to me
directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
final number of attendees by then.

There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
appreciated.

If you have a topic that you want to discuss, just 'Reply All' to this announcement
and give the topic title, a short description and a guesstimate of the time you need
for your topic.

See last year's Media Summit Report as an example of what to expect:

https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/

Regards,

	Hans

PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
closed those days.

In-person attendees:
Sakari Ailus <sakari.ailus@linux.intel.com>
Kieran Bingham <kieran.bingham@ideasonboard.com>
Brandon Brnich <b-brnich@ti.com>
Rouven Czerwinski <rouven.czerwinski@linaro.org>
Mehdi Djait <mehdi.djait@linux.intel.com>
Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Nicolas Dufresne <nicolas.dufresne@collabora.com>
Marco Felsch <m.felsch@pengutronix.de>
Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Paul Kocialkowski <paulk@sys-base.io>
Jai Luthra <jai.luthra@ideasonboard.com>
Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Beleswar Padhi <b-padhi@ti.com>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Loic Poulain <loic.poulain@oss.qualcomm.com>
Sven Püschel <s.pueschel@pengutronix.de>
Ricardo Ribalda <ribalda@chromium.org>
Michael Riesch <michael.riesch@collabora.com>
Daniel Stone <daniel@fooishbar.org> (Collabora)
Devarsh Thakkar <devarsht@ti.com>
Michael Tretter <m.tretter@pengutronix.de>
Suresh Vankadara <svankada@qti.qualcomm.com>
Hans Verkuil <hverkuil@kernel.org> (Cisco)

Waiting List (In-person if space, otherwise remote. Decision will be made mid-May):
Robert Mader <robert.mader@collabora.com>
Satish Babu Patakokila <spatakok@qti.qualcomm.com>

Remote attendees:
Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Mauro Carvalho Chehab <mchehab@kernel.org>
Rishikesh Donadkar <r-donadkar@ti.com>
Jackson Lee <jackson.lee@chipsnmedia.com>
Jose A. Perez de Azpillaga <azpijr@gmail.com>
Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


Agenda (tentative):

8:45-9:20: Arrive, settle in

9:20-9:30: Short intro (Hans Verkuil)

9:30-9:45: Status of ISP support in V4L2
	Presenter: Laurent Pinchart
	Description: Summary of ISP-related development in V4L2 since the last
	Linux Media Summit. This includes a brief overview of technical
	developments, and a summary of the efforts to engage with vendors.

9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
	Presenter: Paul Kocialkowski
	Description: An update on the ongonig work to support stateless codecs in V4L2.
	Some of the remaining open topics will be presented and discussed.

10:45-11:00: break

11:00-11:30: Vulkan Video Codecs
	Presenter: Nicolas Dufresne
	Description: Vulkan video codecs: what are the viable options for Linux Media
	and what is in preparation outside of our subsystem. The second aspect is
	informative as these discussions don't seem to lean toward our subsystem as the
	foundation. But I think it's rather useful for everyone to understand why and
	what is included.

11:30-12:00: Protected Video playback on i.MX8MQ
	Presenter: Rouven Czerwinski
	Description: Introduction to protected video playback
	on i.MX8MQ and missing bits for linux-media & protected heap interoperability.

12:00-13:30: Lunch

13:30-14:00: HDCP support for HDMI receivers
	Presenter: Hans Verkuil
	Description: I have been working on adding HDCP support for HDMI receivers.
	Specifically the HDCP negotiation between sources and sinks.

14:00-14:45: Common raw sensor model, streams, metadata and metadata series status
	Presenter: Sakari Ailus
	Description: The Common Raw Sensor Model defines a new UAPI for camera
	sensors in Linux. It provides a more useful UAPI for configuring camera
	sensors than the existing practice is. The metadata series includes the
	Common Raw Sensor Model and a number of other improvements, such as generic
	raw formats, metadata support and finally enabling the streams uAPI.

14:45-15:15: AI patches
	Presenter: Sakari Ailus
	Description: What is our policy w.r.t. AI generated patches?

15:15-15:30: Break

15:30-15:45: A case for a media-job scheduler
	Presenter: Jacopo Mondi
	Description: Dan has proposed last year a framework for scheduling operations
	across multiple drivers that compose a capture pipeline:

	https://www.spinics.net/lists/linux-media/msg279502.html

	To better clarify why this is useful, I would like to discuss and
	describe a practical use case based around the Mali-C55 ISP as
	integrated in the Renesas RZ/V2H(P) SoC.

15:45-16:15: The Butterfly Effect or How Support for Complex Hardware may affect the uAPI
	Presenter: Michael Riesch
	Description: Video capture and camera hardware in recent SoCs is exceedingly complex
	and the assumption that there is one central V4L2 driver that registers
	the media device does not necessarily hold anymore. IMHO we need a
	central media device to rule them all and adaptations to the
	v4l2_{async,device}_register_subdev code.
	 - Dynamic (de)registration of media entities is desired
	 - This requires considerations about the uAPI
	 - There is significant overlap with the notion of fault-tolerant V4L2
	 - There is also a ton of cleanup work, but the resulting patches must
	   not break anything existing
	 - So we need to talk about possible migration strategies in order to
	   achieve reasonable progress without interfering too much with
	   existing and working parts

16:15-16:45 Overview of Media CI: where do pipelines run?
	Presenter: Ricardo Ribalda
	Description: How are jobs in pipelines assigned? How does the infrastructure
	for Media CI work? Are there things that can be tweaked to make it more
	reliable?

16:45-17:30: Discussion of the media subsystem development process
	Presenter: Hans Verkuil
	Description: Review of the multi-committer model: current status and next steps.
	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

