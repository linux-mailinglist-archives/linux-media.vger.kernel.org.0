Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 243254A174
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 15:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbfFRNDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 09:03:23 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27086 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRNDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 09:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560862996;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ezLFRyWyv33GMlRzKaRYdF8L8kZ6q92sefmgqWQ75xA=;
        b=huLDGFS6hyeVr6k0/j7rQm5LT/v8tme6q6drkDcVb5ytitiulwhKJHfsiEraiRPrvg
        FCRgwZ4Fc+wlnHmOWxycVN9at8GtOjh4fYLaXBOmzM6Eu4lHOqeKzl0i5hh82qa7F1YX
        uHEzGNuu/VuFhx9WudQ3jk2jx1ScKwWYyXzgjckeIib//7eJpNZ/epSJ/BaZcL1swDtw
        rKzey9mYoO13bbZugosdQZ0kS6E2D1mSAbQ5AZR1o3oBhMP6OB226ScigbnYHTCpWk1h
        0UR7hJKMsRZ0/D2X9Vy6B36YJwrjCOC/JVQKHbfXPl1b5vrrf79I12cTKwEcn1w0TSrN
        QJ7A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5ID3G0y4
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 15:03:16 +0200 (CEST)
Date:   Tue, 18 Jun 2019 15:03:16 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <447906344.789688.1560862996532@webmail.strato.com>
In-Reply-To: <20190617210930.6054-6-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-6-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 05/10] drm: rcar-du: Handle CRTC standby from commit
 tail handler
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
> Manage the power state, and initial configuration of the CRTC from the
> commit tail handler. CRTCs which need to be activated are taken out of
> standby, and any deactivated CRTCs are put into standby.
> 
> This aims at removing CRTC state tracking from the rcar_du_crtc
> structure. The initial configuration of the CRTC background colours and
> disabling of all planes is taken out of rcar_du_crtc_setup() and moved
> inline into rcar_du_crtc_enable(). rcar_du_crtc_get() and
> rcar_du_crtc_put() are kept as they are needed to configure the VSP at
> the correct time, this will be addressed in a separate change.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Add more documentation
> - Keep rcar_du_crtc_get() and rcar_du_crtc_put()
> - Renamed rcar_du_crtc_enable() to rcar_du_crtc_exit_standby() and
>   rcar_du_crtc_disable() to rcar_du_crtc_enter_standby()
> - Reword commit message
> 
> Changes since v1:
> 
> - Registers sequence confirmed unchanged
> - Re-ordered in the series to handle before groups
> - Do not merge rcar_du_crtc_setup() (now handled by _crtc_pre_commit)
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 90 ++++++++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  5 ++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  4 ++
>  3 files changed, 81 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index cccd6fe85749..23f4bdef0e3a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -480,17 +480,10 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
>  
>  static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
>  {
> -	/* Set display off and background to black */
> -	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
> -	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
> -
>  	/* Configure display timings and output routing */
>  	rcar_du_crtc_set_display_timing(rcrtc);
>  	rcar_du_group_set_routing(rcrtc->group);
>  
> -	/* Start with all planes disabled. */
> -	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
> -
>  	/* Enable the VSP compositor. */
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
>  		rcar_du_vsp_modeset(rcrtc);
> @@ -501,17 +494,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
>  	drm_crtc_vblank_on(&rcrtc->crtc);
>  }
>  
> -static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
> +static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
>  {
>  	int ret;
>  
> -	/*
> -	 * Guard against double-get, as the function is called from both the
> -	 * .atomic_enable() and .atomic_begin() handlers.
> -	 */
> -	if (rcrtc->initialized)
> -		return 0;
> -
>  	ret = clk_prepare_enable(rcrtc->clock);
>  	if (ret < 0)
>  		return ret;
> @@ -524,8 +510,12 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
>  	if (ret < 0)
>  		goto error_group;
>  
> -	rcar_du_crtc_setup(rcrtc);
> -	rcrtc->initialized = true;
> +	/* Set display off and background to black. */
> +	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
> +	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
> +
> +	/* Start with all planes disabled. */
> +	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
>  
>  	return 0;
>  
> @@ -536,13 +526,29 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
>  	return ret;
>  }
>  
> -static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
> +static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
>  {
>  	rcar_du_group_put(rcrtc->group);
>  
>  	clk_disable_unprepare(rcrtc->extclock);
>  	clk_disable_unprepare(rcrtc->clock);
> +}
>  
> +static void rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
> +{
> +	/*
> +	 * Guard against double-get, as the function is called from both the
> +	 * .atomic_enable() and .atomic_begin() handlers.
> +	 */
> +	if (rcrtc->initialized)
> +		return;
> +
> +	rcar_du_crtc_setup(rcrtc);
> +	rcrtc->initialized = true;
> +}
> +
> +static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
> +{
>  	rcrtc->initialized = false;
>  }
>  
> @@ -662,6 +668,54 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
>  	return 0;
>  }
>  
> +/*
> + * Take all CRTCs that are made active in this commit out of standby.
> + * CRTCs that are deactivated by the commit are untouched and will be
> + * put in standby by rcar_du_crtc_atomic_enter_standby().
> + */
> +int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +	int ret;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +
> +		if (crtc_state->active_changed && crtc_state->active) {
> +			ret = rcar_du_crtc_exit_standby(rcrtc);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Put all CRTCs that have been deactivated by this commit in standby.
> + * This shall be called at the end of the commit tail handler as the
> + * last operation that touches the CRTC hardware.
> + */
> +int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +
> +		if (crtc_state->active_changed && !crtc_state->active)
> +			rcar_du_crtc_enter_standby(rcrtc);
> +	}
> +
> +	return 0;
> +}
> +
>  static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  				       struct drm_crtc_state *old_state)
>  {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 3b7fc668996f..3ce7610793b2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -107,6 +107,11 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  
>  void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
>  
> +int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
> +				     struct drm_atomic_state *state);
> +int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
> +				      struct drm_atomic_state *state);
> +
>  void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
>  
>  #endif /* __RCAR_DU_CRTC_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..59680de271cc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -409,11 +409,15 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	}
>  
>  	/* Apply the atomic update. */
> +	rcar_du_crtc_atomic_exit_standby(dev, old_state);
> +
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
> +	rcar_du_crtc_atomic_enter_standby(dev, old_state);
> +
>  	drm_atomic_helper_commit_hw_done(old_state);
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>  
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
