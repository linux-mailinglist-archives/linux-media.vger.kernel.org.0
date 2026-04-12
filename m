Return-Path: <linux-media+bounces-58605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FRUrDTNz22mpCAkAu9opvQ
	(envelope-from <linux-media+bounces-58605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 12:25:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C213E36A7
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 12:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBF073004077
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 10:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B208375ADE;
	Sun, 12 Apr 2026 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCCIyLbk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9C231836
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775989548; cv=none; b=Iwx5xkKSXAnEboE3f013XK0Mg1NuRHZuwNmiUbeyWWA8FKSKaIf7nAcy16Bt/fI+TMrbLw/lxh4h9FYDB4PTcsePZu2S9apuyHj/TRK7WYpMQ+RutpYxZZFp+Q2uZXMhv3j4tIw00vK3aBCM5OFZ1WkydKNn92czj2cr+lEgmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775989548; c=relaxed/simple;
	bh=5m7P0cmFPqGPiNgaMLjya/OGtJa5rg+U3WM3LBxAKq8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=WUgDA/XD7kFzcfykWFsydxTiUOyGpfiEya3qrt/qYzE9un+FzqfeoYIQc6jSJyuYN1TNk8Zf/qtDiiaOY+kCc9mh9G9z67vBzHOFhqGsGsR1hPUbGO6midgkGR8vM4GMlN3nXgBMFiLTR5CnO+pzFsLFc9wkMuFstxRvWTSpwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCCIyLbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F63C19424;
	Sun, 12 Apr 2026 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775989548;
	bh=5m7P0cmFPqGPiNgaMLjya/OGtJa5rg+U3WM3LBxAKq8=;
	h=Date:From:Subject:To:Cc:From;
	b=YCCIyLbkwo1U7XrSYSjZ4FfeUtsFw9dSrSsY+6HebnmmgtYx69u0/hxHLDkACagZL
	 Upoq9VClisb8LodfZDpHsnSwOShi3ShXsOp59clMdf9iI7YVeGt8EIXsBlnJuTb0zX
	 dwWxwij5DP/21lTu7U98lGxSTx9C6pjA38yDy7meVKI6JlA1W3XKr/PRFb6ihAmiv9
	 YFkJd9G4NZPwlvf7dkICY9XTxUffZxjpgP6xnWkoCC9ZYejvLB9UbW2haSQXr026bv
	 TF7H5xPKVV2fhJ4bBerTQco9K5hwbMCYbMoUUow+5qAc9lpBT6ZJqF8m2gQtBmh+JR
	 IjJv+DAKMFoZQ==
Message-ID: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
Date: Sun, 12 Apr 2026 12:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANNv4] Media Summit on May 26th in Nice, France
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58605-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36]
X-Rspamd-Queue-Id: 19C213E36A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Please pass this on to anyone you think might be interested in this!)

Hi all,

This is the fourth version of this announcement, updating the list of attendees
and the tentative agenda at the end: please let me know if you see mistakes.
Note that there is still time for one or two other topics. Also please check
the agenda if you need more (or perhaps less) time for your topic.

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
Devarsh Thakkar <devarsht@ti.com>
Michael Tretter <m.tretter@pengutronix.de>
Hans Verkuil <hverkuil@kernel.org>

Remote attendees:
Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Rishikesh Donadkar <r-donadkar@ti.com>
Jackson Lee <jackson.lee@chipsnmedia.com>
Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)


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

14:00-14:30: AI patches
	Presenter: Sakari Ailus
	Description: What is our policy w.r.t. AI generated patches?

14:30-15:00 Overview of Media CI: where do pipelines run?
	Presenter: Ricardo Ribalda
	Description: How are jobs in pipelines assigned? How does the infrastructure
	for Media CI work? Are there things that can be tweaked to make it more
	reliable?

15:00-15:15: Break

15:15-16:15: Discussion of the media subsystem development process
	Presenter: Hans Verkuil
	Description: Review of the multi-committer model: current status and next steps.
	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

As you can see, there is still some available time for other topics.

