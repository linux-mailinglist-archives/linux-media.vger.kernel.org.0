Return-Path: <linux-media+bounces-58684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZeKWIPJP3WkFcQkAu9opvQ
	(envelope-from <linux-media+bounces-58684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:20:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55683F30AA
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BEC7302C779
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B8A391E79;
	Mon, 13 Apr 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z/Kbrm2S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68796381B13
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111555; cv=none; b=SCIH5X/khR1CCN7T6xnKrNR6kLdDxYB9HwOTz1FgHRAdn4KEwJ1AbAwbGIQtOI7DxAEx5Xr7y32kHkUB5LMcNGewjwZJLCHbpjNWPFG6iO+kaGNMPBm6MH41Ib2sK0qD8ZPq8tgwMOvZr6g8D5HQHjKU6zUq4xBEUY4W5ePplXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111555; c=relaxed/simple;
	bh=MC78Mz1thpdXA4kdOj07eDWriG++ENWRUTjymZDXN1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRPrH/igYgtPgKVTFKUYYPEZVRQFPx9EWNn5gsluNHySvPS8n8YgXYIZACoezOwdrPPXwdv7KHNQvmjdEkNp7m9gW9EtvT5bGhkqtb1OqP4MNq/culfBHiWln4sZJx3FE4BF+LR/a362GmBlK611Qgf0dnWmGcYP6Okdl2XjHso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z/Kbrm2S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5D987FE;
	Mon, 13 Apr 2026 22:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776111457;
	bh=MC78Mz1thpdXA4kdOj07eDWriG++ENWRUTjymZDXN1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/Kbrm2SsPdcn22urKS0dw2lKuivw33MiPEQHiScPqDbHQ6g7ek4m9VW/A1jtQPrp
	 1OHvoLXly+pH8YpSB3fKMfijM4d0N8JsXVqP8o4riOl+AIgQwb2N8UrP+u/21iHDvQ
	 z7CmAWUbMjtv5sAzl51WlBLg/NGPgzeeUNKWVdsA=
Date: Mon, 13 Apr 2026 23:19:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Brandon Brnich <b-brnich@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Padhi, Beleswar" <b-padhi@ti.com>,
	"Donadkar, Rishikesh" <r-donadkar@ti.com>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
Message-ID: <20260413201907.GD4034@killaraus.ideasonboard.com>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58684-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_TWELVE(0.00)[36];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E55683F30AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> Hi Hans,
> 
> I would be happy to discuss this if a slot is available:
> 
> Title: Generic V4L2 ISP M2M framework
> Presenter: Loic Poulain
> Time estimate: ~20min
> Description: During early development of a Qualcomm Offline Image
> Processing Engine (OPE), we relied on the V4L2 memory‑to‑memory
> (v4l2‑m2m) framework, which is widely used and provides solid support
> for buffer management and scheduling. However, applying it to an ISP
> use case exposes limitations: ISP engines often require a richer media
> graph, with multiple pads and metadata flows, similar to inline ISP
> pipelines (params, stats, outputs). This talk proposes discussing the
> need for and design of a common V4L2 ISP M2M framework to factor out
> shared functionality across drivers, particularly around buffer/queue
> management and job scheduling.

That's well aligned with the v4l2-isp framework that Jacopo started, and
to the multi-context and media-jobs APIs that we have proposed. I
wonder, however, if a short session at the media summit will be enough,
or if we should try to organize a half day brainstorming workshop at
some point. Depending on when the people interested in this topic plan
to arrive, Monday could be an option.

> On Sun, Apr 12, 2026 at 12:25 PM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> >
> > (Please pass this on to anyone you think might be interested in this!)
> >
> > Hi all,
> >
> > This is the fourth version of this announcement, updating the list of attendees
> > and the tentative agenda at the end: please let me know if you see mistakes.
> > Note that there is still time for one or two other topics. Also please check
> > the agenda if you need more (or perhaps less) time for your topic.
> >
> > This year's Media Summit will be held on Tuesday May 26th the day before the
> > Embedded Recipes Conference in Nice, France:
> >
> > https://embedded-recipes.org/2026/
> >
> > The Media Summit will be held at Hotel Campanile and in the same meeting room
> > as last year (Nikaia):
> >
> > https://nice-aeroport.campanile.com/en-us/
> >
> > It is close to the Airport and to the Embedded Recipes venue.
> >
> > The meeting room can hold up to 30 people and I will provide video conferencing support,
> > just like last year. The location and the meeting room was quite nice last year, so
> > I saw no need to change it.
> >
> > That said, in-person participation is very much preferred. This yearly summit is meant
> > for active media developers to meet face-to-face and to discuss media subsystem issues.
> >
> > And it is also a good opportunity to talk to each other during the Embedded Recipes
> > conference to discuss topics in a smaller group. But if you are an active media developer
> > and are really not able to attend in person, then remote participation is an option.
> >
> > If you want to attend the meeting (either in person or remote), then send an email to me
> > directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
> > final number of attendees by then.
> >
> > There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
> > the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
> > appreciated.
> >
> > If you have a topic that you want to discuss, just 'Reply All' to this announcement
> > and give the topic title, a short description and a guesstimate of the time you need
> > for your topic.
> >
> > See last year's Media Summit Report as an example of what to expect:
> >
> > https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
> >
> > Regards,
> >
> >         Hans
> >
> > PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
> > closed those days.
> >
> > In-person attendees:
> > Sakari Ailus <sakari.ailus@linux.intel.com>
> > Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Brandon Brnich <b-brnich@ti.com>
> > Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > Mehdi Djait <mehdi.djait@linux.intel.com>
> > Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Marco Felsch <m.felsch@pengutronix.de>
> > Paul Kocialkowski <paulk@sys-base.io>
> > Jai Luthra <jai.luthra@ideasonboard.com>
> > Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > Beleswar Padhi <b-padhi@ti.com>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Sven Püschel <s.pueschel@pengutronix.de>
> > Ricardo Ribalda <ribalda@chromium.org>
> > Michael Riesch <michael.riesch@collabora.com>
> > Devarsh Thakkar <devarsht@ti.com>
> > Michael Tretter <m.tretter@pengutronix.de>
> > Hans Verkuil <hverkuil@kernel.org>
> >
> > Remote attendees:
> > Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > Rishikesh Donadkar <r-donadkar@ti.com>
> > Jackson Lee <jackson.lee@chipsnmedia.com>
> > Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> >
> >
> > Agenda (tentative):
> >
> > 8:45-9:20: Arrive, settle in
> >
> > 9:20-9:30: Short intro (Hans Verkuil)
> >
> > 9:30-9:45: Status of ISP support in V4L2
> >         Presenter: Laurent Pinchart
> >         Description: Summary of ISP-related development in V4L2 since the last
> >         Linux Media Summit. This includes a brief overview of technical
> >         developments, and a summary of the efforts to engage with vendors.
> >
> > 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> >         Presenter: Paul Kocialkowski
> >         Description: An update on the ongonig work to support stateless codecs in V4L2.
> >         Some of the remaining open topics will be presented and discussed.
> >
> > 10:45-11:00: break
> >
> > 11:00-11:30: Vulkan Video Codecs
> >         Presenter: Nicolas Dufresne
> >         Description: Vulkan video codecs: what are the viable options for Linux Media
> >         and what is in preparation outside of our subsystem. The second aspect is
> >         informative as these discussions don't seem to lean toward our subsystem as the
> >         foundation. But I think it's rather useful for everyone to understand why and
> >         what is included.
> >
> > 11:30-12:00: Protected Video playback on i.MX8MQ
> >         Presenter: Rouven Czerwinski
> >         Description: Introduction to protected video playback
> >         on i.MX8MQ and missing bits for linux-media & protected heap interoperability.
> >
> > 12:00-13:30: Lunch
> >
> > 13:30-14:00: HDCP support for HDMI receivers
> >         Presenter: Hans Verkuil
> >         Description: I have been working on adding HDCP support for HDMI receivers.
> >         Specifically the HDCP negotiation between sources and sinks.
> >
> > 14:00-14:30: AI patches
> >         Presenter: Sakari Ailus
> >         Description: What is our policy w.r.t. AI generated patches?
> >
> > 14:30-15:00 Overview of Media CI: where do pipelines run?
> >         Presenter: Ricardo Ribalda
> >         Description: How are jobs in pipelines assigned? How does the infrastructure
> >         for Media CI work? Are there things that can be tweaked to make it more
> >         reliable?
> >
> > 15:00-15:15: Break
> >
> > 15:15-16:15: Discussion of the media subsystem development process
> >         Presenter: Hans Verkuil
> >         Description: Review of the multi-committer model: current status and next steps.
> >         Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
> >
> > As you can see, there is still some available time for other topics.

-- 
Regards,

Laurent Pinchart

