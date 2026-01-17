Return-Path: <linux-media+bounces-50962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39434D39130
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5A50301E6B2
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA252ED869;
	Sat, 17 Jan 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkHOYd9I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CDE2882D7
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686346; cv=none; b=Jjk/YSh+lMneoNkTSD8c4rWRUw3mC1YjHeVdx36dkSYLhx2iUX9xNGmU6i0ty+CObPsBmUV/oCOHZoTm7dRJcCHqvDFNruARYWfqlUmx7VMZymtFGYtg1xNMRVnxuDhidOkKw4BLLInlB8/PgXBcJleeQXH2LrvO3uZa6XP4DJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686346; c=relaxed/simple;
	bh=0uz81NtG/vkuLGFutGR+aZqXQZBLoZNngy5nYCQ664s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYAUhYWS7sHZZL/z6MvUTXalIxYd7pDiBOH/xWxfLJE0Efo28AauBWT3YHPOxRoIZJbbSjD7jvlQUurSC/n1dQD5yXUF6au6RX+mS16CROQTyiaUtsLCFOq/S9h/HBi7bnqx7W02dJHXixaHRwSkZjtVu22cGQiViarlm6C3Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkHOYd9I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso17143065e9.1
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686342; x=1769291142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=JkHOYd9IxhzDrifYRDn6k6b2J6NkfOvukeY8uoS20HYGL4STIt8KkpU69T/9S3oOWZ
         AWJQlndagjSD6NVjMYyMR0OkDu+Ty3h1BEQgv3ek4kFV6Cc2lF69FoFaP61AiIaIjwY1
         LTy7UZWw90UJ6kNjBc3lcVHmSkkknkRE++xgO56XLsdud+7GtsoRcXNWGgZhDnccmApO
         ePj1sNkD5RbmuqyWpFtCSOd5ChHukyfQ8qNL+7kqwMxj5tlZjLBg0dBBPufroWrp7rKv
         qIfdl3kxIQQXkmBzqiYGGdv7lHtyoW9zJ1qnbB0gijUuaEcgXbW4iKKgi78Jvdaf4EwO
         8Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686342; x=1769291142;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=JN2aBeJCaeXBPS/9VlGTL0OaK9SsPBHsHJeEEL+uKHqJYyiL/amvPDjAoO3NF4iv8+
         O9yjpmfKRjD379ObIbwNlxeuuL1CyGe72Vi4Moxyy0FuzBKXzR0zPBhsXJmuSjfOtrGr
         xB8aEJectOrLATbjbwUmi5Hi+JkUfJygp08WwAqiGOWrsEvy0RHeYJSfJ7b4mseTuJqE
         FeTiBzGcXyfxKdKHwaXTO/c0SEQkVxQCN0DHAJ5cW4DTwRQ9f7Wr9A1PvsQ7q88a3Toc
         dIakXxpwzV3Yxr0RaXpG/QzBAoyzJl5foFAiTQuAgWJigm6m0mQZZfke3uHZSgusv4Mi
         twjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl+P1ADBYLjrNOx5JNe3oSVo1v5SQqnE/hucfRXjFhf1ifWcyiCmeho5X9f6WXbWBgOPQ5ETG3Ryq6Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWF7H3uH6326WIR9LtjQgoyVQJEqfTQuQlGdUUK2JYk0gGNUf+
	aYheGfCzUdLlJY/AKwpTekYelq5l2lxf0DEmmLoKrXa6PASlFU9sTDQDLDWG/UOCaNk=
X-Gm-Gg: AY/fxX496jO/e3MlUCpeKD/wI90XRVaX1HPFfQOWvGBtyMzoUaniUR3g5U/CPFi81Un
	FJEwNvU9kxoM8N9QqqsyGNuITMM2uATg6irzvTtEV+MC0ETy3haU5Ki1rrtTHjebLsDtNd8+QV0
	VfzX0T+2FvT3E+n7NWJ1HDyiDHE6yTAGdEPSxOuZhPA1Lp/1kXHd5O7QKdZpVj7uEZ0D2+Ibv3I
	KDcwAxlqXu0Do0VZEQcl8X51SlKyZTkVLMHUfhXdzOc4BnRGiNGMw74zkOHtlKa3J8Iv20nFtv/
	vIDGP/jT6Yuw+aQAcPIMUTxsHTWCbQvm9TZr7tnvIeJtX8dIJih/lj6TBEs6k+H/LPPaM6eyUah
	lbeARMZnBcoehJHTv7I+S3+miqYDuRXLDPiPBNU6WYTBhd8eUxeesyzywS/khiI8EEj/EN3/1/N
	CA9kepnm+n9scyCEJwPzMJS2V45+DsvohtGg3Sozl8Nbw13NJJ1H6yqOqNzqYdczo=
X-Received: by 2002:a05:600c:8b78:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-4801e30a790mr89523405e9.8.1768686341602;
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm111346115e9.8.2026.01.17.13.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Message-ID: <6fd412e1-31d4-4f8b-9aa3-e2d7423fca66@linaro.org>
Date: Sat, 17 Jan 2026 21:45:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
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
 <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <phodina@protonmail.com>
> 
> The lanes must not be initialized before the driver has access to
> the lane configuration, as it depends on whether D-PHY or C-PHY mode
> is in use. Move the lane initialization to a later stage where the
> configuration structures are available.
> 
> Signed-off-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 91 ++++++++++++++--------
>   1 file changed, 57 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f3a8625511e1e..9e8470358515f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1048,6 +1048,62 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
> +		break;
> +	case CAMSS_2290:
> +	case CAMSS_6150:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8250[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		}
> +		break;
> +	case CAMSS_8280XP:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
> +		break;
> +	case CAMSS_X1E80100:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
> +		break;
> +	case CAMSS_8550:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
> +		break;
> +	case CAMSS_8650:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
>   	val = 0;
> @@ -1119,49 +1175,16 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		return -ENOMEM;
>   
>   	csiphy->regs = regs;
> -	regs->offset = 0x800;
>   	regs->common_status_offset = 0xb0;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -	case CAMSS_6150:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> -		break;
> -	case CAMSS_7280:
> -	case CAMSS_8250:
> -		regs->lane_regs = &lane_regs_sm8250[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>   		regs->offset = 0x1000;
>   		break;
> -	case CAMSS_8300:
> -	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> -		break;
>   	default:
> +		regs->offset = 0x800;
>   		break;
>   	}
>   
> 

Subject to testing.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

