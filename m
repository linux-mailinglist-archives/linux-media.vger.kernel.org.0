Return-Path: <linux-media+bounces-26454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E6A3D98F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475343BD3F5
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6231F4720;
	Thu, 20 Feb 2025 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="spM8QGAh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD21F4626
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053492; cv=none; b=Igt2ryUUy6JSH2Qw10tPsfRPrwT2unzxogxlmzBOl+2WZQu8Xi868euP/Aa7zHlv22zsg0vgro16ZTXwI06fUJKHG5hDltj+g9Pu7NAx4dy2hdQIGH+pZfuXLYzx81+7XpyD5nqNP+5Z+1/JhsgftQw29xIEXVOuaF5rO6Cn1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053492; c=relaxed/simple;
	bh=r8IYxrRXAnKduh4TLmdIc3jgKVwKdZs/UkxlwTO6S0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUrkgBYfliVeRzxGu8m5JKYInZ+NMF5qApIx2BgcOjEP8+Wy64/5BKtD4lXiXnngXpg6hLG0ndPrzyL0hzcu/EdLpfsWkhGGX/6Gh04r6vKL9VtU6lOOIk9U67XQR7ZINYiX3J81xnNI7bABqMUf1SoAeLkhyPvdVu+aPr+24k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=spM8QGAh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F03ACE79;
	Thu, 20 Feb 2025 13:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740053404;
	bh=r8IYxrRXAnKduh4TLmdIc3jgKVwKdZs/UkxlwTO6S0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spM8QGAhCBuaDN0L9FqUu7LTYCodG07JWyoTEZDzFU1xtu5l3wpRvoLEWIF+q57Y0
	 lkaLGTdS+ZBBqbf29M5DqqNm22gIxZJzYfgXLosxt6DLzYhHwnXCqqkw2a1ZHoQK8l
	 OTd+KZd8RMaW4Z1Fv1/2aBhLBBVegiSMaWSudHNo=
Date: Thu, 20 Feb 2025 14:11:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
Message-ID: <20250220121112.GC22240@pendragon.ideasonboard.com>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
 <2her7s6acicbzk7pkknflckhp46klxqzplyr4bw2daz6dw4rb4@pzx3gki6uorj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2her7s6acicbzk7pkknflckhp46klxqzplyr4bw2daz6dw4rb4@pzx3gki6uorj>

On Thu, Feb 20, 2025 at 12:34:23PM +0100, Jacopo Mondi wrote:
> Hi Hans
>    thanks for organizing this
> 
> On Thu, Feb 20, 2025 at 11:24:30AM +0100, Hans Verkuil wrote:
> > [Repost because I mixed up a Lyon and Nice, and to provide more info on the other
> >  events that take place in Nice. Also added Kevin Hilman to the CC list.]
> >
> > Hi all,
> >
> > We want to organize a Media Summit this year as well to meet each other face-to-face.
> > We try to co-locate with an existing conference, and this year there are two options:
> >
> > 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
> >
> >    https://embedded-recipes.org/2025/
> >
> >    So a media summit would probably take place on May 11 or 12.
> >
> >    This conference is a one room, one track format. But the room holds up to 200
> >    people and the expectation is that it is not a problem to get tickets for it.
> >    And we might be able to reserve some tickets for us as well.
> >
> >    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
> >    GStreamer plans an event during the weekend after ER.
> >
> > 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
> >
> >    https://events.linuxfoundation.org/open-source-summit-europe/
> >
> >    The Embedded Linux Conference Europe is part of that event. The summit would
> >    probably be on August 24 or 28.

Do I assume correctly we would organize it by ourselves like the
previous years, finding sponsors and renting a meeting room somewhere,
and not relying on the Linux Foundation ?

> > I know that getting permission to travel is still a problem for many, which is why we
> > try to co-locate with a larger event.
> >
> > So: if you are a core media maintainer or an active media developer, and want to join
> > the Media Summit, which of these two options would work for you?
> 
> I know I will be in Nice, not sure about Amsterdam yet.
> 
> The co-location of a libcamera, pipewire and gstreamer events also
> makes me lean towards Nice as a better choice for the media summit.

Likewise, I know I'll be in Nice. I can probably make it to Amsterdam
too if needed.

> >
> > If possible, I would like to get an idea of what I can expect in about two weeks time.
> > I'll send out a reminder in about a week as well.
> >
> > Feel free to forward this if you know other people who might be interested.
> >
> > If you haven't been to one of these Media Summits before, then you can find the report
> > on last year's summit here:
> >
> > https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> >
> > That should give you an idea of what to expect.

-- 
Regards,

Laurent Pinchart

