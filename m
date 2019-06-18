Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E198C4A26F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 15:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfFRNgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 09:36:49 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:25439 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFRNgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 09:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560864967;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9ozTmPCWNkD85dxiLtzqCpUDP/EyYvgQQPmGjV1+QiY=;
        b=BKWZ6lCf9dL5gnurSO9GJResztf/QZ9thCjxlDodRyWDAhBq/yFuZ6iHiJAEkRTXOW
        O9M58t2vbIglJr2dtFCm69Jkn+TlkbXgqiecj1N25kz8WxcZSQRt9Hd3ptOm2lqLG2er
        8zkToI4ktqjqwW6CSGVYKr+Xcb4xBJfSfFjsMex4NFRQr/a5eqFxMZtTDLB0ci+Z1xZm
        +Zcy4JvaAH/zv/F6Yr+kbkl+LUA71XUkqLFNZwTKcA/1MmjJ5M8kBhjYCXMKA/jIX/tq
        0LXiMeuOobDMkUkn4ZARHpgV9kFI5WPWMFQhxDhbfKRr+yiAWJ0zHtgwbVfsvHinFRTq
        iREQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5IDa61Ex
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 15:36:06 +0200 (CEST)
Date:   Tue, 18 Jun 2019 15:36:06 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2003798727.792594.1560864966711@webmail.strato.com>
In-Reply-To: <20190617210930.6054-9-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-9-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 08/10] drm: rcar-du: Create a group state object
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
> Create a new private state object for the DU groups, and move the
> initialisation of a group object to a new function rcar_du_group_init().
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Call mutex_destroy() when cleaning up the group
> - Include mutex.h and slab.h
> - Squash "drm: rcar-du: Add rcar_du_get_{old,new}_group_state()"
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 144 ++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.h |  29 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  27 +----
>  3 files changed, 177 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..8e12bd42890e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -25,6 +25,11 @@
>  
>  #include <linux/clk.h>
>  #include <linux/io.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_device.h>
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_group.h"
> @@ -351,3 +356,142 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
>  
>  	return rcar_du_set_dpad0_vsp1_routing(rgrp->dev);
>  }
> +
> +/* -----------------------------------------------------------------------------
> + * Group State Handling
> + */
> +
> +static struct drm_private_state *
> +rcar_du_group_atomic_duplicate_state(struct drm_private_obj *obj)
> +{
> +	struct rcar_du_group_state *state;
> +
> +	if (WARN_ON(!obj->state))
> +		return NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state == NULL)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->state);
> +
> +	return &state->state;
> +}
> +
> +static void rcar_du_group_atomic_destroy_state(struct drm_private_obj *obj,
> +					       struct drm_private_state *state)
> +{
> +	kfree(to_rcar_group_state(state));
> +}
> +
> +static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
> +	.atomic_duplicate_state = rcar_du_group_atomic_duplicate_state,
> +	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
> +};
> +
> +/**
> + * rcar_du_get_old_group_state - get old group state, if it exists
> + * @state: global atomic state object
> + * @rgrp: group to grab
> + *
> + * This function returns the old group state for the given group, or
> + * NULL if the group is not part of the global atomic state.
> + */
> +struct rcar_du_group_state *
> +rcar_du_get_old_group_state(struct drm_atomic_state *state,
> +			    struct rcar_du_group *rgrp)
> +{
> +	struct drm_private_obj *obj = &rgrp->private;
> +	struct drm_private_state *pstate;
> +	unsigned int i;
> +
> +	for (i = 0; i < state->num_private_objs; i++) {
> +		if (obj == state->private_objs[i].ptr) {
> +			pstate = state->private_objs[i].old_state;
> +			return to_rcar_group_state(pstate);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * rcar_du_get_new_group_state - get new group state, if it exists
> + * @state: global atomic state object
> + * @rgrp: group to grab
> + *
> + * This function returns the new group state for the given group, or
> + * NULL if the group is not part of the global atomic state.
> + */
> +struct rcar_du_group_state *
> +rcar_du_get_new_group_state(struct drm_atomic_state *state,
> +			    struct rcar_du_group *rgrp)
> +{
> +	struct drm_private_obj *obj = &rgrp->private;
> +	struct drm_private_state *pstate;
> +	unsigned int i;
> +
> +	for (i = 0; i < state->num_private_objs; i++) {
> +		if (obj == state->private_objs[i].ptr) {
> +			pstate = state->private_objs[i].new_state;
> +			return to_rcar_group_state(pstate);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Init and Cleanup
> + */
> +
> +/*
> + * rcar_du_group_init - Initialise and reset a group object
> + *
> + * Return 0 in case of success or a negative error code otherwise.
> + */
> +int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
> +		       unsigned int index)
> +{
> +	static const unsigned int mmio_offsets[] = {
> +		DU0_REG_OFFSET, DU2_REG_OFFSET
> +	};
> +
> +	struct rcar_du_group_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_atomic_private_obj_init(rcdu->ddev, &rgrp->private, &state->state,
> +				    &rcar_du_group_state_funcs);
> +
> +	mutex_init(&rgrp->lock);
> +
> +	rgrp->dev = rcdu;
> +	rgrp->mmio_offset = mmio_offsets[index];
> +	rgrp->index = index;
> +	/* Extract the channel mask for this group only. */
> +	rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * index))
> +			    & GENMASK(1, 0);
> +	rgrp->num_crtcs = hweight8(rgrp->channels_mask);
> +
> +	/*
> +	 * If we have more than one CRTC in this group pre-associate
> +	 * the low-order planes with CRTC 0 and the high-order planes
> +	 * with CRTC 1 to minimize flicker occurring when the
> +	 * association is changed.
> +	 */
> +	rgrp->dptsr_planes = rgrp->num_crtcs > 1
> +			   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
> +			   : 0;
> +
> +	return 0;
> +}
> +
> +void rcar_du_group_cleanup(struct rcar_du_group *rgrp)
> +{
> +	mutex_destroy(&rgrp->lock);
> +
> +	drm_atomic_private_obj_fini(&rgrp->private);
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> index 87950c1f6a52..f9961f89fd97 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> @@ -12,12 +12,15 @@
>  
>  #include <linux/mutex.h>
>  
> +#include <drm/drm_atomic.h>
> +
>  #include "rcar_du_plane.h"
>  
>  struct rcar_du_device;
>  
>  /*
>   * struct rcar_du_group - CRTCs and planes group
> + * @private: The base drm private object
>   * @dev: the DU device
>   * @mmio_offset: registers offset in the device memory map
>   * @index: group index
> @@ -32,6 +35,8 @@ struct rcar_du_device;
>   * @need_restart: the group needs to be restarted due to a configuration change
>   */
>  struct rcar_du_group {
> +	struct drm_private_obj private;
> +
>  	struct rcar_du_device *dev;
>  	unsigned int mmio_offset;
>  	unsigned int index;
> @@ -49,6 +54,19 @@ struct rcar_du_group {
>  	bool need_restart;
>  };
>  
> +#define to_rcar_group(s) container_of(s, struct rcar_du_group, private)
> +
> +/**
> + * struct rcar_du_group_state - Driver-specific group state
> + * @state: base DRM private state
> + */
> +struct rcar_du_group_state {
> +	struct drm_private_state state;
> +};
> +
> +#define to_rcar_group_state(s) \
> +	container_of(s, struct rcar_du_group_state, state)
> +
>  u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
>  void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
>  
> @@ -60,4 +78,15 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
>  
>  int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
>  
> +struct rcar_du_group_state *
> +rcar_du_get_old_group_state(struct drm_atomic_state *state,
> +			    struct rcar_du_group *rgrp);
> +struct rcar_du_group_state *
> +rcar_du_get_new_group_state(struct drm_atomic_state *state,
> +			    struct rcar_du_group *rgrp);
> +
> +int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
> +		       unsigned int index);
> +void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
> +
>  #endif /* __RCAR_DU_GROUP_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index c04136674e58..f57a035a94ee 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -23,6 +23,7 @@
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> +#include "rcar_du_group.h"
>  #include "rcar_du_kms.h"
>  #include "rcar_du_regs.h"
>  #include "rcar_du_vsp.h"
> @@ -621,10 +622,6 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  {
> -	static const unsigned int mmio_offsets[] = {
> -		DU0_REG_OFFSET, DU2_REG_OFFSET
> -	};
> -
>  	struct drm_device *dev = rcdu->ddev;
>  	struct drm_encoder *encoder;
>  	struct rcar_du_group *rgrp;
> @@ -671,25 +668,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Initialize the groups. */
>  	for_each_rcdu_group(rcdu, rgrp, i) {
> -		mutex_init(&rgrp->lock);
> -
> -		rgrp->dev = rcdu;
> -		rgrp->mmio_offset = mmio_offsets[i];
> -		rgrp->index = i;
> -		/* Extract the channel mask for this group only. */
> -		rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * i))
> -				   & GENMASK(1, 0);
> -		rgrp->num_crtcs = hweight8(rgrp->channels_mask);
> -
> -		/*
> -		 * If we have more than one CRTCs in this group pre-associate
> -		 * the low-order planes with CRTC 0 and the high-order planes
> -		 * with CRTC 1 to minimize flicker occurring when the
> -		 * association is changed.
> -		 */
> -		rgrp->dptsr_planes = rgrp->num_crtcs > 1
> -				   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
> -				   : 0;
> +		ret = rcar_du_group_init(rcdu, rgrp, i);
> +		if (ret < 0)
> +			return ret;
>  
>  		if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
>  			ret = rcar_du_planes_init(rgrp);
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
