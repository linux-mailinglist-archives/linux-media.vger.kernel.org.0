Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BEB9CF05
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 14:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbfHZMIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 08:08:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:30612 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfHZMIX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 08:08:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 05:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; 
   d="scan'208";a="174188415"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga008.jf.intel.com with SMTP; 26 Aug 2019 05:08:17 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 26 Aug 2019 15:08:16 +0300
Date:   Mon, 26 Aug 2019 15:08:16 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Ramalingam C <ramalingam.c@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
Message-ID: <20190826120816.GX5942@intel.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190814104520.6001-3-darekm@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 14, 2019 at 12:45:00PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index b1ca8e5bdb56d..9fcf2c58c29c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2752,8 +2752,9 @@ intel_hdmi_connector_register(struct drm_connector *connector)
>  
>  static void intel_hdmi_destroy(struct drm_connector *connector)
>  {
> -	if (intel_attached_hdmi(connector)->cec_notifier)
> -		cec_notifier_put(intel_attached_hdmi(connector)->cec_notifier);
> +	struct cec_notifier *n = intel_attached_hdmi(connector)->cec_notifier;
> +
> +	cec_notifier_conn_unregister(n);
>  
>  	intel_connector_destroy(connector);
>  }
> @@ -3068,6 +3069,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>  	struct drm_device *dev = intel_encoder->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	enum port port = intel_encoder->port;
> +	struct cec_connector_info conn_info;
>  
>  	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
>  		      port_name(port));
> @@ -3120,8 +3122,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>  		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
>  	}
>  
> -	intel_hdmi->cec_notifier = cec_notifier_get_conn(dev->dev,
> -							 port_identifier(port));
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	intel_hdmi->cec_notifier =
> +		cec_notifier_conn_register(dev->dev, port_identifier(port),
> +					   &conn_info);
>  	if (!intel_hdmi->cec_notifier)
>  		DRM_DEBUG_KMS("CEC notifier get failed\n");
>  }
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog

-- 
Ville Syrjälä
Intel
