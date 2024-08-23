Return-Path: <linux-media+bounces-16662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7695CE7D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235691C23579
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F15218859B;
	Fri, 23 Aug 2024 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KVY2lFnI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39516188594
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421454; cv=none; b=ff/5vCF08j6+pmGVs6uQoBAvFEE/ZwnZP+S8C0jEZWP7JGxRMHJuy3Ny8/cDJyLAakFxXN/HSzDGFkmYTPk4hHRn/2NerysollREjLeejA+7p1S/FhaeGn2aepMjX8f0vm2yQ9hRcKnCV8KzL+hNsKsT5P21d0y8IfJvB9Fz+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421454; c=relaxed/simple;
	bh=l5JljWRmvDmBu3HYulttaD/CvcBvW/xtYL8bHgQPleI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evKbk0yhqdcO+Bo063ymiAqT8WHu+wOTZ7TE54O+gHDE6Z6an7d2QkD5bgzhOpysQzVNupiyzw82jEGTCAlVgCDh+o0a4JczCu9HKyKCwyWUGCIos9W54JKDWrAB/6YfpB7jPrVItJ4J/zkrPWSbvXinqp91eQQVzwRsZhtgtEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KVY2lFnI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C94A2D5;
	Fri, 23 Aug 2024 15:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724421387;
	bh=l5JljWRmvDmBu3HYulttaD/CvcBvW/xtYL8bHgQPleI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVY2lFnIhLls9qb0ScKs8uZsk5FSQVpXfBRIRgRh09U4SqbRjhGP76HG1uuKlD0+i
	 PYtQwx+Dp0rZXgqE/5glqhzmIX+fHAJkW7tb4oBbTUA2qds2zct0rOyxQv7ZVl/3RI
	 ek7zc4O9Nzu723sMfaaOZfPfIncILeUbBAB5kpz4=
Date: Fri, 23 Aug 2024 16:57:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as
 deprecated
Message-ID: <20240823135728.GL26098@pendragon.ideasonboard.com>
References: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
 <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>

On Fri, Aug 23, 2024 at 07:16:42AM +0000, Sakari Ailus wrote:
> On Fri, Aug 23, 2024 at 12:41:25AM +0300, Laurent Pinchart wrote:
> > Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
> > deprecated") marked the v4l2_pipeline_pm_get() and
> > v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
> > the related v4l2_pipeline_link_notify() function similarly. Fix it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> How about adding a warning for the use of these functions? Possibly on
> debug level if pr_warn_once() is considered too drastic?

I think we need to do a bit of homework first, as there's a large number
of drivers using these, directly or indirectly. We should at least
convert the sensor drivers still using .s_power() to runtime PM, to make
it possible to convert the other drivers.

> > ---
> >  include/media/v4l2-mc.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > index ed0a44b6eada..1837c9fd78cf 100644
> > --- a/include/media/v4l2-mc.h
> > +++ b/include/media/v4l2-mc.h
> > @@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> >   * @flags: New link flags that will be applied
> >   * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
> >   *
> > + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> > + * ON SUB-DEVICE DRIVERS INSTEAD.
> > + *
> >   * React to link management on powered pipelines by updating the use count of
> >   * all entities in the source and sink sides of the link. Entities are powered
> >   * on or off accordingly. The use of this function should be paired
> > 
> > base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Regards,

Laurent Pinchart

