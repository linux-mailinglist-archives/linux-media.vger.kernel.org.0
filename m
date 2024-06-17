Return-Path: <linux-media+bounces-13384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4890A621
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C286A1C25D5C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D743186E25;
	Mon, 17 Jun 2024 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="bf5Zk+IG"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870EB39FFB;
	Mon, 17 Jun 2024 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607197; cv=pass; b=pne4f2Ngriu4h/DJFy4XdxSmioxpyYX2hxntuEmucKXhHINdkr4O26IWPnxQrV/aSUtwu/zbdgtiYlb09+rIRfm5mYrpn80UeK5ZU1HJ5bIZ/hRuN2n25ddqdtnBifW/mUmoKxVzR2CGP6YSC2+UJWvldPnHOCqgMoKJG5H2odM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607197; c=relaxed/simple;
	bh=W6o5OFHPV903s3p/dxPKCzEI3sKGQY/2nQbvsZRxpLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoINhJ32+sSJAvwElXt0coffBjn4Njzs+RaJ39YlEYWJL1+RQHsaJxIoIZsOnjzK0VyVBLpee+D1u5HsQGxkGU3KOhyeorMdJVFCcic+67FbnGtxAROnXdYy0N6/b7NAxDpWCd3IY7W538xWaKlyS0H18JGZLA2Plcl5/Rozw5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=bf5Zk+IG; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W2gZD47h7z49Q4J;
	Mon, 17 Jun 2024 09:53:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1718607189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6uM9bQS23wS/E3Smjz6I8J48DsYFyEmhgCN++2bd06U=;
	b=bf5Zk+IGlVR0GCuS1tBR4o1xKV3iJLFAHkqQafKJit6IzQn/WHnZUmB+Seq5p/vg79KZ6t
	q1WkXJ/UbNpZcw5McY2aWelByD8RKxomDKquZgZl1PmYXBX3FzD5eVsMZd4vWumRPshiZs
	p4rjPqA9Afne5H0TQjPxWluqEMC+fn5sCLEA4/xv41qgPf4ROqIjFxezneiB4cVuOamijl
	D8jZC0sU3a5eMyBjvQI9LIs//262p9XQOODO8ePaR2zzKk7w3wHGWluoE7DLALHgZwRquA
	DCowO4CHF/vDI1n0jIkGSm5d1MqgAh+/4chewekQ0mWvwd7Z7HuyxHczqoDEQQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1718607189; a=rsa-sha256;
	cv=none;
	b=lOJd2AbRGWco3YqNfFGvOISmSbFKfXt+p9SXblLenZH5NkO3pl8Hmo30HrlNm22ILxEFpl
	lFXXd8VBufe/0N+/41bKT2NgmGGxKyrSW30vOtm95++jVnm3LrXBnvuwOr7iKc38wmlW/y
	r08ef1rzLID2XnJ5HyqGFMr9IJBWY4H2m6+R1dhO54y6C2qzddpNWTpdYUMKB//1fbuzsz
	HbvcuBp3fxziOqoF+1Dy4jC2lwUYZBZJyT0h0E47btlF2b7sg4ikTqhQBffm0MvVJESJa7
	6X47BbLKW9uGy2Uzse/TVWQ2GvM4EfHWfXdfukxjqkXWRkBxirlyt0TB7ougyA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1718607189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6uM9bQS23wS/E3Smjz6I8J48DsYFyEmhgCN++2bd06U=;
	b=TEL/6PRiT3valJJGt2sCzkeYA4ZyeqI8x3JS7I88MFtssakG4OQW2KW+GGk33820jMXyDu
	8WV2+c1EXR1SBtsL5Jg9Mti13bX3s6isS8wQsqSg77hTodt4P2mVhblImDeY2SaxWcAp2F
	2FKmeXJctCQRLI3VaW5EZN5yyKWK+NQt0U1TvB2WvGyf7jXCwLZomO2JMX6plnyaZnLJij
	8GLar7wMF7UbqVYPG1bdz7yjvJBdtx4aMqOFX0CaOAIdO8rZKUVagD/lxSvT9wcE2Kc+hL
	IshEn/Fi4gOpe7ZWWTb8kKfv6E96mlln70Vp9E+SZ2eyt1FLgPXqdA1ny4yOPQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3BC6D634C93;
	Mon, 17 Jun 2024 09:53:07 +0300 (EEST)
Date: Mon, 17 Jun 2024 06:53:07 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <Zm_dU6LQE1SgVMj-@valkosipuli.retiisi.eu>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
 <ygr7rhp23gjc4ywmcdy7d5coh4wubxlvkdxcvwgdpk4j343pnd@h4if5jtz7mop>
 <20240606175306.GB26663@pendragon.ideasonboard.com>
 <afe76b3c-8e75-4c70-bcc2-9ee5f57d70b7@ideasonboard.com>
 <ZmVKANYj7uD3IFmy@valkosipuli.retiisi.eu>
 <20240616203807.GB10964@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616203807.GB10964@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Jun 16, 2024 at 11:38:07PM +0300, Laurent Pinchart wrote:
> On Sun, Jun 09, 2024 at 06:21:52AM +0000, Sakari Ailus wrote:
> > On Thu, Jun 06, 2024 at 10:10:14PM +0300, Tomi Valkeinen wrote:
> > > On 06/06/2024 20:53, Laurent Pinchart wrote:
> > > > > > > > +			return -EINVAL;
> > > > > > > > +		}
> > > > > > > > +
> > > > > > > > +		active_sink = route->sink_pad;
> > > > > > > > +	}
> > > > > > > > +	if (active_sink == UINT_MAX) {
> > > > > > > > +		dev_err(rzr->mali_c55->dev, "One route has to be active");
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	}
> > > > > >
> > > > > > The recommended handling of invalid routing is to adjust the routing
> > > > > > table, not to return errors.
> > > > >
> > > > > How should I adjust it ? The error here is due to the fact multiple
> > > > > routes are set as active, which one should I make active ? the first
> > > > > one ? Should I go and reset the flags in the subdev_route for the one
> > > > > that has to be made non-active ?
> > > >
> > > > The same way you would adjust an invalid format, you can pick the route
> > > > you consider should be the default.
> > > > 
> > > > I'd like Sakari's and Tomi's opinions on this, as it's a new API and the
> > > > behaviour is still a bit in flux.
> > > 
> > > Well... My opinion is that the driver adjusting the given config parameters
> > > (for any ioctl) is awful and should be deprecated. If the user asks for X,
> > > and the driver adjusts it and returns Y, then the user has two options:
> > > fail, because it didn't get X (after possibly laborious field by field
> > > checks), or shrug it's virtual shoulders and accept Y and hope that things
> > > still work even though it wanted X.
> > 
> > This is still often the only way to tell what the hardware can do as the
> > limitations in different cases (cropping and scaling for instance) can be
> > arbitrary. The other option is that the user space has to know the hardware
> > capabilities without them being available from the kernel.
> 
> For some parameters that make sense (we don't have a try mechanism for
> ISP parameters buffers for instance), but when it comes to configuring a
> pipeline, I think a parameters adjustment model is needed when we don't
> have means to expose constraints in a generic way to userspace. The
> question is in which category routing falls.
> 
> > There could be cases of IOCTLs where returning an error if what was
> > requested can't be performed exactly is workable in general, but then again
> > having consistency across IOCTL behaviour is very beneficial as well.
> > 
> > If you need something exactly, then I think you should check after the
> > IOCTL that this is what you also got, beyond the IOCTL succeeding.
> 
> I do agree with Tomi that this kind of check can be annoying for
> applications. In cases where checking the result would be complex, and
> where there is very little use case for receiving anything but the exact
> configuration you asked for, adjusting the parameters could increase the
> implementation complexity on both the kernel side and userspace side for
> no or very little benefit.
> 
> > > But maybe that was an answer to a question you didn't really ask =).
> > > 
> > > I think setting it to default routing in case of an error is as fine as any
> > > other "fix" for the routing. It won't work anyway.
> > > 
> > > But if the function sets default routing and returns 0 here, why would it
> > > return an error from v4l2_subdev_routing_validate()? Should it just set
> > > default routing in that case too? So should set_routing() ever return an
> > > error, if we can just set the default routing?
> 
> That's a good point. I asked myself the same question after sending my
> previous e-mail, and wondered if anyone else would notice too :-)
> 
> > S_ROUTING is a bit special as it deals with multiple routes and the user
> > space does have a way to add them incrementally.
> > 
> > Perhaps we should document better what the driver is expected to to correct
> > the routes?
> 
> We should document the expected behaviour clearly. After agreeing on the
> expected behaviour, that is.
> 
> > I'd think routes may be added by the driver (as some of them cannot be
> > disabled for instance) but if a requested route cannot be created, that
> > should probably be an error.
> > 
> > I've copied my current (with all the pending patches) documentation here
> > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/streams-doc/userspace-api/media/v4l/dev-subdev.html#streams-multiplexed-media-pads-and-internal-routing>.
> >
> > The text does not elaborate what exactly a driver could or should do, apart
> > from specifying the condition for EINVAL. I think we should specify this in
> 
> I don't see mentions of EINVAL related to streams there, am I missing
> something ?
> 
> > greater detail. My original thought wws the adjustment would be done by
> > adding static routes omitted by the caller, not trying to come up with e.g.
> > valid pad/stream pairs when user provided invalid ones.
> > 
> > Could this correction functionality be limited to returning static routes?
> 
> That would make userspace a tad simpler, and wouldn't be hard to do in
> the kernel, but I wonder if departing from the rule that invalid routing
> tables result in an error is worth it for such a small gain.

I'm just referring to our previous decision on the matter. :-)

Of course an application can do G_ROUTING, toggle the routes it needs to
and call S_ROUTING again, in order to be (fairly) certain it'll succeed.

Say, if an application wants to enable an embedded data route, then it'll
be required to supply the route for the image data as well, even if there's
no configuration that could be made for that route.

I'm thinking of fairly generic code here, if a device requires special
routing setup, it'll need the user space to be aware of it.

> 
> > > In the VIDIOC_SUBDEV_S_ROUTING doc we do list some cases where EINVAL or
> > > E2BIG is returned. But only a few, and I think
> > > v4l2_subdev_routing_validate() will return errors for many other cases too.
> > > 
> > > For what it's worth, the drivers I have written just return an error. It's
> > > simple for the driver and the user and works. If the consensus is that the
> > > drivers should instead set the default routing, or somehow mangle the given
> > > routing to an acceptable form, I can update those drivers accordingly.
> > > 
> > > But we probably need to update the docs too to be a bit more clear what
> > > VIDIOC_SUBDEV_S_ROUTING will do (although are the other ioctls any
> > > clearer?).
> > > 
> > > All that said, I think it's still a bit case-by-case. I don't think the
> > > drivers should always return an error if they get a routing table that's not
> > > 100% perfect. E.g. if a device supports two static routes, but the second
> > > one can be enabled or disabled, the driver should still accept a routing
> > > table from the user with only the first route present. Etc.
> > > 
> > > For the specific case in this patch... I'd prefer returning an error, or if
> > > that's not ok, set default routing.
> > 
> > Not modifying the routing table is another option as well but it may
> > require separating validating user-provided routes and applying the routes
> 
> I'm not sure to follow you here. By not modifying the routing table, do
> you mean returning an error ? Why would that require separation of
> validation and configuration ?

If a driver has already made changes to its routing table, it's a bad idea
to return an error to the user. In this case changes shouldn't be made.

> 
> > to the sub-device state. The default could be useful in principle, too, for
> > routing-unaware applications but they won't be calling S_ROUTING anyway.
> 

-- 
Kind regards,

Sakari Ailus

