Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBD14876DB
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 12:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347267AbiAGLww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 06:52:52 -0500
Received: from lahtoruutu.iki.fi ([185.185.170.37]:50744 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347264AbiAGLwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 06:52:50 -0500
X-Greylist: delayed 146990 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jan 2022 06:52:50 EST
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id A5B0D1B0030E;
        Fri,  7 Jan 2022 13:52:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1641556366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KOoOMFuSXGaXVTzv7o4JhkgOfDNKguyFVVADd8MxT6U=;
        b=OV+kTXtHKd9OK6W0DB9EiooZuo7Ux7vz3R3G0oRHAcL1UfBfZivqTCJNkd3cUNIepJ1E/s
        InstB0N4p4oVle4zms+7Gb8md2VsD9wS93o/Htms0BkjSXU17jtb2MTNMUs6ZgWl4WhHdP
        uXFs7Zumftax1gRm7NqPW2gpoMN7LPSHcXBKOF/OjWJRn4QojGysngCTO/AiRvsZHaHiUa
        qUAlNYfBtCZMhJ8rdj96/57g01h2xVj7fg9pvMAAKrZGmEhkXU4Syl5N7D3szHePbxYsmH
        xcLHpD7NJ0CZNquYqfhBV717Bz0kWyjGoTlwpIi0zXIwCGK0/L14tTuwEJ28/Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2BDEB634C90;
        Fri,  7 Jan 2022 13:52:46 +0200 (EET)
Date:   Fri, 7 Jan 2022 13:52:45 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?iso-8859-1?B?Suly9G1l?= Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 3/3] staging: media: imx: imx7-mipi-csis: Make subdev
 name unique
Message-ID: <Ydgpjd1sfayQfP5j@valkosipuli.retiisi.eu>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
 <20220106172441.7399-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106172441.7399-4-laurent.pinchart@ideasonboard.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1641556366; a=rsa-sha256;
        cv=none;
        b=A1/zCW1Ei1d7RyrB5un5Gxh4csfLlsDvhJIFkJUP0pjQu1Qfib2yAZrTmFTxH1qLU4RFhF
        2AXKY7s3YBlDA+p3l0IzNo216ED3kRp+Ys/G6tmSaxTDLV3SZTrna5YvzlKQcfbvwk5s5k
        735nH1JpElkpsx7bN71j1Ri1AdM4dO0ylMY22Mb3Knf+fS8ZBxEsk5Cmp3+PM+ghAwGvq+
        rzBUuB/Qca9vcy2uchKIdpWb9bcGLMrXcfAYz6w52LnKAA6Uy239fI2QGq2FD6etvnPFt4
        NexVxFgC0ciEd8OWHxGHo6CFp9SxPHTvNAr2iKtIPrZ3YM9QIakexdbWovfwNA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1641556366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KOoOMFuSXGaXVTzv7o4JhkgOfDNKguyFVVADd8MxT6U=;
        b=V8HTnv9h2pnWIJ0wioKLu7xdgg9xKKe/qDf9O7zRA3v4GCv5jNx6RNZy3P4mJ6pbjjetHy
        f/qPXz3v6Y/vl+ZtbVoFozyjTwxlEmOE5UcirG50S6qBj7sLZ5ckiP3xsVhO2awQ9m1nFM
        2VlAPKKir5DhO1wEBY+zdmAWK4ap1KoeHyVo6h4tfJjzK2385qYM94MCPzj/Z/QA1VOj+d
        JMDFb6gLpiZVuKR3I5wUPQAhP7F2WIRdgnvxB33kQQEEBgOOUCkxIJ5Hhmkt4aNQ3LycVl
        Lhwgt6zCprzP5SbEhuBwIcnuFNRfhGQ8++3v8Ciz6rSp3Q48Xr7zqp55EM6ejw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 06, 2022 at 07:24:41PM +0200, Laurent Pinchart wrote:
> When multiple CSIS instances are present in a single graph, they are
> currently all named "imx7-mipi-csis.0", which breaks the entity name
> uniqueness requirement. Fix it by using the device name to create the
> subdev name.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index d7bcfb1a0c52..6443cca817fe 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -32,7 +32,6 @@
>  #include <media/v4l2-subdev.h>
>  
>  #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
> -#define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
>  
>  #define CSIS_PAD_SINK				0
>  #define CSIS_PAD_SOURCE				1
> @@ -313,7 +312,6 @@ struct csi_state {
>  	struct reset_control *mrst;
>  	struct regulator *mipi_phy_regulator;
>  	const struct mipi_csis_info *info;
> -	u8 index;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
> @@ -1329,8 +1327,8 @@ static int mipi_csis_subdev_init(struct csi_state *state)
>  
>  	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
>  	sd->owner = THIS_MODULE;
> -	snprintf(sd->name, sizeof(sd->name), "%s.%d",
> -		 CSIS_SUBDEV_NAME, state->index);
> +	snprintf(sd->name, sizeof(sd->name), "csis-%s",
> +		 dev_name(state->dev));
>  
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sd->ctrl_handler = NULL;

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
