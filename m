Return-Path: <linux-media+bounces-47166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0476BC609CE
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 19:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9764235CBEE
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 18:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E182FFF87;
	Sat, 15 Nov 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sn+xBh7H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D421C9FD
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763229959; cv=none; b=g7jo/8RxbqTazMzE1eOi3nSywPBWspIPwjHpgpsHR/aot9yjOF8qqwJ0bcPJwbOt4AcdniD4HBiF3c4YeyFXEU47s0kMuXcmPqEE29S36vCeaC1Jz4nUQn8f/ZMcUjXYDd+7zPq9Zf38IS2pUS7PngIa8shG+i2Y1HliqrCJlMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763229959; c=relaxed/simple;
	bh=w442aZ4LFC0AX0ackeUzLDVIbB8jwP4x/RcA7xJryJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS58ixunfTqn80OieoWCYzsSj5dxO0dGEzr95RqaLkdAwGJ28QrjdbII8qeBeM53Eli+VczpupTZTCqNlLl+Gpb/EjzNjSlNayHJiKnPUNsOnaBrpn/+tXzaVMpgNsJTqjoCeLuYBBHkohYar46Its8xMmZxiJ8cLoWtfToSIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sn+xBh7H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-140-85.net.vodafone.it [5.90.140.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49B4782A;
	Sat, 15 Nov 2025 19:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763229832;
	bh=w442aZ4LFC0AX0ackeUzLDVIbB8jwP4x/RcA7xJryJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sn+xBh7HAwvXN2UAMGHAEgw8lx1h5/vGy6k4I5DKZ7aftQddRUYQrIekzbWMSVsbR
	 OimTZdaxME+fUq7xya4+HQVSJJ0tweVFr3TX3/BKXa06IFcdjS1EpTjI4+b6CXb7j8
	 +C1boJghW8x/w7geMrUTv4MqGDqnPOgOh2pDGBtQ=
Date: Sat, 15 Nov 2025 19:05:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
Message-ID: <kfpmbac63yox5nadxg52tvovxvx7kh2fpjparomplidtaebp2b@5376grxdf3ig>
References: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
 <60754b1c-7f4d-4a7f-abe2-5b23c0f40aba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60754b1c-7f4d-4a7f-abe2-5b23c0f40aba@kernel.org>

Hi Hans

On Sat, Nov 15, 2025 at 10:54:20AM +0100, Hans Verkuil wrote:
> On 14/11/2025 21:19, Jacopo Mondi wrote:
> > As the Mali-C55 driver is instrumented to work without depending on
> > CONFIG_PM, mark the two pm_runtime handlers as __maybe_unused to
> > suppress the compiler warning when compiling without CONFIG_PM.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Late fix for Mali C55 PR
> >
> > fixes:
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/87903226
> >
> > it's great to have CI, Thanks!
>
> I wondered why I didn't see this issue until CI started on the merge request.
> It turned out that I used to have the FULL_CI variable set to 1 in gitlab, but
> at some point it was removed. Either by me or perhaps by a gitlab update, possibly
> when we moved to a different server. In any case, I now set it again and I now
> see the same issue.
>
> You can do the same: setting FULL_CI to 1 will enable additional tests, which
> is useful when prepping a PR.

Uh nice, I didn't know that!

yes, I would like to repeat the config tests you have run, but I
thought they were not available to users to reduce the workload.

I'll remember to enable FULL_CI for pull requests next time

Anyway, I see you have collected this patch which is now in
media-committers/next, so I guess we can address Laurent's suggestion
on top of v6.19

Thanks
   j

>
> Regards,
>
> 	Hans
>
> >
> > ---
> >  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > index b23d543cf496..43b834459ccf 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -707,7 +707,7 @@ static void __mali_c55_power_off(struct mali_c55 *mali_c55)
> >  	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
> >  }
> >
> > -static int mali_c55_runtime_suspend(struct device *dev)
> > +static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
> >  {
> >  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> >
> > @@ -770,7 +770,7 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
> >  	return 0;
> >  }
> >
> > -static int mali_c55_runtime_resume(struct device *dev)
> > +static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
> >  {
> >  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> >  	int ret;
> > --
> > 2.51.1
> >
>

