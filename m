Return-Path: <linux-media+bounces-889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896717F5EB2
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7BF1C20FF1
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 12:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0032421D;
	Thu, 23 Nov 2023 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlgx7y45"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F423DB2
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 04:04:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507a55302e0so1012077e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 04:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700741076; x=1701345876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ff20L7uFDpZRo7krlqV3HLTPchR47Ag5cWaCM9fPD6g=;
        b=vlgx7y45Olt3kw1TNz95/2YiGJayqTvcXi+Y3SUDA340JwO6n4yFNcMIpCaJxT7T7A
         K1nXSehDnkMTcyNErTtoZOOCpn0414fPWnuZcIKoaWw63XJ0pVOyNHQqJBwnuF4B1uvL
         H/LwTKMv7506UbX0ZVfLwPBFD2ayd0g4hk+myDKXQAF09ppWLwiYB+n8mQYhQEsAc3Ey
         rm9ZVdAQ4A/5qTdQY+LRkZniCYsrmo8H4sCAXSksCk2xNJ8iE1saEfqN22Q7pqDCBksK
         KDrBnHECV/kpQvtjiJ+OTWpHRlQFc0vgqVmyWS4fck9cF2xnbFU8nRjAtdMUxiz9bfQp
         iqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700741076; x=1701345876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ff20L7uFDpZRo7krlqV3HLTPchR47Ag5cWaCM9fPD6g=;
        b=g/BFntZNReY7YmSCWaGwaXoW5+ZcuaUxgmfzS7AlBgJD4ihpZQH+AS+WUyGqfoCqpe
         am0xDGxC1iNCBnY1Gs78wSVyscqbLpeCdjmCnEXOpgDvmACa17Iec3sb60RCrCHWgC75
         vUDrMXmOUf51g6u044JccYQI0HTsmMZM/zV93PBLFPm3hlNyu1UDFv94Pq4zmu5PaA0n
         grwmkJQXVUi7ksZAHu0lMMWJpayZsB5ULYi7AXjBHPZvy27TMD6zjWy14rk2cNQN4Jc8
         d7uM/FGetvO05ec7scBDb6Phr3Mv5lJCorf6GKNO1JJNjm+v5t5n7lU0mLqMAxHME/0W
         JmdQ==
X-Gm-Message-State: AOJu0YwMF+esOn5SEqJ4572DMNtStqzsm3FdG0ep3qS4JymA5IQs3MQN
	j0X56p7Yo3FaPbYL0xzo3rqZjSvthPnnvtWtJiGB9YIa
X-Google-Smtp-Source: AGHT+IEwYG/SbSC3Sw94iuFLx+tG2uSUti7Wr4GzwU7IAkuFM+DgS1L4qHKbRUNmwdyTbnN3J7MH3Q==
X-Received: by 2002:a05:651c:306:b0:2c8:878e:9d40 with SMTP id a6-20020a05651c030600b002c8878e9d40mr3439166ljp.13.1700741075933;
        Thu, 23 Nov 2023 04:04:35 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r18-20020a2e80d2000000b002b70a64d4desm170764ljg.46.2023.11.23.04.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 04:04:35 -0800 (PST)
Message-ID: <84a97960-dfef-4d2f-8462-d3acb6f5a125@linaro.org>
Date: Thu, 23 Nov 2023 13:04:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-4-55eb0f35a30a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231118-b4-camss-named-power-domains-v5-4-55eb0f35a30a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/18/23 13:11, Bryan O'Donoghue wrote:
> Moving the location of the hooks to VFE power domains has several
> advantages.
> 
> 1. Separation of concerns and functional decomposition.
>     vfe.c should be responsible for and know best how manage
>     power-domains for a VFE, excising from camss.c follows this
>     principle.
> 
> 2. Embedding a pointer to genpd in struct camss_vfe{} meas that we can
>     dispense with a bunch of kmalloc array inside of camss.c.
> 
> 3. Splitting up titan top gdsc from vfe/ife gdsc provides a base for
>     breaking up magic indexes in dtsi.
> 
> Suggested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 24 +++++++++-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
>   drivers/media/platform/qcom/camss/camss.c     | 67 ++++++++++++++-------------
>   drivers/media/platform/qcom/camss/camss.h     |  4 +-
>   4 files changed, 62 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5172eb5612a1c..defff24f07ce3 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -14,6 +14,7 @@
>   #include <linux/mutex.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/spinlock_types.h>
>   #include <linux/spinlock.h>
> @@ -1381,8 +1382,13 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   	if (!res->line_num)
>   		return -EINVAL;
>   
> -	if (res->has_pd)
> -		vfe->genpd = camss->genpd[id];
> +	if (res->has_pd) {
> +		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
> +		if (IS_ERR(vfe->genpd)) {
> +			ret = PTR_ERR(vfe->genpd);
> +			return ret;
Can't help but notice the two lines above could become one

[...]

> +/*
> + * msm_vfe_genpd_cleanup - Cleanup VFE genpd linkages
> + * @vfe: VFE device
> + *
stray newline?

> + */
> +void msm_vfe_genpd_cleanup(struct vfe_device *vfe)
> +{
> +	if (vfe->genpd_link)
> +		device_link_del(vfe->genpd_link);
> +
> +	if (vfe->genpd)
> +		dev_pm_domain_detach(vfe->genpd, true);
> +}
> +
>   /*
>    * vfe_link_setup - Setup VFE connections
>    * @entity: Pointer to media entity structure
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 992a2103ec44c..cdbe59d8d437e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -159,6 +159,8 @@ struct camss_subdev_resources;
>   int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   			const struct camss_subdev_resources *res, u8 id);
>   
> +void msm_vfe_genpd_cleanup(struct vfe_device *vfe);
> +
>   int msm_vfe_register_entities(struct vfe_device *vfe,
>   			      struct v4l2_device *v4l2_dev);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ed01a3ac7a38e..5f7a3b17e25d7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1487,7 +1487,9 @@ static const struct media_device_ops camss_media_ops = {
>   static int camss_configure_pd(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> +	const struct camss_resources *res = camss->res;
>   	int i;
> +	int vfepd_num;
>   	int ret;
Reverse-Christmas-tree, please

[...]

> +static void camss_genpd_cleanup(struct camss *camss)
> +{
>   	if (camss->genpd_num == 1)
>   		return;
>   
> -	if (camss->genpd_num > camss->res->vfe_num)
> -		device_link_del(camss->genpd_link[camss->genpd_num - 1]);
> +	if (camss->genpd_link)
> +		device_link_del(camss->genpd_link);
> +
> +	dev_pm_domain_detach(camss->genpd, true);
>   
> -	for (i = 0; i < camss->genpd_num; i++)
> -		dev_pm_domain_detach(camss->genpd[i], true);
> +	camss_genpd_subdevice_cleanup(camss);
This changes the behavior, previously CAMSS_TOP was shut down last
(which makes more sense to me, anyway)

otherwise, I think this lgtm

Konrad

