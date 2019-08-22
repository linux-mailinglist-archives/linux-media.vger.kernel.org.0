Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E6F98CD6
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbfHVIEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:04:06 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40753 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfHVIEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:04:06 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0i4diaYaNThuu0i4hij7Mt; Thu, 22 Aug 2019 10:04:04 +0200
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Date:   Thu, 22 Aug 2019 10:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-3-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFS6JYJ0+q2LAIYGCuj6fLd3vPJORYjU0ME/5k7e+ByKAWdY7DwySnd1VrwDnra4h8Liaj9h6QVz2CkpJPjMBXo/3g493dn33GbRBDTqxc7SkLG0XiEs
 aBKLf9xZZV6Wi9Nx1llBJUoktu1pAR3UfKootbfsbcmnM2wadZF3tWvKfQUCQl/YOxE74kQSZS+TI4XeEB12wp7vRFL4nPMnrmV3CN/GLbothgeVWXH+VqBJ
 p7/N3t/Ygq7nmyFKW0rf+TG225kLl+WcWMbettDkA+r1j94Yy+K0/EZRSUeyrQYncx9kRyGyAe+X8YB9xEQxmgoHuoXdzrJl3TouvBlhv4L8DrgKBBjJI/iM
 3V2sI548xb1YuHm/4IHB//h8YBfk17LaWcA0HSgTtQxZnQGWxcTNzg9x/btYbaUVl2XxLM9ph99szDuHgiH/Qthtx0Z6dQHLK7kSpKx4MqynPS1Xr+0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ville or Rodrigo,

Can one of you either merge this patch or Ack it so that I can merge this?

Thank you!

Regards,

	Hans

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
> 

