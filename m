Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2DFE361AC6
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 09:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhDPHqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 03:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhDPHqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 03:46:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA3BC061574;
        Fri, 16 Apr 2021 00:46:13 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCBE05A5;
        Fri, 16 Apr 2021 09:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618559170;
        bh=P7wwiy1ARCZJKs2Gzsnd/CbbG6MTgpoebNlqrb2EiGU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vGl2HQqQ6d+qaDSlFxoNL4JTPaQwlXITDJiAMAOMY+J0JwWUXmbYafcnXHvGemzzx
         erq15XghRnW1hyHPgDs5Zr/tWfnTI8El+9yrE4habSs5L8IQ/qRqpkT1mT6X/HKYvv
         2sVY8iONFHBD5NoFAmWxXnt6R5js5/1ipVHnY0AQ=
Subject: Re: [PATCHv2 1/6] drm: drm_bridge: add connector_attach/detach bridge
 ops
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-2-hverkuil-cisco@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3ba8c7c3-2e86-964d-2e5b-5cdd805def5c@ideasonboard.com>
Date:   Fri, 16 Apr 2021 10:46:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 02/03/2021 18:23, Hans Verkuil wrote:
> Add bridge connector_attach/detach ops. These ops are called when a
> bridge is attached or detached to a drm_connector. These ops can be
> used to register and unregister an HDMI CEC adapter for a bridge that
> supports CEC.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/drm_bridge_connector.c |  9 +++++++++
>   include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 791379816837..07db71d4f5b3 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>   {
>   	struct drm_bridge_connector *bridge_connector =
>   		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
> +		if (bridge->funcs->connector_detach)
> +			bridge->funcs->connector_detach(bridge, connector);
>   
>   	if (bridge_connector->bridge_hpd) {
>   		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> @@ -375,6 +380,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		if (bridge->funcs->connector_attach)
> +			bridge->funcs->connector_attach(bridge, connector);
> +
>   	return connector;
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..3320a6ebd253 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -629,6 +629,33 @@ struct drm_bridge_funcs {
>   	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
>   	 */
>   	void (*hpd_disable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @connector_attach:
> +	 *
> +	 * This callback is invoked whenever our bridge is being attached to a
> +	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
> +	 * Note that this callback expects that this op always succeeds. Since
> +	 * HDMI CEC support is an optional feature, any failure to register a
> +	 * CEC adapter must be ignored since video output will still work
> +	 * without CEC.
> +	 *

Even if CEC support is optional, the callback itself is generic. 
Wouldn't it be better to make this function return an error, and for 
CEC, just return 0 if CEC won't get registered correctly?

Also, I personally like things to fail if something doesn't go right, 
instead of continuing, if that thing is never supposed to happen in 
normal situations. E.g. if CEC registration fails because we're out of 
memory, I think the op should fail too.

  Tomi
