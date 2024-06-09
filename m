Return-Path: <linux-media+bounces-12782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB59014B3
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 08:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5A31C20BD4
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 06:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD30617550;
	Sun,  9 Jun 2024 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="MWxjwXh9"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BC568A;
	Sun,  9 Jun 2024 06:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717914123; cv=pass; b=cGEA4Rxh1OaHORMVQbxt24/lWXx3DVgZtZ7eJ+0bMq3SC+j3IQeigbxcQh1nmbbkJ180oP3+jvMFqXqO7Hr3VCMeCKND4oTL2LSHdpBNZwqCSGCRnWBsCrwEipBV2VdWy7bAsbnJd3FhpaHyf2cJJNv/OHWZl5kd8oXIB3PrQ7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717914123; c=relaxed/simple;
	bh=VSZ92pV3AucnLK8hN95dDKzWaGIS9Zmj7GOSIzj6KXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o40M7og1jS7WpDQjgnYx10ZCJ5VEmXU0IcdEOx1klKcNdOGW0yL29H0ajvN/Wfrcjiau9I08k8Kli6LwsBvWQtq01DLlhrFbu+M4O0L9opbSIMs55IkCc9Okyduy0uQslD3tBf5S7GBdnnP6Nl41dNglJZmseY+fL6qDERULpXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=MWxjwXh9; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VxlFt12NTzyRF;
	Sun,  9 Jun 2024 09:21:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1717914116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CjfKa8cImL97CymJHsFxLj8doDjqDxazoQdqIj3VnM=;
	b=MWxjwXh9C/Bo5VAQIBv6GjLDlJAkhPCkF+Tap1rRykxlXS0Q0IVSVOtgRkUYCwK+hvtJ91
	EgPefs2xfBNsvUkGynwyEyBynJBXFUGyERTHWC6Sp68qxlnC/vfDoInVs1ea4iHouNGveP
	WHEmMQwR10Jdd9vwussrxt7RQU7rWZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1717914116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CjfKa8cImL97CymJHsFxLj8doDjqDxazoQdqIj3VnM=;
	b=mENg3wx9wX+MkqOj3OfhvxCf/pvITDWD5AIgVOEkQVnOjefusKHPMIQlaQtIvLKf7dRrJ2
	Y2i7Nad42YnA6kfRJro9/hMRQR7qqEepYnC6SPYGdyJ78kzc2AMO8hRZYBA1lpWpobvmt3
	bNesWC5c+8gkZvMeDEw2T0m3BSIu/X4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1717914116; a=rsa-sha256; cv=none;
	b=eR9MO2uej7jxWQbnClaQHVvkeo9rt5cb7U/mWedcIzzDNLOBWAZ2E6AEiV4+JKDn97rExo
	H7KIJeApNxADYV6b5kCJKaU58F/4rB+nlOzkW7/NDyPr3fJaYF8+1dnKtK9u+tPbYubkz0
	aVirVY3eOfBwy8ABt5nb/Ev+N8G5Ytw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4F603634C93;
	Sun,  9 Jun 2024 09:21:53 +0300 (EEST)
Date: Sun, 9 Jun 2024 06:21:52 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <ZmVKANYj7uD3IFmy@valkosipuli.retiisi.eu>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
 <ygr7rhp23gjc4ywmcdy7d5coh4wubxlvkdxcvwgdpk4j343pnd@h4if5jtz7mop>
 <20240606175306.GB26663@pendragon.ideasonboard.com>
 <afe76b3c-8e75-4c70-bcc2-9ee5f57d70b7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe76b3c-8e75-4c70-bcc2-9ee5f57d70b7@ideasonboard.com>

Moi,

On Thu, Jun 06, 2024 at 10:10:14PM +0300, Tomi Valkeinen wrote:
> On 06/06/2024 20:53, Laurent Pinchart wrote:
> > > > > > +			return -EINVAL;
> > > > > > +		}
> > > > > > +
> > > > > > +		active_sink = route->sink_pad;
> > > > > > +	}
> > > > > > +	if (active_sink == UINT_MAX) {
> > > > > > +		dev_err(rzr->mali_c55->dev, "One route has to be active");
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > The recommended handling of invalid routing is to adjust the routing
> > > > table, not to return errors.
> > > How should I adjust it ? The error here is due to the fact multiple
> > > routes are set as active, which one should I make active ? the first
> > > one ? Should I go and reset the flags in the subdev_route for the one
> > > that has to be made non-active ?
> > The same way you would adjust an invalid format, you can pick the route
> > you consider should be the default.
> > 
> > I'd like Sakari's and Tomi's opinions on this, as it's a new API and the
> > behaviour is still a bit in flux.
> 
> Well... My opinion is that the driver adjusting the given config parameters
> (for any ioctl) is awful and should be deprecated. If the user asks for X,
> and the driver adjusts it and returns Y, then the user has two options:
> fail, because it didn't get X (after possibly laborious field by field
> checks), or shrug it's virtual shoulders and accept Y and hope that things
> still work even though it wanted X.

This is still often the only way to tell what the hardware can do as the
limitations in different cases (cropping and scaling for instance) can be
arbitrary. The other option is that the user space has to know the hardware
capabilities without them being available from the kernel.

There could be cases of IOCTLs where returning an error if what was
requested can't be performed exactly is workable in general, but then again
having consistency across IOCTL behaviour is very beneficial as well.

If you need something exactly, then I think you should check after the
IOCTL that this is what you also got, beyond the IOCTL succeeding.

> 
> But maybe that was an answer to a question you didn't really ask =).
> 
> I think setting it to default routing in case of an error is as fine as any
> other "fix" for the routing. It won't work anyway.
> 
> But if the function sets default routing and returns 0 here, why would it
> return an error from v4l2_subdev_routing_validate()? Should it just set
> default routing in that case too? So should set_routing() ever return an
> error, if we can just set the default routing?

S_ROUTING is a bit special as it deals with multiple routes and the user
space does have a way to add them incrementally.

Perhaps we should document better what the driver is expected to to correct
the routes?

I'd think routes may be added by the driver (as some of them cannot be
disabled for instance) but if a requested route cannot be created, that
should probably be an error.

I've copied my current (with all the pending patches) documentation here
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/streams-doc/userspace-api/media/v4l/dev-subdev.html#streams-multiplexed-media-pads-and-internal-routing>.

The text does not elaborate what exactly a driver could or should do, apart
from specifying the condition for EINVAL. I think we should specify this in
greater detail. My original thought wws the adjustment would be done by
adding static routes omitted by the caller, not trying to come up with e.g.
valid pad/stream pairs when user provided invalid ones.

Could this correction functionality be limited to returning static routes?

> 
> In the VIDIOC_SUBDEV_S_ROUTING doc we do list some cases where EINVAL or
> E2BIG is returned. But only a few, and I think
> v4l2_subdev_routing_validate() will return errors for many other cases too.
> 
> For what it's worth, the drivers I have written just return an error. It's
> simple for the driver and the user and works. If the consensus is that the
> drivers should instead set the default routing, or somehow mangle the given
> routing to an acceptable form, I can update those drivers accordingly.
> 
> But we probably need to update the docs too to be a bit more clear what
> VIDIOC_SUBDEV_S_ROUTING will do (although are the other ioctls any
> clearer?).
> 
> All that said, I think it's still a bit case-by-case. I don't think the
> drivers should always return an error if they get a routing table that's not
> 100% perfect. E.g. if a device supports two static routes, but the second
> one can be enabled or disabled, the driver should still accept a routing
> table from the user with only the first route present. Etc.
> 
> For the specific case in this patch... I'd prefer returning an error, or if
> that's not ok, set default routing.

Not modifying the routing table is another option as well but it may
require separating validating user-provided routes and applying the routes
to the sub-device state. The default could be useful in principle, too, for
routing-unaware applications but they won't be calling S_ROUTING anyway.

-- 
Terveisin,

Sakari Ailus

