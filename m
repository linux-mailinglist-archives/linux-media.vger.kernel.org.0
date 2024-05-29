Return-Path: <linux-media+bounces-12183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2978D3B03
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F33B2835F4
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9091D18410F;
	Wed, 29 May 2024 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WLoOLl0x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C996181BB8;
	Wed, 29 May 2024 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996591; cv=none; b=qluOnNUZ7fudrfOKxmEyhqL6J68RBCvQHW0gAHzhx3xqTRpZs1QcgXuH/8vwffuRQgJ653gjtqEGR9Qh6wcR/mp3JqGnuxBlG3V8/bpht5+8LTok1g87IvVe/YDF9N1rJcKSN3Z2xm8Jb12opkY0b4zy5dv5qoC9+jBf/v6/1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996591; c=relaxed/simple;
	bh=sewIJaD9QjZaC5xG2CE6xvk6MR9xCopp4nwFzwuQONM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rbdc0iNukalzuHhoXSMJkaFtB/vsIpaLyTcjus/STl7FZvZHCzz9mfwj2zX/f2KwmRAVyA7Dpnx5aeXK9GOaICj6yPo9y4HApc/RHV4ej7ZRIoE7vhhhPbuc1ry9KGCc6XR5bFb64lsXuWDEu29BGR89UITb/K28EtKNRcaG6fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WLoOLl0x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DBEB2B5A;
	Wed, 29 May 2024 17:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716996573;
	bh=sewIJaD9QjZaC5xG2CE6xvk6MR9xCopp4nwFzwuQONM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLoOLl0xQ/o4oH3fuxV5VZLyyC+IFLMk/tN24fONYBJtHmBv0J8zLd/owMU1b2inJ
	 n89/s7xlgzydAjqnXu3r+loDucHc+8Tpio+GVgEsUpWLbxf8qL112tSKA0c+71vIXW
	 LVWq/nFLWvzyy8AgV0ZDCjYht8t7NcRSEKnVay1M=
Date: Wed, 29 May 2024 18:29:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <20240529152925.GT1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
 <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
 <20240529145253.GE19014@pendragon.ideasonboard.com>
 <501d8e92-43c8-4205-9c3a-819888fbd5f2@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <501d8e92-43c8-4205-9c3a-819888fbd5f2@moroto.mountain>

On Wed, May 29, 2024 at 06:19:33PM +0300, Dan Carpenter wrote:
> On Wed, May 29, 2024 at 05:52:53PM +0300, Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 05:34:41PM +0300, Dan Carpenter wrote:
> > > On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > > > > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> > > > >  	}
> > > > >  
> > > > >  	/* Iterate through each output port to discover topology */
> > > > > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > > > > +	for_each_endpoint_of_node(parent, ep) {
> > > > >  		/*
> > > > >  		 * Legacy binding mixes input/output ports under the
> > > > >  		 * same parent. So, skip the input ports if we are dealing
> > > > 
> > > > I think there's a bug below. The loop contains
> > > > 
> > > > 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> > > > 		if (ret)
> > > > 			return ret;
> > > > 
> > > > which leaks the reference to ep. This is not introduced by this patch,
> > > 
> > > Someone should create for_each_endpoint_of_node_scoped().
> > > 
> > > #define for_each_endpoint_of_node_scoped(parent, child) \
> > >         for (struct device_node *child __free(device_node) =           \
> > >              of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
> > >              child = of_graph_get_next_endpoint(parent, child))
> > 
> > I was thinking about that too :-) I wondered if we should then bother
> > taking and releasing references, given that references to the children
> > can't be leaked out of the loop. My reasoning was that the parent
> > device_node is guaranteed to be valid throughout the loop, so borrowing
> > references to children instead of creating new ones within the loop
> > should be fine. This assumes that endpoints and ports can't vanish while
> > the parent is there. Thinking further about it, it may not be a safe
> > assumption for the future. As we anyway use functions internally that
> > create new references, we can as well handle them correctly.
> > 
> > Using this new macro, the loop body would need to call of_node_get() if
> > it wants to get a reference out of the loop.
> 
> The child pointer is declared local to just the loop so you'd need
> create a different function scoped variable.  If it's not local to the
> loop then we'd end up taking a reference on each iteration and never
> releasing anything except on error paths.
> 
> > That's the right thing to
> > do, and I think it would be less error-prone than having to drop
> > references when exiting from the loop as we do today. It would still be
> > nice if we could have an API that allows catching this missing
> > of_node_get() automatically, but I don't see a simple way to do so at
> > the moment.
> 
> That's an interesting point.
> 
> If we did "function_scope_var = ep;" here then we'd need to take a
> second reference as you say.

Yes, that's what I meant above, sorry if that wasn't clear.

> With other cleanup stuff like kfree() it's
> very hard to miss it if we forget to call "no_free_ptr(&ep)" because
> it's on the success path.  It leads to an immediate crash in testing.
> But here it's just ref counting so possibly we might miss that sort of
> bug.

All this calls for std::shared_ptr<struct device_node> :-D

Jokes aside, I think for_each_endpoint_of_node_scoped() would still be
safer, as the number of cases where we would have to pass a reference to
the outer scope should be quite smaller than the number of cases where
we break from for_each_endpoint_of_node() loops today.

On the other hand, the consequence of a bug with
for_each_endpoint_of_node_scoped() would be a dangling reference,
instead of a reference leak with for_each_endpoint_of_node(), so it may
be more dangerous the same way that UAF is more dangerous than memory
leaks.

-- 
Regards,

Laurent Pinchart

