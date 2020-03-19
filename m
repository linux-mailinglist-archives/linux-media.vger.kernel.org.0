Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D395018BEF2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 19:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgCSSDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 14:03:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgCSSDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 14:03:39 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F70A53;
        Thu, 19 Mar 2020 19:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584641017;
        bh=HOUY95IFrKZRKfGjSsw5sMRF6MP3fYQPa1epjOauYxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bLh0NBazFtysSiu+BJPR6fz6MWHFcZR2o8u4zE9vDkPwTVmMO43hTlNOyGXql5p46
         34EPnvnwtuOFc0/5U/0U5lQM07k0buTa0E1aKTA4q0la/oEy4tDjuArHbAEkSJXwM2
         hnWsc+pls1DSNxhrkqjTgE3a0M3QfQCIXRuT+xzQ=
Date:   Thu, 19 Mar 2020 20:03:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: adv748x: fix end-of-line terminators in
 diagnostic statements
Message-ID: <20200319180331.GK14585@pendragon.ideasonboard.com>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <5272d873b4daf8b0bdb8aff81b08ab3508da9567.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5272d873b4daf8b0bdb8aff81b08ab3508da9567.1584639664.git.alexander.riesen@cetitec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thank you for the patch.

On Thu, Mar 19, 2020 at 06:41:43PM +0100, Alex Riesen wrote:
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
