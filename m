Return-Path: <linux-media+bounces-56091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGiVLGxauWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:43:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827F2AB201
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B880431015E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEAE2D592E;
	Tue, 17 Mar 2026 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxX9tq30"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255842C0F6F
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754833; cv=none; b=Xwkur0U9NQbKUW1R6tP9PbTtg7A4oiIpAZwduVMAGAp3xR4wR7ddxEjGNRNFwSQeQSvHdJwAQEv9dXf5oOedC5ab6EtYW7cY4MUul5E2jY00GRLhKi8raC5Z/PafXnzh1lCVxRsZuphyTnoWeqx1JTlIkXaL14ejN25D41dz5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754833; c=relaxed/simple;
	bh=ukEdBRqORvau80MIfMeCKHot6URwAG/oM70kKwMQig4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=vD9aAhf9igj0svacH4BS53XzEmTz7FP7HfjnOZrgekbevZ2tU2VhVzbgW2trWrZ0kS0cphK0JTwWp+Ue9WBrfc6aBBCeJ9L3026dIfYS8VHE52EVd+qdGb1ThNrd/sZCZKuXXxI/J2UWtYeaPyVA+B5OWZM7/r+b8rFateN8V3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxX9tq30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A26BC19425;
	Tue, 17 Mar 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754833;
	bh=ukEdBRqORvau80MIfMeCKHot6URwAG/oM70kKwMQig4=;
	h=Date:From:Subject:To:Cc:From;
	b=KxX9tq30yUVeFsXlvuGCtZotXvLNwATn/E53xfBY9zybdBDG5agjtSCRWFXS+KFzo
	 rrFCnZ6R6P6NUXmCQYRuDiV17Mbt/eLYIbmyzY9f3f+cHo+dArlF1JmiI0fKs/eXGq
	 lsEtFIq+T4o9llElPK/nub7UXPPsVNVlMEw9HGqYiEnuc+4e3LSWvN7J+iBJh6CxeD
	 VfjdQt7EjAuXHXBB4HYsZiKsRhSaFTSkh1+BDvOf6dGqw9sYTcsIX+pZD7vil4wL00
	 8gu71DT24VZ1B1K/sgF858gfRHlczl9kLXy3d6hhuSSNK6wSIEAyhzJetfG/MljAJg
	 RyEkGTEgFpCEg==
Message-ID: <b20e0a50-9b0b-4fec-94a5-60bda74ddc9f@kernel.org>
Date: Tue, 17 Mar 2026 14:40:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANNv2] Media Summit on May 26th in Nice, France
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
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-56091-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1827F2AB201
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Please pass this on to anyone you think might be interested in this!)

Hi all,

This is the second version of this announcement, adding a list of attendees
and a tentative agenda at the end: please let me know if you see mistakes.

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
Michael Riesch <michael.riesch@collabora.com>
Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Loic Poulain <loic.poulain@oss.qualcomm.com>
Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Michael Tretter <m.tretter@pengutronix.de>
Sven Püschel <s.pueschel@pengutronix.de>
Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Devarsh Thakkar <devarsht@ti.com>
Marco Felsch <m.felsch@pengutronix.de>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Nicolas Dufresne <nicolas.dufresne@collabora.com>
Paul Kocialkowski <paulk@sys-base.io>
Brandon Brnich <b-brnich@ti.com>
Ricardo Ribalda <ribalda@chromium.org>
Kieran Bingham <kieran.bingham@ideasonboard.com>
Hans Verkuil <hverkuil@kernel.org>

Remote attendees:
Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
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

