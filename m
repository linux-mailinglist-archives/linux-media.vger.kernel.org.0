Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA64C31F905
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 13:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBSMFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 07:05:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBSMD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 07:03:27 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3C0344;
        Fri, 19 Feb 2021 13:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613736163;
        bh=5U/ZjUnFiUHnvU43maG2e5VgUk5poNHV5/Gra6oXEEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bvjcf2S88BzayBWdoCDIQ3qOHZBNYX1TNUzwOnYQZmOT8zLJtnkLVjEsrs0dHkBOd
         uDDHLklv8bU3HS+c4h0tt54YSRKqc36iGY5Lm2w2YxwnE99dMNU0hPUdtk0ogcDscy
         hLrXvvNEPl6vP5oxKgdGFYkxBRIvPDuyzNk6kIOQ=
Date:   Fri, 19 Feb 2021 14:02:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/5] drm: drm_bridge: add cec_init/exit bridge ops
Message-ID: <YC+oyavcOV0uFJUb@pendragon.ideasonboard.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211103703.444625-2-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Feb 11, 2021 at 11:36:59AM +0100, Hans Verkuil wrote:
> Add bridge cec_init/exit ops. These ops will be responsible for
> creating and destroying the CEC adapter for the bridge that supports
> CEC.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++++++++++++++++
>  include/drm/drm_bridge.h               | 31 ++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 791379816837..2ff90f5e468c 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -84,6 +84,13 @@ struct drm_bridge_connector {
>  	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
>  	 */
>  	struct drm_bridge *bridge_modes;
> +	/**
> +	 * @bridge_cec:
> +	 *
> +	 * The last bridge in the chain (closest to the connector) that provides
> +	 * cec adapter support, if any (see &DRM_BRIDGE_OP_CEC).
> +	 */
> +	struct drm_bridge *bridge_cec;
>  };
>  
>  #define to_drm_bridge_connector(x) \
> @@ -204,6 +211,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  
> +	if (bridge_connector->bridge_cec) {
> +		struct drm_bridge *cec = bridge_connector->bridge_cec;
> +
> +		cec->funcs->cec_exit(cec);
> +	}
>  	if (bridge_connector->bridge_hpd) {
>  		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
>  
> @@ -352,6 +364,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			bridge_connector->bridge_detect = bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>  			bridge_connector->bridge_modes = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_CEC)
> +			bridge_connector->bridge_cec = bridge;
>  
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
> @@ -374,6 +388,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	else if (bridge_connector->bridge_detect)
>  		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>  				  | DRM_CONNECTOR_POLL_DISCONNECT;
> +	if (bridge_connector->bridge_cec) {
> +		struct drm_bridge *bridge = bridge_connector->bridge_cec;
> +		int ret = bridge->funcs->cec_init(bridge, connector);
> +
> +		if (ret) {
> +			drm_bridge_connector_destroy(connector);
> +			return ERR_PTR(ret);
> +		}
> +	}
>  
>  	return connector;
>  }
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..4c83c2657e87 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -629,6 +629,30 @@ struct drm_bridge_funcs {
>  	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
>  	 */
>  	void (*hpd_disable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @cec_init:
> +	 *
> +	 * Initialize the CEC adapter.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support a CEC adapter. Bridges that implement it shall also
> +	 * implement the @cec_exit callback and set the DRM_BRIDGE_OP_CEC flag
> +	 * in their &drm_bridge->ops.
> +	 */
> +	int (*cec_init)(struct drm_bridge *bridge, struct drm_connector *conn);
> +
> +	/**
> +	 * @cec_exit:
> +	 *
> +	 * Terminate the CEC adapter.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support a CEC adapter. Bridges that implement it shall also
> +	 * implement the @cec_init callback and set the DRM_BRIDGE_OP_CEC flag
> +	 * in their &drm_bridge->ops.
> +	 */
> +	void (*cec_exit)(struct drm_bridge *bridge);

These are very ad-hoc operations. Would it make sense to have something
that could also be reused for other type of intiialization and cleanup
that require access to the drm_connector ?

>  };
>  
>  /**
> @@ -698,6 +722,13 @@ enum drm_bridge_ops {
>  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>  	 */
>  	DRM_BRIDGE_OP_MODES = BIT(3),
> +	/**
> +	 * @DRM_BRIDGE_OP_CEC: The bridge supports a CEC adapter.
> +	 * Bridges that set this flag shall implement the
> +	 * &drm_bridge_funcs->cec_init and &drm_bridge_funcs->cec_exit
> +	 * callbacks.
> +	 */
> +	DRM_BRIDGE_OP_CEC = BIT(4),
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
