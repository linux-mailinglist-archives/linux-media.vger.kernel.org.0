Return-Path: <linux-media+bounces-13488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209890BF37
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 00:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C181C213D5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 22:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A40199392;
	Mon, 17 Jun 2024 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VHKf7B2P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92B188CCB;
	Mon, 17 Jun 2024 22:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664602; cv=none; b=BMuF6xEqeUanW39u2NajRdoowkKigL3SqKim7Aax9P7KNDwSvk3JI+lAQrI5/DGCesch+Pa1+fqQReGQCymf11jM/2TG6LBWwD4TVAJywRlc+34ZhSEtsa78OMkV5axz1/l0FjuzIMo5CZR/I4O6di+7rdJ+F3akQQiQ3JbF1HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664602; c=relaxed/simple;
	bh=XQjga9PpCEkFSdwPugow4xWUMKShp1Bft6kQ86mIHMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1BWVFFVoqsR1+eb4JPCcY5QVMlYkKoGFgRdZyXd58XOLczYPYKQf0d+Sj6RS5TBn5RnUu2o99l5785g5mtQpZ5f+Mg5JiUpqJ52g/y2l2PIJz2zTSJQwwdKuc+BF+ZsbVGgYxM/9Y9ykyfuKttdi+c0JsTsggQL1/JdQcizYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VHKf7B2P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53006289;
	Tue, 18 Jun 2024 00:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718664581;
	bh=XQjga9PpCEkFSdwPugow4xWUMKShp1Bft6kQ86mIHMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHKf7B2PIjGd9PWzVxPUtyuLQrQIBo2/Ydxv2iR8t8D/b5ua6ChoEzYrPkSiR8KXQ
	 J1uaiQAHI9zWWg8ONvMqveMf58zx4IPxLOHkMmeaECkTiWMTDKq8Kz2khxLryKjLyW
	 lMcpS6WgKUOME+qYg+QcO8y07nlOKo92/7UOQWpM=
Date: Tue, 18 Jun 2024 01:49:35 +0300
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
Message-ID: <20240617224935.GD17726@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
 <ygr7rhp23gjc4ywmcdy7d5coh4wubxlvkdxcvwgdpk4j343pnd@h4if5jtz7mop>
 <20240606175306.GB26663@pendragon.ideasonboard.com>
 <afe76b3c-8e75-4c70-bcc2-9ee5f57d70b7@ideasonboard.com>
 <ZmVKANYj7uD3IFmy@valkosipuli.retiisi.eu>
 <20240616203807.GB10964@pendragon.ideasonboard.com>
 <Zm_dU6LQE1SgVMj-@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zm_dU6LQE1SgVMj-@valkosipuli.retiisi.eu>

On Mon, Jun 17, 2024 at 06:53:07AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Jun 16, 2024 at 11:38:07PM +0300, Laurent Pinchart wrote:
> > On Sun, Jun 09, 2024 at 06:21:52AM +0000, Sakari Ailus wrote:
> > > On Thu, Jun 06, 2024 at 10:10:14PM +0300, Tomi Valkeinen wrote:
> > > > On 06/06/2024 20:53, Laurent Pinchart wrote:
> > > > > > > > > +			return -EINVAL;
> > > > > > > > > +		}
> > > > > > > > > +
> > > > > > > > > +		active_sink = route->sink_pad;
> > > > > > > > > +	}
> > > > > > > > > +	if (active_sink == UINT_MAX) {
> > > > > > > > > +		dev_err(rzr->mali_c55->dev, "One route has to be active");
> > > > > > > > > +		return -EINVAL;
> > > > > > > > > +	}
> > > > > > >
> > > > > > > The recommended handling of invalid routing is to adjust the routing
> > > > > > > table, not to return errors.
> > > > > >
> > > > > > How should I adjust it ? The error here is due to the fact multiple
> > > > > > routes are set as active, which one should I make active ? the first
> > > > > > one ? Should I go and reset the flags in the subdev_route for the one
> > > > > > that has to be made non-active ?
> > > > >
> > > > > The same way you would adjust an invalid format, you can pick the route
> > > > > you consider should be the default.
> > > > > 
> > > > > I'd like Sakari's and Tomi's opinions on this, as it's a new API and the
> > > > > behaviour is still a bit in flux.
> > > > 
> > > > Well... My opinion is that the driver adjusting the given config parameters
> > > > (for any ioctl) is awful and should be deprecated. If the user asks for X,
> > > > and the driver adjusts it and returns Y, then the user has two options:
> > > > fail, because it didn't get X (after possibly laborious field by field
> > > > checks), or shrug it's virtual shoulders and accept Y and hope that things
> > > > still work even though it wanted X.
> > > 
> > > This is still often the only way to tell what the hardware can do as the
> > > limitations in different cases (cropping and scaling for instance) can be
> > > arbitrary. The other option is that the user space has to know the hardware
> > > capabilities without them being available from the kernel.
> > 
> > For some parameters that make sense (we don't have a try mechanism for
> > ISP parameters buffers for instance), but when it comes to configuring a
> > pipeline, I think a parameters adjustment model is needed when we don't
> > have means to expose constraints in a generic way to userspace. The
> > question is in which category routing falls.
> > 
> > > There could be cases of IOCTLs where returning an error if what was
> > > requested can't be performed exactly is workable in general, but then again
> > > having consistency across IOCTL behaviour is very beneficial as well.
> > > 
> > > If you need something exactly, then I think you should check after the
> > > IOCTL that this is what you also got, beyond the IOCTL succeeding.
> > 
> > I do agree with Tomi that this kind of check can be annoying for
> > applications. In cases where checking the result would be complex, and
> > where there is very little use case for receiving anything but the exact
> > configuration you asked for, adjusting the parameters could increase the
> > implementation complexity on both the kernel side and userspace side for
> > no or very little benefit.
> > 
> > > > But maybe that was an answer to a question you didn't really ask =).
> > > > 
> > > > I think setting it to default routing in case of an error is as fine as any
> > > > other "fix" for the routing. It won't work anyway.
> > > > 
> > > > But if the function sets default routing and returns 0 here, why would it
> > > > return an error from v4l2_subdev_routing_validate()? Should it just set
> > > > default routing in that case too? So should set_routing() ever return an
> > > > error, if we can just set the default routing?
> > 
> > That's a good point. I asked myself the same question after sending my
> > previous e-mail, and wondered if anyone else would notice too :-)
> > 
> > > S_ROUTING is a bit special as it deals with multiple routes and the user
> > > space does have a way to add them incrementally.
> > > 
> > > Perhaps we should document better what the driver is expected to to correct
> > > the routes?
> > 
> > We should document the expected behaviour clearly. After agreeing on the
> > expected behaviour, that is.
> > 
> > > I'd think routes may be added by the driver (as some of them cannot be
> > > disabled for instance) but if a requested route cannot be created, that
> > > should probably be an error.
> > > 
> > > I've copied my current (with all the pending patches) documentation here
> > > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/streams-doc/userspace-api/media/v4l/dev-subdev.html#streams-multiplexed-media-pads-and-internal-routing>.
> > >
> > > The text does not elaborate what exactly a driver could or should do, apart
> > > from specifying the condition for EINVAL. I think we should specify this in
> > 
> > I don't see mentions of EINVAL related to streams there, am I missing
> > something ?
> > 
> > > greater detail. My original thought wws the adjustment would be done by
> > > adding static routes omitted by the caller, not trying to come up with e.g.
> > > valid pad/stream pairs when user provided invalid ones.
> > > 
> > > Could this correction functionality be limited to returning static routes?
> > 
> > That would make userspace a tad simpler, and wouldn't be hard to do in
> > the kernel, but I wonder if departing from the rule that invalid routing
> > tables result in an error is worth it for such a small gain.
> 
> I'm just referring to our previous decision on the matter. :-)
> 
> Of course an application can do G_ROUTING, toggle the routes it needs to
> and call S_ROUTING again, in order to be (fairly) certain it'll succeed.
> 
> Say, if an application wants to enable an embedded data route, then it'll
> be required to supply the route for the image data as well, even if there's
> no configuration that could be made for that route.
> 
> I'm thinking of fairly generic code here, if a device requires special
> routing setup, it'll need the user space to be aware of it.

I hope the libcamera implementation of the routing API will help us
figuring this out. We can leave the point open for now.

> > > > In the VIDIOC_SUBDEV_S_ROUTING doc we do list some cases where EINVAL or
> > > > E2BIG is returned. But only a few, and I think
> > > > v4l2_subdev_routing_validate() will return errors for many other cases too.
> > > > 
> > > > For what it's worth, the drivers I have written just return an error. It's
> > > > simple for the driver and the user and works. If the consensus is that the
> > > > drivers should instead set the default routing, or somehow mangle the given
> > > > routing to an acceptable form, I can update those drivers accordingly.
> > > > 
> > > > But we probably need to update the docs too to be a bit more clear what
> > > > VIDIOC_SUBDEV_S_ROUTING will do (although are the other ioctls any
> > > > clearer?).
> > > > 
> > > > All that said, I think it's still a bit case-by-case. I don't think the
> > > > drivers should always return an error if they get a routing table that's not
> > > > 100% perfect. E.g. if a device supports two static routes, but the second
> > > > one can be enabled or disabled, the driver should still accept a routing
> > > > table from the user with only the first route present. Etc.
> > > > 
> > > > For the specific case in this patch... I'd prefer returning an error, or if
> > > > that's not ok, set default routing.
> > > 
> > > Not modifying the routing table is another option as well but it may
> > > require separating validating user-provided routes and applying the routes
> > 
> > I'm not sure to follow you here. By not modifying the routing table, do
> > you mean returning an error ? Why would that require separation of
> > validation and configuration ?
> 
> If a driver has already made changes to its routing table, it's a bad idea
> to return an error to the user. In this case changes shouldn't be made.

Ah yes, that should be clearly documented. If an error is returned, no
change to the state shall occur.

> > > to the sub-device state. The default could be useful in principle, too, for
> > > routing-unaware applications but they won't be calling S_ROUTING anyway.

-- 
Regards,

Laurent Pinchart

