Return-Path: <linux-media+bounces-50966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F43D39144
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9CBE3011EE2
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6DE2E0925;
	Sat, 17 Jan 2026 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6pRloz7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD162DAFD7
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768687016; cv=none; b=AR/hXatC0eVKMfwkC5o6huMOtUB8+Y2khQPrT/Z31x9+sAehf2O3fnbYVZeP93QumA6RloVM7qPeYBKad+74co8zJKCvVzwZVTeOr9f6CVfAHk3yN9ADOcbJW6U6jxDhlp8PsD/+gyVWNOgd2yqkuylytdJgaDEX2gUL3Ql2tTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768687016; c=relaxed/simple;
	bh=vF4TN1yu22+nztG/+fn/F8a92h6FiVLorTUIC6RyXGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBw+yshh1Bnz4FwbEpwEk0/4lZp148a1+L19q+gtQZ198pZrJ3EZLHOz8xUfshWjTcY+pEGOul/guKeA1DrMl1q9F4tY34EULy/5IkTzceAWCkDtd5JkqB8VB2XxGLZBpwgEgTnKwZ8ucdDGeMSZi+JaPEh3d6NlmhdA1K2qAAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6pRloz7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so20458495e9.3
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768687013; x=1769291813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okLeQShl2fqm0YxPatMOb07vCxHIVDXXSr6Cq83TEoo=;
        b=O6pRloz7Xa9a2ROMub5Uygp0vjiES3ND/eE4d1qElydlgQJrlJRFZNUJZPn6PLy3Ko
         N2SAtmJ7YzVUGq/ttiQOgRYs3T2Br4ep+ufQaq/+XN4c4YN7QpxlagloNQlbRiwu8ko9
         Cn4PJ2o8NuCfXx5XiNtu52iZVMXCLRjoy9msgQjQh50pXcxd4KXZbJL5lE98Lm4GNlSg
         cTjQOFyquWqy/5bkeD/+Zre8D1A8yi0WcaSWSMIto+220JOfyHLmOikPgLGOjvnVhK0h
         XSqJs2IxzXiKJvPqIdSlczoUlPhpKoTT3vQtUF1rx8mtZ7zqXOo6Ju5V6vaya+a7Zuoj
         K50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768687013; x=1769291813;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okLeQShl2fqm0YxPatMOb07vCxHIVDXXSr6Cq83TEoo=;
        b=IEeqlnd9667Q+fG8bkZ74qoDgauD+0WrTFprUF4bJDdygaqQaXUCZ5n5y96SIuKfyx
         xkobCJg3WYqLrkDPlJAW6KAr5QllCPPocOj3hbyVRSlnW2CY1YCuLUBSHqrTnklrlxwg
         yEWjDz48WDSkKc8wXop1G/9x6oOyLCd1qqKN5/7WODtOEPJ4AqaQBj5eZPvWzTcMYRfD
         6xaps2QLrF+DMYiOjDx7RE7nlccE0d4xrqpHFPCeg4frZZkDNP4jSU9szfUgsh62kzBs
         G2XPInZ1HJUfgHsnr0VlQtXJpWHe0IOHy414Xxbfi3ujMsBWzE0bUQw7Ea/Yqp94EY4P
         d7qA==
X-Forwarded-Encrypted: i=1; AJvYcCW9k/ptibGbvkRbI/BRGDtYRW3iJd8HRGeOQNvO2eqHRViR04koUFavhTnlljVVZWuWl+GW6qvRuROv2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwawozjwuN8ex4/oeYWI+WK8+zOkVLGNauRxPTGeHAHufPzerae
	NdKecSmI1KgtKyLetnq/spAoqnixgDEJTX2RD6SIeKteZgKp1/hbXfdaxsX0AA8USQU=
X-Gm-Gg: AY/fxX6N2MHhRvA9cXjsqVSWy0Gi5izfr77KvsKiPcm4G1WLAOJ4Ap9v+fvx/boRPlo
	Nv0eNHV/HU5jJfsMHatBs/wlnZSsyJbrShzyKC2HqClt2C3OAUOr6jCQFqo7QaQZYzsBS2JS3b2
	WqZ3Q+18yN2spKC6aMFGyUFRxG6cx5EIL9a6E4ABbG5Qjy4jw6kLe3LAMLKmiR9lMFqne7bzZfI
	OGbBOraK+ypSWXOqgRSSHC5xzBb5ZaPdFxZ+/mWyEEiLr8WdhLEN9O6qQnh7hwOfFRAG8LJMF+S
	6PEZws/upvDTnPE+0Gj0i091edwNlIwXrjgBzX7M+ba15TvDdkQdBTlFnNQsX7Mv8uUUA6dQ7vg
	dCGpZXJ+LyiR7VqJh3d1jiusoJEn+ZTt/uuZ1bwIV2HjMNCoePI8g/tzfJRM3c1DNEFJOHzjMoX
	ni330lEIlHPgYUgHW/SrG8j4MuETB/PnN/YoyiKPAXT9I/nhcogzWR
X-Received: by 2002:a05:600c:4e90:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4801eab54ccmr80999525e9.7.1768687013504;
        Sat, 17 Jan 2026 13:56:53 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm167386705e9.12.2026.01.17.13.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:56:53 -0800 (PST)
Message-ID: <6cdc17f7-0926-4230-8be8-ecf26cc26df4@linaro.org>
Date: Sat, 17 Jan 2026 21:56:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   |  2 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
>   drivers/media/platform/qcom/camss/camss.c        | 16 +++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index b50b0cfe280c1..24f244d2959c9 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +					csid->phy.lane_cnt, csid->phy.cphy);

Just pass &csid->phy ..
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 08dd238e52799..1ea0d0ef354ff 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);

CPHY shouldn't be a boolean special case - you have a use-case for the 
containing structure, so pass that instead.
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ea0c8cf3cd806..556fedd92e065 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,14 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4280,20 +4288,22 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @nr_of_lanes: Number of lanes in the link to the sensor
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			unsigned int nr_of_lanes, bool cphy)
>   {
>   	struct media_pad *sensor_pad;
> +	unsigned int div = nr_of_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e..6bf7738837b89 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			unsigned int lanes, bool cphy);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 


