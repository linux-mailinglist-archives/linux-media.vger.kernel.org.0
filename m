Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72A15992F9
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242265AbiHSCKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbiHSCKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:10:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0418DD777;
        Thu, 18 Aug 2022 19:10:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ED1F3F1;
        Fri, 19 Aug 2022 04:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660875014;
        bh=SXRUZwcRcYy6bdv+SkLqpvDOfBEeFhEWZRl2EAsy17M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IbGCVncxMbp6BKa0g4KRWZbIsGU4XTFWQ/vSMl3RCskT3Yd/rxP63fnVFT6WYY0v0
         fbeXWgCxAQdx7u3U91n9q9GJVfHOFabUbf36uP+E5KV4FI1QYTsYN2iikhVNuVMhmV
         mCylu811HjFy6a3/ILg82qmE6c4AW5Hc19jJ1Noc=
Date:   Fri, 19 Aug 2022 05:10:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org
Subject: Re: [PATCH v2 3/3] drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE
 support
Message-ID: <Yv7xAk0RhI3PfnUs@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-4-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810083711.219642-4-taki@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hayama-san,

Thank you for the patch.

On Wed, Aug 10, 2022 at 05:37:11PM +0900, Takanari Hayama wrote:
> DRM_MODE_BLEND_PIXEL_NONE ignores an alpha channel.
> 
> Rcar-du driver supports only 3 formats with an alpha channel
> (DRM_FORMAT_ARGB1555, DRM_FORMAT_ARGB8888 and DRM_FORMAT_ARGB4444). We
> simply override the format passed to VSP1 for blending with the pixel
> format without alpha channel.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index b9580fcfec7a..7cce2d414ced 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -151,6 +151,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		.alpha = state->state.alpha >> 8,
>  		.zpos = state->state.zpos,
>  	};
> +	u32 fourcc = state->format->fourcc;
>  	unsigned int i;
>  
>  	cfg.src.left = state->state.src.x1 >> 16;
> @@ -169,7 +170,23 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  
>  	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);
>  
> -	format = rcar_du_format_info(state->format->fourcc);
> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> +		switch (fourcc) {
> +		case DRM_FORMAT_ARGB1555:
> +			fourcc = DRM_FORMAT_XRGB1555;
> +			break;
> +
> +		case DRM_FORMAT_ARGB4444:
> +			fourcc = DRM_FORMAT_XRGB4444;
> +			break;
> +
> +		case DRM_FORMAT_ARGB8888:
> +			fourcc = DRM_FORMAT_XRGB8888;
> +			break;
> +		}
> +	}
> +
> +	format = rcar_du_format_info(fourcc);
>  	cfg.pixelformat = format->v4l2;
>  
>  	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
> @@ -447,6 +464,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		}
>  
>  		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>  					BIT(DRM_MODE_BLEND_PREMULTI) |
>  					BIT(DRM_MODE_BLEND_COVERAGE));
>  

-- 
Regards,

Laurent Pinchart
