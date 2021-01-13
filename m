Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074362F57B6
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbhANCFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbhAMWao (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 17:30:44 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D43C0617A7
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 14:28:35 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id m10so4372570lji.1
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 14:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tsPSdZ8Aw4g0TYx7JW/kAU6i2N4McGrt/cbxtG7nAXE=;
        b=RMdTch7AyLw4Nyvjw5yB8UhNcoiPSdb9JTZd12fD4+jkAc2xq70SDb2UvLmBvsg/WN
         o9Nt2lTqHflISFDSxSy30z+TELnaauZuu3BGntJ4lWEIN2cldnHMYl6dSV8Tt7ESv3Dx
         I8ANjPmO+Id0zy9P1YBK6vApkDkkopG8tdobMUoTrwU6Zt/Zw4w9YYanJkRrjaeUAL/G
         e+f8TYz4QTxGNIVTNW7KyJi0M2cR3G4rfUm0Vt4EWhlxSIJ+yuErminm6cOE2mWsrXMz
         eLX7fir8X6OFkLbDx1UPB2Z/n7XywOOPdeAzFclbrtTDJES4yLrLPtOcgDhI+lAJRXcz
         ax/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tsPSdZ8Aw4g0TYx7JW/kAU6i2N4McGrt/cbxtG7nAXE=;
        b=p2kzXs/mpxJS96veubqI5+Dcr9hgWroYwSKynlgM8LDpxpqx2UVYe4dVDOC4ALH+SG
         72eKdE0FQj9GpkvwIDY9o7XMDA0UxbZdxd5LeGtAC9se1iyC61pQCE69DTw1rsv2AR59
         GYdRFCoUmKScU0PcPfPSkhSuXsJXnjJNNFnPHKMxIrihaaDL39yZnA8UyVJg4t+AtWgK
         15KWVPoHrUom5Q6lB9zyNSseKxsRUUEEXp3zEt8059IYtc0/Kn+P0yydFKAUs8CtSkKT
         c+P7zHOrJYate/Oy5ufDVS8MbPNDbklCO3p5nTDqpeeAweE7HOLpJdTr6g/38n4pZTi0
         pwcw==
X-Gm-Message-State: AOAM530u1ilDAzGnkSvbW3oHGjSreihYqQQZYNSqFDKPfYtqsHOf7B9w
        FqhKSDz0hvPlx64F63qCz7Y/mA==
X-Google-Smtp-Source: ABdhPJxgnCeCngkz7yOC1vUzRojbJM1YLBDyyOYE1eSrPQJmtxuGRRJr/vMGjagIg+/3cldzvF9HsA==
X-Received: by 2002:a05:651c:1027:: with SMTP id w7mr1803200ljm.297.1610576913047;
        Wed, 13 Jan 2021 14:28:33 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id l13sm336422lfk.296.2021.01.13.14.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 14:28:32 -0800 (PST)
Subject: Re: [PATCH v1 04/17] media: camss: Make ISPIF subdevice optional
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-5-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <97d0a789-a4c7-b66f-3c6c-8f89dcdfe8a6@linaro.org>
Date:   Thu, 14 Jan 2021 01:28:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108120429.895046-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thanks for the patch!

On 08.01.2021 15:04, Robert Foss wrote:
> This driver supports multiple architecture versions of the Qualcomm ISP.
> The CAMSS architecure which this driver is name after, and with the
> introduction of this series, the Titan architecture.
> 
> The ISPIF is IP-block that is only present in the CAMSS architecture.
> In order to support the Titan architecture, make the ISPIF an optional
> subdevice.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-ispif.c   | 144 ++++++++++--------
>   .../media/platform/qcom/camss/camss-ispif.h   |   3 +-
>   drivers/media/platform/qcom/camss/camss.c     | 113 +++++++++-----
>   drivers/media/platform/qcom/camss/camss.h     |   2 +-
>   4 files changed, 160 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index adeb92808998..0c804584dd65 100644
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
> @@ -1088,26 +1094,31 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>    *
>    * Return 0 on success or a negative error code otherwise
>    */
> -int msm_ispif_subdev_init(struct ispif_device *ispif,
> +int msm_ispif_subdev_init(struct camss *camss,
>   			  const struct resources_ispif *res)
>   {
> -	struct device *dev = to_device(ispif);
> -	struct platform_device *pdev = to_platform_device(dev);
> +	struct ispif_device *ispif = camss->ispif;
> +	struct platform_device *pdev = to_platform_device(camss->dev);
>   	struct resource *r;
>   	int i;
>   	int ret;
>   
> +	if (res == NULL && ispif == NULL)
> +		return 0;
> +
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
> +	ispif->line = devm_kcalloc(camss->dev, ispif->line_num,
> +			sizeof(*ispif->line), GFP_KERNEL);
>   	if (!ispif->line)
>   		return -ENOMEM;
>   
> @@ -1115,12 +1126,12 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
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
> @@ -1132,16 +1143,16 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	/* Memory */
>   
>   	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
> -	ispif->base = devm_ioremap_resource(dev, r);
> +	ispif->base = devm_ioremap_resource(camss->dev, r);
>   	if (IS_ERR(ispif->base)) {
> -		dev_err(dev, "could not map memory\n");
> +		dev_err(camss->dev, "could not map memory\n");
>   		return PTR_ERR(ispif->base);
>   	}
>   
>   	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
> -	ispif->base_clk_mux = devm_ioremap_resource(dev, r);
> +	ispif->base_clk_mux = devm_ioremap_resource(camss->dev, r);
>   	if (IS_ERR(ispif->base_clk_mux)) {
> -		dev_err(dev, "could not map memory\n");
> +		dev_err(camss->dev, "could not map memory\n");
>   		return PTR_ERR(ispif->base_clk_mux);
>   	}
>   
> @@ -1150,24 +1161,25 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ, res->interrupt);
>   
>   	if (!r) {
> -		dev_err(dev, "missing IRQ\n");
> +		dev_err(camss->dev, "missing IRQ\n");
>   		return -EINVAL;
>   	}
>   
>   	ispif->irq = r->start;
>   	snprintf(ispif->irq_name, sizeof(ispif->irq_name), "%s_%s",
> -		 dev_name(dev), MSM_ISPIF_NAME);
> -	if (to_camss(ispif)->version == CAMSS_8x16)
> -		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
> +		 dev_name(camss->dev), MSM_ISPIF_NAME);
> +	if (camss->version == CAMSS_8x16)
> +		ret = devm_request_irq(camss->dev, ispif->irq, ispif_isr_8x16,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
> -	else if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		 to_camss(ispif)->version == CAMSS_660)
> -		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
> +	else if (camss->version == CAMSS_8x96 ||
> +		 camss->version == CAMSS_660)
> +		ret = devm_request_irq(camss->dev, ispif->irq, ispif_isr_8x96,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>   	else
>   		ret = -EINVAL;
> +
>   	if (ret < 0) {
> -		dev_err(dev, "request_irq failed: %d\n", ret);
> +		dev_err(camss->dev, "request_irq failed: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -1177,7 +1189,7 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	while (res->clock[ispif->nclocks])
>   		ispif->nclocks++;
>   
> -	ispif->clock = devm_kcalloc(dev,
> +	ispif->clock = devm_kcalloc(camss->dev,
>   				    ispif->nclocks, sizeof(*ispif->clock),
>   				    GFP_KERNEL);
>   	if (!ispif->clock)
> @@ -1186,7 +1198,7 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	for (i = 0; i < ispif->nclocks; i++) {
>   		struct camss_clock *clock = &ispif->clock[i];
>   
> -		clock->clk = devm_clk_get(dev, res->clock[i]);
> +		clock->clk = devm_clk_get(camss->dev, res->clock[i]);
>   		if (IS_ERR(clock->clk))
>   			return PTR_ERR(clock->clk);
>   
> @@ -1198,7 +1210,7 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	while (res->clock_for_reset[ispif->nclocks_for_reset])
>   		ispif->nclocks_for_reset++;
>   
> -	ispif->clock_for_reset = devm_kcalloc(dev,
> +	ispif->clock_for_reset = devm_kcalloc(camss->dev,
>   					      ispif->nclocks_for_reset,
>   					      sizeof(*ispif->clock_for_reset),
>   					      GFP_KERNEL);
> @@ -1208,7 +1220,7 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
>   	for (i = 0; i < ispif->nclocks_for_reset; i++) {
>   		struct camss_clock *clock = &ispif->clock_for_reset[i];
>   
> -		clock->clk = devm_clk_get(dev, res->clock_for_reset[i]);
> +		clock->clk = devm_clk_get(camss->dev, res->clock_for_reset[i]);
>   		if (IS_ERR(clock->clk))
>   			return PTR_ERR(clock->clk);
>   
> @@ -1331,10 +1343,13 @@ static const struct media_entity_operations ispif_media_ops = {
>   int msm_ispif_register_entities(struct ispif_device *ispif,
>   				struct v4l2_device *v4l2_dev)
>   {
> -	struct device *dev = to_device(ispif);
> +	struct camss *camss =  ispif->camss;
>   	int ret;
>   	int i;
>   
> +	if (!ispif)
> +		return 0;
> +
>   	for (i = 0; i < ispif->line_num; i++) {
>   		struct v4l2_subdev *sd = &ispif->line[i].subdev;
>   		struct media_pad *pads = ispif->line[i].pads;
> @@ -1348,7 +1363,7 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
>   
>   		ret = ispif_init_formats(sd, NULL);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to init format: %d\n", ret);
> +			dev_err(camss->dev, "Failed to init format: %d\n", ret);
>   			goto error;
>   		}
>   
> @@ -1360,13 +1375,15 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
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
> @@ -1393,6 +1410,9 @@ void msm_ispif_unregister_entities(struct ispif_device *ispif)
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
> index 8fefce57bc49..aeec59bc6194 100644
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
> @@ -884,8 +910,9 @@ static int camss_register_entities(struct camss *camss)
>   	for (i--; i >= 0; i--)
>   		msm_vfe_unregister_entities(&camss->vfe[i]);
>   
> -	msm_ispif_unregister_entities(&camss->ispif);
>   err_reg_ispif:
> +	if (camss->ispif)
> +		msm_ispif_unregister_entities(camss->ispif);
>   
>   	i = camss->csid_num;
>   err_reg_csid:
> @@ -916,7 +943,8 @@ static void camss_unregister_entities(struct camss *camss)
>   	for (i = 0; i < camss->csid_num; i++)
>   		msm_csid_unregister_entity(&camss->csid[i]);
>   
> -	msm_ispif_unregister_entities(&camss->ispif);
> +	if (camss->ispif)
> +		msm_ispif_unregister_entities(camss->ispif);
>   
>   	for (i = 0; i < camss->vfe_num; i++)
>   		msm_vfe_unregister_entities(&camss->vfe[i]);
> @@ -1047,6 +1075,15 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_free;
>   	}
>   
> +	if (camss->version == CAMSS_8x16 ||
> +	    camss->version == CAMSS_8x96) {
> +		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->csid), GFP_KERNEL);

- shouldn't it be sizeof(*camss->ispif) instead?

Thanks,
Andrey

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
