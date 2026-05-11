Return-Path: <linux-media+bounces-61131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFb0OMnoAWoRmQEAu9opvQ
	(envelope-from <linux-media+bounces-61131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:33:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E547E510388
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 484D4301A2F3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268553FD128;
	Mon, 11 May 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AM+amCvF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A463FCB33
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509061; cv=none; b=LrVKVZO94NmEiSJ6IYV7Y4FVP0hpfGl2aAn6PklzX+yLZcbK2a37ni7wG7iI0A7nxBv6IqWUP8bJsKPm/uR39BKQpNwbpNVmDPH2r5ZJZCpmSTxYNSoDadZVxB/9PSzym0v2eqopWK/PS5xq3HXc/UKyKN8ouumx7ThPO9yIJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509061; c=relaxed/simple;
	bh=zmJamE54/Kgvzi1OXVj48RW/+j1DD2vE+AbEUzIEXzQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pWjjpBe0RRo2ioBoDw0p6Q0Br4S+vaqbGuJUgzPUos8TOeQO3CGkWbAm8+TjvALne9MnW7GK02jls8gulZxuvu5rOhU5k1nB/oIJw6C7++DSNR52KyE/QozPH8Cu9q5WZQ9Xb1/vn+JpqZSfzM02VTzLHEKXpru50EoFZNwaUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AM+amCvF reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:b16a:5ed9:4ada:a95a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5FD309D1;
	Mon, 11 May 2026 16:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778509048;
	bh=zmJamE54/Kgvzi1OXVj48RW/+j1DD2vE+AbEUzIEXzQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AM+amCvFIPhbHGUCRO9rZJFVMYquinCJUuZub3XECvsG37+mO+UHsrCxPt+vW/U/v
	 XU6o9nSjobZG61hAodnADUMYGwHIezpSlJywvgz+5wrHLvCUIKTGcY3suJDmCEm3C3
	 QWD9dKEj0Ez1tcbqdIJc8d4Z4f4f2DbrJAM8tSus=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8c0fe854-145e-46d6-83b2-180e495fde95@kernel.org>
References: <8c0fe854-145e-46d6-83b2-180e495fde95@kernel.org>
Subject: Re: [ANNv5] Media Summit on May 26th in Nice, France
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>, Brandon Brnich <b-brnich@ti
 .com>, Marco Felsch <m.felsch@pengutronix.de>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, Devarsh Thakkar <devarsht@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar" <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>, Rouven Czerwinski <rouven.czerwinski@linaro.org>, Jose A. Perez de Azpillaga <azpijr@gmail.com>, Daniel Stone <daniel@fooishbar.org>, Robert Mader <robert.mader@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Mon, 11 May 2026 16:17:32 +0200
Message-ID: <177850905212.2119687.8469081167321211265@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-Rspamd-Queue-Id: E547E510388
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61131-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	RCPT_COUNT_TWELVE(0.00)[40];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,mess.org,linux.intel.com,chromium.org,collabora.com,ragnatech.se,foss.st.com,linaro.org,raspberrypi.com,pengutronix.de,baylibre.com,sys-base.io,ti .com,oss.qualcomm.com,ti.com,chipsnmedia.com,gmail.com,fooishbar.org];
	NEURAL_HAM(-0.00)[-0.935];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans,

Thank you for organizing this.

Quoting Hans Verkuil (2026-04-29 08:24:23)
> (Please pass this on to anyone you think might be interested in this!)
>=20
> Hi all,
>=20
> This is the fifth version of this announcement, updating the list of atte=
ndees
> and the tentative agenda at the end: please let me know if you see mistak=
es.
>=20
> This year's Media Summit will be held on Tuesday May 26th the day before =
the
> Embedded Recipes Conference in Nice, France:
>=20
> https://embedded-recipes.org/2026/
>=20
> The Media Summit will be held at Hotel Campanile and in the same meeting =
room
> as last year (Nikaia):
>=20
> https://nice-aeroport.campanile.com/en-us/
>=20
> It is close to the Airport and to the Embedded Recipes venue.
>=20
> The meeting room can hold up to 30 people and I will provide video confer=
encing support,
> just like last year. The location and the meeting room was quite nice las=
t year, so
> I saw no need to change it.
>=20
> That said, in-person participation is very much preferred. This yearly su=
mmit is meant
> for active media developers to meet face-to-face and to discuss media sub=
system issues.
>=20
> And it is also a good opportunity to talk to each other during the Embedd=
ed Recipes
> conference to discuss topics in a smaller group. But if you are an active=
 media developer
> and are really not able to attend in person, then remote participation is=
 an option.
>=20
> If you want to attend the meeting (either in person or remote), then send=
 an email to me
> directly. The deadline for in-person attendance is May 14 as the hotel ne=
eds to know the
> final number of attendees by then.

I'd like to attend in person. As I also got a topic, I included this in
the 'Reply All', I hope that is fine.

>=20
> There is no registration fee, the meeting room is sponsored by Cisco and =
Collabora, and
> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it=
's very much
> appreciated.
>=20
> If you have a topic that you want to discuss, just 'Reply All' to this an=
nouncement
> and give the topic title, a short description and a guesstimate of the ti=
me you need
> for your topic.

I'd like to continue the discussion on "Module identification".

Title: How to progress on Module identification
Description: In many real world use cases it is necessary to identify
the exact module/lens combination on top of the currently used sensor to
be able to provide corresponding tuning data. I'd like to recap on the
existing ideas and add a few more thoughts on how we could solve that.

I'll collect a few slides on that topic, but as the agenda is already
well filled, I'm not sure if it finds a spot. I expect that 15min would
be sufficient for that.

Best regards,
Stefan

>=20
> See last year's Media Summit Report as an example of what to expect:
>=20
> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@=
jjverkuil.nl/
>=20
> Regards,
>=20
>         Hans
>=20
> PS: Be aware that May 24 and 25 are public holidays in France. So many sh=
ops may be
> closed those days.
>=20
> In-person attendees:
> Sakari Ailus <sakari.ailus@linux.intel.com>
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Brandon Brnich <b-brnich@ti.com>
> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> Mehdi Djait <mehdi.djait@linux.intel.com>
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Marco Felsch <m.felsch@pengutronix.de>
> Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Paul Kocialkowski <paulk@sys-base.io>
> Jai Luthra <jai.luthra@ideasonboard.com>
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Beleswar Padhi <b-padhi@ti.com>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Loic Poulain <loic.poulain@oss.qualcomm.com>
> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> Ricardo Ribalda <ribalda@chromium.org>
> Michael Riesch <michael.riesch@collabora.com>
> Daniel Stone <daniel@fooishbar.org> (Collabora)
> Devarsh Thakkar <devarsht@ti.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Suresh Vankadara <svankada@qti.qualcomm.com>
> Hans Verkuil <hverkuil@kernel.org> (Cisco)
>=20
> Waiting List (In-person if space, otherwise remote. Decision will be made=
 mid-May):
> Robert Mader <robert.mader@collabora.com>
> Satish Babu Patakokila <spatakok@qti.qualcomm.com>
>=20
> Remote attendees:
> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Mauro Carvalho Chehab <mchehab@kernel.org>
> Rishikesh Donadkar <r-donadkar@ti.com>
> Jackson Lee <jackson.lee@chipsnmedia.com>
> Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
>=20
> Agenda (tentative):
>=20
> 8:45-9:20: Arrive, settle in
>=20
> 9:20-9:30: Short intro (Hans Verkuil)
>=20
> 9:30-9:45: Status of ISP support in V4L2
>         Presenter: Laurent Pinchart
>         Description: Summary of ISP-related development in V4L2 since the=
 last
>         Linux Media Summit. This includes a brief overview of technical
>         developments, and a summary of the efforts to engage with vendors.
>=20
> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
>         Presenter: Paul Kocialkowski
>         Description: An update on the ongonig work to support stateless c=
odecs in V4L2.
>         Some of the remaining open topics will be presented and discussed.
>=20
> 10:45-11:00: break
>=20
> 11:00-11:30: Vulkan Video Codecs
>         Presenter: Nicolas Dufresne
>         Description: Vulkan video codecs: what are the viable options for=
 Linux Media
>         and what is in preparation outside of our subsystem. The second a=
spect is
>         informative as these discussions don't seem to lean toward our su=
bsystem as the
>         foundation. But I think it's rather useful for everyone to unders=
tand why and
>         what is included.
>=20
> 11:30-12:00: Protected Video playback on i.MX8MQ
>         Presenter: Rouven Czerwinski
>         Description: Introduction to protected video playback
>         on i.MX8MQ and missing bits for linux-media & protected heap inte=
roperability.
>=20
> 12:00-13:30: Lunch
>=20
> 13:30-14:00: HDCP support for HDMI receivers
>         Presenter: Hans Verkuil
>         Description: I have been working on adding HDCP support for HDMI =
receivers.
>         Specifically the HDCP negotiation between sources and sinks.
>=20
> 14:00-14:45: Common raw sensor model, streams, metadata and metadata seri=
es status
>         Presenter: Sakari Ailus
>         Description: The Common Raw Sensor Model defines a new UAPI for c=
amera
>         sensors in Linux. It provides a more useful UAPI for configuring =
camera
>         sensors than the existing practice is. The metadata series includ=
es the
>         Common Raw Sensor Model and a number of other improvements, such =
as generic
>         raw formats, metadata support and finally enabling the streams uA=
PI.
>=20
> 14:45-15:15: AI patches
>         Presenter: Sakari Ailus
>         Description: What is our policy w.r.t. AI generated patches?
>=20
> 15:15-15:30: Break
>=20
> 15:30-15:45: A case for a media-job scheduler
>         Presenter: Jacopo Mondi
>         Description: Dan has proposed last year a framework for schedulin=
g operations
>         across multiple drivers that compose a capture pipeline:
>=20
>         https://www.spinics.net/lists/linux-media/msg279502.html
>=20
>         To better clarify why this is useful, I would like to discuss and
>         describe a practical use case based around the Mali-C55 ISP as
>         integrated in the Renesas RZ/V2H(P) SoC.
>=20
> 15:45-16:15: The Butterfly Effect or How Support for Complex Hardware may=
 affect the uAPI
>         Presenter: Michael Riesch
>         Description: Video capture and camera hardware in recent SoCs is =
exceedingly complex
>         and the assumption that there is one central V4L2 driver that reg=
isters
>         the media device does not necessarily hold anymore. IMHO we need a
>         central media device to rule them all and adaptations to the
>         v4l2_{async,device}_register_subdev code.
>          - Dynamic (de)registration of media entities is desired
>          - This requires considerations about the uAPI
>          - There is significant overlap with the notion of fault-tolerant=
 V4L2
>          - There is also a ton of cleanup work, but the resulting patches=
 must
>            not break anything existing
>          - So we need to talk about possible migration strategies in orde=
r to
>            achieve reasonable progress without interfering too much with
>            existing and working parts
>=20
> 16:15-16:45 Overview of Media CI: where do pipelines run?
>         Presenter: Ricardo Ribalda
>         Description: How are jobs in pipelines assigned? How does the inf=
rastructure
>         for Media CI work? Are there things that can be tweaked to make i=
t more
>         reliable?
>=20
> 16:45-17:30: Discussion of the media subsystem development process
>         Presenter: Hans Verkuil
>         Description: Review of the multi-committer model: current status =
and next steps.
>         Are there any bottlenecks, any ideas for improvements, w.r.t. the=
 development process?
>

