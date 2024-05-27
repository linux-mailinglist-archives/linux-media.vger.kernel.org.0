Return-Path: <linux-media+bounces-11931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE28D005B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 14:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A332282D94
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 12:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAAF15E5BE;
	Mon, 27 May 2024 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="tC3iHN8V"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187314D5A2
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814001; cv=pass; b=HM7NYmhLf+pK0a0IJYTfYEN9Wzg3qLb+Jb1t6ORTAcByhX04KlqD5g9z+p/Wmjj8+X7GwHkX+UMYVxM78YgzIbzHGiVi4BPMa8Kkld4+eDcZ31pnD2ncznQdRBt0Y3O9SmVbH6m8wh2/q9S1Fy5JwokkD3fS7CtLL/5nrJnl3l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814001; c=relaxed/simple;
	bh=J58yCsmWA0KCvmUey9yVf78/muyUQq977Ll3PQgixPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsvUH/cRFAIRPZaPZ6u01x0XKys89c0p3p8DoMa4Jr1SETp86jLIf2cKJRqp1LgcE9Z9eokr5coc/0EAbfmg4+uE7QCw71jNBRcWJy618IpqZZYqwwQB2rChMVpeLj+QN/ARw+Bk6ZA96nrp9uS9xhFt2szY4qqr0QeD3rUsSO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=tC3iHN8V; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VnwPk5LKszyQm;
	Mon, 27 May 2024 15:46:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716813995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmSUXYDbnQFcVUqVihEOWzOSg+TScz9cUz45kiLxNuY=;
	b=tC3iHN8VwMKtgVhTt/AyesdGq2IdVY4vLoR6MQuV3rhMFiFrET9MFCDspnWHtbxSQ4TLtV
	YYuCA+sQgEfMMIM3UuGHxASc9T03Rl0e9CB3waBkasukZIOiluByC4ZhtHFUPrggJBp2Ss
	xagmIR75Qz5w5Y1SgTwDId7MRy5q7wA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716813995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmSUXYDbnQFcVUqVihEOWzOSg+TScz9cUz45kiLxNuY=;
	b=cBLINw4xom9sitqEsm5ej02rzn3R8s7BR3aoQoBRaFwkdJS7dXbWVDo6IY4ZrdEhAG/SG9
	GI6CsokhEbn0ncTa06flWnxRG1jT9MAJ4c9aDgC+Og9NxjVBB7h5VxB/MoKVceij5bKVz4
	8PoIGQS4K5C4g7AUYyl5LjXimCrMsh8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716813995; a=rsa-sha256; cv=none;
	b=TQrVxLfHI3JZ+1Wfn1M/ZGMe4JNrc3IYoEcNup9IBcPEK4uOv/f44BJ9/PteRubDpeQi5J
	RdLrSVO83omgBNJbpy6+MzhYjovR7+OEd7lMBveua7HI/SVwnlwl1J4RTmLrLbkxjBKAnP
	rAHzxEgx51wZuq/jOQ3CwS3ddOHAgVE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 583CE634C93;
	Mon, 27 May 2024 15:43:38 +0300 (EEST)
Date: Mon, 27 May 2024 12:43:37 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <ZlR_-VL7hy5_Hhe4@valkosipuli.retiisi.eu>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <20240527011911.GD24374@pendragon.ideasonboard.com>
 <ZlQryf4bA4CsubPR@valkosipuli.retiisi.eu>
 <6oiill244e4bb4zsdd5x7kzrw62x4pq6vfmps6offh5qvfniyr@4u4xi4fparbk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6oiill244e4bb4zsdd5x7kzrw62x4pq6vfmps6offh5qvfniyr@4u4xi4fparbk>

Hi Jacopo,

On Mon, May 27, 2024 at 12:18:54PM +0200, Jacopo Mondi wrote:
> Hi Sakari, Laurent
> 
> On Mon, May 27, 2024 at 06:44:25AM GMT, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > On Mon, May 27, 2024 at 04:19:11AM +0300, Laurent Pinchart wrote:
> > > > One API-based solution could be moving the IOCTL interface to MC device
> > > > node only. This wouldn't be a small change so I'm not proposing doing that
> > > > now.
> > >
> > > I think we could also use the request API. It is a bit more cumbersome
> > > to use from a userspace point of view, but this driver is meant to be
> > > used from libcamera, so we can isolate applications from the extra
> > > burden.
> > >
> > > We will need to add support for formats in the request API (or rather
> > > for requests in the format ioctls).
> > >
> > > From a kernel point of view, the helpers used by the codec drivers may
> > > not be suitable for ISP drivers, but I don't think it would be very
> > > difficult to implement other helpers is needed, isolating the ISP driver
> > > from the complexity of the request API.
> > >
> > > This doesn't preclude developing a better userspace API with ioctls on
> > > the MC device node only at a later point. If the above-mentioned kernel
> > > helpers are done right, transitioning to a new userspace API will have
> > > minimal impact on drivers.
> >
> > This is indeed the third feasible option. I agree. The work on the
> > framework side might not be that much either.
> >
> 
> For the time being, I would like to move forward and merge the version
> of the driver with a single enabled context.
> 
> As you can see the driver multiples the contexts by creating two
> groups
> 
> The number of groups is defined by
> 
> /*
>  * We want to support 2 independent instances allowing 2 simultaneous users
>  * of the ISP-BE (of course they share hardware, platform resources and mutex).
>  * Each such instance comprises a group of device nodes representing input
>  * and output queues, and a media controller device node to describe them.
>  */
> #define PISPBE_NUM_NODE_GROUPS 2
> 
> Can I simply set this to 1 or should the driver be reworked to remove
> the group concept completely (it will be quite some rework).
> 
> You can guess what my preference is, and considering we want to
> experiment with a different API the group part will possibily need to
> be reintroduced.

I believe you can also guess what my preference is. :-)

I don't expect we'll need the number of groups in the upstream driver.

Before deciding what to do here I'd like to arrive to a conclusion on how
this gets addressed so the desired functionality is available in the
upstream driver.

Maybe the Request API is indeed something to consider here.

I wonder what Laurent thinks.

> 
> Also if we simply set PISPBE_NUM_NODE_GROUPS=1, the downstream RPi
> kernel will solely need to have 1 patch that restores the value to 2
> to be able to use the mainline kernel driver instead of keeping their
> multi-context downstream version in use until multi-context is
> finalized in mainline.

-- 
Kind regards,

Sakari Ailus

