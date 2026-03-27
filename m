Return-Path: <linux-media+bounces-57255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DoZIEFeUxml7MQUAu9opvQ
	(envelope-from <linux-media+bounces-57255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:29:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01800346116
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC439305F246
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659DA199920;
	Fri, 27 Mar 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO6vh06e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D73BB4A
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621708; cv=none; b=Z570QztXOtlKWQIHBXxN3D50sCzccXRfSfo4Gl1DooVKMgi2y2bIexQbYcbZDXDtnAtVSneFFOyeLBh5H1c0w8GA39UPDqCzwJm3Ffz5r3Z50jgvUUxeM3t9d63W32/p0IS6u4y5/BVLl0bYfH04QleH6r/nDtEpi5ZcaNiho4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621708; c=relaxed/simple;
	bh=13ut+pc06WW5siJcgsC1Q0NjWfQ1JaLOiLJwqlqZ9nA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=A3l9uUPjRPD8FIglVRybgTW69zIJ7KhGbycjHFk5R/wVvANnqGQjubFD3QbSHbPQPDSPW61MPS8qwYCqQ7S0FHoergpxJEVVOwZeemPdMau1Z45eED1gk0IF7Sun/UZn++5esu7NJn8rwlK+20DPGcOM2JzcyozEBHNV8nXEV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO6vh06e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39743C19423;
	Fri, 27 Mar 2026 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774621708;
	bh=13ut+pc06WW5siJcgsC1Q0NjWfQ1JaLOiLJwqlqZ9nA=;
	h=Date:From:Subject:To:Cc:From;
	b=RO6vh06eoa38vO0ZgvFGCDeNHiokCIYwnJmu9gTrVy5gLx5H3KmLZE+5lmW36RtTu
	 2SHNoZKS/uOJq7fKB/EQ33IowFG+hYFRX3RGaicnQm8dJhouygJ8YU9J21yOwagTD1
	 J5KFJRbO92a5nul+85u6iSqqqIs8gxl0JiasdFPF2YYcAkj+PTkMR2Nvrnbg4UJfhV
	 kII2qQ1OBNJ2ZL18a58KmppccjLPTUhEMs1pP6EviyeejDfFkpTXhn1fR+ugIAQRDG
	 GPcBWq5LjbkSEU+0Da51m04U0XOo3U9RBnUWoGb6NlrKCu2X0Htb0xZKe81FLajwF/
	 ztkfM+x95VqcQ==
Message-ID: <cd6465bc-ca32-429d-8e79-1a27cdee33e3@kernel.org>
Date: Fri, 27 Mar 2026 15:28:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANNv3] Media Summit on May 26th in Nice, France
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
 Jai Luthra <jai.luthra@ideasonboard.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-57255-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[32];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01800346116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Please pass this on to anyone you think might be interested in this!)

Hi all,

This is the third version of this announcement, updating the list of attendees
and the tentative agenda at the end: please let me know if you see mistakes.
Note that more topics are welcome!

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

This announcement goes out quite early for once, usually it takes a lot longer
to organize, but having it in the same place as before made life so much easier.

Regards,

	Hans

PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
closed those days.

In-person attendees:
Sakari Ailus <sakari.ailus@linux.intel.com>
Kieran Bingham <kieran.bingham@ideasonboard.com>
Brandon Brnich <b-brnich@ti.com>
Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Nicolas Dufresne <nicolas.dufresne@collabora.com>
Marco Felsch <m.felsch@pengutronix.de>
Paul Kocialkowski <paulk@sys-base.io>
Jai Luthra <jai.luthra@ideasonboard.com>
Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Benjamin Mugnier <benjamin.mugnier@foss.st.com>
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
Jackson Lee <jackson.lee@chipsnmedia.com>
Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)


Agenda (unordered, *very* tentative):

Title: Discussion of the media subsystem development process
Presenter: Hans Verkuil
Time estimate: 1 hour
Description: Review of the multi-committer model: current status and next steps.
Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

Title: Status of ISP support in V4L2
Presenter: Laurent Pinchart
Time estimate: 15 minutes
Description: Summary of ISP-related development in V4L2 since the last
Linux Media Summit. This includes a brief overview of technical
developments, and a summary of the efforts to engage with vendors.

Title: Vulkan Video Codecs
Presenter: Nicolas Dufresne
Time estimate: ???
Description: Vulkan video codecs: what are the viable options for Linux Media
and what is in preparation outside of our subsystem. The second aspect is
informative as these discussions don't seem to lean toward our subsystem as the
foundation. But I think it's rather useful for everyone to understand why and
what is included.

Title: V4L2 Stateless Video Encoding uAPI Progress Update
Presenter: Paul Kocialkowski
Time estimate: 1 hour
Description: An update on the ongonig work to support stateless codecs in V4L2.
Some of the remaining open topics will be presented and discussed.

Title: HDCP support for HDMI receivers
Presenter: Hans Verkuil
Time estimate: 30 minutes
Description: I have been working on adding HDCP support for HDMI receivers.
Specifically the HDCP negotiation between sources and sinks. Decrypting
protected video to secure memory is not part of V4L2 so I won't discuss this.

Title: Overview of Media CI: where do pipelines run?
Presenter: Ricardo Ribalda
Time estimate: 30
Description: How are jobs in pipelines assigned? How does the infrastructure
for Media CI work? Are there things that can be tweaked to make it more
reliable?

Title: AI patches
Presenter: Sakari Ailus
Time estimate: 15
Description: What is our policy w.r.t. AI generated patches?

