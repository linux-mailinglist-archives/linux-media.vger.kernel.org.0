Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E29F92065
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 11:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfHSJc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 05:32:57 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42373 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726491AbfHSJc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 05:32:57 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ze1yhLrdkDqPeze22hnetb; Mon, 19 Aug 2019 11:32:54 +0200
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-10-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <afb078a4-fcc0-348f-a44a-1bc42f9d0562@xs4all.nl>
Date:   Mon, 19 Aug 2019 11:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-10-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfItaiA0s3txtT7+Va9qL4LzgEwfX8209zJbEtkbvihu0JellZ/bJoZ/HB32Dlkr2WEvSXgzBuzF8uT/ko+i5zbYZuBLrh4eApyeCA9SUsHMmKOK+sj5t
 o/ylrZosAqvdbnWdyCDJaDVhCK18cDpDsONdjHSoGslycM+uxNLKg5kwf5/ehSo2NLwCXUujr4DndTyjHvf71ZHU/X2bkziAebZFaXuw9UQgC3CRrX8IycgD
 gPVqS6STsO6EWZ5nUHkRNetYvyNQ2rGP/p+76Zonx1OH6GgkxEjNMSjrcbf+8WoPDkoUmsBWd2ZoLHFzGkyo9JXPPP259zpe77JyOP0FV5WQjaLtKOmRJ9dd
 oZuIo07AWohuu42HaHxj8Yn8OKClgbOS5GcIOabeZxynwyU9b5ZQdygkZ2nB8wtOHtPwkmpSCNxDjzABsMw1q5lJ/2oiAbEk+En6lO9xASJYY4mkl3/qQALX
 haIpS2JI9fhgZDDM6Zxb267dhmt3wE+xQsjRmjfzDrJD3MhALXP9I8rvVDhFkYx9CMOuZdTQPU4mQ5DDGLR7GXqtwds6DlgmQIaoyg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
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
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 31 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index bc1565f1822ab..d532b468d9af5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -852,6 +852,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
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
> @@ -935,6 +939,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  {
>  	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>  	struct drm_connector *connector = &hdata->connector;
> +	struct cec_connector_info conn_info;
>  	int ret;
>  
>  	connector->interlace_allowed = true;
> @@ -957,6 +962,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
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
> @@ -1528,8 +1542,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
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
> @@ -2006,12 +2020,6 @@ static int hdmi_probe(struct platform_device *pdev)
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
> @@ -2023,7 +2031,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  	ret = hdmi_register_audio_device(hdata);
>  	if (ret)
> -		goto err_notifier_put;
> +		goto err_runtime_disable;
>  
>  	ret = component_add(&pdev->dev, &hdmi_component_ops);
>  	if (ret)
> @@ -2034,8 +2042,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  err_unregister_audio:
>  	platform_device_unregister(hdata->audio.pdev);
>  
> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);
>  
>  err_hdmiphy:
> @@ -2054,12 +2061,10 @@ static int hdmi_remove(struct platform_device *pdev)
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

