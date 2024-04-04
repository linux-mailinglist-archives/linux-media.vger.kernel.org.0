Return-Path: <linux-media+bounces-8632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDE8984C6
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D401C21A0F
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCC9763EE;
	Thu,  4 Apr 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i8GhAf5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CE762EF
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712225384; cv=none; b=Li7zHpVkp0mF29cd2B0QCdD+hPERaJlofi8nPRaTsKwGYVz3mvheg9Zd6/KLjf65hECpVBPbGbgkiHETxait3J0g8NTwdZiXrRxmB5U6wyorP0DFaCklDscGVY+U9y6CjszbXkYF+HY74a/PX2mpeEpMWMa8ttnF3N4NrcKl4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712225384; c=relaxed/simple;
	bh=oqFL+GrqVWo8Oto8bxZMsKlYP3JmiTP02n6XsvCQogM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idgFR7WFrVRFtsRnQ40qkUzO2rgtqEW9px/v2aVneblbgvoTQGPO866sjNOWc+gJ5qcOC/45CixpPO8HNZnQb9lgizz4cbMGSPpVMuyzn2WS3ms7LBem8etjJzvk/3iFoD6hMvVzsX2OIaXEqKM2ZmB7RJhZtnDGMLzAPp0Hmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i8GhAf5Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4DC0497;
	Thu,  4 Apr 2024 12:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712225342;
	bh=oqFL+GrqVWo8Oto8bxZMsKlYP3JmiTP02n6XsvCQogM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8GhAf5YduLiFtN+c7ECsW43wCQb6KKySQhpb80EtsaX2vEekgZlzDIsRCTdYkqSj
	 X09oZsacmPRu4FpW8xrXrJQZfWxK2yaQhGwc6G31H4aEk+q+TewODxK4TzJj4eqK1V
	 +OSpDs02XyzkzppvQsK1nwSGSyLPkWU8ETitoCgo=
Date: Thu, 4 Apr 2024 13:09:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
Message-ID: <20240404100928.GK23803@pendragon.ideasonboard.com>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>

Hi Hans,

On Thu, Apr 04, 2024 at 09:29:34AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Normally we like to have a one day Media Summit meeting co-located with
> the Embedded Linux Conference Europe, however there isn't one this year.
> 
> Instead of organizing an ELC both in North America and in Europe each
> year, the Linux Foundation switched to alternating between NA and Europe,
> and this year it is in North America.

It's a bit of a mess this year actually. The plan announced last year
was to de-couple ELC for OSS, as the event grew too big, causing
difficulties for attendees to find each other, and increasing the costs
quite dramatically. It was deemed not possible to keep organizing two
standalone ELC per year in the new setup, so they decided to handle it
as LPC, alternating between Europe and North America.

In practice, and for a reason that doesn't seem to be public, ELC NA has
been collocated with OSS NA, and someone decided to add an ELC component
to OSS EU in Vienna without really announcing it. It is a "mini ELC"
apparently, with two parallel tracks only.

TL;DR: It's a mess and many people in the community are frustrated.

> The problem is that most media subsystem developers are based in Europe
> for some strange reason.

The reason, and a possible change in that particular area of
demographics, are likely best discussed face to face in a state of
incomplete sobriety :-) In any case, it seems to be a fact at the
moment.

> So we have to make a choice this year: we can co-locate with the gStreamer
> and XDC conference in Montreal, Canada on October 7 or 8, or we can
> organize a meeting somewhere in Europe ourselves. One possibility is
> to try and co-locate with the Open Source Summit Europe/LPC conferences
> in Vienna, Austria in the week of September 16-20. Another is just to
> organize something ourselves somewhere in Europe. But that's a last resort,
> co-locating with a conference is generally more appealing for people.

We also floated the idea of co-locating with Embedded Recipes, but that
has been cancelled this year (partly due to the ELC changes).

> The advantage of picking Montreal is that the gStreamer conference is
> more applicable to the work we do, and we can get a meeting room there
> free of charge. Besides, I've never been to Montreal :-)

Montréal is nice :-)

> But can we get enough of the core media maintainers there? There is no
> point otherwise. I suspect that the same company travel constraints that
> were present last year are still in force this year.
>
> If we pick Vienna instead (assuming we can get a meeting room for a decent
> price), would that work better?

I think we can figure out sponsorship to pay for a room.

> So if you are a core media maintainer, or an active media developer interested
> in joining a Media Summit, please let me know if:
> 
> 1) Montreal, October 7 or 8, works for me!
> 2) Vienna, one day in the period September 16-20, works for me!
> 
> Please respond asap, I'd like to get a clear picture soon, ideally by the end
> of next week.

I will personally travel to Montréal regardless of where we organize the
media summit, so both work for me. I however think it will be difficult
to get a large enough audience there, and Vienna seems a better pick. We
will need to be careful to select a date that will minimize conflicts
though. As LPC is probably the most interesting event that week, and
runs from Wednesday to Friday, I think we should pick either Monday the
16th or Tuesday the 17th.

-- 
Regards,

Laurent Pinchart

