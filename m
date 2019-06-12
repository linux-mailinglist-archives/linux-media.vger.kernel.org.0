Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6F0429B2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 16:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732480AbfFLOot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 10:44:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732013AbfFLOot (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 10:44:49 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AA689B1;
        Wed, 12 Jun 2019 16:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560350687;
        bh=vMR9A4FDBoZw7TYBoNxkxyC3Dk/Go+uEMd3khgtzWqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XgzGW5t5NBsJJ/rOPqsxE1JJX8Vd4Am863+9wB/kricrA7DOoikdJm+yG7b1u6C6v
         0T+vmOZQHATyliUqjepUAYCe+w0hUb0l6dvyhAgeLk3MIpNHWYCaypUI/srpuxuqQn
         gKCsn5AZRk/7rPFaaQFH0YTDipPhDqMkd0DOCLPY=
Date:   Wed, 12 Jun 2019 17:44:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm: rcar-du: Convert to the new VSP atomic API
Message-ID: <20190612144432.GO5035@pendragon.ideasonboard.com>
References: <20190517223143.26251-1-kieran.bingham+renesas@ideasonboard.com>
 <20190517223143.26251-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190517223143.26251-3-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, May 17, 2019 at 11:31:42PM +0100, Kieran Bingham wrote:
> The configuration API between the VSP and the DU has been updated to
> provide finer grain control over modesetting, and enablement.
> 
> Split rcar_du_vsp_enable() into rcar_du_vsp_modeset() and
> rcar_du_vsp_enable() accordingly, and update each function to use the
> new VSP API.
> 
> There are no further users of the deprecated vsp1_du_setup_lif() which
> can now be removed.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 21 +++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |  2 ++
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 2da46e3dc4ae..cccd6fe85749 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -492,8 +492,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
>  	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
>  
>  	/* Enable the VSP compositor. */
> -	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> +	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
> +		rcar_du_vsp_modeset(rcrtc);
>  		rcar_du_vsp_enable(rcrtc);
> +	}
>  
>  	/* Turn vertical blanking interrupt reporting on. */
>  	drm_crtc_vblank_on(&rcrtc->crtc);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 5e4faf258c31..c170427fcad9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -44,16 +44,14 @@ static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
>  	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
>  }
>  
> -void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
> +void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc)
>  {
>  	const struct drm_display_mode *mode = &crtc->crtc.state->adjusted_mode;
>  	struct rcar_du_device *rcdu = crtc->dev;
> -	struct vsp1_du_lif_config cfg = {
> +	struct vsp1_du_modeset_config cfg = {
>  		.width = mode->hdisplay,
>  		.height = mode->vdisplay,
>  		.interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE,
> -		.callback = rcar_du_vsp_complete,
> -		.callback_data = crtc,
>  	};
>  	struct rcar_du_plane_state state = {
>  		.state = {
> @@ -90,12 +88,23 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>  	 */
>  	crtc->group->need_restart = true;
>  
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +

Extra blank line.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	vsp1_du_atomic_modeset(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +}
> +
> +void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
> +{
> +	struct vsp1_du_enable_config cfg = {
> +		.callback = rcar_du_vsp_complete,
> +		.callback_data = crtc,
> +	};
> +
> +	vsp1_du_atomic_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
>  
>  void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
>  {
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
> +	vsp1_du_atomic_disable(crtc->vsp->vsp, crtc->vsp_pipe);
>  }
>  
>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> index 9b4724159378..a6f6bb4690f2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> @@ -58,6 +58,7 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
>  #ifdef CONFIG_DRM_RCAR_VSP
>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		     unsigned int crtcs);
> +void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
> @@ -73,6 +74,7 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
>  {
>  	return -ENXIO;
>  }
> +static inlinc void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc) { };
>  static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
>  static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
>  static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };

-- 
Regards,

Laurent Pinchart
