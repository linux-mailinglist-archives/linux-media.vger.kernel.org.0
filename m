Return-Path: <linux-media+bounces-12062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A38D1573
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91FD284F63
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECE17346D;
	Tue, 28 May 2024 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aQrAkp5O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D537316E
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716882248; cv=none; b=Eii/bMpsuE24IEp6XoiMzih1th11194PwBBX07hlGipWWbd/1BNfxns02uKL4OFxBNEOEducZKtCKZrC9Lb6BS/RNsAvgEYJOXf1xNBmd8AJFlya5Sn8H8leiwoxNx5FvfcJpH4afDOLNROtxS/b+a/7PmfVxpdXF9pfJFhmSV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716882248; c=relaxed/simple;
	bh=G82cS/oO4p7Z+EIUpSqRXWGdudTSYJJoH/uClaLU1Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg1ht0zIFn67EydZRtnYqmPiNRZTiUNJJ5WodVgpJ/GMZOT1O4FBldlFZ5cVIxVLSLltgQzr0NsdlvpopTM3PzFvMSbfL5DfXYS7yvkdEv53j60pXFIeAxhncY+NSV3DJpN/Ij+LQXqPuo56YwWCVjB8DrS3jXQU+Dht3AjJNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aQrAkp5O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8C811495;
	Tue, 28 May 2024 09:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716882241;
	bh=G82cS/oO4p7Z+EIUpSqRXWGdudTSYJJoH/uClaLU1Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQrAkp5OEGU8fZFsJXJJ/uaEv+kFi4dvv5l7KWAWCMMJZYZDfGpXrd/JbAkOUTrgP
	 zEyEkN12lhIiWrizjmMtkmuwQZnEZf/brt7vj+ry7lEIxBeErwFLjcXnehSTIB/wBO
	 a8f4/Gg8euXI/h2GpA3M83rXWA9LPUyXs96QCDcM=
Date: Tue, 28 May 2024 09:44:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <fa6vgerzbkdlrncuzawolnufirzfacpcvetjul75sts3huu6fs@74ledwj6q5mz>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <20240527011911.GD24374@pendragon.ideasonboard.com>
 <ZlQryf4bA4CsubPR@valkosipuli.retiisi.eu>
 <6oiill244e4bb4zsdd5x7kzrw62x4pq6vfmps6offh5qvfniyr@4u4xi4fparbk>
 <ZlR_-VL7hy5_Hhe4@valkosipuli.retiisi.eu>
 <20240527153924.GD1490@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240527153924.GD1490@pendragon.ideasonboard.com>

Hi Laurent, Sakari

On Mon, May 27, 2024 at 06:39:24PM GMT, Laurent Pinchart wrote:
> Hello,
>
> On Mon, May 27, 2024 at 12:43:37PM +0000, Sakari Ailus wrote:
> > On Mon, May 27, 2024 at 12:18:54PM +0200, Jacopo Mondi wrote:
> > > On Mon, May 27, 2024 at 06:44:25AM GMT, Sakari Ailus wrote:
> > > > On Mon, May 27, 2024 at 04:19:11AM +0300, Laurent Pinchart wrote:
> > > > > > One API-based solution could be moving the IOCTL interface to MC device
> > > > > > node only. This wouldn't be a small change so I'm not proposing doing that
> > > > > > now.
> > > > >
> > > > > I think we could also use the request API. It is a bit more cumbersome
> > > > > to use from a userspace point of view, but this driver is meant to be
> > > > > used from libcamera, so we can isolate applications from the extra
> > > > > burden.
> > > > >
> > > > > We will need to add support for formats in the request API (or rather
> > > > > for requests in the format ioctls).
> > > > >
> > > > > From a kernel point of view, the helpers used by the codec drivers may
> > > > > not be suitable for ISP drivers, but I don't think it would be very
> > > > > difficult to implement other helpers is needed, isolating the ISP driver
> > > > > from the complexity of the request API.
> > > > >
> > > > > This doesn't preclude developing a better userspace API with ioctls on
> > > > > the MC device node only at a later point. If the above-mentioned kernel
> > > > > helpers are done right, transitioning to a new userspace API will have
> > > > > minimal impact on drivers.
> > > >
> > > > This is indeed the third feasible option. I agree. The work on the
> > > > framework side might not be that much either.
> > >
> > > For the time being, I would like to move forward and merge the version
> > > of the driver with a single enabled context.
> > >
> > > As you can see the driver multiples the contexts by creating two
> > > groups
> > >
> > > The number of groups is defined by
> > >
> > > /*
> > >  * We want to support 2 independent instances allowing 2 simultaneous users
> > >  * of the ISP-BE (of course they share hardware, platform resources and mutex).
> > >  * Each such instance comprises a group of device nodes representing input
> > >  * and output queues, and a media controller device node to describe them.
> > >  */
> > > #define PISPBE_NUM_NODE_GROUPS 2
> > >
> > > Can I simply set this to 1 or should the driver be reworked to remove
> > > the group concept completely (it will be quite some rework).
> > >
> > > You can guess what my preference is, and considering we want to
> > > experiment with a different API the group part will possibily need to
> > > be reintroduced.
> >
> > I believe you can also guess what my preference is. :-)
> >

I can yes :)

> > I don't expect we'll need the number of groups in the upstream driver.
> >

No, not the number, you're right, it would be silly to keep the macro
and define it to 1.

I'm all for removing the for-loops that create and destroy groups and for
removing from the group structure the fields that are now global
(namely the v4l2_device, the subdev and the media_device), but I would
like to keep the 'group' wrapper in-place, even if we'll end up having
a single group in mainline.

> > Before deciding what to do here I'd like to arrive to a conclusion on how
> > this gets addressed so the desired functionality is available in the
> > upstream driver.
> >
> > Maybe the Request API is indeed something to consider here.
> >
> > I wonder what Laurent thinks.
>
> Using the request API, we will still have contexts. Instead of having
> one media device per context, the contexts will be dynamically
> allocated, one per file handle. Would it be enough, as a first step
> forward, to refactor the contexts and move the media device and other
> related pieces out, keeping the fields that we expect will stay
> per-context ?
>

I suspect we'll have to re-introduce contexts somehow, that's the
reason why I would like to keep the group structure in place.

I can experiment with removing the global fields from the group and
check how much refactoring does it take to do so.

> > > Also if we simply set PISPBE_NUM_NODE_GROUPS=1, the downstream RPi
> > > kernel will solely need to have 1 patch that restores the value to 2
> > > to be able to use the mainline kernel driver instead of keeping their
> > > multi-context downstream version in use until multi-context is
> > > finalized in mainline.
>
> --
> Regards,
>
> Laurent Pinchart

