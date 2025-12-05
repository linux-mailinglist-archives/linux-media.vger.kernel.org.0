Return-Path: <linux-media+bounces-48317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD43CA7348
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A009300B821
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775DD313E15;
	Fri,  5 Dec 2025 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIDmaRxL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B90313523
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931134; cv=none; b=TV6075h8B8JO+YPTdaZ6mvTWe5hhDiVgvYJ8RsyDmK5M5wbfPzkH/0ci76x7o8ThGOjMuAEiWlRekZCM37EDKw6itFD3gmR0N/5zicoImQi6CewK1JowHDCJw78/TPxNpzMh3paF5Yba7P2pQag28XyoHhV5hcWKR6vSOzkLTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931134; c=relaxed/simple;
	bh=7Ti0/hGGkcg6vgg8ymr8rwSgVKCe99zuGiU54ocDWAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svO9HX0yXqw38w0SF9dBeNXDWdKyg2O/jb3fkgVTl7P7Hv3mESDhueAB9LF5VCwtFc5Cpc+2jKMB/S8PbnW/rzgt64EKeRC22JbDAE6u3cyvsOyyEWU60EVvpyiCdqY/tWVXT5wq14BnpuIKBrNrm84LfQ0WoYo9MtP/1Hkd5XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIDmaRxL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so17857035e9.2
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931126; x=1765535926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=wIDmaRxLRmZmtfvpWC8v9C8oFKrswPcglDTp0Uj0bJbjhlYvIIAGm6yncpWdAS9txT
         4/g1IVxSDaXapSvcKOHxPScqV4nGRmfFyOeZq6Ux7+SUPlyK3/i9q+vj/tMzDLxpG3kI
         Fn7yBexlS+sURVrzqwB/jfTBB2fomGqj5P+Kny+809oscQe8vlymxDjN2/tyXYzFMvYX
         u0Nkc16YDYdYL2OO3s7NlQrVzZ34DZT7UXJTOUDzLMxkEX2ToHmniNJFObvRgMSwFrrR
         y4oBS3NYRnlHEMjujPr7I4DoTyBN6iqYOy8rPGVGvpm/kT6W8qD+iW2dd1MEGTNV5yr8
         TBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931126; x=1765535926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=GZib5j0XWOLkkYTnG2R20duDA2hA3WoVlVLP+8584fJfpyLcth39QxtLyg15Mm3CM4
         5V3RXG/giw40u5S5lR4zaFMvDdWvp1JpbkgQNdxp1Ec+ZSHRs+pBj7k1QulGHCHrcrTD
         EyP2neznHFCYxyJiJ6bEj8Oz/9/zAkNNRLPvgY/1yyeT8IATQE/eeIT7Zgo/UjKyxCju
         EpxqihuPWvw03ZvIItDTaAzaGiLMpe8JK45dJY7ki3QTEx304KDSyeIg+WcFef7shG3V
         o2axM9D6UTR5FhQ+OlTC+SdYG2umLpJSxJHSuV3CEfoAP3AseH8WBYdzKCBcJgHhvj/o
         D0eg==
X-Forwarded-Encrypted: i=1; AJvYcCXeKCaiGHX50UBs33QuJMAWOcE3/kCwWAbIhczExVaZ/BeErZoViSh25ArooU2kmSh7PCm7SsVOM0jAXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywud5nuDOOpX5gpe2OiMHXM8qeZorF4joPrEVhxaf1Tltwst2Su
	kKUIIrrpDV5lprkOID2T5nLpl78oN3uIkwm1HXHIboehmyW64WNojzEJ81yoAIXHhg0=
X-Gm-Gg: ASbGnctUV73r9jfZT7yuYjp8+tOadK9FAl1dsAh0JqmrjM4QpDhHklr5m6G2E/sx3Ct
	nqbcOOGz/oRdcAwRV9rC+csDVuB6GEZ9aPT8vmAOsBRrdTSv3PcO8zp6H1X3It5l7WF2tXLvIx7
	AnPvcG482DPTLBDJVLX3t+X5ET9nhO0LPh2EjH/JtXz6eAE/V8hO/hH/BLt3zjhKFZU9fJt0ur0
	sFiQY8nvmGHn6ZblRlJUwMRpdrSRdjIevu0MObCd2ESpmJhcqmzQHkqHnbK95EadNy35Y8AIzfa
	BS4Lsd3bJ9FWeGmf4EsJ2KgNNCFCQKr8evskfZEWz3eKtjIRMiMsd1WDjoMjar5ar+jal5oeA+h
	XYBY4UGyBsrY09QbkQcj1dfXrPljvavR0gxTSUn6tTGeJK9IxtKot8ECMbs3kCPvuaz/UTSRRmM
	MswZnd90bKROJ6Vy1KIxPO/mJKFq+fFS6n41vOm9+7RgN88RBfEIyLtWcVS215Y1I=
X-Google-Smtp-Source: AGHT+IEniZY9x6ScJP/72sFnDswrZrFy73p5tN4uqWyYm+lhn3NmJsuyIGi2aQ1n3YuJ/2WMhpQq1Q==
X-Received: by 2002:a05:600c:35ce:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4792f268a6bmr70857545e9.14.1764931126466;
        Fri, 05 Dec 2025 02:38:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ed466sm72223685e9.13.2025.12.05.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:38:45 -0800 (PST)
Message-ID: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Date: Fri, 5 Dec 2025 10:38:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>   1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

Is this error possible ?

If so we want to trap it earlier and throw a meaningful error up the 
callstack to NAK the configuration.

i.e. you could make this function return and int and throw the error 
upwards.

But is there no opportunity to trap this error before this point ?

Either way just printing out something like "critical error can't 
continue" without returning logical result codes to that effect is wrong.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> @@ -1236,25 +1240,45 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
>   		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
>   		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
>   		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
>   		break;
>   	case CAMSS_8300:
>   	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

You could trap this up the top of the function.
Make this function return and int.

Or better yet find this error earlier ?

Anyway rather than replicate the if (cphy) { do stuff } in each case of 
the switch, just move the error handling to the top of the function once 
and return a real error.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
>   		break;
>   	default:
>   		break;
> 

---
bod

