Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD74D86450
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 16:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387737AbfHHO1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 10:27:06 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40877 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728327AbfHHO1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 10:27:06 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vjNfhtxgZAffAvjNghCgH2; Thu, 08 Aug 2019 16:27:04 +0200
Subject: Re: [PATCH v5 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-10-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4113019c-560e-0a0b-e506-4eaeb0f32383@xs4all.nl>
Date:   Thu, 8 Aug 2019 16:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-10-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOvjMDa+ROqQD7DxG23tcECwajuBzIKnXitLoHkEW1cEWN7p5wR+S+4VWMDsRBMBAXZk8zHCM9wGH4FPYDYvLBvu5Vj47XeJsQ73CgkaXUkWsgHH1fiY
 XDiCFPwqHQfIlwIMkR2yo54OmTgYBFVyk14P01HXOp0LtwhI+vPhibqa8R+yxDLD9kby6BaqgoVeuuGojEHj5lWW3om0qW96zTIIteq3t2MAfpiP9mo1u6UJ
 qjZF8X4P6ElRfU9bMZftAjTGtUB56SBKI3d5wlMxr+6D0XMgSJEK8zsM0dKrFjcAxop6T+744D7MLksSTO/Qgw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v2:
> 	- removed unnecessary call to invalidate phys address before
> 	deregistering the notifier,
> 	- use cec_notifier_phys_addr_invalidate instead of setting
> 	invalid address on a notifier.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with an Odroid U3.

Regards,

	Hans

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 31 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 19c252f659dd0..5fd2551a93567 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -858,6 +858,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
>  
>  static void hdmi_connector_destroy(struct drm_connector *connector)
>  {
> +	struct hdmi_context *hdata = connector_to_hdmi(connector);
> +
> +	cec_notifier_conn_unregister(hdata->notifier);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -941,6 +945,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>  	struct drm_connector *connector = &hdata->connector;
> +	struct cec_connector_info conn_info;
>  	int ret;
>  
>  	connector->interlace_allowed = true;
> @@ -963,6 +968,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
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
> @@ -1534,8 +1548,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
>  		 */
>  		mutex_unlock(&hdata->mutex);
>  		cancel_delayed_work(&hdata->hotplug_work);
> -		cec_notifier_set_phys_addr(hdata->notifier,
> -					   CEC_PHYS_ADDR_INVALID);
> +		if (hdata->notifier)
> +			cec_notifier_phys_addr_invalidate(hdata->notifier);
>  		return;
>  	}
>  
> @@ -2012,12 +2026,6 @@ static int hdmi_probe(struct platform_device *pdev)
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
> @@ -2029,7 +2037,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  	ret = hdmi_register_audio_device(hdata);
>  	if (ret)
> -		goto err_notifier_put;
> +		goto err_runtime_disable;
>  
>  	ret = component_add(&pdev->dev, &hdmi_component_ops);
>  	if (ret)
> @@ -2040,8 +2048,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  err_unregister_audio:
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);
>  
>  err_hdmiphy:
> @@ -2060,12 +2067,10 @@ static int hdmi_remove(struct platform_device *pdev)
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

