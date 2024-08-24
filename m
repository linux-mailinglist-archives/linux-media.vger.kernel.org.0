Return-Path: <linux-media+bounces-16701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821095DEC4
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 17:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FA60B21840
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 15:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87E353365;
	Sat, 24 Aug 2024 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hpTXU4VE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07A1EA80
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724514623; cv=none; b=lbxPe5Nj5LTyT54qncE7+f2N1N3k6eaNREqTjzHtx0t9swawA0C5t2IIA/eAMEIvyFgi65dSBh57qllLqEcDxGtWN1TsvdX+vsH/OvzpZKdOuHeugvxHX6ciP32XI+J6jhU83jMC/JEF+0Y2eSRRg1WAAltBnYbcWxUCD0UBEus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724514623; c=relaxed/simple;
	bh=HKTEjkIKuaK8kpreAzT2d0jRqzhhgdkur2lTcmRkqpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmemyrVA2RUgmIq/g6PCqKD1jLm57gzbWaU9C5Qk4avZemikargLPGlD4BbKFw5GN/VdtK6kd+QKNzicHpGXjMxu4RVmLOk9kZnKulO3wVAecvaCP4iYDScPWv3UD8zVmaLwyPUQHmO8fHYkefdSyDWouwGQyf6+UJxdozuG9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hpTXU4VE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 408C06DE;
	Sat, 24 Aug 2024 17:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724514548;
	bh=HKTEjkIKuaK8kpreAzT2d0jRqzhhgdkur2lTcmRkqpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpTXU4VEC3sGdJW0ytxRoV2j/TP/aWXgyvZrIKVJnheYlFk7ZpDERcVso9rokvfBl
	 Ar/VA8XnHoFwQyG4fR7waThNWg2Uh1ZcOZtUSsl+GHt6Vez1F4N49nxLXVxXFZdqnL
	 Ky/U1smYxt6msqg1/kQV4GXIpx3quUd8uDPAzbgI=
Date: Sat, 24 Aug 2024 18:50:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as
 deprecated
Message-ID: <20240824155009.GU26098@pendragon.ideasonboard.com>
References: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
 <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>
 <20240823135728.GL26098@pendragon.ideasonboard.com>
 <ZsnuBtFIiEb316cf@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZsnuBtFIiEb316cf@valkosipuli.retiisi.eu>

On Sat, Aug 24, 2024 at 02:28:22PM +0000, Sakari Ailus wrote:
> On Fri, Aug 23, 2024 at 04:57:28PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 23, 2024 at 07:16:42AM +0000, Sakari Ailus wrote:
> > > On Fri, Aug 23, 2024 at 12:41:25AM +0300, Laurent Pinchart wrote:
> > > > Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
> > > > deprecated") marked the v4l2_pipeline_pm_get() and
> > > > v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
> > > > the related v4l2_pipeline_link_notify() function similarly. Fix it.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > How about adding a warning for the use of these functions? Possibly on
> > > debug level if pr_warn_once() is considered too drastic?
> > 
> > I think we need to do a bit of homework first, as there's a large number
> > of drivers using these, directly or indirectly. We should at least
> > convert the sensor drivers still using .s_power() to runtime PM, to make
> > it possible to convert the other drivers.
> 
> With that, we could just drop the implementation of the pipeline PM stuff
> and replace it with a warning.
> 
> I think a pr_debug_once() would still be appropriate, at least. People
> generally won't read the documentation unless something is broken.

Generally I agree, but my concern here is that someone hitting the
warning would need to first convert all the remaining sensor drivers to
runtime PM before they could safely address the issue on the host driver
side. That's quite a bit of yak shaving.

> > > > ---
> > > >  include/media/v4l2-mc.h | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > > > index ed0a44b6eada..1837c9fd78cf 100644
> > > > --- a/include/media/v4l2-mc.h
> > > > +++ b/include/media/v4l2-mc.h
> > > > @@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> > > >   * @flags: New link flags that will be applied
> > > >   * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
> > > >   *
> > > > + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> > > > + * ON SUB-DEVICE DRIVERS INSTEAD.
> > > > + *
> > > >   * React to link management on powered pipelines by updating the use count of
> > > >   * all entities in the source and sink sides of the link. Entities are powered
> > > >   * on or off accordingly. The use of this function should be paired
> > > > 
> > > > base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Regards,

Laurent Pinchart

