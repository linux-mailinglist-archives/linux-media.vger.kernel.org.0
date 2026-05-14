Return-Path: <linux-media+bounces-61595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CB1BDCgBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:13:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3245540319
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F749304203F
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B43A7827;
	Thu, 14 May 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSsWByJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808E3A3E7A
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753568; cv=none; b=tSgAXEzJg/Hmbet5EGxCTWjTO+YxGTTYU9/M5IrIA1AlvCUZSolqqWEXDZ847e0M7SR3GnCPzTzqtpnL2W7hGVqzkVK64Me7srsSqf+m6NjmVz3089Tozk/oI0IC887StXV8ZnJI9Vnn8GNQ8Kv8VhpbUa9LViFxZSDg2N7ufmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753568; c=relaxed/simple;
	bh=9EaU+pivKiDd6F7CgEZLnd0DOCJUxI3pSahbU9XYgw4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gPNsYGuHLfOvHZ4CpwCBBz2hlOs/vOzf3mik3Pfa3af8kKSSIedcNF/MbDZfvN3QNb7r0bd2MUXq4VkR/X5c4bHMblr17JADYqibKxb4Mw7+RQGgxoArzPoa5P6IDACa4TG3n+5XPvsGY3iSOEGSf2h5ufe7fYmRBmw4pqjSDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSsWByJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F7C2BCB3;
	Thu, 14 May 2026 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753568;
	bh=9EaU+pivKiDd6F7CgEZLnd0DOCJUxI3pSahbU9XYgw4=;
	h=Date:From:Subject:To:Cc:From;
	b=dSsWByJQUM3jp7PdtIa6M2l2fIUzFSocVyAm4Gqvk0LjEItoqRRgNioNg95Z4ttri
	 3MCWnLkZYkPqiTgaQnJhaMiultIToCKvewEtOwKYLCL2J4vnTNDrRHKIDjUO3te6dN
	 n2d2JABGB9UkTNQ21H3aGaXZfyiNBW5pqibAyQwBlKqe7uwMyMhoE5VugsOr4XEfgK
	 mOk0KPu0BUON7MNo9GkNhYJD4GjonNvCmwSaLUUbQ4vl/oWbbhVdjsTxha8RBz0cyQ
	 FfP0ssp7zTFw7S6a0AYVS1EXQeBQwHqHE4gxmWnpZPhOHjdleSgKQnBvzV2IosbvD5
	 ZcWVSNsIv7UDA==
Message-ID: <8590b824-0556-448f-be58-03ddb30b08bb@kernel.org>
Date: Thu, 14 May 2026 12:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANNv6, final] Media Summit on May 26th in Nice, France
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
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
 Robert Mader <robert.mader@collabora.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Satish Babu Patakokila <spatakok@qti.qualcomm.com>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 =?UTF-8?B?VsOtY3RvciBKw6FxdWV6?= <vjaquez@igalia.com>,
 Frank Li <Frank.li@nxp.com>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3245540319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-61595-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux.intel.com,chromium.org,collabora.com,linaro.org,raspberrypi.com,pengutronix.de,sys-base.io,foss.st.com,ti.com,oss.qualcomm.com,chipsnmedia.com,gmail.com,fooishbar.org,qti.qualcomm.com,igalia.com,nxp.com,allegrodvt.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[37];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi all,

This is the sixth and final version of this announcement, finalizing the list of attendees
and the agenda at the end: please let me know if you see mistakes.

We're now closed for new registrations: we're 26 in-person attendees and 11 remote attendees.
Information on how to call in as remote participant will be given in a separate email next week.

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

The meeting room is sponsored by Cisco and Collabora, and the lunch is sponsored by
Ideas on Board! Many thanks to our sponsors, it's very much appreciated.

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
Stefan Klug <stefan.klug@ideasonboard.com>
Paul Kocialkowski <paulk@sys-base.io>
Frank Li <Frank.li@nxp.com>
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

Remote attendees:
Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Mauro Carvalho Chehab <mchehab@kernel.org>
Rishikesh Donadkar <r-donadkar@ti.com>
Víctor Jáquez <vjaquez@igalia.com>
Antti Laakso <antti.laakso@linux.intel.com>
Jackson Lee <jackson.lee@chipsnmedia.com>
Robert Mader <robert.mader@collabora.com>
Satish Babu Patakokila <spatakok@qti.qualcomm.com>
Jose A. Perez de Azpillaga <azpijr@gmail.com>
Dave Stevenson <dave.stevenson@raspberrypi.com>
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Arthur Vinchon <arthur.vinchon@allegrodvt.com>


Agenda:

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

14:00-14:15: How to progress on Module identification
	Presenter: Stefan Klug
	Description: In many real world use cases it is necessary to identify
	the exact module/lens combination on top of the currently used sensor to
	be able to provide corresponding tuning data. I'd like to recap on the
	existing ideas and add a few more thoughts on how we could solve that.

14:15-15:00: Common raw sensor model, streams, metadata and metadata series status
	Presenter: Sakari Ailus
	Description: The Common Raw Sensor Model defines a new UAPI for camera
	sensors in Linux. It provides a more useful UAPI for configuring camera
	sensors than the existing practice is. The metadata series includes the
	Common Raw Sensor Model and a number of other improvements, such as generic
	raw formats, metadata support and finally enabling the streams uAPI.

15:00-15:30: AI patches
	Presenter: Sakari Ailus
	Description: What is our policy w.r.t. AI generated patches?

15:30-15:45: Break

15:45-16:00: A case for a media-job scheduler
	Presenter: Jacopo Mondi
	Description: Dan has proposed last year a framework for scheduling operations
	across multiple drivers that compose a capture pipeline:

	https://www.spinics.net/lists/linux-media/msg279502.html

	To better clarify why this is useful, I would like to discuss and
	describe a practical use case based around the Mali-C55 ISP as
	integrated in the Renesas RZ/V2H(P) SoC.

16:00-16:30: The Butterfly Effect or How Support for Complex Hardware may affect the uAPI
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

16:30-17:00 Overview of Media CI: where do pipelines run?
	Presenter: Ricardo Ribalda
	Description: How are jobs in pipelines assigned? How does the infrastructure
	for Media CI work? Are there things that can be tweaked to make it more
	reliable?

17:00-17:45: Discussion of the media subsystem development process
	Presenter: Hans Verkuil
	Description: Review of the multi-committer model: current status and next steps.
	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

