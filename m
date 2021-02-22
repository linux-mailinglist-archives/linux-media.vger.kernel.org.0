Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5722032155C
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 12:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhBVLpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 06:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhBVLpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 06:45:42 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EE9C06174A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 03:45:01 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id e17so57010172ljl.8
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MxPlHbXYugR+GyzGQ4MNZpa+2cxc7caoJS9Q08n01BU=;
        b=FZC8vjZxFVp4FftG/9esK0jP1dhAv7nDlj0qOhskRE3t1T/CFMDrCoRiy7hE91GKzf
         0i4J0WIWeqWwVrkqsBgEeTAcT3gfdQuNy9d+7v5mi0VHKlqYpn4XAlVX95Zsfv2HQcRH
         4PRGaxqA9U7qLaFhndU/8X2VbHMLy5DodGCKsI0JSu8NKnb9ahFoqOAXeyZQfyvT5rdm
         h9T3uPM1rPn+x1wvbVqQR5DxhZNCQM6gXZbjCOY2SRPfftIYZ3WThtADniZgQsdk0Bjx
         kRRxwuAaZLFWxiaBfU/a1VYQOiCBq01LIFXiiZYLfVjihAbCiBBVw6NbKxdtk58jVKnX
         mPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MxPlHbXYugR+GyzGQ4MNZpa+2cxc7caoJS9Q08n01BU=;
        b=lg9dsH8OjBifFlnqWNsUXPCweltdYy1cZ/HkpaZ9fj8fk4hucyLoNV4y/0las9Id6q
         IfrXIspHDM/eSRntwuIe+IB9VMmNCygm/cpZcipHRyBF0nCGdcsBxihBecy8NSM71K+X
         t6kRqAAuPh4GJ/Hr4cp0r+2YTDKu89t4De39mHNRMI92OMy0waicX0l2405hxDIRiJAx
         wHtcFuXidDMB3YOWIAsQ64SjgCbV+4F/RICHbez7PJjTSbAtM5Wt+E1lyCvS20Ghac7a
         xtioauDFYnOfF19F0uXLvMZ0F+y6inEz7x5KBzZq488SWTYxBIIzWG6z3ARKRlCk3AnU
         A3hw==
X-Gm-Message-State: AOAM533h2OZfX2HneaENL5XdgT/AupRYV/nN/He/YOayob1pS4BHhKpe
        d0Pq9P7HnCqdxb27578qQHkfiA==
X-Google-Smtp-Source: ABdhPJyxalBupjjMqx5uthbbwkIK2RAXGa2eG3yqalDbS0sPVBpxWuAd0EVwFZ74kujc40vn1swk5Q==
X-Received: by 2002:a19:ca1b:: with SMTP id a27mr13209415lfg.92.1613994300095;
        Mon, 22 Feb 2021 03:45:00 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id j16sm1383636lfk.68.2021.02.22.03.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 03:44:59 -0800 (PST)
Subject: Re: [PATCH v5 12/22] media: camss: Remove per VFE power domain
 toggling
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-13-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <32b2cd1d-e41a-4571-ac4f-4ec055b3f6cb@linaro.org>
Date:   Mon, 22 Feb 2021 14:44:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-13-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

On 17.02.2021 14:21, Robert Foss wrote:
> For Titan ISPs clocks fail to re-enable during vfe_get()
> after any vfe has been halted and its corresponding power
> domain power has been detached.

OK.

> Since all of the clocks depend on all of the PDs, per
> VFE PD detaching is no option for this generation of HW.

But this patch removes camss_pm_domain_on/off calls from
vfe_get/put() for all the SOCs, not only for sdm845.
And this looks like a regression (higher power consumption)
for all the generation1 devices.

Is it possible to handle gen1 and gen2 hardware differently,
so that gen1 continued to use camss_pm_domain_on/off as
before?

Thanks,
Andrey

> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-ispif.c   | 11 ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |  7 --
>   drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++++--------
>   drivers/media/platform/qcom/camss/camss.h     | 12 +--
>   4 files changed, 60 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index fc121da4ab0c..b88f4025010a 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -323,14 +323,6 @@ static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
>   	struct camss *camss = ispif->camss;
>   	int ret;
>   
> -	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE0);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE1);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret = camss_enable_clocks(ispif->nclocks_for_reset,
>   				  ispif->clock_for_reset,
>   				  camss->dev);
> @@ -343,9 +335,6 @@ static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
>   
>   	camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
>   
> -	camss_pm_domain_off(camss, PM_DOMAIN_VFE0);
> -	camss_pm_domain_off(camss, PM_DOMAIN_VFE1);
> -
>   	return ret;
>   }
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 6fafeb8a5484..ed35f9ae9067 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -580,10 +580,6 @@ static int vfe_get(struct vfe_device *vfe)
>   	mutex_lock(&vfe->power_lock);
>   
>   	if (vfe->power_count == 0) {
> -		ret = camss_pm_domain_on(vfe->camss, vfe->id);
> -		if (ret < 0)
> -			goto error_pm_domain;
> -
>   		ret = pm_runtime_get_sync(vfe->camss->dev);
>   		if (ret < 0)
>   			goto error_pm_runtime_get;
> @@ -620,9 +616,7 @@ static int vfe_get(struct vfe_device *vfe)
>   
>   error_pm_runtime_get:
>   	pm_runtime_put_sync(vfe->camss->dev);
> -	camss_pm_domain_off(vfe->camss, vfe->id);
>   
> -error_pm_domain:
>   	mutex_unlock(&vfe->power_lock);
>   
>   	return ret;
> @@ -646,7 +640,6 @@ static void vfe_put(struct vfe_device *vfe)
>   		}
>   		camss_disable_clocks(vfe->nclocks, vfe->clock);
>   		pm_runtime_put_sync(vfe->camss->dev);
> -		camss_pm_domain_off(vfe->camss, vfe->id);
>   	}
>   
>   	vfe->power_count--;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5d0479b5589c..3c45537b2cfb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -774,28 +774,6 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
>   	return 0;
>   }
>   
> -int camss_pm_domain_on(struct camss *camss, int id)
> -{
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660) {
> -		camss->genpd_link[id] = device_link_add(camss->dev,
> -				camss->genpd[id], DL_FLAG_STATELESS |
> -				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> -
> -		if (!camss->genpd_link[id])
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -void camss_pm_domain_off(struct camss *camss, int id)
> -{
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660)
> -		device_link_del(camss->genpd_link[id]);
> -}
> -
>   /*
>    * camss_of_parse_endpoint_node - Parse port endpoint node
>    * @dev: Device
> @@ -1207,6 +1185,48 @@ static const struct media_device_ops camss_media_ops = {
>   	.link_notify = v4l2_pipeline_link_notify,
>   };
>   
> +
> +static int camss_configure_pd(struct camss *camss)
> +{
> +	int nbr_pm_domains = 0;
> +	int last_pm_domain = 0;
> +	int i;
> +	int ret;
> +
> +	if (camss->version == CAMSS_8x96 ||
> +	    camss->version == CAMSS_660)
> +		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
> +
> +	for (i = 0; i < nbr_pm_domains; i++) {
> +		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
> +		if (IS_ERR(camss->genpd[i])) {
> +			ret = PTR_ERR(camss->genpd[i]);
> +			goto fail_pm;
> +		}
> +
> +		camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
> +			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +
> +		if (!camss->genpd_link[i]) {
> +			dev_pm_domain_detach(camss->genpd[i], true);
> +			ret = -EINVAL;
> +			goto fail_pm;
> +		}
> +
> +		last_pm_domain = i;
> +	}
> +
> +	return 0;
> +
> +fail_pm:
> +	for (i = 0; i < last_pm_domain; i++) {
> +		device_link_del(camss->genpd_link[i]);
> +		dev_pm_domain_detach(camss->genpd[i], true);
> +	}
> +
> +	return ret;
> +}
> +
>   /*
>    * camss_probe - Probe CAMSS platform device
>    * @pdev: Pointer to CAMSS platform device
> @@ -1339,20 +1359,10 @@ static int camss_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660) {
> -		camss->genpd[PM_DOMAIN_VFE0] = dev_pm_domain_attach_by_id(
> -						camss->dev, PM_DOMAIN_VFE0);
> -		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE0]))
> -			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE0]);
> -
> -		camss->genpd[PM_DOMAIN_VFE1] = dev_pm_domain_attach_by_id(
> -						camss->dev, PM_DOMAIN_VFE1);
> -		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE1])) {
> -			dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0],
> -					     true);
> -			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE1]);
> -		}
> +	ret = camss_configure_pd(camss);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to configure power domains: %d\n", ret);
> +		return ret;
>   	}
>   
>   	pm_runtime_enable(dev);
> @@ -1373,6 +1383,9 @@ static int camss_probe(struct platform_device *pdev)
>   
>   void camss_delete(struct camss *camss)
>   {
> +	int nbr_pm_domains = 0;
> +	int i;
> +
>   	v4l2_device_unregister(&camss->v4l2_dev);
>   	media_device_unregister(&camss->media_dev);
>   	media_device_cleanup(&camss->media_dev);
> @@ -1380,9 +1393,12 @@ void camss_delete(struct camss *camss)
>   	pm_runtime_disable(camss->dev);
>   
>   	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660) {
> -		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
> -		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
> +	    camss->version == CAMSS_660)
> +		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
> +
> +	for (i = 0; i < nbr_pm_domains; i++) {
> +		device_link_del(camss->genpd_link[i]);
> +		dev_pm_domain_detach(camss->genpd[i], true);
>   	}
>   
>   	kfree(camss);
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index b7ad8e9f68a8..7560d85b3352 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -57,9 +57,9 @@ struct resources_ispif {
>   };
>   
>   enum pm_domain {
> -	PM_DOMAIN_VFE0,
> -	PM_DOMAIN_VFE1,
> -	PM_DOMAIN_COUNT
> +	PM_DOMAIN_VFE0 = 0,
> +	PM_DOMAIN_VFE1 = 1,
> +	PM_DOMAIN_CAMSS_COUNT = 2,	/* CAMSS series of ISPs */
>   };
>   
>   enum camss_version {
> @@ -83,8 +83,8 @@ struct camss {
>   	int vfe_num;
>   	struct vfe_device *vfe;
>   	atomic_t ref_count;
> -	struct device *genpd[PM_DOMAIN_COUNT];
> -	struct device_link *genpd_link[PM_DOMAIN_COUNT];
> +	struct device *genpd[PM_DOMAIN_CAMSS_COUNT];
> +	struct device_link *genpd_link[PM_DOMAIN_CAMSS_COUNT];
>   };
>   
>   struct camss_camera_interface {
> @@ -110,8 +110,6 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_entity *camss_find_sensor(struct media_entity *entity);
>   int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
> -int camss_pm_domain_on(struct camss *camss, int id);
> -void camss_pm_domain_off(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
>   
>   #endif /* QC_MSM_CAMSS_H */
> 
