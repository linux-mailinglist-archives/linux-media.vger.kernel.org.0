Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066B65992F0
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbiHSCIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbiHSCIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:08:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B412B1707D;
        Thu, 18 Aug 2022 19:08:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DF263F1;
        Fri, 19 Aug 2022 04:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660874895;
        bh=oDbPySEphycwFKXs9Mf0TcGdddFYuL6YT5lpGvcJT8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXK5wcfc+3hJSdCKIQMwMRmWbLLVgwD2WXMss044/lLufLYf41CYjwIvmRJZuorHj
         K3NH6F6kbRGqticYtAQMLv6R3B17+EWPzy/1xHGZ7OiJYHJqubBGzUkbYJPdB+xEvd
         SsqgYl3pOjen5Y4LMH5iqTcrBVhQXb1AeeoudVMo=
Date:   Fri, 19 Aug 2022 05:08:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org
Subject: Re: [PATCH v2 2/3] drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
Message-ID: <Yv7wjIx+NLe5iqQn@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-3-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810083711.219642-3-taki@igel.co.jp>
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

On Wed, Aug 10, 2022 at 05:37:10PM +0900, Takanari Hayama wrote:
> R-Car DU driver implicitly supports DRM_MODE_BLEND_COVERAGE only.
> This adds a support for DRM_MODE_BLEND_PREMULTI. As a consequence,
> DRM_MODE_BLEND_PREMULTI becomes the default. If DRM_MODE_BLEND_COVERAGE
> is desired, it should be set explicitly.
> 
> This behavior comes from how DRM blend mode is supported.
> drm_plane_create_blend_mode_property() creates the blend mode property
> with the default value of DRM_MODE_BLEND_PREMULTI. This default value
> cannot be modified from the atomic driver.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 8eb9b2b097ae..b9580fcfec7a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -167,6 +167,8 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
>  			   + fb->offsets[i];
>  
> +	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);

I'll drop the parentheses here too, and if you don't mind, I'll move
this down after setting cfg.pixelformat, as premult qualifies the format
so it's more logical in that reading order (no change on the behaviour
of course).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	format = rcar_du_format_info(state->format->fourcc);
>  	cfg.pixelformat = format->v4l2;
>  
> @@ -444,6 +446,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  						       num_planes - 1);
>  		}
>  
> +		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));
> +
>  		vsp->num_planes++;
>  	}
>  

-- 
Regards,

Laurent Pinchart
