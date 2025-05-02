Return-Path: <linux-media+bounces-31629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C1AA768B
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123F1983430
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AB225B1E2;
	Fri,  2 May 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SuB9U1tx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0B25A331
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201538; cv=none; b=XMBmJl6wF7/DvWNqHTySX6eHgfOJg/+zFgK8BjFucXcYjavFcCjofQkbqsyhbCtScHzsL/DIuqhr0uJ2CyhfKtG0UbFGyI5jLM4X/SNAlr19NSx6wizWGEV+AwAH3oZD1iuPHAPKyiDXpJ5m3EjIr2BVJawvaM3OuScLt5aP7a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201538; c=relaxed/simple;
	bh=d+PSw0JYvVPF0oeno3KUP7YBvR+JhmVRQyPjJA6hyq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9/pxwUX7VpA9N6ATLYHvZSWha5HzZpIFN+IJErxd6MHZXiCYwUEhamkxWndWf68X5Ujs/OFTZr3pGL6QNeUtC23BabmpdVb87eYeTYF8iHpf4QdC7oH57MMEpDEdFR3/M9Nt8G08nEjilUuQI7sBDCeLQ6FSlXR5papYZYKw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SuB9U1tx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82AEB353;
	Fri,  2 May 2025 17:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746201526;
	bh=d+PSw0JYvVPF0oeno3KUP7YBvR+JhmVRQyPjJA6hyq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuB9U1txmz9O9tOcJuALVGnBfXOToqvk6Bw73R+8Cym0FZqV09KvGsp+TZ47ENafP
	 72JPkz9mEJ5WbttOmJZ8coDIAjvlAsM+KqDz6nl/A6MiP+uw6AmC8laPk6Aa4r0Nm8
	 YdtcafMu5kFL0gwMfmvTGaNHKo8enUQ+M6yjn/kE=
Date: Fri, 2 May 2025 18:58:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
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
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <20250502155845.GB15945@pendragon.ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>

On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Here is my v4 of the draft (close to final) agenda for the media summit.
> 
> Changes since v3: added more attendees, added a new topic (cgroups) from Maxime.
> Please note that I slightly reduced the length of some of the topics since we
> have a packed agenda. Please let me know if you think you need more (or less!)
> time then I put you down for in the agenda. My experience is that it tends to
> average out (some topics take more time than expected, some less), but a good
> estimate helps. I also updated the lunch information.
> 
> One important notice: it turned out that the meeting room does not actually have
> dedicated video conference equipment. I'm trying to figure out a solution for this,
> but for those that registered for remote attendance, be aware that it might not
> work out or be of poor quality. I hope to have more information for you next week.

I have two conference speakers
(https://us.ankerwork.com/collections/speaker/products/a3305) that I can
bring. We used them during the last libcamera workshop and the
experience was reasonable. No guarantee of fitness for the purpose
though, it depends on the size and configuration of the room.

> We have 18 in-person attendees, which is in line with previous summits, even though
> the time since the last summit is less than usual and we are co-located with a
> different conference. It's good to know that those changes didn't impact the turn-out.
> 
> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
> please let me know and just send it to the old email (that won't go away).
> 
> The Media Summit will be held Tuesday May 13th to coincide with
> the Embedded Recipes Conference in Nice, France:
> 
> https://embedded-recipes.org/2025/
> 
> Note that there are also some workshops held after this conference:
> 
> https://embedded-recipes.org/2025/workshops/
> 
> And a gStreamer hackfest:
> 
> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
> 
> The Media Summit will be held at Hotel Campanile:
> 
> https://nice-aeroport.campanile.com/en-us/
> 
> It is close to the Airport and to the Embedded Recipes venue.
> 
> The meeting room is sponsored by Collabora and Cisco Systems Norway.
> The lunch is sponsored by Ideas on Board. Many thanks to our sponsors
> for making this Media Summit possible!
> 
> We have the following confirmed in-person attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
> Hans de Goede <hdegoede@redhat.com> (Red Hat)
> Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Maxime Ripard <mripard@redhat.com> (Red Hat)
> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> 
> And the following remote participants:
> 
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> 
> Note: information on how to connect remotely will come later. See also the notice
> at the top of this email.
> 
> If any information above is incorrect, or if I missed someone, then please let me know asap.
> 
> Agenda:
> 
> 9:00-9:30: Get settled :-)
> 
> 9:30-9:40: Hans Verkuil: Quick introduction
> 
> 9:40-10:25: Paul Kocialkowski: Stateless video encoding uAPI
> 
> 10:25-11:15: Jai Luthra: Per-stream V4L2 controls
> 
> 11:15-11:30: break
> 
> 11:30-12:15: Sakari Ailus: Identifying camera modules
> 
> 12:15-13:30: Lunch at L'Azur Bistrot Niçois

It will take about 10 minutes to walk to the restaurant, plus the time
to leave the room, so I have informed them we will arrive at 12:30.

> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
> 
> 14:00-14:50: Hans de Goede: Discuss V4L2 subdev API ambiguities
> 
> 14:50-15:10: Jacopo Mondi: Unify the multi-context support with the m2m context handling
> 
> 15:10-15:25: break
> 
> 15:25-15:50: Maxime Ripard: V4L2 & cgroups memory accounting
> 
> 15:50-16:35: Ricardo Ribalda: Openness Framework for ISPs
> 
> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> 
> Please reply with corrections, questions, etc. to the agenda.

-- 
Regards,

Laurent Pinchart

