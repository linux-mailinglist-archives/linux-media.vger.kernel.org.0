Return-Path: <linux-media+bounces-19043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987A98EF64
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E5D41F22117
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8209189BB4;
	Thu,  3 Oct 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AzSsjYIi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A501741D2;
	Thu,  3 Oct 2024 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959215; cv=none; b=UZgQz6JdrX2p/sMkyD3cLiU5waDtl83sO0AWsDwK+5sHioSZ0Mxqc66E7jCU/GxWrfhlkFYl3djE2YxHBuDkX4b1JhEg3bMneYVaVuIE4dSomiuIpztSijhgmaCswVMJ80cvxgBHR6cICTUtkLMqrMtcuWAqHTfC7LhFCsraiPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959215; c=relaxed/simple;
	bh=pbWAuYc4wU7yIVOcZosZrZFwYMRZ/afD9jVz/eX9/do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4MmUbAzZ8opyz1lHA+238rfz3CdKaTEDuoQjiInY9ZlIj2mf1zO/i9jRK23EmBIKM7qyI8pKX5iMMRO7QDg+bajE0V/mBHUJ8RvlLs5gvuKEvf4bitkbmztQN/3G05SkAZ8pvwSdNwHtWGRoWfAufaeHBpge7tL7U3l9p4Nju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AzSsjYIi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1F5718D;
	Thu,  3 Oct 2024 14:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727959118;
	bh=pbWAuYc4wU7yIVOcZosZrZFwYMRZ/afD9jVz/eX9/do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AzSsjYIimjuKm8pOO2DqN/20OXfvwYcJvLm45TNiuOvGjeg6p0nw7BFaGXJjGpI0g
	 5wY+Kkb/3uJV40rkgQA5XREd2h4kK0tHce/dSQuhrbjD8yVaNTSbwLWVGrzlvGt23X
	 ccpp7ht1eJwWvlv8BSjCSEtQpKeCNH5JzAX3ziPc=
Message-ID: <d60193e5-2ce1-49d6-b6e3-a7318c3184f0@ideasonboard.com>
Date: Thu, 3 Oct 2024 15:40:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ub960: clarify stream_enable_mask indexing
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241002164347.899083-1-demonsingur@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241002164347.899083-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/10/2024 19:43, Cosmin Tanislav wrote:
> Variables containing port numbers are used to index
> arrays which should be indexed by pad numbers.
> Coincidentally, the order in which pad numbers are
> assigned makes it avoid any conflicts, but it's still
> confusing.
> 
> Clarify the situation by adding port_to_pad helpers
> and using them.
> 

Please use the same prefix as the previous patches use:

media: i2c: ds90ub960:

Also, while at it, you could re-format the desc a bit, as it's quite 
narrow and slightly oddly formatted.

As for the code itself, it works for me and looks good:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>   drivers/media/i2c/ds90ub960.c | 41 +++++++++++++++++++++++++----------
>   1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index ffe5f25f86476..d1595c88f7632 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -527,6 +527,7 @@ struct ub960_data {
>   
>   	u8 stored_fwd_ctl;
>   
> +	/* Indexed by pad number */
>   	u64 stream_enable_mask[UB960_MAX_NPORTS];
>   
>   	/* These are common to all ports */
> @@ -561,6 +562,16 @@ static inline unsigned int ub960_pad_to_port(struct ub960_data *priv, u32 pad)
>   		return pad - priv->hw_data->num_rxports;
>   }
>   
> +static inline unsigned int ub960_rxport_to_pad(struct ub960_data *priv, u32 port)
> +{
> +	return port;
> +}
> +
> +static inline unsigned int ub960_txport_to_pad(struct ub960_data *priv, u32 port)
> +{
> +	return port + priv->hw_data->num_rxports;
> +}
> +
>   struct ub960_format_info {
>   	u32 code;
>   	u32 bpp;
> @@ -2558,6 +2569,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   {
>   	struct ub960_data *priv = sd_to_ub960(sd);
>   	struct device *dev = &priv->client->dev;
> +	/* Indexed by rx port number */
>   	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
>   	struct v4l2_subdev_route *route;
>   	unsigned int failed_port;
> @@ -2595,11 +2607,13 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   	}
>   
>   	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
> +		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
> +
>   		if (!sink_streams[nport])
>   			continue;
>   
>   		/* Enable the RX port if not yet enabled */
> -		if (!priv->stream_enable_mask[nport]) {
> +		if (!priv->stream_enable_mask[sink_pad]) {
>   			ret = ub960_enable_rx_port(priv, nport);
>   			if (ret) {
>   				failed_port = nport;
> @@ -2607,7 +2621,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   			}
>   		}
>   
> -		priv->stream_enable_mask[nport] |= sink_streams[nport];
> +		priv->stream_enable_mask[sink_pad] |= sink_streams[nport];
>   
>   		dev_dbg(dev, "enable RX port %u streams %#llx\n", nport,
>   			sink_streams[nport]);
> @@ -2617,9 +2631,9 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   			priv->rxports[nport]->source.pad,
>   			sink_streams[nport]);
>   		if (ret) {
> -			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
> +			priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
>   
> -			if (!priv->stream_enable_mask[nport])
> +			if (!priv->stream_enable_mask[sink_pad])
>   				ub960_disable_rx_port(priv, nport);
>   
>   			failed_port = nport;
> @@ -2633,6 +2647,8 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   
>   err:
>   	for (nport = 0; nport < failed_port; nport++) {
> +		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
> +
>   		if (!sink_streams[nport])
>   			continue;
>   
> @@ -2646,10 +2662,10 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
>   		if (ret)
>   			dev_err(dev, "Failed to disable streams: %d\n", ret);
>   
> -		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
> +		priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
>   
>   		/* Disable RX port if no active streams */
> -		if (!priv->stream_enable_mask[nport])
> +		if (!priv->stream_enable_mask[sink_pad])
>   			ub960_disable_rx_port(priv, nport);
>   	}
>   
> @@ -2689,6 +2705,8 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
>   	}
>   
>   	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
> +		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
> +
>   		if (!sink_streams[nport])
>   			continue;
>   
> @@ -2702,10 +2720,10 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
>   		if (ret)
>   			dev_err(dev, "Failed to disable streams: %d\n", ret);
>   
> -		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
> +		priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
>   
>   		/* Disable RX port if no active streams */
> -		if (!priv->stream_enable_mask[nport])
> +		if (!priv->stream_enable_mask[sink_pad])
>   			ub960_disable_rx_port(priv, nport);
>   	}
>   
> @@ -3460,6 +3478,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
>   	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
>   
>   	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
> +		unsigned int pad = ub960_rxport_to_pad(priv, nport);
>   		struct fwnode_handle *link_fwnode;
>   		struct fwnode_handle *ep_fwnode;
>   
> @@ -3468,7 +3487,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
>   			continue;
>   
>   		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> -							    nport, 0, 0);
> +							    pad, 0, 0);
>   		if (!ep_fwnode) {
>   			fwnode_handle_put(link_fwnode);
>   			continue;
> @@ -3503,11 +3522,11 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
>   	int ret;
>   
>   	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
> -		unsigned int port = nport + priv->hw_data->num_rxports;
> +		unsigned int pad = ub960_txport_to_pad(priv, nport);
>   		struct fwnode_handle *ep_fwnode;
>   
>   		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> -							    port, 0, 0);
> +							    pad, 0, 0);
>   		if (!ep_fwnode)
>   			continue;
>   


