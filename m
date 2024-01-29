Return-Path: <linux-media+bounces-4347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 072BE840509
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6F0283CDB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0486605C3;
	Mon, 29 Jan 2024 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ew9fCP6t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9626605A6;
	Mon, 29 Jan 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531370; cv=none; b=EulSBdCP5Kh7nkyCRvo4nJ1Vu/F+sJNC3KUmuu7s/N1QdhCSFy0hxJI/pWX19QcrLeMUZC5a7N8gHIlaUL8RKduUR0+elI43e24ofsHeh3Ey9dabIMTpCzYg/FsRSOFhiLHu2chM/arUe0uES1R8Vb/I8qH3lmRiiCECli0u4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531370; c=relaxed/simple;
	bh=seT4cFxJGu1vUJfRNDUUD9uV9saeS5T7Q5DryHH1KRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuXUFwhvzw4OyHUkmh0Vrf4bu3xDu0i5wwlgMx8MAUO0AiAkjDlO9jsp1c2eLaokw+MiSTvXCPOFa3XdibTsjYYkqHXPtkXSvBZ5TywW7ljyeHAs2geDIPNrp/P+UlOIYx4il1X8nm0hvOqfxKmojTR4xtOIEal7O83bsuFH0EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ew9fCP6t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA3D91803;
	Mon, 29 Jan 2024 13:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706531289;
	bh=seT4cFxJGu1vUJfRNDUUD9uV9saeS5T7Q5DryHH1KRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ew9fCP6txddjNsh8EXXz+kSS9vmA1GMuCVrrLPHUXer3lbfWC3JX/Z2I8jfG6AuQC
	 sXgqei/XxHWhOP705fWcHasNUvrkAVLekNQJXQsY2p6Hwb3Z5CzOFidNtQdJrUrMgt
	 q+5fn1ch5FJl+4K/+y2ia3oYzrFLqLHAy3llzYGE=
Message-ID: <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
Date: Mon, 29 Jan 2024 14:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-sound@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2024 02:54, Kuninori Morimoto wrote:
> We already have of_graph_get_next_endpoint(), but it is not intuitive
> to use.
> 
> (X)	node {
> (Y)		ports {
> 			port@0 { endpoint { remote-endpoint = ...; };};
> (A1)			port@1 { endpoint { remote-endpoint = ...; };
> (A2)				 endpoint { remote-endpoint = ...; };};
> (B)			port@2 { endpoint { remote-endpoint = ...; };};
> 		};
> 	};
> 
> For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> I want to use like below
> 
> 	A1 = of_graph_get_next_endpoint(port1, NULL);
> 	A2 = of_graph_get_next_endpoint(port1, A1);
> 
> But 1st one will be error, because of_graph_get_next_endpoint() requested
> "parent" means "node" (X) or "ports" (Y), not "port".
> Below are OK
> 
> 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> 
> In other words, we can't handle A1/A2 directly via
> of_graph_get_next_endpoint() so far.
> 
> There is another non intuitive behavior on of_graph_get_next_endpoint().
> In case of if I could get A1 pointer for some way, and if I want to
> handle port@1 things, I would like use it like below
> 
> 	/*
> 	 * "endpoint" is now A1, and handle port1 things here,
> 	 * but we don't know how many endpoints port1 has.
> 	 *
> 	 * Because "endpoint" is non NULL, we can use port1
> 	 * as of_graph_get_next_endpoint(port1, xxx)
> 	 */
> 	do {
> 		/* do something for port1 specific things here */
> 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> 
> But it also not worked as I expected.
> I expect it will be A1 -> A2 -> NULL,
> but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> will fetch endpoint beyond the port.
> 
> It is not useful on generic driver like Generic Sound Card.
> It uses of_get_next_child() instead for now, but it is not intuitive,
> and not check node name (= "endpoint").
> 
> To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> 
> 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/of/property.c    | 26 +++++++++++++++++++++++++-
>   include/linux/of_graph.h |  2 ++
>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 14ffd199c9b1..37dbb1b0e742 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
>   }
>   EXPORT_SYMBOL(of_graph_get_next_port);
>   
> +/**
> + * of_graph_get_next_endpoint_raw() - get next endpoint node

How about "of_graph_get_next_port_endpoint()"?

> + * @port: pointer to the target port node
> + * @endpoint: current endpoint node, or NULL to get first
> + *
> + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */

It might be good to highlight here the difference to the 
of_graph_get_next_endpoint().

> +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> +						   struct device_node *endpoint)
> +{
> +	if (!port)
> +		return NULL;
> +
> +	do {
> +		endpoint = of_get_next_child(port, endpoint);
> +		if (!endpoint)
> +			break;
> +	} while (!of_node_name_eq(endpoint, "endpoint"));
> +
> +	return endpoint;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
> +
>   /**
>    * of_graph_get_next_endpoint() - get next endpoint node
>    * @parent: pointer to the parent device node
> @@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>   		 * getting the next child. If the previous endpoint is NULL this
>   		 * will return the first child.
>   		 */
> -		endpoint = of_get_next_child(port, prev);
> +		endpoint = of_graph_get_next_endpoint_raw(port, prev);
>   		if (endpoint) {
>   			of_node_put(port);
>   			return endpoint;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index fff598640e93..427905a6e8c3 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
>   struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>   struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>   					struct device_node *previous);
> +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> +						   struct device_node *prev);
>   struct device_node *of_graph_get_next_port(const struct device_node *parent,
>   					   struct device_node *previous);
>   struct device_node *of_graph_get_endpoint_by_regs(


