Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3839478F1DB
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 19:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbjHaRZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 13:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjHaRZF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 13:25:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D626107
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693502702; x=1725038702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GTS8w1vFRbKw6Z5fs2GGWb5MlJivULFPOSfQjRvg/wQ=;
  b=KxgGPDHafqo04AwnzAidVF8t0oxH/BtyqdeGVp3AIR6WyaBVEeq+x9qw
   J+7NnZ/KFvJf/HWx22MR1Y0SmJDFBRsIAaxhRcHMzkoeCO2h55iJ6H7vG
   nVSViWDeXPy4ifQ2FXvePDNb4r3rRKhGhYoxFlgK3kk2TDxnl/scxxjiA
   ypev3APVbEHcqVPPAPrfNxmhfShf6cEoD7HzMST64gLWAm3oDoTZJBCJ4
   nVsaqGeWPYF/oZKsFoV1UwaLIY116iItjGo5ipIKMhkP+UsjnceelvSQQ
   OEHIgJOBSBGCCS54Myx8DUFJqPg83h7cttZu/MNBuNQ4iiS4HkhVS1+u6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379802786"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="379802786"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 10:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733192617"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="733192617"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
  by orsmga007.jf.intel.com with SMTP; 31 Aug 2023 10:24:58 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 31 Aug 2023 20:24:58 +0300
Date:   Thu, 31 Aug 2023 20:24:58 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/display: use
 drm_edid_is_digital()
Message-ID: <ZPDM6rh0NMa4yt6H@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 24, 2023 at 04:46:03PM +0300, Jani Nikula wrote:
> Reduce the use of struct edid and drm_edid_raw().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  9 ++++-----
>  drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
>  3 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> index f66340b4caf0..310670bb6c25 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -657,21 +657,18 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
>  	drm_edid = intel_crt_get_edid(connector, i2c);
>  
>  	if (drm_edid) {
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -		bool is_digital = edid->input & DRM_EDID_INPUT_DIGITAL;
> -
>  		/*
>  		 * This may be a DVI-I connector with a shared DDC
>  		 * link between analog and digital outputs, so we
>  		 * have to check the EDID input spec of the attached device.
>  		 */
> -		if (!is_digital) {
> +		if (drm_edid_is_digital(drm_edid)) {
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "CRT detected via DDC:0x50 [EDID]\n");
> -			ret = true;
> +				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
>  		} else {
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
> +				    "CRT detected via DDC:0x50 [EDID]\n");
> +			ret = true;

Inverting the check made the diff a bit confusing, but looks
correct in the end.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		}
>  	} else {
>  		drm_dbg_kms(&dev_priv->drm,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9442bf43550e..aa9915098dda 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2452,7 +2452,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
>  	intel_wakeref_t wakeref;
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>  	bool connected = false;
>  	struct i2c_adapter *i2c;
>  
> @@ -2475,9 +2474,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  
>  	to_intel_connector(connector)->detect_edid = drm_edid;
>  
> -	/* FIXME: Get rid of drm_edid_raw() */
> -	edid = drm_edid_raw(drm_edid);
> -	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
> +	if (drm_edid_is_digital(drm_edid)) {
>  		intel_hdmi_dp_dual_mode_detect(connector);
>  
>  		connected = true;
> @@ -2485,7 +2482,9 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  
>  	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
>  
> -	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
> +	/* FIXME: Get rid of drm_edid_raw() */
> +	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
> +					     drm_edid_raw(drm_edid));
>  
>  	return connected;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 7d25a64698e2..917771e19e38 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2094,10 +2094,8 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
>  
>  	status = connector_status_unknown;
>  	if (drm_edid) {
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -
>  		/* DDC bus is shared, match EDID to connector type */
> -		if (edid && edid->input & DRM_EDID_INPUT_DIGITAL)
> +		if (drm_edid_is_digital(drm_edid))
>  			status = connector_status_connected;
>  		else
>  			status = connector_status_disconnected;
> @@ -2111,8 +2109,7 @@ static bool
>  intel_sdvo_connector_matches_edid(struct intel_sdvo_connector *sdvo,
>  				  const struct drm_edid *drm_edid)
>  {
> -	const struct edid *edid = drm_edid_raw(drm_edid);
> -	bool monitor_is_digital = !!(edid->input & DRM_EDID_INPUT_DIGITAL);
> +	bool monitor_is_digital = drm_edid_is_digital(drm_edid);
>  	bool connector_is_digital = !!IS_DIGITAL(sdvo);
>  
>  	DRM_DEBUG_KMS("connector_is_digital? %d, monitor_is_digital? %d\n",
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
