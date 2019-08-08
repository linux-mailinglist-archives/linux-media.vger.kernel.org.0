Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F16686117
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 13:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfHHLro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 07:47:44 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51389 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727649AbfHHLro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 07:47:44 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vgtRhsqvGAffAvgtShC4FD; Thu, 08 Aug 2019 13:47:42 +0200
Subject: Re: [PATCH v5 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-3-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8e6b902d-509c-a71e-9f7f-efb88967b8c1@xs4all.nl>
Date:   Thu, 8 Aug 2019 13:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-3-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfONLBntJeL0ZSCLxc5QG2Eyb8sN1wB7Rb78SEMXNAIU0DTQlX4zwtQrMmr/iUgHEurpORU5dCrFS5936vGpzwtlq3dff1Uawx25fLIit3nehU5715/Pe
 4ec0fxx4laPl+I81xcR7nu+3DMo0DXgXJXg1JiYwQtLAVcatieEM7JhrTb9tTlRtREC3ohOoPtKma2x0rty8w5fMot1WS9LLhbESz1sdvW0T4GopGwBLZap1
 5IqRL6UpZz8Prhy5unjwozkbP9MaUyUti8vEbJrer8EXXRxRyEVqHkDn/kxfdlJh22nLQrThT2wA3oz3H0Rrog==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with an Udoo-X86 board.

Regards,

	Hans

> ---
>  drivers/gpu/drm/i915/intel_hdmi.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
> index 187a2b828b975..db7953ce49c8e 100644
> --- a/drivers/gpu/drm/i915/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/intel_hdmi.c
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
> @@ -3061,6 +3062,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>  	struct drm_device *dev = intel_encoder->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	enum port port = intel_encoder->port;
> +	struct cec_connector_info conn_info;
>  
>  	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
>  		      port_name(port));
> @@ -3113,8 +3115,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
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

