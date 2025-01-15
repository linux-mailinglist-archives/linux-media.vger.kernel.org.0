Return-Path: <linux-media+bounces-24769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E787A11EC3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2843A1A32
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC91720C499;
	Wed, 15 Jan 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nT/8QB1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32A248160
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935268; cv=none; b=NyHhczCaG6yj5POAj2Rgf7zOvlLdoa+vFHczyRJHR/4wvxtOzJZTzNMsHpt+rxLEFoZWEdNoQeXVYfDCcnvETyr9KkS7mqRIEmHi2cdBpcMuU994eOUYwX8YdplhVA3uGU0/dRb5d8KZGyVMDS550f22zkK7TAC2TUsL7+Ha5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935268; c=relaxed/simple;
	bh=Fg+37e6woVvUUebjXjbz5FU8XYpgwfQR33aFm0Qvgy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKRm7GCsEFuyUPoZQ+NxuXpSDRpJEsO6sjlOtLn5n5HAcKb9h9EBM4vRUrnmgpzXIiRg2IiUosl48lbJyaL2gMWIWFkCk/BVGQu5JQb2+0FChaYyO9N8CAO05ja5XdCWBf4pvYcSAadiGj0OOtiEkpv3/jXwri7e4EGRUTTlSv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nT/8QB1Y; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so5482365e87.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 02:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736935264; x=1737540064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ5dt/qLr3VvJ8B5OacAL/6U7yodrgZD0IL2tTlPHPc=;
        b=nT/8QB1Yti3IAvkc0mH9GvbZXOOeE5pJyYmv43/TXibNFrpLN88Jo2GDGu71JuWiuk
         fqavWn3XJnOJw4G3uG7Fzswkkdswu+K39Ky9Upeq82W9rnlisdJb7YbuXQikICVG6Hw/
         c3NrIngMpYW5jpDU7Mwrqlhezo9fzqkCoTT+4m+aa57JN3W6OjCJBwEFbXAMWk1pkpYl
         6LatXlxoTn9Uz+8Om2uVVwH5sI3yEr9eFLfvIb3/blvnzjk/LKE8Rj5al5OmuOwwSLIr
         97nZmHHqTc7T7HGVUjxAcK3s9zQDAcQ90XBzkHs5GE7H1Gm635Jh6JXYTAh2Zrd7eorB
         10jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736935264; x=1737540064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ5dt/qLr3VvJ8B5OacAL/6U7yodrgZD0IL2tTlPHPc=;
        b=QTG5lnGG0ga3FZnsobGgY9DNZ682kPsTClcnyVHDt8YjFr71D75LvQBtkD3KvwsRSA
         5DyC2U2rFIECEvg0E/HdIyH9XP00e1YfciNY2/qEhE3EwDVxcaqtEpvxX2+2BCFFelZo
         1asEmhn0Ljk/w4n+AGDlmivIa6JiEK3f0kXhsWTqLU/Vk2Hbbydnz8hbwzJze2Gqj96V
         V4ZyMtoR1Mpyia5Cty6wA8ymIf7WKPeTHPxnpkMyK5SKkGFdHw4zKJReSoo64SQunWyT
         iHsIN9uWfKI8ro0XKtQRhc28dD3eg9cm9ADhFdnLz2MbYGbi1Fx8RgpGUe754CcgusQb
         MC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtL2I4N7tbWR6cPYOj3k7jlbJbTfJjpjZDX1m6sMAtQlDZIxrqK7+6kOpJ1hYjKw0q4s+NRC84KK4vDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkeKAzYXDMYHbHmeUZ10CV1ZbUQs39PR9C4unxs+vYVKCMvZE
	db6jiLIVlbsWoHOelnh5IL7INBibHI7r3dmOJK1LU59X4BVk7NmAxzdTcX8dmPc=
X-Gm-Gg: ASbGnctNlmQ4NPvWb37gunLjUO+XmlW/CRUgnEV89/taqOULVHzbRvlMki+ZzRK8D/S
	e7iT6HUR1kDcgSkHwNqUawTGwbpv+jrRKjHqTAomif+yHsVrn1jd16QCQK3+YntIRRNmtfuzzzi
	wJ3RGJivopMMVp/16B5l+92AZiYhHx9QdBTSbXdqmX/JsVi5f0aesC8ZLEjTrllxvx1mvz0vyUz
	eqB0nyomy7VcAr9eL4srw+1jhPERB0njNJAV8b5g8+ciOHBeI5tR7RWLL4rZfb/0xefjdC/xPgJ
	WtQLqMgIb0IHkTg231WYHHiU6bsHcbYZ1Bfd
X-Google-Smtp-Source: AGHT+IH1cl4tHzKbcYYDDe2QwnGPmD4imeSfkQtHhn289Ax/JxMouFvFg7I8mRg66j/rsW7P93KXow==
X-Received: by 2002:a05:6512:2246:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-542845d35d9mr8769193e87.30.1736935264443;
        Wed, 15 Jan 2025 02:01:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6bddsm1960300e87.120.2025.01.15.02.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:01:04 -0800 (PST)
Date: Wed, 15 Jan 2025 12:01:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/3] venus: pm_helpers: Remove dead code and simplify
 power management
Message-ID: <a6qhm6viuldidhtc32l7qajx24yh6wrntxi63jm4n4cvp7ktmu@sum7w5cwpbms>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-3-9a24d2fd724c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-switch_gdsc_mode-v3-3-9a24d2fd724c@quicinc.com>

On Wed, Jan 15, 2025 at 03:00:54PM +0530, Renjiang Han wrote:
> The functions poweron_coreid(), poweroff_coreid() and vcodec_control_v4()
> are only used for v4 and v6. Remove the dead code by:
> - Removing vcodec_control_v4() function
> - Removing the check for !IS_V6(core) && !IS_V4(core) in poweron_coreid()
> and poweroff_coreid()
> 
> Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 73 +++-----------------------
>  1 file changed, 8 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index a2062b366d4aedba3eb5e4be456a005847eaec0b..846aa765edbb33df0b0c39bb463dd68c16ce1b68 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -406,74 +406,29 @@ static const struct venus_pm_ops pm_ops_v3 = {
>  	.load_scale = load_scale_v1,
>  };
>  
> -static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
> -{
> -	void __iomem *ctrl, *stat;
> -	u32 val;
> -	int ret;
> -
> -	if (IS_V6(core) || IS_V4(core))
> -		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> -	else if (coreid == VIDC_CORE_ID_1) {
> -		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
> -		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
> -	} else {
> -		ctrl = core->wrapper_base + WRAPPER_VCODEC1_MMCC_POWER_CONTROL;
> -		stat = core->wrapper_base + WRAPPER_VCODEC1_MMCC_POWER_STATUS;
> -	}
> -
> -	if (enable) {
> -		writel(0, ctrl);
> -
> -		ret = readl_poll_timeout(stat, val, val & BIT(1), 1, 100);
> -		if (ret)
> -			return ret;
> -	} else {
> -		writel(1, ctrl);
> -
> -		ret = readl_poll_timeout(stat, val, !(val & BIT(1)), 1, 100);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  {
>  	int ret;
>  
>  	if (coreid_mask & VIDC_CORE_ID_1) {
> -		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> +		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], false);
>  		if (ret)
>  			return ret;
>  
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -		if (!IS_V6(core) && !IS_V4(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> -			if (ret)
> -				return ret;
> -		}
> -
>  		ret = pm_runtime_put_sync(core->pmdomains->pd_devs[1]);
>  		if (ret < 0)
>  			return ret;
>  	}
>  
>  	if (coreid_mask & VIDC_CORE_ID_2) {
> -		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> +		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], false);
>  		if (ret)
>  			return ret;
>  
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -		if (!IS_V6(core) && !IS_V4(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> -			if (ret)
> -				return ret;
> -		}
> -
>  		ret = pm_runtime_put_sync(core->pmdomains->pd_devs[2]);
>  		if (ret < 0)
>  			return ret;
> @@ -491,17 +446,11 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core) && !IS_V4(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> -			if (ret)
> -				return ret;
> -		}
> -
>  		ret = vcodec_clks_enable(core, core->vcodec0_clks);
>  		if (ret)
>  			return ret;
>  
> -		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> +		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], true);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -511,17 +460,11 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core) && !IS_V4(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> -			if (ret)
> -				return ret;
> -		}
> -
>  		ret = vcodec_clks_enable(core, core->vcodec1_clks);
>  		if (ret)
>  			return ret;
>  
> -		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> +		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], true);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -802,7 +745,7 @@ static int vdec_power_v4(struct device *dev, int on)
>  	if (!legacy_binding)
>  		return 0;
>  
> -	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], false);
>  	if (ret)
>  		return ret;
>  
> @@ -811,7 +754,7 @@ static int vdec_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> +	dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], true);

Check for the error here.

>  
>  	return ret;
>  }
> @@ -847,7 +790,7 @@ static int venc_power_v4(struct device *dev, int on)
>  	if (!legacy_binding)
>  		return 0;
>  
> -	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], false);
>  	if (ret)
>  		return ret;
>  
> @@ -856,7 +799,7 @@ static int venc_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> +	dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], true);


Check for the error here.

>  
>  	return ret;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

