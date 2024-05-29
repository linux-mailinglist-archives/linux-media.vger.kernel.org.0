Return-Path: <linux-media+bounces-12161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39E8D39F8
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 258EEB2761E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7ED15AD95;
	Wed, 29 May 2024 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gipnSN5D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362C79DC;
	Wed, 29 May 2024 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994388; cv=none; b=CQ1f41C1sxAX5vi+IXIu884OnscJAXvu/6OSEDGi7j7xNy7z9mfAB8n1sEW51fgaDvWuXv41pvuet7DEkytmVIkpjzDy7H4Yi9Q0PBIM4zRtsbUoKmVn9QYd9AA/N9ubLC+WMgakPWSNTrIBBu1GS7GVjtMVm40ow5AClBf99LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994388; c=relaxed/simple;
	bh=IPyfsviMHfRYRP5OZ3gUy0wQdIM5xIEx1uKWNBREPF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lflj3jk08pDB9zwoFZlNpACHpg5X9sKf50h+vr7wvA7BZuvugLrWkVWAISJZxgJHOJeC67wSb1K4Ehzrukj1MivwrRCy9Kx/7Ma5s64dyJbWA1jXbTOhsuN0KSCNsjZpnMxzLl4BBJgbCX7qSBk1bIPw/54zi1EpAmwrltjn4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gipnSN5D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12868A27;
	Wed, 29 May 2024 16:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716994381;
	bh=IPyfsviMHfRYRP5OZ3gUy0wQdIM5xIEx1uKWNBREPF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gipnSN5DBSj7oGWyxrhcwgzrXtRO4mDyWNTPqcrwjA/+03UGbhkwmzFj8ylSGPTqL
	 KGy13WpqOq5al1juCr4RQwjk+vfLlpsYbUU3HFJ2gx6Vx6PLgMiKZhLCbATiKFN75Q
	 FEuwyHELmIqr5ylVSDlC+XDIecCjxRDc1itzm03g=
Date: Wed, 29 May 2024 17:52:53 +0300
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
Message-ID: <20240529145253.GE19014@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
 <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>

On Wed, May 29, 2024 at 05:34:41PM +0300, Dan Carpenter wrote:
> On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> > >  	}
> > >  
> > >  	/* Iterate through each output port to discover topology */
> > > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > > +	for_each_endpoint_of_node(parent, ep) {
> > >  		/*
> > >  		 * Legacy binding mixes input/output ports under the
> > >  		 * same parent. So, skip the input ports if we are dealing
> > 
> > I think there's a bug below. The loop contains
> > 
> > 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> > 		if (ret)
> > 			return ret;
> > 
> > which leaks the reference to ep. This is not introduced by this patch,
> 
> Someone should create for_each_endpoint_of_node_scoped().
> 
> #define for_each_endpoint_of_node_scoped(parent, child) \
>         for (struct device_node *child __free(device_node) =           \
>              of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
>              child = of_graph_get_next_endpoint(parent, child))

I was thinking about that too :-) I wondered if we should then bother
taking and releasing references, given that references to the children
can't be leaked out of the loop. My reasoning was that the parent
device_node is guaranteed to be valid throughout the loop, so borrowing
references to children instead of creating new ones within the loop
should be fine. This assumes that endpoints and ports can't vanish while
the parent is there. Thinking further about it, it may not be a safe
assumption for the future. As we anyway use functions internally that
create new references, we can as well handle them correctly.

Using this new macro, the loop body would need to call of_node_get() if
it wants to get a reference out of the loop. That's the right thing to
do, and I think it would be less error-prone than having to drop
references when exiting from the loop as we do today. It would still be
nice if we could have an API that allows catching this missing
of_node_get() automatically, but I don't see a simple way to do so at
the moment.

-- 
Regards,

Laurent Pinchart

