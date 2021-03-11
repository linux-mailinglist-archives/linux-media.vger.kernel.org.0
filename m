Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E8337600
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhCKOoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbhCKOnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:43:51 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3230C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 06:43:50 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 184so2458548ljf.9
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v2jrYTb1SCxF/JCCQU98oFyXQ/569Pvs+HCej3w7NsE=;
        b=PaKC8OR27TgvJVP3M1WA6VPFzUIfv/6HYvuumSG5xZfnRc0zVUTA/pPO/XNYGF1znz
         /wPiohDN5E9XBy3FCTw1hxx3b5zT6Gskwq5Y8mVlXkNnUQaa26FFQEg/h6lU0lwyof60
         iRq7baFOepz78YluhloY8AyIsVhv11QdTTCHCyXzZ8no/AQKZtW9Jipx1g5tb7W3TxZm
         5uekdaZkQriUu56DMiEv1bbBzTjeHrISypSk14BP40iORuDPEn/ZPYmuUMheYE89VxiK
         ilfzMG1/2NumbM/0uZWhkuM3JwGRE4WWhZvXXFcAE2JXyYdzm9Ob3XQsHqVkgcJHQxhD
         C3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2jrYTb1SCxF/JCCQU98oFyXQ/569Pvs+HCej3w7NsE=;
        b=kuwR5bbc8RIL9O55kCIMc0DllZM4RU/tcEO0DlhJfuS4m57F1I7EEeXa/gvWSPQlu6
         kK7FKVHW7WnVTNPwkU89Ev3BgpN9nLXV8LEwTUeB6Imlv3j/bPhy/5rCRuX2hBI2Q06Q
         /FcANvUHsDRoBSqfBmJ2vQUwVJ+yVmk0F1kG3VYDzCzSQb88V/+s0gLFkDzur2Or+NeR
         lIX27mPOctmIue5VINuBZ7iRszy5hR8NPbdz5nPWdYHU+SFWC8swRyi7qmpFA3m9KFev
         twSrRaPo7xrZ8CyqrceUPWI5FtKXZamYTctE1U5lKWojNMLZ4N3DL9ROK0d2CYnHy+dt
         MjNg==
X-Gm-Message-State: AOAM530OoIvPkJ62jVoMGycDxXYV21EnlODcLGJjQGBECz0Y6WHqrfFv
        BN0luleifS4ZYB72r3S4N4W+nw==
X-Google-Smtp-Source: ABdhPJzdtNyEIfM1ZRwHc5QfHNm5NEhqlQguTYtqUp9ABmv4+SD96OFpSNw86S8FGdCJFDYKSUz14w==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr4842665ljp.397.1615473828889;
        Thu, 11 Mar 2021 06:43:48 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id q12sm1057604ljj.49.2021.03.11.06.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 06:43:48 -0800 (PST)
Subject: Re: [PATCH v6 12/22] media: camss: Remove per VFE power domain
 toggling
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210304120326.153966-1-robert.foss@linaro.org>
 <20210304120326.153966-13-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <a60346bb-4929-c6c1-cd47-4b732175d6c7@linaro.org>
Date:   Thu, 11 Mar 2021 17:43:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304120326.153966-13-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for the patch!

On 04.03.2021 15:03, Robert Foss wrote:
> For Titan ISPs clocks fail to re-enable during vfe_get()
> after any vfe has been halted and its corresponding power
> domain power has been detached.
> 
> Since all of the clocks depend on all of the PDs, per
> VFE PD detaching is no option for this generation of HW.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> 
> Changes since v5:
>   - Andrey: Bifurcated PD support into Gen1 & Gen2 paths

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

>   .../media/platform/qcom/camss/camss-vfe-170.c | 21 +++++
>   .../media/platform/qcom/camss/camss-vfe-4-1.c | 19 ++++
>   .../media/platform/qcom/camss/camss-vfe-4-7.c | 39 ++++++++
>   .../media/platform/qcom/camss/camss-vfe-4-8.c | 34 +++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c |  6 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
>   drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++++++------
>   drivers/media/platform/qcom/camss/camss.h     | 10 +-
>   8 files changed, 189 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index ce1130108e01..99f27124ad3b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -714,6 +714,25 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   }
>   
> +/*
> + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static void vfe_pm_domain_off(struct vfe_device *vfe)
> +{
> +
> +}
> +
> +
> +/*
> + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static int vfe_pm_domain_on(struct vfe_device *vfe)
> +{
> +	return 0;
> +}
> +
>   /*
>    * vfe_queue_buffer - Add empty buffer
>    * @vid: Video device structure
> @@ -775,6 +794,8 @@ const struct vfe_hw_ops vfe_ops_170 = {
>   	.hw_version_read = vfe_hw_version_read,
>   	.isr_read = vfe_isr_read,
>   	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
>   	.reg_update_clear = vfe_reg_update_clear,
>   	.reg_update = vfe_reg_update,
>   	.subdev_init = vfe_subdev_init,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 81756d7fd5c2..9fc44be3ccb8 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -938,6 +938,23 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +/*
> + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static void vfe_pm_domain_off(struct vfe_device *vfe)
> +{
> +
> +}
> +
> +/*
> + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static int vfe_pm_domain_on(struct vfe_device *vfe)
> +{
> +	return 0;
> +}
>   
>   const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
>   	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
> @@ -990,6 +1007,8 @@ const struct vfe_hw_ops vfe_ops_4_1 = {
>   	.hw_version_read = vfe_hw_version_read,
>   	.isr_read = vfe_isr_read,
>   	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
>   	.reg_update_clear = vfe_reg_update_clear,
>   	.reg_update = vfe_reg_update,
>   	.subdev_init = vfe_subdev_init,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> index 5ecb87f1b047..41cf150d9efe 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> @@ -8,6 +8,7 @@
>    * Copyright (C) 2015-2018 Linaro Ltd.
>    */
>   
> +#include <linux/device.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
> @@ -1104,6 +1105,42 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
>   	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
>   }
>   
> +/*
> + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static void vfe_pm_domain_off(struct vfe_device *vfe)
> +{
> +	struct camss *camss;
> +
> +	if (!vfe)
> +		return;
> +
> +	camss = vfe->camss;
> +
> +	device_link_del(camss->genpd_link[vfe->id]);
> +}
> +
> +/*
> + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static int vfe_pm_domain_on(struct vfe_device *vfe)
> +{
> +	struct camss *camss = vfe->camss;
> +	enum vfe_line_id id = vfe->id;
> +
> +	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
> +						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +
> +	if (!camss->genpd_link[id]) {
> +		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static void vfe_violation_read(struct vfe_device *vfe)
>   {
>   	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
> @@ -1162,6 +1199,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
>   	.hw_version_read = vfe_hw_version_read,
>   	.isr_read = vfe_isr_read,
>   	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
>   	.reg_update_clear = vfe_reg_update_clear,
>   	.reg_update = vfe_reg_update,
>   	.subdev_init = vfe_subdev_init,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> index 732b93b365d3..f368870ae36d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> @@ -8,6 +8,7 @@
>    * Copyright (C) 2015-2021 Linaro Ltd.
>    */
>   
> +#include <linux/device.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
> @@ -1098,6 +1099,37 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
>   	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
>   }
>   
> +/*
> + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static void vfe_pm_domain_off(struct vfe_device *vfe)
> +{
> +	struct camss *camss = vfe->camss;
> +
> +	device_link_del(camss->genpd_link[vfe->id]);
> +}
> +
> +/*
> + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static int vfe_pm_domain_on(struct vfe_device *vfe)
> +{
> +	struct camss *camss = vfe->camss;
> +	enum vfe_line_id id = vfe->id;
> +
> +	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
> +						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +
> +	if (!camss->genpd_link[id]) {
> +		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static void vfe_violation_read(struct vfe_device *vfe)
>   {
>   	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
> @@ -1156,6 +1188,8 @@ const struct vfe_hw_ops vfe_ops_4_8 = {
>   	.hw_version_read = vfe_hw_version_read,
>   	.isr_read = vfe_isr_read,
>   	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
>   	.reg_update_clear = vfe_reg_update_clear,
>   	.reg_update = vfe_reg_update,
>   	.subdev_init = vfe_subdev_init,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 6fafeb8a5484..402f18729f9f 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -580,7 +580,7 @@ static int vfe_get(struct vfe_device *vfe)
>   	mutex_lock(&vfe->power_lock);
>   
>   	if (vfe->power_count == 0) {
> -		ret = camss_pm_domain_on(vfe->camss, vfe->id);
> +		ret = vfe->ops->pm_domain_on(vfe);
>   		if (ret < 0)
>   			goto error_pm_domain;
>   
> @@ -620,7 +620,7 @@ static int vfe_get(struct vfe_device *vfe)
>   
>   error_pm_runtime_get:
>   	pm_runtime_put_sync(vfe->camss->dev);
> -	camss_pm_domain_off(vfe->camss, vfe->id);
> +	vfe->ops->pm_domain_off(vfe);
>   
>   error_pm_domain:
>   	mutex_unlock(&vfe->power_lock);
> @@ -646,7 +646,7 @@ static void vfe_put(struct vfe_device *vfe)
>   		}
>   		camss_disable_clocks(vfe->nclocks, vfe->clock);
>   		pm_runtime_put_sync(vfe->camss->dev);
> -		camss_pm_domain_off(vfe->camss, vfe->id);
> +		vfe->ops->pm_domain_off(vfe);
>   	}
>   
>   	vfe->power_count--;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 29b3d930ffc6..05839a9f60f6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -106,6 +106,8 @@ struct vfe_hw_ops {
>   	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
>   	irqreturn_t (*isr)(int irq, void *dev);
>   	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
> +	void (*pm_domain_off)(struct vfe_device *vfe);
> +	int (*pm_domain_on)(struct vfe_device *vfe);
>   	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
>   	void (*reg_update_clear)(struct vfe_device *vfe,
>   				 enum vfe_line_id line_id);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5d0479b5589c..0a9388227c59 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -776,24 +776,24 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
>   
>   int camss_pm_domain_on(struct camss *camss, int id)
>   {
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660) {
> -		camss->genpd_link[id] = device_link_add(camss->dev,
> -				camss->genpd[id], DL_FLAG_STATELESS |
> -				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +	int ret = 0;
> +
> +	if (id < camss->vfe_num) {
> +		struct vfe_device *vfe = &camss->vfe[id];
>   
> -		if (!camss->genpd_link[id])
> -			return -EINVAL;
> +		ret = vfe->ops->pm_domain_on(vfe);
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   void camss_pm_domain_off(struct camss *camss, int id)
>   {
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660)
> -		device_link_del(camss->genpd_link[id]);
> +	if (id < camss->vfe_num) {
> +		struct vfe_device *vfe = &camss->vfe[id];
> +
> +		vfe->ops->pm_domain_off(vfe);
> +	}
>   }
>   
>   /*
> @@ -1207,6 +1207,48 @@ static const struct media_device_ops camss_media_ops = {
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
> +		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
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
> @@ -1339,20 +1381,10 @@ static int camss_probe(struct platform_device *pdev)
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
> @@ -1373,6 +1405,9 @@ static int camss_probe(struct platform_device *pdev)
>   
>   void camss_delete(struct camss *camss)
>   {
> +	int nbr_pm_domains = 0;
> +	int i;
> +
>   	v4l2_device_unregister(&camss->v4l2_dev);
>   	media_device_unregister(&camss->media_dev);
>   	media_device_cleanup(&camss->media_dev);
> @@ -1380,9 +1415,12 @@ void camss_delete(struct camss *camss)
>   	pm_runtime_disable(camss->dev);
>   
>   	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660) {
> -		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
> -		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
> +	    camss->version == CAMSS_660)
> +		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> +
> +	for (i = 0; i < nbr_pm_domains; i++) {
> +		device_link_del(camss->genpd_link[i]);
> +		dev_pm_domain_detach(camss->genpd[i], true);
>   	}
>   
>   	kfree(camss);
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index b7ad8e9f68a8..244991710879 100644
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
> +	PM_DOMAIN_GEN1_COUNT = 2,	/* CAMSS series of ISPs */
>   };
>   
>   enum camss_version {
> @@ -83,8 +83,8 @@ struct camss {
>   	int vfe_num;
>   	struct vfe_device *vfe;
>   	atomic_t ref_count;
> -	struct device *genpd[PM_DOMAIN_COUNT];
> -	struct device_link *genpd_link[PM_DOMAIN_COUNT];
> +	struct device *genpd[PM_DOMAIN_GEN1_COUNT];
> +	struct device_link *genpd_link[PM_DOMAIN_GEN1_COUNT];
>   };
>   
>   struct camss_camera_interface {
> 
