Return-Path: <linux-media+bounces-47149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D4C5F434
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01BC534D4E9
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 20:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084B52F8BC9;
	Fri, 14 Nov 2025 20:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vFUtuCbu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE62D1916
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763153119; cv=none; b=B2BdOkp/HKOSo0R0JldQwejt64u/ks6J0d8UvF4sdCO4IL4555Ww6jNT7sjrVryyfNIqPnelS52pUIEcV7akj1ehJlpweIbbWArTCq63n1rpGvdPYffEXj/roaNu73Kp2NAxkGkqO2BR+Ds5gvrl2X/WpNF9fG3W/rDNnAHaqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763153119; c=relaxed/simple;
	bh=qIaFYnXw9LxKzDKzAArW4iVGQif2/ro82tgrGknL+IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3cx3awQ/tZBjysiNuTAgeu8imKJuI0Gj+rppvNJpU10KAeTuFK0qQn4ouGlC1aww7ioLd9xRY5THDhFqGQjkFnQ6fzmyXDcEkxwK52QZ4nxkJkj9Uxe/Gz7U+3xsj1Y6xPJb2Q5LT9Z+yxSLS3Jn8VbnxAR0WJOkhjbfDJ9Xv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vFUtuCbu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F6192D8;
	Fri, 14 Nov 2025 21:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763152994;
	bh=qIaFYnXw9LxKzDKzAArW4iVGQif2/ro82tgrGknL+IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFUtuCbuiuHxjw57vG8L8ZOVQXgcJsuMsXWeZ/tBDoCM8d7yrbmECLeqm61/K+B7R
	 okABjcivUWp9u0MQ35c9xcolVvWnhr1H4h5ERAmaweP2/rDAgineQSx5Nz2wvm1cfa
	 dlWe4DMi8l5TsCJ+An6V8wP2M4CqwtkGzpgDC9Ik=
Date: Fri, 14 Nov 2025 22:45:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: hans@jjverkuil.nl, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
Message-ID: <20251114204501.GA12160@pendragon.ideasonboard.com>
References: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>

On Fri, Nov 14, 2025 at 09:19:20PM +0100, Jacopo Mondi wrote:
> As the Mali-C55 driver is instrumented to work without depending on
> CONFIG_PM, mark the two pm_runtime handlers as __maybe_unused to
> suppress the compiler warning when compiling without CONFIG_PM.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Late fix for Mali C55 PR
> 
> fixes:
> https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/87903226
> 
> it's great to have CI, Thanks!

The recommended way to handle this is to replace SET_RUNTIME_PM_OPS with
RUNTIME_PM_OPS and use pm_ptr(). See commit
b5ddb9ab3d83fe0d93d38de442c45610a5846d06 for instance. I think you can
actually use DEFINE_RUNTIME_DEV_PM_OPS() and drop the manual
SET_SYSTEM_SLEEP_PM_OPS().

This being said, it seems PM needs more love, I don't see where
streaming would get stopped and resumed with system PM. That's something
to be addressed on top of course.

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index b23d543cf496..43b834459ccf 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -707,7 +707,7 @@ static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>  	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>  }
> 
> -static int mali_c55_runtime_suspend(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
>  {
>  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> 
> @@ -770,7 +770,7 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  	return 0;
>  }
> 
> -static int mali_c55_runtime_resume(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
>  {
>  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>  	int ret;

-- 
Regards,

Laurent Pinchart

