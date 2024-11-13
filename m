Return-Path: <linux-media+bounces-21341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC289C6638
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 01:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47CE0B2CB7B
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 00:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B402318E3F;
	Wed, 13 Nov 2024 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nz5GAF3p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F9DF71
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731458051; cv=none; b=pGq5LOrUICquJW/Q/sRnL9PlenGBiKxEPD5ZHK1fHifRz4p4cUPLbsAAmCkgFx1wKqCPlYAGSAujqDkG9mSzKsqEfDYEPSzfzr6GPEg25/XCIwmpXS8XTAaEjSZFrFqFU5euPhrQfC9fuD+puwemWw2Piiyr6+qquACxgOORqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731458051; c=relaxed/simple;
	bh=MtV3z9l4ppGnoR95stXyLitFUn/bWfoBPXbl4J9IVlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBl8a5SNgz0fbRBakOjminemXOmDbk5P16e942HOzu7F60koJ8BMcfAvkk8LZYUIjVFjUZSY4tSa94ESZpe839Mc2TzyYE4ZOqpTEYp0mCGQMn8QbQGGOR+cTyVloX+Mec/bZXVtapDks/ImC3mm9jSKA2KHflZC76q1nrRpU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nz5GAF3p; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2f75d529b49so1623981fa.1
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 16:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731458047; x=1732062847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueGWEGboEzRXmBuOHI83hWbIZN6FiPD7JtU9cIKuuNo=;
        b=nz5GAF3pSxHr70ZaAUeDZ2vxMhSXnasW8zC5LOSDo6Xf+ZBTSmPqxHGm/dPWn773sr
         lTbWHBvHPozuX6lmyiWq+D/HU9fO/YJRzk+b8sS1OevbiNn5oIm1Lxm1GzG99686+ayL
         6eppdQhtyB7D5G4r4NKtuI+GuoX6UXoXft2pJOo0Xc8eigeDhBInJhdKGabLp+mk4ChT
         cX3V4IIUBlwCIgnal9BacQLd/hNYoG5Su5d8vvXrBf/qqsBDNs1Avv3zETFhQ/Ajgurt
         5sck8dHtpzRDoNLHeRH6+xnfClzjXPGEY3lpgexpabT6NtsLAWxzL++80ps0m96xeuZy
         2Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731458047; x=1732062847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueGWEGboEzRXmBuOHI83hWbIZN6FiPD7JtU9cIKuuNo=;
        b=Jp2Vkm5GN7jw7XOExFli+Mz+NPyLIvEFoh4eAkZiapo/BdlfpzFqn8mKKKFPChO0Kv
         X/b6rrOsZ6w3ggh4CR4dT4/xDURaEi2QkUKgO9F9PPaxGT9OLi93SygHzd13CJcu2S16
         dmbvxVu5y41SQAR6paTsJ+UvM2jrrt8+AqJ9KWQTZcj+OqLGcns/ks7+9ZpPDirlDNgQ
         ubSKkpEP4ZYQKcQ3f/UsMODc1AeiLlSRwCLtiFypCs3Ua0tAz2tpA3n6tyu52a1QKDpx
         oulA8n1peBX4XJLXZiymsphxkIcFcaOhIKrao1zJluV8bCNAPg2gz3JIAj8TPLz7ww6w
         nlsQ==
X-Gm-Message-State: AOJu0Yyn/KzQ1ZZl0hCEMrZolSci1xsNGbKO8ufYfjVB3TxCdgjMSkaq
	HoIeACRZ4AoWMKmnhSI/BbC0d5HWCxd/djBj0f3KexlSfQVNdmq7kqhiKHq8RP0=
X-Google-Smtp-Source: AGHT+IHThF7lX2QKxL9oJNzu2pZCjkWPz9dwQIUwkuBkBOR5ce+IfNWLCy2w8bOMAj/lFSHp7N9H1g==
X-Received: by 2002:a05:6512:1151:b0:53d:a12b:c5e2 with SMTP id 2adb3069b0e04-53da12bc791mr11919e87.3.1731458046950;
        Tue, 12 Nov 2024 16:34:06 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826aeb12sm2035465e87.228.2024.11.12.16.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 16:34:05 -0800 (PST)
Message-ID: <d6459b89-1bb2-4906-bba7-d0ac549ccfff@linaro.org>
Date: Wed, 13 Nov 2024 02:33:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: qcom: camss: Restructure
 camss_link_entities
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
 <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vikram.

On 11/12/24 15:38, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   6 +-
>   drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++------
>   drivers/media/platform/qcom/camss/camss.h     |   4 +
>   3 files changed, 138 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..446604cc7ef6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1794,9 +1794,9 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   				&video_out->vdev.entity, 0,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to link %s->%s entities: %d\n",
> -				sd->entity.name, video_out->vdev.entity.name,
> -				ret);
> +			camss_link_err(vfe->camss, sd->entity.name,
> +				       video_out->vdev.entity.name,
> +				       ret);

As Bryan said, the change above is unrelated to the restructuring.

See also my next comment.

>   			goto error_link;
>   		}
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index fabe034081ed..980cb1e337be 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1840,14 +1840,83 @@ static int camss_init_subdevices(struct camss *camss)
>   }
>   
>   /*
> - * camss_link_entities - Register subdev nodes and create links
> + * camss_link_err - print error in case link creation fails
> + * @src_name: name for source of the link
> + * @sink_name: name for sink of the link
> + */
> +inline void camss_link_err(struct camss *camss,
> +			   const char *src_name,
> +			   const char *sink_name,
> +			   int ret)
> +{
> +	if (!camss || !src_name || !sink_name)
> +		return;
> +	dev_err(camss->dev,
> +		"Failed to link %s->%s entities: %d\n",
> +		src_name,
> +		sink_name,
> +		ret);
> +}

I believe this new function is simply not needed. It is not helpful.

> +/*
> + * camss_link_entities_csid - Register subdev nodes and create links
>    * @camss: CAMSS device
>    *
>    * Return 0 on success or a negative error code on failure
>    */
> -static int camss_link_entities(struct camss *camss)
> +static int camss_link_entities_csid(struct camss *camss)
>   {
> -	int i, j, k;
> +	struct media_entity *src_entity;
> +	struct media_entity *sink_entity;
> +	int ret, line_num;
> +	u16 sink_pad;
> +	u16 src_pad;
> +	int i, j;
> +
> +	for (i = 0; i < camss->res->csid_num; i++) {
> +		if (camss->ispif)
> +			line_num = camss->ispif->line_num;
> +		else
> +			line_num = camss->vfe[i].res->line_num;
> +
> +		src_entity = &camss->csid[i].subdev.entity;
> +		for (j = 0; j < line_num; j++) {
> +			if (camss->ispif) {
> +				sink_entity = &camss->ispif->line[j].subdev.entity;
> +				src_pad = MSM_CSID_PAD_SRC;
> +				sink_pad = MSM_ISPIF_PAD_SINK;
> +			} else {
> +				sink_entity = &camss->vfe[i].line[j].subdev.entity;
> +				src_pad = MSM_CSID_PAD_FIRST_SRC + j;
> +				sink_pad = MSM_VFE_PAD_SINK;
> +			}

So, you split one solid function, which covers csid->ispif and ispif->vfe
into two separate functions, the logic of "if (camss->ispif)" is applied
twice in two different functions, while before the change it was done just
once, then why does it enhance readability? I think it's just the opposite...

> +
> +			ret = media_create_pad_link(src_entity,
> +						    src_pad,
> +						    sink_entity,
> +						    sink_pad,
> +						    0);
> +			if (ret < 0) {
> +				camss_link_err(camss, src_entity->name,
> +					       sink_entity->name,
> +					       ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * camss_link_entities_csiphy - Register subdev nodes and create links
> + * @camss: CAMSS device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int camss_link_entities_csiphy(struct camss *camss)
> +{
> +	int i, j;
>   	int ret;
>   
>   	for (i = 0; i < camss->res->csiphy_num; i++) {
> @@ -1858,81 +1927,77 @@ static int camss_link_entities(struct camss *camss)
>   						    MSM_CSID_PAD_SINK,
>   						    0);
>   			if (ret < 0) {
> -				dev_err(camss->dev,
> -					"Failed to link %s->%s entities: %d\n",
> -					camss->csiphy[i].subdev.entity.name,
> -					camss->csid[j].subdev.entity.name,
> -					ret);
> +				camss_link_err(camss,
> +					       camss->csiphy[i].subdev.entity.name,
> +					       camss->csid[j].subdev.entity.name,
> +					       ret);
>   				return ret;
>   			}
>   		}
>   	}
>   
> -	if (camss->ispif) {
> -		for (i = 0; i < camss->res->csid_num; i++) {
> -			for (j = 0; j < camss->ispif->line_num; j++) {
> -				ret = media_create_pad_link(&camss->csid[i].subdev.entity,
> -							    MSM_CSID_PAD_SRC,
> -							    &camss->ispif->line[j].subdev.entity,
> -							    MSM_ISPIF_PAD_SINK,
> +	return 0;
> +}
> +
> +/*
> + * camss_link_entities_ispif - Register subdev nodes and create links
> + * @camss: CAMSS device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int camss_link_entities_ispif(struct camss *camss)
> +{
> +	int i, j, k;
> +	int ret;
> +
> +	for (i = 0; i < camss->ispif->line_num; i++) {
> +		for (k = 0; k < camss->res->vfe_num; k++) {
> +			for (j = 0; j < camss->vfe[k].res->line_num; j++) {
> +				struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
> +				struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> +
> +				ret = media_create_pad_link(&ispif->entity,
> +							    MSM_ISPIF_PAD_SRC,
> +							    &vfe->entity,
> +							    MSM_VFE_PAD_SINK,
>   							    0);
>   				if (ret < 0) {
> -					dev_err(camss->dev,
> -						"Failed to link %s->%s entities: %d\n",
> -						camss->csid[i].subdev.entity.name,
> -						camss->ispif->line[j].subdev.entity.name,
> -						ret);
> +					camss_link_err(camss, ispif->entity.name,
> +						       vfe->entity.name,
> +						       ret);
>   					return ret;
>   				}
>   			}
>   		}
> -
> -		for (i = 0; i < camss->ispif->line_num; i++)
> -			for (k = 0; k < camss->res->vfe_num; k++)
> -				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
> -					struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
> -					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> -
> -					ret = media_create_pad_link(&ispif->entity,
> -								    MSM_ISPIF_PAD_SRC,
> -								    &vfe->entity,
> -								    MSM_VFE_PAD_SINK,
> -								    0);
> -					if (ret < 0) {
> -						dev_err(camss->dev,
> -							"Failed to link %s->%s entities: %d\n",
> -							ispif->entity.name,
> -							vfe->entity.name,
> -							ret);
> -						return ret;
> -					}
> -				}
> -	} else {
> -		for (i = 0; i < camss->res->csid_num; i++)
> -			for (k = 0; k < camss->res->vfe_num; k++)
> -				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
> -					struct v4l2_subdev *csid = &camss->csid[i].subdev;
> -					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> -
> -					ret = media_create_pad_link(&csid->entity,
> -								    MSM_CSID_PAD_FIRST_SRC + j,
> -								    &vfe->entity,
> -								    MSM_VFE_PAD_SINK,
> -								    0);
> -					if (ret < 0) {
> -						dev_err(camss->dev,
> -							"Failed to link %s->%s entities: %d\n",
> -							csid->entity.name,
> -							vfe->entity.name,
> -							ret);
> -						return ret;
> -					}
> -				}
>   	}
>   
>   	return 0;
>   }
>   
> +/*
> + * camss_link_entities - Register subdev nodes and create links
> + * @camss: CAMSS device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int camss_link_entities(struct camss *camss)
> +{
> +	int ret;
> +
> +	ret = camss_link_entities_csiphy(camss);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = camss_link_entities_csid(camss);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (camss->ispif)
> +		ret = camss_link_entities_ispif(camss);

Since there is an expectation that the change is non-functional, please
keep the logic unmodified.

	if (camss->ispif) {
		ret = camss_link_entities_ispif(camss);
	} else {
		
	}

> +	return ret;
> +}
> +
>   /*
>    * camss_register_entities - Register subdev nodes and create links
>    * @camss: CAMSS device
> @@ -2073,9 +2138,10 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
>   				input, MSM_CSIPHY_PAD_SINK,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>   			if (ret < 0) {
> -				dev_err(camss->dev,
> -					"Failed to link %s->%s entities: %d\n",
> -					sensor->name, input->name, ret);
> +				camss_link_err(camss,
> +					       sensor->name,
> +					       input->name,
> +					       ret);
>   				return ret;
>   			}
>   		}
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 0ce84fcbbd25..2086000ad5c1 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -160,5 +160,9 @@ void camss_pm_domain_off(struct camss *camss, int id);
>   int camss_vfe_get(struct camss *camss, int id);
>   void camss_vfe_put(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
> +void camss_link_err(struct camss *camss,
> +		    const char *src_name,
> +		    const char *sink_name,
> +		    int ret);

Please don't add this into the header file. Drop it.

>   #endif /* QC_MSM_CAMSS_H */

In fact I didn't find the change as a simplification, because now there are
more if-branches apparently. Is there a reason why the change is needed?

--
Best wishes,
Vladimir

