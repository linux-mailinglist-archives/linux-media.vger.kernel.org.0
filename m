Return-Path: <linux-media+bounces-32118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA4AB0F50
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478E13BB8A6
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4961B28D831;
	Fri,  9 May 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oi0Og2pG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E751728A1DC
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783621; cv=none; b=P7S8vPhIlr9rSVZh1kU436a33WIAiwuaQMRLaSo5t/13Sg3gCQQjpW/NzSYVUX0Tpt6V1RGBhRIAmXozlGea03Qwtd3Gkr3jl/ujH1oXGQwNh9pq1a6Z+5XG0zxMdlIq67Lz2Wj3n+qhkbR1cownZcJHmPHfGd3GXWbfAYDOswY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783621; c=relaxed/simple;
	bh=/s5UWAtS6yK6sx6W70sCKxI4RQLAqa8ShRlt9Xz8LG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtaXzqKFmw87fTDyscYQ9wwUfu6CAmax3Qxa50zF+eS23ci3vrBYGRBJOB2sS5gFB1Pfk/KGK7qYWU6d+O63kYJzb6V9xaozhgZcoCuYqXcs6fYiesV0o+6YIKAw//tfN5mdwDVsvH0WdGfCRD7KsvpEAzJE39E6ClVioHHzq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oi0Og2pG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 784FC9E5;
	Fri,  9 May 2025 11:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746783601;
	bh=/s5UWAtS6yK6sx6W70sCKxI4RQLAqa8ShRlt9Xz8LG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oi0Og2pG28Ea22k6/NQ9P7pN/AYDieSX4jbkeBHGQ1oXnVY/lOP8RJoNzdVrESHY4
	 56/ID1HzEIN+qmgLpFbJExW6D6Y4kvDgJdyUWRD7T6AdiggSgT7bgRIo9WGz7FOHak
	 s4M3D/rz3NoRBCJ04xVpUto283ImmNHLoxYJLiHo=
Date: Fri, 9 May 2025 11:40:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
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
Message-ID: <20250509094005.GA30047@pendragon.ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBjYnrvg-_T-7xRi@kekkonen.localdomain>

On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:
> Hans, Laurent, others,
> 
> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> > 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> > 
> > Please reply with corrections, questions, etc. to the agenda.
> 
> As it seems we might have a little bit of time left, I'd like to propose a
> keysigning party we haven't done for a few years now. We have some new
> people here and the folks who have been around for longer have new keys,
> too.
> 
> This is what we did the previous time
> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
> 
> I wonder if Laurent would like to do the same this time around. I can also
> help with the arrangements.

I don't mind signing keys, but I won't have time to organize it. Feel
free to take the lead :-)

> Instead of key servers, there is
> <URL:https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/>. For initial
> fingerprint distribution, e-mail or an editable document (over HTTPS)
> probably works the best. I can provide an e-mail address / URL in case
> there's a need to.

-- 
Regards,

Laurent Pinchart

