Return-Path: <linux-media+bounces-13756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB890F8D7
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 00:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5181C20E19
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 22:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8AD152792;
	Wed, 19 Jun 2024 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZD0jODsj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843CC15AD93
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718835038; cv=none; b=Fb6N8YFt1hJQSAtqy0Xj2vFkYjgK929eihqk27ryPFc3okmN7aD0f8VipwJy97zum+axgxT7LvUoE1iwZjJb3213JM0LEzWi7pUW1WKDKau23JsLywISwX6C/HOgxQaWBtzzdRDIV5DE/X/4PaRlDlEVTmEDBiij5txWoPjsY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718835038; c=relaxed/simple;
	bh=MzmtV6RJLPp/mRcRZ0X769Ji07wp0WHO6hIUMyrrkbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1OEEH3+LXAjHKHoa23xI+0rOfUde0yAR95ndMiFYNMpQG/7V7QscZ3XFabEzZQ7xakDh9inpYw5Vk8F5jSP9f99kPxM6IKdN/tJNDD8JvessFf/KDyY6nz2ihK95GQMIWK4XD1UbA87o/uiXcq8W1q3q7KYg0c4QpcuWCqwGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZD0jODsj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cc5d5179aso397077e87.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718835035; x=1719439835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLgiYNE4EcD1eCJhNuCVVYDqXAq6ojEUG+xkLeofvQc=;
        b=ZD0jODsj2dqR6niAcu4iYnoLREx/xanEKDhi/tDviC4bUQJh5vtZjXfbC34tzZgW3G
         6BKm4ageaUM4Hf0mRN7IdDnB/FDQYOPMieSxPdg1yXE6VW4aKv0cx6TWPLVQZunGYRwO
         T54zssokxcBMS5TC2ImxzP+b6s15TQ6Za9AjiBnGGwzXZcAfnUO08vKEaJSs0bB0AGTx
         +rDAGx3e3Ur2rilDtn6A70iSoBT+MlbQG8CdN8wZodf3whkXF5bOyp+x3hCuTbTBVwCF
         0cMwh4WYT4dNykT6KqJEbMVdF20b2GKmxziiPIP5L02vNCPfaVLcq5xxKkdRVuFmXywi
         0lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835035; x=1719439835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLgiYNE4EcD1eCJhNuCVVYDqXAq6ojEUG+xkLeofvQc=;
        b=csoRIHNOvOXXJM81h5j1GThxlph2tZTCn4iH1WJiePIZOsv/n2sCqNMqU1WOGO1a/3
         SkcCpZf4VdkJzhzIofax5NbuYqsbze6+WeeGfg8A9fobhhKdyPtjU1UuJNGUCVDiRNud
         LV95Bw+EbGBk/Wux4+/PmLaxdLuQ6ye4nfJs0eCHleGfVkmhH8B6mn+zAB6SIJaOg0oP
         jouJUT5BIdz05IlCfVolSIvLcCejxhVQhql7b4IDt5YhpoBvp8E4238N/oNrWbKFTPO0
         PHBMZIdqKr7S9y/49sQzcS+wzZ31oI5UmtI+0leswHI9WhmrexRa9Q+0pBS/DaXhN/Ye
         O9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVaOk0Xr53YNS1pERvVu/cu3B7IzaYtV11cv5rPWJCipmVwSTQYWBEh7wPSNVCsHrTqNLjTKs/Ey6Y4Ah61as+5QiGZSmgo5vp4mRQ=
X-Gm-Message-State: AOJu0YwbiY9g7bK+qwb8jWhkUM3UWLJYvAj5Us5t1X1yVnE6O2Tz5AWU
	GprbxpQHx6qk7/9g5Kag+G3Akon/4GJZFFabmm6WzTnmicmQnsflhX9AV7HfpLM=
X-Google-Smtp-Source: AGHT+IH3CBrMepbPopZ1LMG2Hk8saC3rtJcvZcFGZJwOAFrtpz5t43UjJvvpMhq86KbRuj7gOqRYyA==
X-Received: by 2002:a05:6512:742:b0:52b:bd50:baed with SMTP id 2adb3069b0e04-52ccaa5a074mr2226003e87.61.1718835034394;
        Wed, 19 Jun 2024 15:10:34 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::ebdd? ([2a02:8109:aa0d:be00::ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed3658sm704663566b.133.2024.06.19.15.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 15:10:34 -0700 (PDT)
Message-ID: <18c0b683-97c8-4d53-9852-840a21c11d9a@linaro.org>
Date: Thu, 20 Jun 2024 00:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/5] clk: qcom: gdsc: Add set and get hwmode callbacks
 to switch GDSC mode
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240619141413.7983-1-quic_jkona@quicinc.com>
 <20240619141413.7983-4-quic_jkona@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240619141413.7983-4-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

Sorry, some grammar nitpicks.

On 19/06/2024 16:14, Jagadeesh Kona wrote:
> Some GDSC client drivers require the GDSC mode to be switched dynamically
> to HW mode at runtime to gain the power benefits. Typically such client
> drivers require the GDSC to be brought up in SW mode initially to enable
> the required dependent clocks and configure the hardware to proper state.
> Once initial hardware set up is done, they switch the GDSC to HW mode to
> save power. At the end of usecase, they switch the GDSC back to SW mode
> and disable the GDSC.
> 
> Introduce HW_CTRL_TRIGGER flag to register the set_hwmode_dev and
> get_hwmode_dev callbacks for GDSC's whose respective client drivers
> require the GDSC mode to be switched dynamically at runtime using
> dev_pm_genpd_set_hwmode() API.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 42 +++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/gdsc.h |  1 +
>   2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index df9618ab7eea..6acc7af82255 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -363,6 +363,44 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>   	return 0;
>   }
>   
> +static int gdsc_set_hwmode(struct generic_pm_domain *domain, struct device *dev, bool mode)
> +{
> +	struct gdsc *sc = domain_to_gdsc(domain);
> +	int ret;
> +
> +	ret = gdsc_hwctrl(sc, mode);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Wait for the GDSC to go through a power down and
> +	 * up cycle. In case SW/FW end up polling status
> +	 * bits for the gdsc before the power cycle is completed
> +	 * it might read the status wrongly.

If we poll the status register before the power cycle is finished we 
might read incorrect values.
> +	 */
> +	udelay(1);
> +
> +	/*
> +	 * When GDSC is switched to HW mode, HW can disable the GDSC.
The GDSC
> +	 * When GDSC is switched back to SW mode, the GDSC will be enabled
The GDSC
> +	 * again, hence need to poll for GDSC to complete the power uphence we need to poll

Kind regards,
> +	 */
> +	if (!mode)
> +		return gdsc_poll_status(sc, GDSC_ON);
> +
> +	return 0;
> +}
> +
> +static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev)
> +{
> +	struct gdsc *sc = domain_to_gdsc(domain);
> +	u32 val;
> +
> +	regmap_read(sc->regmap, sc->gdscr, &val);
> +
> +	return !!(val & HW_CONTROL_MASK);
> +}
> +
>   static int gdsc_init(struct gdsc *sc)
>   {
>   	u32 mask, val;
> @@ -451,6 +489,10 @@ static int gdsc_init(struct gdsc *sc)
>   		sc->pd.power_off = gdsc_disable;
>   	if (!sc->pd.power_on)
>   		sc->pd.power_on = gdsc_enable;
> +	if (sc->flags & HW_CTRL_TRIGGER) {
> +		sc->pd.set_hwmode_dev = gdsc_set_hwmode;
> +		sc->pd.get_hwmode_dev = gdsc_get_hwmode;
> +	}
>   
>   	ret = pm_genpd_init(&sc->pd, NULL, !on);
>   	if (ret)
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 803512688336..1e2779b823d1 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -67,6 +67,7 @@ struct gdsc {
>   #define ALWAYS_ON	BIT(6)
>   #define RETAIN_FF_ENABLE	BIT(7)
>   #define NO_RET_PERIPH	BIT(8)
> +#define HW_CTRL_TRIGGER	BIT(9)
>   	struct reset_controller_dev	*rcdev;
>   	unsigned int			*resets;
>   	unsigned int			reset_count;

-- 
// Caleb (they/them)

