Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1539331585F
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 22:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhBIVN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 16:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbhBIU7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 15:59:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331BEC0613D6
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 12:59:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f1so30543184lfu.3
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 12:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cMk2WPytum719c+kcMb7LaS8xgqJCOGt5qImbLMSOqI=;
        b=jENxbbaZrKUXXq07VHi2mDTT52uTDkqSSjpUmn4dTNtL/mR2UJy+bpTRMvVZoe4LFB
         rYwUMN019+XqfNLMMP2RjJWChxPHx5mqYI/lObgUD5v7oqD5Wkll5vsTJILvhu7k8ViB
         SttXDoADkb1pPLrbW4AXv/NF7EffOAm0pVAPDr1G8XZrGBFrydgsOTeXiFN0jbdNS6Yg
         QIrB5kxEafelHuSQ6rqVDtPOYgo4PTp1xz2xQzvCo5ECTVF3bPsy611rr64xveII8pCX
         UqvcwSN69N+I5xTemRC1B0V3G9gicS+F5NAfKeob96Bza7bbZph100/3vAFwbW1hk5qm
         hX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cMk2WPytum719c+kcMb7LaS8xgqJCOGt5qImbLMSOqI=;
        b=Jr34GWlt9jFEFSDbJq6SWTd7oH1NcoXB4N1uPsp3eIjml+UZ+RLgb2iW3dmJx379eJ
         bsi2qBGycpJ+lMNaxg0UbyZpzL0T6Pwz5OEeLW32HVc6LNrFBOYIbxnEVdcbWN9YX6Tu
         6e3BKZnGIIU/dTxNaczCJto5ZZxVyAXeaJYA2bPTHJe+2z1+s3rHyQBTGIDwXm0q2p6f
         7Z+wK5KcZO9Mm+Rey28S9vbt0tBvfW0xfH+lzpvpgElb7yYn+0Y9vSOSLOAMxEuE5cQX
         2LIEsT86mqgvJX9MiHOxabKmJPkWrUMBg/aNWgbcgpZNkNkpPA3Sz7pPZXW2/LIcGnMh
         eg3w==
X-Gm-Message-State: AOAM533BmC2Tf1Buzt+34msmy6eKxTeNptxWqfSg8rYzacysKNgvqtJL
        LVy2WLqwPuQYir60OlTpF19glA==
X-Google-Smtp-Source: ABdhPJxqIsPaEHLrnHTmzEWrkRkIEdnmFdDtjmYTbHp3zyCFkWTmrcKA9IXecXBbI/QsdIdo4dTMvQ==
X-Received: by 2002:ac2:5327:: with SMTP id f7mr3857828lfh.82.1612904343381;
        Tue, 09 Feb 2021 12:59:03 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id t13sm2706425lfc.147.2021.02.09.12.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 12:59:02 -0800 (PST)
Subject: Re: [PATCH v4 05/22] media: camss: Make ISPIF subdevice optional
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-6-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <17d3e2e8-497a-bf4e-66ac-7ed1a4c9bde6@linaro.org>
Date:   Tue, 9 Feb 2021 23:59:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205104414.299732-6-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

On 05.02.2021 13:43, Robert Foss wrote:
> This driver supports multiple architecture versions of the Qualcomm ISP.
> The CAMSS architecure which this driver is name after, and with the
> introduction of this series, the Titan architecture.
> 
> The ISPIF is an IP-block that is only present in the CAMSS generation of
> the architecture. In order to support the Titan generation, make the
> ISPIF an optional subdevice.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>   - Björn: Improved commit message
>   - Björn: Use local 'dev' ptr instead of 'camss->dev'
>   - Björn: Remove res/ispif NULL checks
>   - Björn: Remove ispif NULL checks before calling
>     msm_ispif_unregister_entities()
>   - Andrey: Fixed incorrect allocation size
> 
> 
>   .../media/platform/qcom/camss/camss-ispif.c   | 114 ++++++++++--------
>   .../media/platform/qcom/camss/camss-ispif.h   |   3 +-
>   drivers/media/platform/qcom/camss/camss.c     | 111 +++++++++++------
>   drivers/media/platform/qcom/camss/camss.h     |   2 +-
>   4 files changed, 142 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index adeb92808998..c36570042082 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -161,6 +161,7 @@ static const u32 ispif_formats_8x96[] = {
>   static irqreturn_t ispif_isr_8x96(int irq, void *dev)
>   {
>   	struct ispif_device *ispif = dev;
> +	struct camss *camss = ispif->camss;
>   	u32 value0, value1, value2, value3, value4, value5;
>   
>   	value0 = readl_relaxed(ispif->base + ISPIF_VFE_m_IRQ_STATUS_0(0));
> @@ -186,34 +187,34 @@ static irqreturn_t ispif_isr_8x96(int irq, void *dev)
>   		complete(&ispif->reset_complete[1]);
>   
>   	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 pix0 overflow\n");
>   
>   	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi0 overflow\n");
>   
>   	if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 pix1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 pix1 overflow\n");
>   
>   	if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi1 overflow\n");
>   
>   	if (unlikely(value2 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi2 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi2 overflow\n");
>   
>   	if (unlikely(value3 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE1 pix0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE1 pix0 overflow\n");
>   
>   	if (unlikely(value3 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE1 rdi0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE1 rdi0 overflow\n");
>   
>   	if (unlikely(value4 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE1 pix1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE1 pix1 overflow\n");
>   
>   	if (unlikely(value4 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE1 rdi1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE1 rdi1 overflow\n");
>   
>   	if (unlikely(value5 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE1 rdi2 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE1 rdi2 overflow\n");
>   
>   	return IRQ_HANDLED;
>   }
> @@ -228,6 +229,7 @@ static irqreturn_t ispif_isr_8x96(int irq, void *dev)
>   static irqreturn_t ispif_isr_8x16(int irq, void *dev)
>   {
>   	struct ispif_device *ispif = dev;
> +	struct camss *camss = ispif->camss;
>   	u32 value0, value1, value2;
>   
>   	value0 = readl_relaxed(ispif->base + ISPIF_VFE_m_IRQ_STATUS_0(0));
> @@ -244,30 +246,32 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
>   		complete(&ispif->reset_complete[0]);
>   
>   	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 pix0 overflow\n");
>   
>   	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_RDI0_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi0 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi0 overflow\n");
>   
>   	if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_PIX1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 pix1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 pix1 overflow\n");
>   
>   	if (unlikely(value1 & ISPIF_VFE_m_IRQ_STATUS_1_RDI1_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi1 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi1 overflow\n");
>   
>   	if (unlikely(value2 & ISPIF_VFE_m_IRQ_STATUS_2_RDI2_OVERFLOW))
> -		dev_err_ratelimited(to_device(ispif), "VFE0 rdi2 overflow\n");
> +		dev_err_ratelimited(camss->dev, "VFE0 rdi2 overflow\n");
>   
>   	return IRQ_HANDLED;
>   }
>   
>   static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>   {
> +	struct camss *camss = ispif->camss;
> +
>   	unsigned long time;
>   	u32 val;
>   
> -	if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
> -		dev_err(to_device(ispif),
> +	if (vfe_id > (camss->vfe_num - 1)) {
> +		dev_err(camss->dev,
>   			"Error: asked reset for invalid VFE%d\n", vfe_id);
>   		return -ENOENT;
>   	}
> @@ -300,7 +304,7 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>   	time = wait_for_completion_timeout(&ispif->reset_complete[vfe_id],
>   		msecs_to_jiffies(ISPIF_RESET_TIMEOUT_MS));
>   	if (!time) {
> -		dev_err(to_device(ispif),
> +		dev_err(camss->dev,
>   			"ISPIF for VFE%d reset timeout\n", vfe_id);
>   		return -EIO;
>   	}
> @@ -316,30 +320,31 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>    */
>   static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
>   {
> +	struct camss *camss = ispif->camss;
>   	int ret;
>   
> -	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
> +	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE0);
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
> +	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE1);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = camss_enable_clocks(ispif->nclocks_for_reset,
>   				  ispif->clock_for_reset,
> -				  to_device(ispif));
> +				  camss->dev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = ispif_vfe_reset(ispif, vfe_id);
>   	if (ret)
> -		dev_dbg(to_device(ispif), "ISPIF Reset failed\n");
> +		dev_dbg(camss->dev, "ISPIF Reset failed\n");
>   
>   	camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
>   
> -	camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE0);
> -	camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE1);
> +	camss_pm_domain_off(camss, PM_DOMAIN_VFE0);
> +	camss_pm_domain_off(camss, PM_DOMAIN_VFE1);
>   
>   	return ret;
>   }
> @@ -355,7 +360,7 @@ static int ispif_set_power(struct v4l2_subdev *sd, int on)
>   {
>   	struct ispif_line *line = v4l2_get_subdevdata(sd);
>   	struct ispif_device *ispif = line->ispif;
> -	struct device *dev = to_device(ispif);
> +	struct device *dev = ispif->camss->dev;
>   	int ret = 0;
>   
>   	mutex_lock(&ispif->power_lock);
> @@ -505,7 +510,7 @@ static int ispif_validate_intf_status(struct ispif_device *ispif,
>   	}
>   
>   	if ((val & 0xf) != 0xf) {
> -		dev_err(to_device(ispif), "%s: ispif is busy: 0x%x\n",
> +		dev_err(ispif->camss->dev, "%s: ispif is busy: 0x%x\n",
>   			__func__, val);
>   		ret = -EBUSY;
>   	}
> @@ -552,7 +557,7 @@ static int ispif_wait_for_stop(struct ispif_device *ispif,
>   				 ISPIF_TIMEOUT_SLEEP_US,
>   				 ISPIF_TIMEOUT_ALL_US);
>   	if (ret < 0)
> -		dev_err(to_device(ispif), "%s: ispif stop timeout\n",
> +		dev_err(ispif->camss->dev, "%s: ispif stop timeout\n",
>   			__func__);
>   
>   	return ret;
> @@ -800,6 +805,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>   {
>   	struct ispif_line *line = v4l2_get_subdevdata(sd);
>   	struct ispif_device *ispif = line->ispif;
> +	struct camss *camss = ispif->camss;
>   	enum ispif_intf intf = line->interface;
>   	u8 csid = line->csid_id;
>   	u8 vfe = line->vfe_id;
> @@ -825,8 +831,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>   		ispif_select_csid(ispif, intf, csid, vfe, 1);
>   		ispif_select_cid(ispif, intf, cid, vfe, 1);
>   		ispif_config_irq(ispif, intf, vfe, 1);
> -		if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		    to_camss(ispif)->version == CAMSS_660)
> +		if (camss->version == CAMSS_8x96 ||
> +		    camss->version == CAMSS_660)
>   			ispif_config_pack(ispif,
>   					  line->fmt[MSM_ISPIF_PAD_SINK].code,
>   					  intf, cid, vfe, 1);
> @@ -843,8 +849,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>   			return ret;
>   
>   		mutex_lock(&ispif->config_lock);
> -		if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		    to_camss(ispif)->version == CAMSS_660)
> +		if (camss->version == CAMSS_8x96 ||
> +		    camss->version == CAMSS_660)
>   			ispif_config_pack(ispif,
>   					  line->fmt[MSM_ISPIF_PAD_SINK].code,
>   					  intf, cid, vfe, 0);
> @@ -1088,26 +1094,29 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>    *
>    * Return 0 on success or a negative error code otherwise
>    */
> -int msm_ispif_subdev_init(struct ispif_device *ispif,
> +int msm_ispif_subdev_init(struct camss *camss,
>   			  const struct resources_ispif *res)
>   {
> -	struct device *dev = to_device(ispif);
> +	struct device *dev = camss->dev;
> +	struct ispif_device *ispif = camss->ispif;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct resource *r;
>   	int i;
>   	int ret;
>   
> +	ispif->camss = camss;
> +
>   	/* Number of ISPIF lines - same as number of CSID hardware modules */
> -	if (to_camss(ispif)->version == CAMSS_8x16)
> +	if (camss->version == CAMSS_8x16)
>   		ispif->line_num = 2;
> -	else if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		 to_camss(ispif)->version == CAMSS_660)
> +	else if (camss->version == CAMSS_8x96 ||
> +		 camss->version == CAMSS_660)
>   		ispif->line_num = 4;
>   	else
>   		return -EINVAL;
>   
> -	ispif->line = devm_kcalloc(dev, ispif->line_num, sizeof(*ispif->line),
> -				   GFP_KERNEL);
> +	ispif->line = devm_kcalloc(dev, ispif->line_num,
> +			sizeof(*ispif->line), GFP_KERNEL);
>   	if (!ispif->line)
>   		return -ENOMEM;
>   
> @@ -1115,12 +1124,12 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   		ispif->line[i].ispif = ispif;
>   		ispif->line[i].id = i;
>   
> -		if (to_camss(ispif)->version == CAMSS_8x16) {
> +		if (camss->version == CAMSS_8x16) {
>   			ispif->line[i].formats = ispif_formats_8x16;
>   			ispif->line[i].nformats =
>   					ARRAY_SIZE(ispif_formats_8x16);
> -		} else if (to_camss(ispif)->version == CAMSS_8x96 ||
> -			   to_camss(ispif)->version == CAMSS_660) {
> +		} else if (camss->version == CAMSS_8x96 ||
> +			   camss->version == CAMSS_660) {
>   			ispif->line[i].formats = ispif_formats_8x96;
>   			ispif->line[i].nformats =
>   					ARRAY_SIZE(ispif_formats_8x96);
> @@ -1157,15 +1166,16 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	ispif->irq = r->start;
>   	snprintf(ispif->irq_name, sizeof(ispif->irq_name), "%s_%s",
>   		 dev_name(dev), MSM_ISPIF_NAME);
> -	if (to_camss(ispif)->version == CAMSS_8x16)
> +	if (camss->version == CAMSS_8x16)
>   		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
> -	else if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		 to_camss(ispif)->version == CAMSS_660)
> +	else if (camss->version == CAMSS_8x96 ||
> +		 camss->version == CAMSS_660)
>   		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>   	else
>   		ret = -EINVAL;
> +
>   	if (ret < 0) {
>   		dev_err(dev, "request_irq failed: %d\n", ret);
>   		return ret;
> @@ -1331,10 +1341,13 @@ static const struct media_entity_operations ispif_media_ops = {
>   int msm_ispif_register_entities(struct ispif_device *ispif,
>   				struct v4l2_device *v4l2_dev)
>   {
> -	struct device *dev = to_device(ispif);
> +	struct camss *camss =  ispif->camss;

- here ispif is used before the if (!ispif) check below...

>   	int ret;
>   	int i;

... and here is the check:

> +	if (!ispif)
> +		return 0;

Thanks,
Andrey

> +
>   	for (i = 0; i < ispif->line_num; i++) {
>   		struct v4l2_subdev *sd = &ispif->line[i].subdev;
>   		struct media_pad *pads = ispif->line[i].pads;
> @@ -1348,7 +1361,7 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
>   
>   		ret = ispif_init_formats(sd, NULL);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to init format: %d\n", ret);
> +			dev_err(camss->dev, "Failed to init format: %d\n", ret);
>   			goto error;
>   		}
>   
> @@ -1360,13 +1373,15 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
>   		ret = media_entity_pads_init(&sd->entity, MSM_ISPIF_PADS_NUM,
>   					     pads);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to init media entity: %d\n", ret);
> +			dev_err(camss->dev, "Failed to init media entity: %d\n",
> +				ret);
>   			goto error;
>   		}
>   
>   		ret = v4l2_device_register_subdev(v4l2_dev, sd);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to register subdev: %d\n", ret);
> +			dev_err(camss->dev, "Failed to register subdev: %d\n",
> +				ret);
>   			media_entity_cleanup(&sd->entity);
>   			goto error;
>   		}
> @@ -1393,6 +1408,9 @@ void msm_ispif_unregister_entities(struct ispif_device *ispif)
>   {
>   	int i;
>   
> +	if (!ispif)
> +		return;
> +
>   	mutex_destroy(&ispif->power_lock);
>   	mutex_destroy(&ispif->config_lock);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/media/platform/qcom/camss/camss-ispif.h
> index 4132174f7ea1..fdf28e68cc7d 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.h
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.h
> @@ -63,11 +63,12 @@ struct ispif_device {
>   	struct mutex config_lock;
>   	unsigned int line_num;
>   	struct ispif_line *line;
> +	struct camss *camss;
>   };
>   
>   struct resources_ispif;
>   
> -int msm_ispif_subdev_init(struct ispif_device *ispif,
> +int msm_ispif_subdev_init(struct camss *camss,
>   			  const struct resources_ispif *res);
>   
>   int msm_ispif_register_entities(struct ispif_device *ispif,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 8fefce57bc49..b966de344b5b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -748,11 +748,13 @@ static int camss_init_subdevices(struct camss *camss)
>   		}
>   	}
>   
> -	ret = msm_ispif_subdev_init(&camss->ispif, ispif_res);
> -	if (ret < 0) {
> -		dev_err(camss->dev, "Failed to init ispif sub-device: %d\n",
> +	if (camss->ispif) {
> +		ret = msm_ispif_subdev_init(camss, ispif_res);
> +		if (ret < 0) {
> +			dev_err(camss->dev, "Failed to init ispif sub-device: %d\n",
>   			ret);
> -		return ret;
> +			return ret;
> +		}
>   	}
>   
>   	for (i = 0; i < camss->vfe_num; i++) {
> @@ -801,11 +803,14 @@ static int camss_register_entities(struct camss *camss)
>   		}
>   	}
>   
> -	ret = msm_ispif_register_entities(&camss->ispif, &camss->v4l2_dev);
> -	if (ret < 0) {
> -		dev_err(camss->dev, "Failed to register ispif entities: %d\n",
> +	if (camss->ispif) {
> +		ret = msm_ispif_register_entities(camss->ispif,
> +						  &camss->v4l2_dev);
> +		if (ret < 0) {
> +			dev_err(camss->dev, "Failed to register ispif entities: %d\n",
>   			ret);
> -		goto err_reg_ispif;
> +			goto err_reg_ispif;
> +		}
>   	}
>   
>   	for (i = 0; i < camss->vfe_num; i++) {
> @@ -838,43 +843,64 @@ static int camss_register_entities(struct camss *camss)
>   		}
>   	}
>   
> -	for (i = 0; i < camss->csid_num; i++) {
> -		for (j = 0; j < camss->ispif.line_num; j++) {
> -			ret = media_create_pad_link(
> -				&camss->csid[i].subdev.entity,
> -				MSM_CSID_PAD_SRC,
> -				&camss->ispif.line[j].subdev.entity,
> -				MSM_ISPIF_PAD_SINK,
> -				0);
> -			if (ret < 0) {
> -				dev_err(camss->dev,
> -					"Failed to link %s->%s entities: %d\n",
> -					camss->csid[i].subdev.entity.name,
> -					camss->ispif.line[j].subdev.entity.name,
> -					ret);
> -				goto err_link;
> -			}
> -		}
> -	}
> -
> -	for (i = 0; i < camss->ispif.line_num; i++)
> -		for (k = 0; k < camss->vfe_num; k++)
> -			for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> +	if (camss->ispif) {
> +		for (i = 0; i < camss->csid_num; i++) {
> +			for (j = 0; j < camss->ispif->line_num; j++) {
>   				ret = media_create_pad_link(
> -					&camss->ispif.line[i].subdev.entity,
> -					MSM_ISPIF_PAD_SRC,
> -					&camss->vfe[k].line[j].subdev.entity,
> -					MSM_VFE_PAD_SINK,
> +					&camss->csid[i].subdev.entity,
> +					MSM_CSID_PAD_SRC,
> +					&camss->ispif->line[j].subdev.entity,
> +					MSM_ISPIF_PAD_SINK,
>   					0);
>   				if (ret < 0) {
>   					dev_err(camss->dev,
>   						"Failed to link %s->%s entities: %d\n",
> -						camss->ispif.line[i].subdev.entity.name,
> -						camss->vfe[k].line[j].subdev.entity.name,
> +						camss->csid[i].subdev.entity.name,
> +						camss->ispif->line[j].subdev.entity.name,
>   						ret);
>   					goto err_link;
>   				}
>   			}
> +		}
> +
> +		for (i = 0; i < camss->ispif->line_num; i++)
> +			for (k = 0; k < camss->vfe_num; k++)
> +				for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> +					ret = media_create_pad_link(
> +						&camss->ispif->line[i].subdev.entity,
> +						MSM_ISPIF_PAD_SRC,
> +						&camss->vfe[k].line[j].subdev.entity,
> +						MSM_VFE_PAD_SINK,
> +						0);
> +					if (ret < 0) {
> +						dev_err(camss->dev,
> +							"Failed to link %s->%s entities: %d\n",
> +							camss->ispif->line[i].subdev.entity.name,
> +							camss->vfe[k].line[j].subdev.entity.name,
> +							ret);
> +						goto err_link;
> +					}
> +				}
> +	} else {
> +		for (i = 0; i < camss->csid_num; i++)
> +			for (k = 0; k < camss->vfe_num; k++)
> +				for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> +					ret = media_create_pad_link(
> +						&camss->csid[i].subdev.entity,
> +						MSM_CSID_PAD_SRC,
> +						&camss->vfe[k].line[j].subdev.entity,
> +						MSM_VFE_PAD_SINK,
> +						0);
> +					if (ret < 0) {
> +						dev_err(camss->dev,
> +							"Failed to link %s->%s entities: %d\n",
> +							camss->csid[i].subdev.entity.name,
> +							camss->vfe[k].line[j].subdev.entity.name,
> +							ret);
> +						goto err_link;
> +					}
> +				}
> +	}
>   
>   	return 0;
>   
> @@ -884,8 +910,8 @@ static int camss_register_entities(struct camss *camss)
>   	for (i--; i >= 0; i--)
>   		msm_vfe_unregister_entities(&camss->vfe[i]);
>   
> -	msm_ispif_unregister_entities(&camss->ispif);
>   err_reg_ispif:
> +	msm_ispif_unregister_entities(camss->ispif);
>   
>   	i = camss->csid_num;
>   err_reg_csid:
> @@ -916,7 +942,7 @@ static void camss_unregister_entities(struct camss *camss)
>   	for (i = 0; i < camss->csid_num; i++)
>   		msm_csid_unregister_entity(&camss->csid[i]);
>   
> -	msm_ispif_unregister_entities(&camss->ispif);
> +	msm_ispif_unregister_entities(camss->ispif);
>   
>   	for (i = 0; i < camss->vfe_num; i++)
>   		msm_vfe_unregister_entities(&camss->vfe[i]);
> @@ -1047,6 +1073,15 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_free;
>   	}
>   
> +	if (camss->version == CAMSS_8x16 ||
> +	    camss->version == CAMSS_8x96) {
> +		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
> +		if (!camss->ispif) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +	}
> +
>   	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
>   				  GFP_KERNEL);
>   	if (!camss->vfe) {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 46e986452824..b7ad8e9f68a8 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -79,7 +79,7 @@ struct camss {
>   	struct csiphy_device *csiphy;
>   	int csid_num;
>   	struct csid_device *csid;
> -	struct ispif_device ispif;
> +	struct ispif_device *ispif;
>   	int vfe_num;
>   	struct vfe_device *vfe;
>   	atomic_t ref_count;
> 
