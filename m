Return-Path: <linux-media+bounces-29586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78AA7F55A
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6467A7A6BEE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0A325FA07;
	Tue,  8 Apr 2025 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdJJZw+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136852063FA
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095548; cv=none; b=TwrPI1s667T5jRIzgbOzXbIbOrHoF4BEs6BI1FoKtuz2ELEsRF7Ss4Q++xYwZ0dE5jdqQTlNfH9N0O10NSjpNmNguDGFKMVmxHERc77wfxmloQLso1gtm5WvStulrfC51fZlpU1LzjNcxhpoPDTqKGGdxNkrbg18IRB8rmIPKwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095548; c=relaxed/simple;
	bh=W2OIE3/3U4lTp8OtiUoL89lXbCZT+TjG/7gHbrQ3XOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRm305TAPXIK0iWzzjlu9kQxW4eTlZJyuLjPqt6ubsC+N0V0YK30xj4Lvi6MfVyJz5oLavJEivbPuC64T+jMlpo6m+vv+UvtiA2TcnvEZFmeiHamUbw9ndppyndQ5WenZPkIIYDktc9GMAxBDJA9s9G9eqRe/J31XXceDXN9YZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdJJZw+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0593FC4CEE5;
	Tue,  8 Apr 2025 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095547;
	bh=W2OIE3/3U4lTp8OtiUoL89lXbCZT+TjG/7gHbrQ3XOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JdJJZw+ZfZOEpTSbx4pTAInex/adwiAe7fMhyXviY4t0+2T3qxY2qqd6p8XRX1pWq
	 fLY48pUXpz7fAflVFzx+REp/IhigiALAw0ipWgSdCDvhL/xRCp8aFeKvQ4rrGubLdV
	 iYwPyBEsAI6oIwphmzYKE8DDoKx5NO39K+FObIPCvFXZ/fYCOfqr0l5AcfwHh493VI
	 vtKYD9Zafca3Trf9tF4nnrPhqAy3LpZDwWRdaWJcSU+gHAuV0R6a6Wj1R8Pug1uqJc
	 kJFT9NMuKlOFTVxep044wkzoauVyvDiNHdBczT3Eip5iTO58NIvKiaogd5+Yiqz5q5
	 BBoP1lw177Dww==
Date: Tue, 8 Apr 2025 14:58:29 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media
 Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sean Young <sean@mess.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund@ragnatech.se>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
Message-ID: <20250408145829.43486af3@sal.lan>
In-Reply-To: <8d07578f-4c12-477c-a973-9427faefc07a@xs4all.nl>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
	<20250407193909.GA17385@pendragon.ideasonboard.com>
	<20250408133142.030bd1cf@sal.lan>
	<8d07578f-4c12-477c-a973-9427faefc07a@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 8 Apr 2025 08:42:58 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 08/04/2025 07:31, Mauro Carvalho Chehab wrote:
> > Em Mon, 7 Apr 2025 22:39:09 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> >   
> >> I would like to propose the following topic.
> >>
> >> Review of the status of staging drivers
> >>
> >> We have a set of 11 drivers in drivers/staging/media/, with various
> >> states of maturity and development activity.  
> > 
> > On a quick look, we have there:
> > 
> > 1. source "drivers/staging/media/atomisp/Kconfig"
> > 2. source "drivers/staging/media/av7110/Kconfig"
> > 3. source "drivers/staging/media/imx/Kconfig"
> > 4. source "drivers/staging/media/ipu3/Kconfig"
> > 5. source "drivers/staging/media/max96712/Kconfig"
> > 6. source "drivers/staging/media/meson/vdec/Kconfig"
> > 7. source "drivers/staging/media/rkvdec/Kconfig"
> > 8. source "drivers/staging/media/starfive/Kconfig"
> > 9. source "drivers/staging/media/sunxi/Kconfig"
> > 10. source "drivers/staging/media/tegra-video/Kconfig"
> > 11. source "drivers/staging/media/deprecated/atmel/Kconfig"
> >   
> >> drivers/staging/ is not meant as a place for drivers to die,  
> > 
> > It is, actually: we usually move things there before dropping,
> > because, on most cases, they could be salvaged if someone is
> > interested on it.
> >   
> >> we should nudge the relevant
> >> maintainers and consider dropping drivers that show no hope of
> >> progressing.  
> > 
> > Fully agreed.
> > 
> > -
> > 
> > Yet, while it makes sense to have action plans for drivers on staging,
> > I don't think that the Media Summit is the best place to discuss,
> > as people that might be involved with them may not be able to
> > participate there.  
> 
> Actually, I think quite a few of the relevant people will be there.

Good! Still, before taking any decisions/actions of dropping drivers,
we'll need to have discussions via ML.

> And I think it doesn't hurt to go through the list once a year.

Sure.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > See, there are different situations there, like:
> > 
> > - platform drivers: at worse case, those should be removed when
> >   the core/DT support for such platform is removed. We removed
> >   several such drivers in the past. We can also remove them earlier,
> >   if there are reasons for doing that and nobody is complaining;
> > 
> > - drivers like atomisp that takes a lot of efforts to be promoted.
> >   As long as I see some progress (and we've been seeing progress
> >   on every kernel version), I can't see any reason why removing it.
> > 
> > - drivers like ipu3, which is for an entire family of PC CPUs.
> >   I prefer not dropping drivers like these unless we have very good
> >   reasons to do so. On the other hand, we are seeing very little
> >   progress on those.
> > 
> > Anyway, better to split this into different threads, copying
> > the people involved on the recent changes for such drivers.
> > 
> > Regards,
> > Mauro  
> 

