Return-Path: <linux-media+bounces-29592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF915A7F8C6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54FFF188F9F8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AF3263C7D;
	Tue,  8 Apr 2025 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VF3+LXkF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816A22331F
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102480; cv=none; b=Xmm5HwnEhy/IQ6SYxvhx3O1g4S/sWtuP3UoL2w2gH+AaqY8St7vE2hiVN+zYeO2s3nR3EWZH0+Ja2icA87ohA15wST2vfNnBkGl9v5y5Hmh302+atAJfNBUP+GZ2aXeL2MvefFHsAZoNlrB8lj+GLsUmUKQr7c9ldvUVooyf1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102480; c=relaxed/simple;
	bh=qCgX1X7reqJVC5FvJffs4do6ccxPs2p2tdERK+zugEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnqzxFRoepQr325rjTa3oY37rBel4+BygQ4NHABiVdwa9ojyi/l4HW2Q469bQVFaYvrh0cUXOE4/ICL8D3i60bJph1JaGR0VYrHL8MDGFiS1/oOBdboySCQZaxK8ku8USx5B086KMPdvTRCOxUFl6nIpETZ8ZzCL94wdcRi8cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VF3+LXkF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB4956EC;
	Tue,  8 Apr 2025 10:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744102359;
	bh=qCgX1X7reqJVC5FvJffs4do6ccxPs2p2tdERK+zugEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VF3+LXkF7IG/HKC7eG6ojOdoky9aQAgFsBkqgzfRpqYSHT4PQSGoX6OMi1bRhzOiH
	 lRoeQV+0HaMhFWOmcO9iqUp0AIWnbSfPFL+BaWGMgITuh/kqZFhnyC5R8BV/BPDxod
	 5fetdiM0FvlCH0O7ShiTqgwMEIItGSvhpYNmtI2Q=
Date: Tue, 8 Apr 2025 11:54:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
Message-ID: <20250408085411.GA31475@pendragon.ideasonboard.com>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
 <20250407193909.GA17385@pendragon.ideasonboard.com>
 <20250408133142.030bd1cf@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408133142.030bd1cf@sal.lan>

Hi Mauro,

On Tue, Apr 08, 2025 at 01:31:42PM +0800, Mauro Carvalho Chehab wrote:
> Em Mon, 7 Apr 2025 22:39:09 +0300 Laurent Pinchart escreveu:
> 
> > I would like to propose the following topic.
> > 
> > Review of the status of staging drivers
> > 
> > We have a set of 11 drivers in drivers/staging/media/, with various
> > states of maturity and development activity.
> 
> On a quick look, we have there:
> 
> 1. source "drivers/staging/media/atomisp/Kconfig"
> 2. source "drivers/staging/media/av7110/Kconfig"
> 3. source "drivers/staging/media/imx/Kconfig"
> 4. source "drivers/staging/media/ipu3/Kconfig"
> 5. source "drivers/staging/media/max96712/Kconfig"
> 6. source "drivers/staging/media/meson/vdec/Kconfig"
> 7. source "drivers/staging/media/rkvdec/Kconfig"
> 8. source "drivers/staging/media/starfive/Kconfig"
> 9. source "drivers/staging/media/sunxi/Kconfig"
> 10. source "drivers/staging/media/tegra-video/Kconfig"
> 11. source "drivers/staging/media/deprecated/atmel/Kconfig"
> 
> > drivers/staging/ is not meant as a place for drivers to die,
> 
> It is, actually: we usually move things there before dropping,
> because, on most cases, they could be salvaged if someone is
> interested on it.

I should have be clearer in my e-mail. We indeed use staging in two
different ways, for drivers to go in the kernel, and drivers to get out.
The latter is handled by the drivers/staging/media/deprecated/
directory. As I wanted to focus on drivers going in, I ignored that side
for the purpose of this discussion. I see no issue with moving drivers
to deprecated/ for a few releases before deleting them completely.

For drivers that are merged in the kernel through staging, however, my
opinion is that they're not meant to be left there to die, or they
shouldn't get merged in the first place.

> > we should nudge the relevant
> > maintainers and consider dropping drivers that show no hope of
> > progressing.
> 
> Fully agreed.
> 
> -
> 
> Yet, while it makes sense to have action plans for drivers on staging,
> I don't think that the Media Summit is the best place to discuss,
> as people that might be involved with them may not be able to
> participate there.

I'm not asking for final decisions on individual drivers to be made
there. The topic is about deciding on a subsystem policy, communicating
it clearly, and finding the right incentives to ensure those drivers get
maintained and eventually graduate to drivers/media/.

> See, there are different situations there, like:
> 
> - platform drivers: at worse case, those should be removed when
>   the core/DT support for such platform is removed. We removed
>   several such drivers in the past. We can also remove them earlier,
>   if there are reasons for doing that and nobody is complaining;
> 
> - drivers like atomisp that takes a lot of efforts to be promoted.
>   As long as I see some progress (and we've been seeing progress
>   on every kernel version), I can't see any reason why removing it.
> 
> - drivers like ipu3, which is for an entire family of PC CPUs.
>   I prefer not dropping drivers like these unless we have very good
>   reasons to do so. On the other hand, we are seeing very little
>   progress on those.
> 
> Anyway, better to split this into different threads, copying
> the people involved on the recent changes for such drivers.

-- 
Regards,

Laurent Pinchart

