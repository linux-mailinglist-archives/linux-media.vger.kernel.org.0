Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9321B19D52B
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 12:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390514AbgDCKnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 06:43:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43410 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgDCKnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 06:43:45 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C5C4321;
        Fri,  3 Apr 2020 12:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585910622;
        bh=7iTPc2MHfNIaPRQoxwy2rEVj6cLN33ZYd1sl6ZxpZ70=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=d1hkXTFFsYYXG0JbQFBX6qp5Uk2qKs+AQpMRKmdTAiDl1OmcqaabMPs5Fkbvl6ZbQ
         VrsQ9ESM0piYOky5R31N45FXe+PSvoy/xXv79raidmDlVRYJ26zJGQPNOaDrtZRrL0
         HAQ6cTu6RH0tvafCO8XkQFV50LQ3NTMGTJmL2viw=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 1/9] media: adv748x: fix end-of-line terminators in
 diagnostic statements
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <2f2460435afa594ef417e70068b125af97ddca39.1585852001.git.alexander.riesen@cetitec.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <a111380c-f563-8019-deb8-8916a679227b@ideasonboard.com>
Date:   Fri, 3 Apr 2020 11:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2f2460435afa594ef417e70068b125af97ddca39.1585852001.git.alexander.riesen@cetitec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 02/04/2020 19:34, Alex Riesen wrote:
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I guess we could have also added this directly to the helper macros, but
there is indeed already a mixed usage so either way would require fixups
to be consistent.

So this is a good option ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 24 ++++++++++++------------
>  drivers/media/i2c/adv748x/adv748x-csi2.c |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 23e02ff27b17..c3fb113cef62 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -623,11 +623,11 @@ static int adv748x_parse_dt(struct adv748x_state *state)
>  
>  	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
>  		of_graph_parse_endpoint(ep_np, &ep);
> -		adv_info(state, "Endpoint %pOF on port %d", ep.local_node,
> +		adv_info(state, "Endpoint %pOF on port %d\n", ep.local_node,
>  			 ep.port);
>  
>  		if (ep.port >= ADV748X_PORT_MAX) {
> -			adv_err(state, "Invalid endpoint %pOF on port %d",
> +			adv_err(state, "Invalid endpoint %pOF on port %d\n",
>  				ep.local_node, ep.port);
>  
>  			continue;
> @@ -635,7 +635,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
>  
>  		if (state->endpoints[ep.port]) {
>  			adv_err(state,
> -				"Multiple port endpoints are not supported");
> +				"Multiple port endpoints are not supported\n");
>  			continue;
>  		}
>  
> @@ -702,62 +702,62 @@ static int adv748x_probe(struct i2c_client *client)
>  	/* Discover and process ports declared by the Device tree endpoints */
>  	ret = adv748x_parse_dt(state);
>  	if (ret) {
> -		adv_err(state, "Failed to parse device tree");
> +		adv_err(state, "Failed to parse device tree\n");
>  		goto err_free_mutex;
>  	}
>  
>  	/* Configure IO Regmap region */
>  	ret = adv748x_configure_regmap(state, ADV748X_PAGE_IO);
>  	if (ret) {
> -		adv_err(state, "Error configuring IO regmap region");
> +		adv_err(state, "Error configuring IO regmap region\n");
>  		goto err_cleanup_dt;
>  	}
>  
>  	ret = adv748x_identify_chip(state);
>  	if (ret) {
> -		adv_err(state, "Failed to identify chip");
> +		adv_err(state, "Failed to identify chip\n");
>  		goto err_cleanup_dt;
>  	}
>  
>  	/* Configure remaining pages as I2C clients with regmap access */
>  	ret = adv748x_initialise_clients(state);
>  	if (ret) {
> -		adv_err(state, "Failed to setup client regmap pages");
> +		adv_err(state, "Failed to setup client regmap pages\n");
>  		goto err_cleanup_clients;
>  	}
>  
>  	/* SW reset ADV748X to its default values */
>  	ret = adv748x_reset(state);
>  	if (ret) {
> -		adv_err(state, "Failed to reset hardware");
> +		adv_err(state, "Failed to reset hardware\n");
>  		goto err_cleanup_clients;
>  	}
>  
>  	/* Initialise HDMI */
>  	ret = adv748x_hdmi_init(&state->hdmi);
>  	if (ret) {
> -		adv_err(state, "Failed to probe HDMI");
> +		adv_err(state, "Failed to probe HDMI\n");
>  		goto err_cleanup_clients;
>  	}
>  
>  	/* Initialise AFE */
>  	ret = adv748x_afe_init(&state->afe);
>  	if (ret) {
> -		adv_err(state, "Failed to probe AFE");
> +		adv_err(state, "Failed to probe AFE\n");
>  		goto err_cleanup_hdmi;
>  	}
>  
>  	/* Initialise TXA */
>  	ret = adv748x_csi2_init(state, &state->txa);
>  	if (ret) {
> -		adv_err(state, "Failed to probe TXA");
> +		adv_err(state, "Failed to probe TXA\n");
>  		goto err_cleanup_afe;
>  	}
>  
>  	/* Initialise TXB */
>  	ret = adv748x_csi2_init(state, &state->txb);
>  	if (ret) {
> -		adv_err(state, "Failed to probe TXB");
> +		adv_err(state, "Failed to probe TXB\n");
>  		goto err_cleanup_txa;
>  	}
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 2091cda50935..c43ce5d78723 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -72,7 +72,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>  	struct adv748x_state *state = tx->state;
>  	int ret;
>  
> -	adv_dbg(state, "Registered %s (%s)", is_txa(tx) ? "TXA":"TXB",
> +	adv_dbg(state, "Registered %s (%s)\n", is_txa(tx) ? "TXA":"TXB",
>  			sd->name);
>  
>  	/*
> 

-- 
Regards
--
Kieran
