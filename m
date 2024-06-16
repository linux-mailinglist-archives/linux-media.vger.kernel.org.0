Return-Path: <linux-media+bounces-13331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8B909FBD
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 22:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 341A3B21785
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 20:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B5960269;
	Sun, 16 Jun 2024 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XrbWQfKW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724384503A;
	Sun, 16 Jun 2024 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718570312; cv=none; b=do442u5Xn19ZQl8PRzj2jByl/wtoCTzPyZYooclJ0agr8HT/qTpfxIQScXdwl0u6Nc4nbpF2UU/sSCgyBUUF1uheRw29efUhvCH2VhNxiVwTFiKehlTOppjEq4qdRzcZSAMn5e4uLjxeHRRkYqb1Ki/hVoNcY0hP/eNxGk5dhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718570312; c=relaxed/simple;
	bh=9eVdpnryx4quXlWRY+B3jp2hmH7bA33RckewPEOrq+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3jVoBNLAZ/rXDYvDYV4OeA56lRVYDi8oSkXxe59R5Qt/ZyQ2wC2ljkOAZAakTmtIiYkDXQnNUvJh7uK1D7Czm/ZVn74GEfxcnoi5HYVPe1ty/BHA/SPbpwCuxbme9PFqg0zJ1+xASJqxej+Uijgin2RgHB4nGxYtajVVo4LeyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XrbWQfKW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE52D669;
	Sun, 16 Jun 2024 22:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718570291;
	bh=9eVdpnryx4quXlWRY+B3jp2hmH7bA33RckewPEOrq+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrbWQfKWzmcUvyQhQhIPT9/NFnL+73sv4z7/+lOWY0/kMppIn6ELsaGDTzQA8QDBR
	 FUJEcBG5n6rrVEPEXAR7+AeYAP11e4bUr3DCcmqrY0MwhpNyJYbyVa69Zr5clG+CVH
	 pFA2VyM2n5lKtMrx8PGU2dd293Kv2rpFQmAdzSGY=
Date: Sun, 16 Jun 2024 23:38:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20240616203807.GB10964@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
 <ygr7rhp23gjc4ywmcdy7d5coh4wubxlvkdxcvwgdpk4j343pnd@h4if5jtz7mop>
 <20240606175306.GB26663@pendragon.ideasonboard.com>
 <afe76b3c-8e75-4c70-bcc2-9ee5f57d70b7@ideasonboard.com>
 <ZmVKANYj7uD3IFmy@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmVKANYj7uD3IFmy@valkosipuli.retiisi.eu>

On Sun, Jun 09, 2024 at 06:21:52AM +0000, Sakari Ailus wrote:
> On Thu, Jun 06, 2024 at 10:10:14PM +0300, Tomi Valkeinen wrote:
> > On 06/06/2024 20:53, Laurent Pinchart wrote:
> > > > > > > +			return -EINVAL;
> > > > > > > +		}
> > > > > > > +
> > > > > > > +		active_sink = route->sink_pad;
> > > > > > > +	}
> > > > > > > +	if (active_sink == UINT_MAX) {
> > > > > > > +		dev_err(rzr->mali_c55->dev, "One route has to be active");
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > >
> > > > > The recommended handling of invalid routing is to adjust the routing
> > > > > table, not to return errors.
> > > >
> > > > How should I adjust it ? The error here is due to the fact multiple
> > > > routes are set as active, which one should I make active ? the first
> > > > one ? Should I go and reset the flags in the subdev_route for the one
> > > > that has to be made non-active ?
> > >
> > > The same way you would adjust an invalid format, you can pick the route
> > > you consider should be the default.
> > > 
> > > I'd like Sakari's and Tomi's opinions on this, as it's a new API and the
> > > behaviour is still a bit in flux.
> > 
> > Well... My opinion is that the driver adjusting the given config parameters
> > (for any ioctl) is awful and should be deprecated. If the user asks for X,
> > and the driver adjusts it and returns Y, then the user has two options:
> > fail, because it didn't get X (after possibly laborious field by field
> > checks), or shrug it's virtual shoulders and accept Y and hope that things
> > still work even though it wanted X.
> 
> This is still often the only way to tell what the hardware can do as the
> limitations in different cases (cropping and scaling for instance) can be
> arbitrary. The other option is that the user space has to know the hardware
> capabilities without them being available from the kernel.

For some parameters that make sense (we don't have a try mechanism for
ISP parameters buffers for instance), but when it comes to configuring a
pipeline, I think a parameters adjustment model is needed when we don't
have means to expose constraints in a generic way to userspace. The
question is in which category routing falls.

> There could be cases of IOCTLs where returning an error if what was
> requested can't be performed exactly is workable in general, but then again
> having consistency across IOCTL behaviour is very beneficial as well.
> 
> If you need something exactly, then I think you should check after the
> IOCTL that this is what you also got, beyond the IOCTL succeeding.

I do agree with Tomi that this kind of check can be annoying for
applications. In cases where checking the result would be complex, and
where there is very little use case for receiving anything but the exact
configuration you asked for, adjusting the parameters could increase the
implementation complexity on both the kernel side and userspace side for
no or very little benefit.

> > But maybe that was an answer to a question you didn't really ask =).
> > 
> > I think setting it to default routing in case of an error is as fine as any
> > other "fix" for the routing. It won't work anyway.
> > 
> > But if the function sets default routing and returns 0 here, why would it
> > return an error from v4l2_subdev_routing_validate()? Should it just set
> > default routing in that case too? So should set_routing() ever return an
> > error, if we can just set the default routing?

That's a good point. I asked myself the same question after sending my
previous e-mail, and wondered if anyone else would notice too :-)

> S_ROUTING is a bit special as it deals with multiple routes and the user
> space does have a way to add them incrementally.
> 
> Perhaps we should document better what the driver is expected to to correct
> the routes?

We should document the expected behaviour clearly. After agreeing on the
expected behaviour, that is.

> I'd think routes may be added by the driver (as some of them cannot be
> disabled for instance) but if a requested route cannot be created, that
> should probably be an error.
> 
> I've copied my current (with all the pending patches) documentation here
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/streams-doc/userspace-api/media/v4l/dev-subdev.html#streams-multiplexed-media-pads-and-internal-routing>.
>
> The text does not elaborate what exactly a driver could or should do, apart
> from specifying the condition for EINVAL. I think we should specify this in

I don't see mentions of EINVAL related to streams there, am I missing
something ?

> greater detail. My original thought wws the adjustment would be done by
> adding static routes omitted by the caller, not trying to come up with e.g.
> valid pad/stream pairs when user provided invalid ones.
> 
> Could this correction functionality be limited to returning static routes?

That would make userspace a tad simpler, and wouldn't be hard to do in
the kernel, but I wonder if departing from the rule that invalid routing
tables result in an error is worth it for such a small gain.

> > In the VIDIOC_SUBDEV_S_ROUTING doc we do list some cases where EINVAL or
> > E2BIG is returned. But only a few, and I think
> > v4l2_subdev_routing_validate() will return errors for many other cases too.
> > 
> > For what it's worth, the drivers I have written just return an error. It's
> > simple for the driver and the user and works. If the consensus is that the
> > drivers should instead set the default routing, or somehow mangle the given
> > routing to an acceptable form, I can update those drivers accordingly.
> > 
> > But we probably need to update the docs too to be a bit more clear what
> > VIDIOC_SUBDEV_S_ROUTING will do (although are the other ioctls any
> > clearer?).
> > 
> > All that said, I think it's still a bit case-by-case. I don't think the
> > drivers should always return an error if they get a routing table that's not
> > 100% perfect. E.g. if a device supports two static routes, but the second
> > one can be enabled or disabled, the driver should still accept a routing
> > table from the user with only the first route present. Etc.
> > 
> > For the specific case in this patch... I'd prefer returning an error, or if
> > that's not ok, set default routing.
> 
> Not modifying the routing table is another option as well but it may
> require separating validating user-provided routes and applying the routes

I'm not sure to follow you here. By not modifying the routing table, do
you mean returning an error ? Why would that require separation of
validation and configuration ?

> to the sub-device state. The default could be useful in principle, too, for
> routing-unaware applications but they won't be calling S_ROUTING anyway.

-- 
Regards,

Laurent Pinchart

