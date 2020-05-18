Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D72C1D79EA
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 15:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgERNdM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 May 2020 09:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgERNdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 09:33:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18D5C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 06:33:11 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jaftG-0002WC-IN; Mon, 18 May 2020 15:33:10 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jaftF-0000GK-Js; Mon, 18 May 2020 15:33:09 +0200
Message-ID: <ac24f89ebe68ef2b40bf1d89cd69e566a380fd4a.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: imx-pxp: Fix routing configuration for i.MX7
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-imx@nxp.com, kernel@pengutronix.de
Date:   Mon, 18 May 2020 15:33:09 +0200
In-Reply-To: <20200510223100.11641-2-laurent.pinchart@ideasonboard.com>
References: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
         <20200510223100.11641-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, 2020-05-11 at 01:30 +0300, Laurent Pinchart wrote:
> The PXP hangs without producing any frame on the i.MX7. This is caused
> by a mismatch between the routing configuration and the modules
> configuration. Fix the routing configuration by
> 
> - Selecting Composite Alpha Blending/Color Key 0 (main path) as the
>   input to CSC2 (MUX6).
> - Connecting the Rotation 0 block in the pipeline by feeding it with
>   data (MUX12) and selecting its output (MUX14).
> - Disabling all other muxes () by selecting the "no output" option. The
>   datasheet doesn't explicitly require this, but the PXP has been
>   noticed to hang after several hundreds frames when testing routing
>   with the LUT disabled and the LUT input mux (MUX9) set to MUX8. It's
>   thus safer to explicitly disable all unused paths.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/imx-pxp.c | 34 +++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> index 74e16011fc09..53e3f8c8435f 100644
> --- a/drivers/media/platform/imx-pxp.c
> +++ b/drivers/media/platform/imx-pxp.c
> @@ -911,26 +911,32 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  	/* bypass LUT */
>  	pxp_write(dev, HW_PXP_LUT_CTRL, BM_PXP_LUT_CTRL_BYPASS);
>  
> +	/*
> +	 * Configure routing, disabling all paths that are not used by
> +	 * selecting the "no output" (3) option. The datasheet doesn't
> +	 * explicitly require this, but the PXP has been seen to hand after
> +	 * processing a few hundreds of frames otherwise.
> +	 */
>  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0,

Which commit should this patch be applied on? I have a writel() here.

> -		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1)|
>  		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3)|
>  		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
>  		  BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3)|
>  		  BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
> -		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0));
> +		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3)|
> +		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3));
>  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL1,
> -		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
> -		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1));
> +		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3) |
> +		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3));

I have tried this change on i.MX6ULL / v5.6, it does not work.
The PXP interrupt never triggers.

regards
Philipp
