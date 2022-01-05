Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384A34858CF
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 20:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243292AbiAETDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 14:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243289AbiAETDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 14:03:02 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961E1C061201;
        Wed,  5 Jan 2022 11:03:01 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 7F04B1B0022A;
        Wed,  5 Jan 2022 21:02:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1641409376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0vzccKNKahp6NIlsGUb99SK9e2Mzf8IhCz8xEvjy7b8=;
        b=vMcUFaIEtfLdO/MF9Buz4/saehC7kH3MlZ4dFkicDEYy2WhqsLh/kPsHYxUrQgyVpaqmTh
        SPMTM+ZBSdpm2elhbN1EaQ/QyxP5R+U7KsYoUkdKv0uJOSaW6WxtV9ZnxLYwLYNaahNLxI
        C5hFUuSjfzI7zoFKYOJPnULtR2KcdgEVnqoIRPg/nkny9Gr6fxNbav3OEpisB+l6FMXjDF
        z1oRroWynC8wYJyPI4x3qYjBRD3i7773P8zNkKB4pYeiddinbKzz06TKgj1kKuu+2wJCKj
        E+bzl4Ii3Pg9TZ8gJROr50GWjI3HCxoUiNMcQCW+GX4AkFWC1Ycvt97n4UvZHg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 17211634C90;
        Wed,  5 Jan 2022 21:02:56 +0200 (EET)
Date:   Wed, 5 Jan 2022 21:02:55 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mats Randgaard <matrandg@cisco.com>
Subject: Re: [RFC PATCH 8/8] media: v4l2-mediabus: Drop
 V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag
Message-ID: <YdXrX9VLOm3W3YBl@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-9-laurent.pinchart+renesas@ideasonboard.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1641409376; a=rsa-sha256;
        cv=none;
        b=jR+TIiFwSqozwtguptbm9VvQkzYD91UmCBCd/IzK1u7RAXlxnP4orkPbocA8FzX/OfYRQo
        aPO8gLIKsltom6jDQ0Q59si/K1LpeK6Q9UCWG3Uwb/YL2nb+/FEH5NI79xsoY1tJPn/BzK
        VvY3yQM0cxdr9kY+u1j9sc4OxEkzt/A9ej8bLC1SkIBd1HpWjASWmYzxq/480YvW3umegF
        h/kCYuBKr9xSE1bAhXViqjOC9rdWqQVU2zXcCDoefraN1aDrIUT590Q7BdTafm6hCMY9rm
        At5+va3Q2/aJD6qbKXmhHFYDd1XZwMjIexn2Kxsh5JNHWqn9F+F9jmwuGuoryg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1641409376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0vzccKNKahp6NIlsGUb99SK9e2Mzf8IhCz8xEvjy7b8=;
        b=LIo5BGhwWtZmVRjidjfXc+aBtNSBzZfw0Gg1q7RVSn5pX22OdQ2I8hipilY28kB8gNvcUb
        /cn4jcA9QWbmWeStSUfAT++paZP5I8oqNH2hmdHz6DT6HH59zNJEVOcsU6yP0dhQeBlF6n
        CZX13/5cEnlIxLyXyMic0R1fQcPxCH0NC3BnXmdnJwEvS0Cn0C3AfEEAftP15RrXeXB8oK
        dxS7yY0GKkKWMhfeArZDND+GphcHCn+ETy4kpeb7b4r9kGpMploVrZO4r2WySU0mGS+lB8
        8o6StC16eAiv6NIt/fSVbObmUGO2wuqsWAlpeO1z0k7db3iJ0UNQeYcA5w/wwA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 03, 2022 at 06:24:14PM +0200, Laurent Pinchart wrote:
> MIPI CSI-2 continuous and non-continuous clock modes are mutually
> exclusive. Drop the V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag and use
> V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK only.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7180.c           | 3 +--
>  drivers/media/i2c/tc358743.c          | 6 +++---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 4 +---
>  include/media/v4l2-mediabus.h         | 3 +--
>  4 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 3ff37a550810..4f5db195e66d 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -785,8 +785,7 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
>  	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
>  		cfg->type = V4L2_MBUS_CSI2_DPHY;
>  		cfg->bus.mipi_csi2.num_data_lanes = 1;
> -		cfg->bus.mipi_csi2.flags =
> -				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> +		cfg->bus.mipi_csi2.flags = 0;
>  	} else {
>  		/*
>  		 * The ADV7180 sensor supports BT.601/656 output modes.
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index dfbc42675143..e18b8947ad7e 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -717,7 +717,7 @@ static void tc358743_set_csi(struct v4l2_subdev *sd)
>  			((lanes > 3) ? MASK_D3M_HSTXVREGEN : 0x0));
>  
>  	i2c_wr32(sd, TXOPTIONCNTRL, (state->bus.flags &
> -		 V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) ? MASK_CONTCLKMODE : 0);
> +		 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) ? 0 : MASK_CONTCLKMODE);
>  	i2c_wr32(sd, STARTCNTRL, MASK_START);
>  	i2c_wr32(sd, CSI_START, MASK_STRT);
>  
> @@ -1613,7 +1613,7 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
>  	cfg->type = V4L2_MBUS_CSI2_DPHY;
>  
>  	/* Support for non-continuous CSI-2 clock is missing in the driver */
> -	cfg->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> +	cfg->bus.mipi_csi2.flags = 0;
>  	cfg->bus.mipi_csi2.num_data_lanes = state->csi_lanes_in_use;
>  
>  	return 0;
> @@ -2039,7 +2039,7 @@ static int tc358743_probe(struct i2c_client *client)
>  	/* platform data */
>  	if (pdata) {
>  		state->pdata = *pdata;
> -		state->bus.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> +		state->bus.flags = 0;
>  	} else {
>  		err = tc358743_probe_of(state);
>  		if (err == -ENODEV)
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 9ff3ebb230e7..9aad860cde6c 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -207,13 +207,11 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  	if (fwnode_property_present(fwnode, "clock-noncontinuous")) {
>  		flags |= V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>  		pr_debug("non-continuous clock\n");
> -	} else {
> -		flags |= V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
>  	}
>  
>  	if (bus_type == V4L2_MBUS_CSI2_DPHY ||
>  	    bus_type == V4L2_MBUS_CSI2_CPHY || lanes_used ||
> -	    have_clk_lane || (flags & ~V4L2_MBUS_CSI2_CONTINUOUS_CLOCK)) {
> +	    have_clk_lane || (flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {

This should be just plains flags (i.e. without bitwise and) as we're just
figuring out whether any properties related to CSI-2 were found.

>  		/* Only D-PHY has a clock lane. */
>  		unsigned int dfl_data_lane_index =
>  			bus_type == V4L2_MBUS_CSI2_DPHY;
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index c6626a22b394..e0db3bcff9ed 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -68,8 +68,7 @@
>  
>  /* Serial flags */
>  /* Clock non-continuous mode support. */
> -#define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
> -#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
> +#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
>  
>  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
>  

-- 
Kind regards,

Sakari Ailus
