Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF48678D84E
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjH3SaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242893AbjH3J50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 05:57:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0551B0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 02:57:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4301260EAA
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 09:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA21C433C8;
        Wed, 30 Aug 2023 09:57:21 +0000 (UTC)
Message-ID: <040776c1-d891-a2f1-0674-7fc474f69343@xs4all.nl>
Date:   Wed, 30 Aug 2023 11:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/6] drm/i915/cec: switch to setting physical address
 directly
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <cover.1692884619.git.jani.nikula@intel.com>
 <01a90c82c8a4f2fd945e0181ffeaca595928d19e.1692884619.git.jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <01a90c82c8a4f2fd945e0181ffeaca595928d19e.1692884619.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/08/2023 15:46, Jani Nikula wrote:
> Avoid parsing the EDID again for source physical address. Also gets rids
> of a few remaining raw EDID usages.
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   | 7 ++-----
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 5 ++---
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7067ee3a4bd3..c4b8e0e74c15 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5198,7 +5198,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_connector *connector = intel_dp->attached_connector;
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>  	bool vrr_capable;
>  
>  	intel_dp_unset_edid(intel_dp);
> @@ -5216,10 +5215,8 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
>  	intel_dp_update_dfp(intel_dp, drm_edid);
>  	intel_dp_update_420(intel_dp);
>  
> -	/* FIXME: Get rid of drm_edid_raw() */
> -	edid = drm_edid_raw(drm_edid);
> -
> -	drm_dp_cec_set_edid(&intel_dp->aux, edid);
> +	drm_dp_cec_attach(&intel_dp->aux,
> +			  connector->base.display_info.source_physical_address);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index aa9915098dda..5d6255ee8b54 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2482,9 +2482,8 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  
>  	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
>  
> -	/* FIXME: Get rid of drm_edid_raw() */
> -	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
> -					     drm_edid_raw(drm_edid));
> +	cec_notifier_set_phys_addr(intel_hdmi->cec_notifier,
> +				   connector->display_info.source_physical_address);
>  
>  	return connected;
>  }

