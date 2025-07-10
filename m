Return-Path: <linux-media+bounces-37443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEEAB00FA0
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00BC3B8363
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D9D2FE31A;
	Thu, 10 Jul 2025 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CYFlG8Qn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1842FCE1A;
	Thu, 10 Jul 2025 23:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189918; cv=none; b=nl4zhzsm7/4ejHM0nXMuO5r9kHw9HOWn8pU8l+ds5ezyb5xoDFOBuVWGxWXyeKCo8ViTpTncEU6sy1p/NZKx/6IwZcDSQFXVWYiAqk0RPJ0nxZisElCOH/O0xDo/XZGdK7C0CVaLqECjTZuGxJC5lDey3jUABowFNEUWSF4jNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189918; c=relaxed/simple;
	bh=wEUbA9TjTRzk9zUvf2lLT7GdijCGdUjDdEfcK376Vz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLhI3b+DJUiNFiOB40qU+8tpe/26j6x1+Fq6ELPHlm+Zm+Vow6wfQWNUJjUG+wt2mrV2Zt5g/+IfrbYur/ZIbIasatrSqXmEEXnA9hpbdXg/Ys/M5Okye+eefpn4IgyRzlYJeUTzWa3R0lcD1+Gbjh+1cT9YeylqcZtGQ1wZh7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CYFlG8Qn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B169010D4;
	Fri, 11 Jul 2025 01:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752189885;
	bh=wEUbA9TjTRzk9zUvf2lLT7GdijCGdUjDdEfcK376Vz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYFlG8QnIeQTFSVZeQxKTFlr5UCEw+QVn2aYAfLyFQ0A41YtKEnYYCmCFVC8l0rOw
	 yRGWoQ/32I5k7o6L+NI86oQlIjJGFNINQJv7jaxyrLm4SXczRBk2A1DsIiCsKeECR8
	 Gf71/RGMFcBWVIO4OSpYYLQuJvK+evMPz8hGRe5Y=
Date: Fri, 11 Jul 2025 02:24:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/5] media: renesas: Convert to modern *_PM_OPS()
Message-ID: <20250710232444.GF27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1752088108.git.geert+renesas@glider.be>

On Wed, Jul 09, 2025 at 09:16:06PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series converts the Renesas media drivers from the old
> SIMPLE_DEV_PM_OPS(), SET_SYSTEM_SLEEP_PM_OPS(), and SET_RUNTIME_PM_OPS()
> helpers to the modern DEFINE_SIMPLE_DEV_PM_OPS(), SYSTEM_SLEEP_PM_OPS(),
> RUNTIME_PM_OPS(), pm_ptr(), and pm_sleep_ptr() helpers.  This lets us
> drop the __maybe_unused annotations from power management callbacks, and
> reduces kernel size in case power management or sleep support is not
> enabled.

There is lots of cargo-cult in drivers when it comes to PM. Cleaning
things up is good, but we also need to document the recommended usage.
SIMPLE_DEV_PM_OPS() is marked as deprecated, but
SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are not. Usage of
pm_ptr is also not documented. Could you send a documentation patch to
address this ?

> Thanks for your comments!
> 
> Geert Uytterhoeven (5):
>   media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
>   media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
>   media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
>   media: renesas: ceu: Convert to RUNTIME_PM_OPS()
>   media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()
> 
>  .../media/platform/renesas/rcar-vin/rcar-core.c    |  8 ++++----
>  drivers/media/platform/renesas/rcar_drif.c         | 10 +++++-----
>  drivers/media/platform/renesas/rcar_fdp1.c         | 10 ++++------
>  drivers/media/platform/renesas/renesas-ceu.c       | 10 ++++------
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c     | 14 +++++++-------
>  5 files changed, 24 insertions(+), 28 deletions(-)

-- 
Regards,

Laurent Pinchart

