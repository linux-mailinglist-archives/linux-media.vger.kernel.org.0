Return-Path: <linux-media+bounces-4528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E6844780
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 19:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E861C21F1B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 18:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C398F33CFD;
	Wed, 31 Jan 2024 18:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBPJWwJE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28A210E2;
	Wed, 31 Jan 2024 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706727142; cv=none; b=Uk54cbo3uJJD9cjy13oixchaLFb/tT9pXNDim+2AA9ZEmYmGPbb0XTrtSEV9jnVX8ncNJVeXLBh/FshLu/LLwKXXn1e1bhHOstjJMBHt9TT2rI94ghZacqBz3Jjtn479lnsSWK9oj6DBUPLeGpddDSGcEbr1jvCqYvU4UbK5QU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706727142; c=relaxed/simple;
	bh=8zQgKe5ifbQ5rIqxPOQjyatCTnXh2bIwEYlKyLDty4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3tf+eVUERevybBtwbML2EjJtby1w4GoFPmLM6ziEC2Sp5l+NgNIXG03wbmHY7H9EkYXzAQ4xKDp7641GvN7Ol5svZSRs08hx8f85eBjsFHr8obcvXKCJtjIudBhjSKJcEQSpLHXyoP10gQVjzDSVoIJTF6D7H/ipjRaKNVW1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBPJWwJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F80BC433F1;
	Wed, 31 Jan 2024 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727141;
	bh=8zQgKe5ifbQ5rIqxPOQjyatCTnXh2bIwEYlKyLDty4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBPJWwJEbRCw9XGa9O/cOHCz2wJw2zlEBo7FPMIxL3v1TQGVfqcqBmegNDeZm9xS6
	 F8Y8nV522Hk0ZmC/wzTaR/0Z2mtkIMVEErdfNcwmTwK5QD4PY9XDympcKhdSI1vxwp
	 rsBgFNsNCVu6BaAuQmbFcyNPl7EVnUha+wsK9xJNcgB6jBeZuXNAa5TYaJ/iPapDgk
	 uIt5q6xAiyE7Pw1CA1cHa64FC0LbhGWP5rutIc7Bor+s04Fwqn5YxEKdm7PmpU6f+U
	 DZW50hpcTqkSt35R8ly3ng/Y0JcrZ+4k9xEzgh5CS6fITGxSKQw4R23ajzbKJTw795
	 AkXu9LmKDNg2g==
Date: Wed, 31 Jan 2024 12:52:19 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
Message-ID: <20240131185219.GB1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Jan 29, 2024 at 12:54:44AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()
> 
> Here, for_each_endpoint_of_node() loop finds each endpoints
> 
> 	ports {
> 		port@0 {
> (1)			endpoint {...};
> 		};
> 		port@1 {
> (2)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In above case, for_each_endpoint_of_node() loop finds endpoint as
> (1) -> (2) -> ...
> 
> Basically, user/driver knows which port is used for what, but not in
> all cases. For example on flexible/generic driver case, how many ports
> are used is not fixed.
> 
> For example Sound Generic Card driver which is used from many venders
> can't know how many ports are used. Because the driver is very
> flexible/generic, it is impossible to know how many ports are used,
> it depends on each vender SoC and/or its used board.
> 
> And more, the port can have multi endpoints. For example Generic Sound
> Card case, it supports many type of connection between CPU / Codec, and
> some of them uses multi endpoint in one port.
> Then, Generic Sound Card want to handle each connection via "port"
> instead of "endpoint".
> But, it is very difficult to handle each "port" by
> for_each_endpoint_of_node(). Getting "port" by using of_get_parent()
> from "endpoint" doesn't work. see below.
> 
> 	ports {
> 		port@0 {
> (1)			endpoint@0 {...};
> (2)			endpoint@1 {...};
> 		};
> 		port@1 {
> (3)			endpoint {...};
> 		};
> 		...
> 	};
> 
> Add "port" base functions.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 48 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_graph.h | 21 ++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index afdaefbd03f6..9e670e99dbbb 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -631,6 +631,42 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  }
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>  
> +/**
> + * of_graph_get_next_port() - get next port node
> + * @parent: pointer to the parent device node
> + * @port: current port node, or NULL to get first
> + *
> + * Return: An 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> +					   struct device_node *port)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!port) {
> +		struct device_node *node;
> +
> +		node = of_get_child_by_name(parent, "ports");
> +		if (node) {
> +			parent = node;
> +			of_node_put(node);

The original code had this right, but here you have it wrong.

You are releasing ports here, but then using it...

> +		}
> +
> +		return of_get_child_by_name(parent, "port");

...here. You have to get the child before you can put the parent.

> +	}
> +
> +	do {
> +		port = of_get_next_child(parent, port);
> +		if (!port)
> +			break;
> +	} while (!of_node_name_eq(port, "port"));
> +
> +	return port;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port);
> +

