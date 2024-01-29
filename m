Return-Path: <linux-media+bounces-4350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE08405E4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 14:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB26283743
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61938627EB;
	Mon, 29 Jan 2024 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djMzyfRg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8C627F6;
	Mon, 29 Jan 2024 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533344; cv=none; b=uzU/uIErzNDSb9VVFshPKX7IHhg2sCe03jwZ3eltiht/TTViML4Wm8vHT37FDV9i+AHhetnmYL13kIqTvFYOfYk7OgXL8dkExqV3/WkbWU6svL4BndkrLgHD/aNdIVqyzmmXaSqOVYK+6AhrooLVqzXladGM58N6pbLN1NO8zUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533344; c=relaxed/simple;
	bh=oYJ9n0kmGBMU2bNIDl3amQ7PKIOiEuPvpUteUrfq+VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNf0P1ejzZXVgY+Czle3gPL8aBi4wgus4rLRo/i0cNrnYF1r8EVa0SFjxkx3u/nOSpb8ZjO/EeQB8/+PfnlLt1kePFTn6FXYcPG8X1mHHhKxEAVpKeLVo7HnNwyVOBRk6ooPWaBYOmUhZofoddCJ5c5CLaW148wGv45j0ex0qEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=djMzyfRg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D80915B5;
	Mon, 29 Jan 2024 14:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706533261;
	bh=oYJ9n0kmGBMU2bNIDl3amQ7PKIOiEuPvpUteUrfq+VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djMzyfRgXF1NPy65MR+61w/tngalKk2yKnI+GwLaXMGffyykJfxg+BE9W8Ny+SzKp
	 3edG11TvKTFuKerv6OEweKNRHe4leVvnw1jLWk7XEqB5zloijNMsHBUZ/GvRbEzqKG
	 ZOkF9RPQ1nYYuooHeJRC/2msKN4yH4MV7pyzzASQ=
Date: Mon, 29 Jan 2024 15:02:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Uwe =?utf-8?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Message-ID: <20240129130219.GA20460@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
 <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>

On Mon, Jan 29, 2024 at 02:29:22PM +0200, Tomi Valkeinen wrote:
> On 29/01/2024 02:54, Kuninori Morimoto wrote:
> > We already have of_graph_get_next_endpoint(), but it is not intuitive
> > to use.
> > 
> > (X)	node {
> > (Y)		ports {
> > 			port@0 { endpoint { remote-endpoint = ...; };};
> > (A1)			port@1 { endpoint { remote-endpoint = ...; };
> > (A2)				 endpoint { remote-endpoint = ...; };};
> > (B)			port@2 { endpoint { remote-endpoint = ...; };};
> > 		};
> > 	};
> > 
> > For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> > I want to use like below
> > 
> > 	A1 = of_graph_get_next_endpoint(port1, NULL);
> > 	A2 = of_graph_get_next_endpoint(port1, A1);
> > 
> > But 1st one will be error, because of_graph_get_next_endpoint() requested
> > "parent" means "node" (X) or "ports" (Y), not "port".
> > Below are OK
> > 
> > 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> > 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> > 
> > In other words, we can't handle A1/A2 directly via
> > of_graph_get_next_endpoint() so far.
> > 
> > There is another non intuitive behavior on of_graph_get_next_endpoint().
> > In case of if I could get A1 pointer for some way, and if I want to
> > handle port@1 things, I would like use it like below
> > 
> > 	/*
> > 	 * "endpoint" is now A1, and handle port1 things here,
> > 	 * but we don't know how many endpoints port1 has.
> > 	 *
> > 	 * Because "endpoint" is non NULL, we can use port1
> > 	 * as of_graph_get_next_endpoint(port1, xxx)
> > 	 */
> > 	do {
> > 		/* do something for port1 specific things here */
> > 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> > 
> > But it also not worked as I expected.
> > I expect it will be A1 -> A2 -> NULL,
> > but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> > will fetch endpoint beyond the port.
> > 
> > It is not useful on generic driver like Generic Sound Card.
> > It uses of_get_next_child() instead for now, but it is not intuitive,
> > and not check node name (= "endpoint").
> > 
> > To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> > 
> > 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> > 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> > 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >   drivers/of/property.c    | 26 +++++++++++++++++++++++++-
> >   include/linux/of_graph.h |  2 ++
> >   2 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 14ffd199c9b1..37dbb1b0e742 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
> >   }
> >   EXPORT_SYMBOL(of_graph_get_next_port);
> >   
> > +/**
> > + * of_graph_get_next_endpoint_raw() - get next endpoint node
> 
> How about "of_graph_get_next_port_endpoint()"?

We may want to also rename the existing of_graph_get_next_endpoint()
function to of_graph_next_dev_endpoint() then. It would be a tree-wide
patch, which is always annoying to get reviewed and merged, so if Rob
would prefer avoiding the rename, I'm fine with that.

> > + * @port: pointer to the target port node
> > + * @endpoint: current endpoint node, or NULL to get first
> > + *
> > + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> 
> It might be good to highlight here the difference to the 
> of_graph_get_next_endpoint().

Yes, and the documentation of of_graph_get_next_endpoint() shoul also be
improved.

> > +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> > +						   struct device_node *endpoint)
> > +{
> > +	if (!port)
> > +		return NULL;
> > +
> > +	do {
> > +		endpoint = of_get_next_child(port, endpoint);
> > +		if (!endpoint)
> > +			break;
> > +	} while (!of_node_name_eq(endpoint, "endpoint"));
> > +
> > +	return endpoint;
> > +}
> > +EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
> > +
> >   /**
> >    * of_graph_get_next_endpoint() - get next endpoint node
> >    * @parent: pointer to the parent device node
> > @@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
> >   		 * getting the next child. If the previous endpoint is NULL this
> >   		 * will return the first child.
> >   		 */
> > -		endpoint = of_get_next_child(port, prev);
> > +		endpoint = of_graph_get_next_endpoint_raw(port, prev);
> >   		if (endpoint) {
> >   			of_node_put(port);
> >   			return endpoint;
> > diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> > index fff598640e93..427905a6e8c3 100644
> > --- a/include/linux/of_graph.h
> > +++ b/include/linux/of_graph.h
> > @@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
> >   struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
> >   struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
> >   					struct device_node *previous);
> > +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> > +						   struct device_node *prev);
> >   struct device_node *of_graph_get_next_port(const struct device_node *parent,
> >   					   struct device_node *previous);
> >   struct device_node *of_graph_get_endpoint_by_regs(

-- 
Regards,

Laurent Pinchart

