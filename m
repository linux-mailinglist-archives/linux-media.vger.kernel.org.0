Return-Path: <linux-media+bounces-4527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E2844764
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 19:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06301C212E0
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818CE374CF;
	Wed, 31 Jan 2024 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGsxtHxS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09673610A;
	Wed, 31 Jan 2024 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706726630; cv=none; b=qr+EJI8zBpA+Zm57q3e4g59W8PRU5w07IC9ZKNTyEYKxfagXy5LLWFkKOKIe7tHmSERNsMd4n/JyrQ/+pqJ7YXlig/O9NMVSr4zVoHzxhLXk5vRCauwxpdZLtpUx30vSlLaC4y9FugwFfA9w+KCGTMqSJ+bKlV8SQPsOlfIpM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706726630; c=relaxed/simple;
	bh=OsBhn5fmKfi8kOG7a+u9aX/g82LydKjRXv+v9zD7SsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQj79mvacIUQ8IxI2UvWLTunhlGHQlAbHDeCSF/FtGx/FUkTj0QEIbGHk6AnuKA94PwN1ePZeonDnDWk2DWEKkvMgHY5X1gj/bGxYGc+Awk2Q9SF8JbfWt4QcGKehk6yOrXqQazi4rCY+beaZbxblXOMf8LtZZ1aikpwbnfCbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGsxtHxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030B7C433F1;
	Wed, 31 Jan 2024 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706726630;
	bh=OsBhn5fmKfi8kOG7a+u9aX/g82LydKjRXv+v9zD7SsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGsxtHxSAzaOcN/5DV6z9kKZWrCxBG75yEJ+HTkJ7wz3tE7i+AkQ8lSNlubzT/Wr1
	 YzI0JUirmHvsyu3CjdqK2DQSJ5khkHIe7dDj2u6OflMEdGBjo7RDpqk9zezy6u+n7M
	 8o4klU/vOAOIp07+YLxvC4ld2aYpJiKabRHYyXs77IhQfFcJa5eg8llA+NZuYuf84t
	 4x92sPioNPV08CnIET+iDDUoj0PexWlAbTQtAlJ6zZtVDFm7PGFczPLR8oPtvb8N+S
	 BOV7rZmhi5HMF0au63wBS245/ytj76g90eMbblyamoeZ055mtlfCMOVI3SDNAN2vyO
	 /uCwIMQ/ApvKA==
Date: Wed, 31 Jan 2024 12:43:47 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Message-ID: <20240131184347.GA1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
 <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
 <20240129130219.GA20460@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129130219.GA20460@pendragon.ideasonboard.com>

On Mon, Jan 29, 2024 at 03:02:19PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 29, 2024 at 02:29:22PM +0200, Tomi Valkeinen wrote:
> > On 29/01/2024 02:54, Kuninori Morimoto wrote:
> > > We already have of_graph_get_next_endpoint(), but it is not intuitive
> > > to use.
> > > 
> > > (X)	node {
> > > (Y)		ports {
> > > 			port@0 { endpoint { remote-endpoint = ...; };};
> > > (A1)			port@1 { endpoint { remote-endpoint = ...; };
> > > (A2)				 endpoint { remote-endpoint = ...; };};
> > > (B)			port@2 { endpoint { remote-endpoint = ...; };};
> > > 		};
> > > 	};
> > > 
> > > For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> > > I want to use like below
> > > 
> > > 	A1 = of_graph_get_next_endpoint(port1, NULL);
> > > 	A2 = of_graph_get_next_endpoint(port1, A1);
> > > 
> > > But 1st one will be error, because of_graph_get_next_endpoint() requested
> > > "parent" means "node" (X) or "ports" (Y), not "port".
> > > Below are OK
> > > 
> > > 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> > > 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> > > 
> > > In other words, we can't handle A1/A2 directly via
> > > of_graph_get_next_endpoint() so far.
> > > 
> > > There is another non intuitive behavior on of_graph_get_next_endpoint().
> > > In case of if I could get A1 pointer for some way, and if I want to
> > > handle port@1 things, I would like use it like below
> > > 
> > > 	/*
> > > 	 * "endpoint" is now A1, and handle port1 things here,
> > > 	 * but we don't know how many endpoints port1 has.
> > > 	 *
> > > 	 * Because "endpoint" is non NULL, we can use port1
> > > 	 * as of_graph_get_next_endpoint(port1, xxx)
> > > 	 */
> > > 	do {
> > > 		/* do something for port1 specific things here */
> > > 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> > > 
> > > But it also not worked as I expected.
> > > I expect it will be A1 -> A2 -> NULL,
> > > but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> > > will fetch endpoint beyond the port.
> > > 
> > > It is not useful on generic driver like Generic Sound Card.
> > > It uses of_get_next_child() instead for now, but it is not intuitive,
> > > and not check node name (= "endpoint").
> > > 
> > > To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> > > 
> > > 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> > > 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> > > 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >   drivers/of/property.c    | 26 +++++++++++++++++++++++++-
> > >   include/linux/of_graph.h |  2 ++
> > >   2 files changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > > index 14ffd199c9b1..37dbb1b0e742 100644
> > > --- a/drivers/of/property.c
> > > +++ b/drivers/of/property.c
> > > @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
> > >   }
> > >   EXPORT_SYMBOL(of_graph_get_next_port);
> > >   
> > > +/**
> > > + * of_graph_get_next_endpoint_raw() - get next endpoint node
> > 
> > How about "of_graph_get_next_port_endpoint()"?
> 
> We may want to also rename the existing of_graph_get_next_endpoint()
> function to of_graph_next_dev_endpoint() then. It would be a tree-wide
> patch, which is always annoying to get reviewed and merged, so if Rob
> would prefer avoiding the rename, I'm fine with that.

I think we should get rid of or minimize of_graph_get_next_endpoint() in 
its current form. In general, drivers should be asking for a specific 
port number because their function is fixed in the binding. Iterating 
over endpoints within a port is okay as that's usually a selecting 1 of 
N operation. 

Most cases are in the form of of_graph_get_next_endpoint(dev, NULL) 
which is equivalent to of_graph_get_endpoint_by_regs(dev, 0, 0). 
Technically, -1 instead of 0 is equivalent, but I'd argue is sloppy and 
wrong.

I also added of_graph_get_remote_node() for this reason and cleaned a 
lot of these (in DRM) up some time ago. Because in the end, a driver 
generally just wants the remote device it is connected to and details of 
parsing the graph should be mostly opaque.

Wouldn't something like this work for this case:

#define for_each_port_endpoint_of_node(parent, port, child) \
	for (child = of_graph_get_endpoint_by_regs(parent, port, -1); child != NULL; \
	     child = of_get_next_child(parent, child))

Rob

