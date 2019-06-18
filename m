Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C06A4A0F7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 14:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbfFRMj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 08:39:27 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:20227 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRMj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 08:39:27 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jun 2019 08:39:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560861562;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=1Bl4E/X7aIGsCjE+vopGDFMSaC+03a8Ks/njq7yQypA=;
        b=N82Nsaog0IQymHe7+Fo4LtHr3e0FKajC8HM3IyqBijQtq/APmkHxmKUGEcRvk2I3dI
        ynO7HDCua5/tcsbw7b55QIvz+e9/QAYF+YSITN0Ma6yavy5R8lSYoWJysmS/WLu6+4+k
        ohCiGgaFOGA/SQd+p2R/OYuf/clp7RCuEuoEEznV9qn/dOGwpmWZjs7CRqIrjZdziLhX
        YuowGttIMGH5NK6SD3TUFZPGzBEbxPkMzfKeFjGvyoj1ImpRYcl712ApnUitpCjVmsec
        Ehr+AKH9HLC5QCD7BG9kFr1oIFxWUEu28JeINtGXJprRiXbJ4WRocTkKQW18kHo6g3AU
        bVKg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5ICdM0pB
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 14:39:22 +0200 (CEST)
Date:   Tue, 18 Jun 2019 14:39:22 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <285737736.787668.1560861562177@webmail.strato.com>
In-Reply-To: <20190617210930.6054-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 03/10] drm: rcar-du: Convert to the new VSP atomic
 API
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.220.45
X-Originating-Client: open-xchange-appsuite
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On June 17, 2019 at 11:09 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
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
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Minor formatting changes
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 20 ++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |  2 ++
>  3 files changed, 19 insertions(+), 7 deletions(-)
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
> index 5e4faf258c31..3d007d38d7c1 100644
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
> @@ -90,12 +88,22 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>  	 */
>  	crtc->group->need_restart = true;
>  
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
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
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
