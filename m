Return-Path: <linux-media+bounces-29576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A848A7F429
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 07:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6CC51892B22
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449ED207A03;
	Tue,  8 Apr 2025 05:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acBdSL3h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6AD20330
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090332; cv=none; b=jHsQRLiKRPuPKRBkG7LF0wAhFNBssyqw1XhBOtFhXi9m29XckAU3mjQ6ri4D89ju1Tv1W756PjzUI6unY2b42KVtj15+7MsHooVlY/QoHuGXo/kCPwwXNgbX8F1bVAG+B9vNmmaf4p+I/OOTd4ylSY4Bsly7KtyfGbpro5X9LVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090332; c=relaxed/simple;
	bh=IqjOptwZRCSeZeXlS1DNchDAuzxFH6VUs9W4IbdjPA8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3cQMQWM8fZCRMTGoa/wDR6WkDKwo5oa6YXZTsnrWldLz2vCekDRE0flXDiUM5SQJCjNDhYL900rSd61CVGRNh46lub/6KnPLkmRFQm+y8JIGskasOgMkRsv9xedzYjddWb8BRNIyhkxFjwJ0OWr8TTlXFVsLNBA/Ge+aE/FAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acBdSL3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F59C4CEE5;
	Tue,  8 Apr 2025 05:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744090332;
	bh=IqjOptwZRCSeZeXlS1DNchDAuzxFH6VUs9W4IbdjPA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=acBdSL3haDOFLXRiTtmwt8Nrw08PLq8sqZTeIdjb6IRo1rXMF9bYHKKSMNJSH9mu5
	 PxVGjUF4sCILmy3CgeQ4xtLq5X2AvKqbXViXIy/EAKQL5LfgdBDLcWgH4/XALZAHeh
	 e4lCM/AWbwlukIEJ6jK7qUH9ORJgBZPukuM9fDW+upqKdkBFWPRVaIcIUsFeEw8zmA
	 2vFKuMii9yPCP5h9p/9DFO4uDXE9qyTcL8U0SufXOZBD6rOvdA7saOmvOQnUm/6AEl
	 biKOMusAmwxWsCFtVFyRfnt0SvCsbg8UBK8fLJP+4ot54XtdAzNFOgyg2jyZxe4/69
	 M77NWo6EZ24LA==
Date: Tue, 8 Apr 2025 13:31:42 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas =?UTF-8?B?U8O2ZGVy?=
 =?UTF-8?B?bHVuZA==?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen
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
Message-ID: <20250408133142.030bd1cf@sal.lan>
In-Reply-To: <20250407193909.GA17385@pendragon.ideasonboard.com>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
	<20250407193909.GA17385@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 7 Apr 2025 22:39:09 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> I would like to propose the following topic.
> 
> Review of the status of staging drivers
> 
> We have a set of 11 drivers in drivers/staging/media/, with various
> states of maturity and development activity.

On a quick look, we have there:

1. source "drivers/staging/media/atomisp/Kconfig"
2. source "drivers/staging/media/av7110/Kconfig"
3. source "drivers/staging/media/imx/Kconfig"
4. source "drivers/staging/media/ipu3/Kconfig"
5. source "drivers/staging/media/max96712/Kconfig"
6. source "drivers/staging/media/meson/vdec/Kconfig"
7. source "drivers/staging/media/rkvdec/Kconfig"
8. source "drivers/staging/media/starfive/Kconfig"
9. source "drivers/staging/media/sunxi/Kconfig"
10. source "drivers/staging/media/tegra-video/Kconfig"
11. source "drivers/staging/media/deprecated/atmel/Kconfig"

> drivers/staging/ is not meant as a place for drivers to die,

It is, actually: we usually move things there before dropping,
because, on most cases, they could be salvaged if someone is
interested on it.

> we should nudge the relevant
> maintainers and consider dropping drivers that show no hope of
> progressing.

Fully agreed.

-

Yet, while it makes sense to have action plans for drivers on staging,
I don't think that the Media Summit is the best place to discuss,
as people that might be involved with them may not be able to
participate there.

See, there are different situations there, like:

- platform drivers: at worse case, those should be removed when
  the core/DT support for such platform is removed. We removed
  several such drivers in the past. We can also remove them earlier,
  if there are reasons for doing that and nobody is complaining;

- drivers like atomisp that takes a lot of efforts to be promoted.
  As long as I see some progress (and we've been seeing progress
  on every kernel version), I can't see any reason why removing it.

- drivers like ipu3, which is for an entire family of PC CPUs.
  I prefer not dropping drivers like these unless we have very good
  reasons to do so. On the other hand, we are seeing very little
  progress on those.

Anyway, better to split this into different threads, copying
the people involved on the recent changes for such drivers.

Regards,
Mauro

