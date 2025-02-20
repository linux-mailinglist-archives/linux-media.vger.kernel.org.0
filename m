Return-Path: <linux-media+bounces-26439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3B7A3D5D6
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B2B47AAEEB
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC53B1F152B;
	Thu, 20 Feb 2025 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wD2vKYbu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCE286295
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045645; cv=none; b=T/+7WDa10x9OGnXMttJT6XnYzmugYOnyJrYHE2eqDQoiKBvlowTC1fGpM59MmKl5afpZOHv2OvS5LwZqiyVvfMEQUiROg843a3JKZy+KGl14lCpIbkSZhkxjrLfmBX+3Kdw1rd5v3sivZ1Eor+5+AToWtjosLVQKx+d2JSNm8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045645; c=relaxed/simple;
	bh=35GY1RzHsnomIRl7F49FUBIHL8/gzz4qBtvzCDPw/F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWC/kFoRctwUvZSmewAljI8XDzDKs/9XHb6/R4anN6hVG6kshCAGK3UbArBWI5EhLAcclmF/DuUiOtIZbKFY4LX/nU0m0eqI2HjHsA2wOi5f6SIwFdyljbiKqZTtl79M78VY795WzbviCnzLapvD7Vv5nVOxYw13+g9b85k138I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wD2vKYbu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B42F574C;
	Thu, 20 Feb 2025 10:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740045557;
	bh=35GY1RzHsnomIRl7F49FUBIHL8/gzz4qBtvzCDPw/F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wD2vKYbuSVtqB5ho9k9tdHTOgLCzvVSf3Sc1mifcDp/QgEoaX3hPBFza81HwDh5kW
	 9FePlkYZs4b4xBQiocLHedcGP9uxdhjp+QEdP8QIAujdqTkzgv2wnjxyWW1fsssHhJ
	 dhukI9AIXGzkCy4ZOyvaF065Ef0HYo6R1nJhRCZI=
Date: Thu, 20 Feb 2025 12:00:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANN] Media Summit 2025: Lyon in May or Amsterdam in August?
Message-ID: <20250220100025.GF31825@pendragon.ideasonboard.com>
References: <a9f77089-85ac-4d6a-a29f-14679e6e8b54@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9f77089-85ac-4d6a-a29f-14679e6e8b54@xs4all.nl>

On Thu, Feb 20, 2025 at 08:35:28AM +0100, Hans Verkuil wrote:
> Hi all,
> 
> We want to organize a Media Summit this year as well to meet each other face-to-face.
> We try to co-locate with an existing conference, and this year there are two options:
> 
> 1) Co-locate with the Embedded Recipes conference in Lyon which is held on May 14-16:

Small correction, Embedded Recipes is in Nice.

>    https://embedded-recipes.org/2025/
> 
>    So a media summit would probably take place on May 11 or 12.
> 
>    This conference is a one room, one track format. But the room holds up to 200
>    people and the expectation is that it is not a problem to get tickets for it.
>    And we might be able to reserve some tickets for us as well.
> 
>    There might be a gstreamer and/or libcamera workshop in the weekend after the
>    main conference as well, I understand that is being worked on.
> 
> 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
> 
>    https://events.linuxfoundation.org/open-source-summit-europe/
> 
>    The Embedded Linux Conference Europe is part of that event. The summit would
>    probably be on August 24 or 28.
> 
> I know that getting permission to travel is still a problem for many, which is why we
> try to co-locate with a larger event.
> 
> So: if you are a core media maintainer or an active media developer, and want to join
> the Media Summit, which of these two options would work for you?
> 
> If possible, I would like to get an idea of what I can expect in about two weeks time.
> I'll send out a reminder in about a week as well.
> 
> Feel free to forward this if you know other people who might be interested.
> 
> If you haven't been to one of these Media Summits before, then you can find the report
> on last year's summit here:
> 
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> 
> That should give you an idea of what to expect.
> 
> Regards,
> 
> 	Hans

-- 
Regards,

Laurent Pinchart

