Return-Path: <linux-media+bounces-47167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434BC609D1
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 19:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BCDF3A872A
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 18:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDC83064A2;
	Sat, 15 Nov 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L7sd/jwd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC2265298
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763230035; cv=none; b=gWnEChaMt6X3oQ3alcV4vFmxnllRYUdh04K63cUzUY+UoRhpisvc+5BsgIt0NykruczU/9yDB8n9NsQk1W+83+5TNIVYO5P17jwMmEOsr975wytFtVb8/rRd/v3UUimDl7VL6/a++taLEjHC3PUtQ17bgZo7LixSnjx+HXoo0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763230035; c=relaxed/simple;
	bh=SgwD3GjPAoRqY+KnQgkuaqZUNWGSy9mnANnmSJN0WVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQxlQUnrxPVFuGk6FGFN0DQ7l/NNjBXLBPrQCytoo6WbrsgrocQ8AbPTWlLMfGUV4IG3sKd/TcoNW77VUQTIgowRXaQDtrNdP2eMAo0sbq94qoJ9dUv6ChVja/1lFkNvvGBEmmWhRjfDfoPC+AFFHYYsyo4MCaW66N5vNkHNco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L7sd/jwd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-140-85.net.vodafone.it [5.90.140.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26C3182A;
	Sat, 15 Nov 2025 19:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763229908;
	bh=SgwD3GjPAoRqY+KnQgkuaqZUNWGSy9mnANnmSJN0WVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7sd/jwdcQFT+bgS1Q84W4QIjA9Eq60qwJL//gbD7Y2EqKnWZqAjMmisldmf8p127
	 djkI98KLt3dbnb7JVtkVV3mjRJg+JOGcwzcdJ5Ak1YhtSRYybEaReJcWuWToDO60pN
	 teHM/dbD3mn0csa1lMev/pd3zxVsM60/xinnmLaA=
Date: Sat, 15 Nov 2025 19:07:06 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hans@jjverkuil.nl, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
Message-ID: <f6o5naywg4gc67ww2yi22ybc5pctd3upeyo74vhlvau3sld5rg@2v7baqvvykxn>
References: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
 <20251114204501.GA12160@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114204501.GA12160@pendragon.ideasonboard.com>

Hi Laurent

On Fri, Nov 14, 2025 at 10:45:01PM +0200, Laurent Pinchart wrote:
> On Fri, Nov 14, 2025 at 09:19:20PM +0100, Jacopo Mondi wrote:
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
> The recommended way to handle this is to replace SET_RUNTIME_PM_OPS with
> RUNTIME_PM_OPS and use pm_ptr(). See commit
> b5ddb9ab3d83fe0d93d38de442c45610a5846d06 for instance. I think you can
> actually use DEFINE_RUNTIME_DEV_PM_OPS() and drop the manual
> SET_SYSTEM_SLEEP_PM_OPS().

Thanks, Hans has collected this patch which at least suppress the
compiler warning for v6.19.

>
> This being said, it seems PM needs more love, I don't see where
> streaming would get stopped and resumed with system PM. That's something
> to be addressed on top of course.

We can address both the above suggestions on v6.19!

>
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
>
> --
> Regards,
>
> Laurent Pinchart

