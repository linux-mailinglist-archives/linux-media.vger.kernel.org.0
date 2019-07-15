Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B55768769
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfGOKxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:53:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44163 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729591AbfGOKxe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:53:34 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id mybrhcH4l0SBqmybshRWEK; Mon, 15 Jul 2019 12:53:32 +0200
Subject: Re: [PATCH v2 5/5] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
 <20190701145944.214098-6-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f8549313-8e2e-3de4-befa-09f3cbedc2af@xs4all.nl>
Date:   Mon, 15 Jul 2019 12:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-6-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFfEGTCWAaLPaz0Bao3qbWpLL/CmDt6gDh+hwSyYXFwXJ5IYqOLaL9E2YnfnELAU/T9S/dZ20VSF507+HPdAIUrXk/9XLJOCCu3ddowu/cD88317XutT
 9I8rNlpgy4jbQ0Z8U/xNIqnqB+kUx0d/drqB/fJ/CMJsA4aijZUaKtX4dOa2C6AFv4Y2bsooxQNzRuR5P4wLd6zVyqbCa+AeRMZnXXJOTNGVhk2hWrdmnvk3
 Yi15zUDwG091LbVv4iAsmpkfHhWYUBC4CJ3AlvMP9bqNOQAE+NGF6gBWz6l/8a2uXasHrHo7s70DpFozHJzLQ/Es1fYWvF9P9UNKnJR0KWo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 33 +++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 19c252f659dd0..dec4149435de1 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -858,6 +858,11 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
>  
>  static void hdmi_connector_destroy(struct drm_connector *connector)
>  {
> +	struct hdmi_context *hdata = connector_to_hdmi(connector);
> +
> +	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);

You can drop this, cec_notifier_conn_unregister() takes care of this for you.

> +	cec_notifier_conn_unregister(hdata->notifier);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -941,6 +946,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>  	struct drm_connector *connector = &hdata->connector;
> +	struct cec_connector_info conn_info;
>  	int ret;
>  
>  	connector->interlace_allowed = true;
> @@ -963,6 +969,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
>  	}
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	hdata->notifier = cec_notifier_conn_register(hdata->dev, NULL,
> +						     &conn_info);
> +	if (hdata->notifier == NULL) {
> +		ret = -ENOMEM;
> +		DRM_DEV_ERROR(hdata->dev, "Failed to allocate CEC notifier\n");
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1534,8 +1549,9 @@ static void hdmi_disable(struct drm_encoder *encoder)
>  		 */
>  		mutex_unlock(&hdata->mutex);
>  		cancel_delayed_work(&hdata->hotplug_work);
> -		cec_notifier_set_phys_addr(hdata->notifier,
> -					   CEC_PHYS_ADDR_INVALID);
> +		if (hdata->notifier)
> +			cec_notifier_set_phys_addr(hdata->notifier,
> +						   CEC_PHYS_ADDR_INVALID);

Use cec_notifier_phys_addr_invalidate().

>  		return;
>  	}
>  
> @@ -2012,12 +2028,6 @@ static int hdmi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	hdata->notifier = cec_notifier_get(&pdev->dev);
> -	if (hdata->notifier == NULL) {
> -		ret = -ENOMEM;
> -		goto err_hdmiphy;
> -	}
> -
>  	pm_runtime_enable(dev);
>  
>  	audio_infoframe = &hdata->audio.infoframe;
> @@ -2029,7 +2039,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  	ret = hdmi_register_audio_device(hdata);
>  	if (ret)
> -		goto err_notifier_put;
> +		goto err_runtime_disable;
>  
>  	ret = component_add(&pdev->dev, &hdmi_component_ops);
>  	if (ret)
> @@ -2040,8 +2050,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  err_unregister_audio:
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);
>  
>  err_hdmiphy:
> @@ -2060,12 +2069,10 @@ static int hdmi_remove(struct platform_device *pdev)
>  	struct hdmi_context *hdata = platform_get_drvdata(pdev);
>  
>  	cancel_delayed_work_sync(&hdata->hotplug_work);
> -	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
>  
>  	component_del(&pdev->dev, &hdmi_component_ops);
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -	cec_notifier_put(hdata->notifier);
>  	pm_runtime_disable(&pdev->dev);
>  
>  	if (!IS_ERR(hdata->reg_hdmi_en))
> 

Regards,

	Hans
