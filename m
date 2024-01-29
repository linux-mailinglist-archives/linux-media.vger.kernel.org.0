Return-Path: <linux-media+bounces-4342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D978404CD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD3C1C21C0F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC8F604AA;
	Mon, 29 Jan 2024 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hO54iMKY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18054604A9;
	Mon, 29 Jan 2024 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706530612; cv=none; b=TxTFVz4nOl76i0tnulespr0HsPTzv/gpPM8l62T84fG13zGQyLehg2/DJPERPsSEzgtupCW+WrTbEZ8GPLZp6a59JVtjdO0WqpVyIirR+lIgZ1cAmBtcyXrVpAF5pXzAXmVgmRVSHpCW5kdG/Te/ZXLTdOpNJpYM7DEFketPrJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706530612; c=relaxed/simple;
	bh=Buc3e84FLS5NpyQMahEhPLiLvZM23E4P2g+cf46sAHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFYRl6UqX661fvoxm4z6UZN9zC4h1T4OPSxYOXH4XvByeCeIQPlFvZi3yVdU3TxcHa0RAkoHHnNyMPOD39lcu0RXjH0qvEipT26ehohjJKmu0oRBFbSOOfk4s23E3ZfWRoZvRcWX9C59vn4SRNa5AKG72bTUVB90Vr/ZYWmVtzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hO54iMKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3ED1803;
	Mon, 29 Jan 2024 13:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706530531;
	bh=Buc3e84FLS5NpyQMahEhPLiLvZM23E4P2g+cf46sAHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hO54iMKY8MJbd4QUg9Zp0bmsVngmRoQ0srE45401YojEITJiSlXioNJU7MAItghoO
	 A3EBpvsbEgwxoiN6//5PrnP7WmfijHHKbLd/3peaH93KORKitsZGonTcm0opmZFtuj
	 4cds9ukJDGOM4fiEew287vPg+3pA8Ex/8HCpL30A=
Message-ID: <a45ee568-4ba6-4e5d-a02e-30db7d3ab27c@ideasonboard.com>
Date: Mon, 29 Jan 2024 14:16:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
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
 <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/01/2024 02:54, Kuninori Morimoto wrote:
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
>   drivers/of/property.c    | 48 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/of_graph.h | 21 ++++++++++++++++++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index afdaefbd03f6..9e670e99dbbb 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -631,6 +631,42 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>   }
>   EXPORT_SYMBOL(of_graph_get_port_by_id);
>   
> +/**
> + * of_graph_get_next_port() - get next port node
> + * @parent: pointer to the parent device node
> + * @port: current port node, or NULL to get first
> + *
> + * Return: An 'port' node pointer with refcount incremented. Refcount

"A 'port'".

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

Here you of_node_put() the node, but use it below.

> +		}
> +
> +		return of_get_child_by_name(parent, "port");
> +	}

Maybe you can do:

	node = of_get_child_by_name(parent, "ports");
	if (node)
		parent = node;
	port = of_get_child_by_name(parent, "port");
	of_node_put(node);
	return port;

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
>   /**
>    * of_graph_get_next_endpoint() - get next endpoint node
>    * @parent: pointer to the parent device node
> @@ -823,6 +859,18 @@ int of_graph_get_endpoint_count(const struct device_node *np)
>   }
>   EXPORT_SYMBOL(of_graph_get_endpoint_count);
>   
> +int of_graph_get_port_count(const struct device_node *np)

The kerneldoc is missing for this func.

The return type and the variable below should be unsigned.

I can see these are wrong with of_graph_get_endpoint_count() too, so 
maybe that should be fixed also.

> +{
> +	struct device_node *port;
> +	int num = 0;
> +
> +	for_each_port_of_node(np, port)
> +		num++;
> +
> +	return num;
> +}
> +EXPORT_SYMBOL(of_graph_get_port_count);
> +
>   /**
>    * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
>    * @node: pointer to parent device_node containing graph port/endpoint
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..fff598640e93 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -37,14 +37,28 @@ struct of_endpoint {
>   	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
>   	     child = of_graph_get_next_endpoint(parent, child))
>   
> +/**
> + * for_each_port_of_node - iterate over every port in a device node
> + * @parent: parent device node containing ports/port
> + * @child: loop variable pointing to the current port node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_port_of_node(parent, child)			\
> +	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> +	     child = of_graph_get_next_port(parent, child))
> +
>   #ifdef CONFIG_OF
>   bool of_graph_is_present(const struct device_node *node);
>   int of_graph_parse_endpoint(const struct device_node *node,
>   				struct of_endpoint *endpoint);
>   int of_graph_get_endpoint_count(const struct device_node *np);
> +int of_graph_get_port_count(const struct device_node *np);
>   struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>   struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>   					struct device_node *previous);
> +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> +					   struct device_node *previous);
>   struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg);
>   struct device_node *of_graph_get_remote_endpoint(
> @@ -86,6 +100,13 @@ static inline struct device_node *of_graph_get_next_endpoint(
>   	return NULL;
>   }
>   
> +static inline struct device_node *of_graph_get_next_port(
> +					const struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>   static inline struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg)
>   {


