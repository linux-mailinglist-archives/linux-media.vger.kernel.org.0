Return-Path: <linux-media+bounces-28446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF87A67F6B
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 23:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74E5424B7E
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 22:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C278520B81B;
	Tue, 18 Mar 2025 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuSnVjyS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9B2066D9
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742335912; cv=none; b=BrpFO3BsvMHq9gw2EtOaq3AxD1FVpZfhguBxei2izgX0j4d8lbiFRkLBEE2A/xh/INDZResBReJtjycGCNEPxBoQ1dQMXUTY1N/64nrUHCEzYLl1jCaiiZfvQeaO5uIMShB2YyzQs09y31mBZcqVR2piMXZF+nIe0livUkhLJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742335912; c=relaxed/simple;
	bh=9gh3xtWkal4psS5BuhqOt8wWpRdxFLmYUUTWbCZ71kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fd80a5zhKQZgoBEapuYFc+KzTQiwuZeM3gMLu5f/nQ7yf59UUf53DS0tuInh0akMyAwGhdWz5c/Uk2vUjROxb8BLCTHmuyfFDmohqalI7fPbLUvYjfGShEZ7bsH4wEFDKn/uGo6eP7taQG9NmOjXxxKxpEesZYoT1kIDHUSp7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuSnVjyS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1173068066b.3
        for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742335908; x=1742940708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HD9NpfmchfroViUWqm7KH0wfqC0Fje7BCCs4RB1DhO4=;
        b=nuSnVjySH4YigZml0f8ir9PDjzVDTmd4hJn+OoIoaVAEsevb4aXfyX6YZOBvCJJ3MV
         0Vb8PuTKi8gRlZ5+Ztx4QWzuRhxAp9tSZagQlCtauiXFaDn6/oNGNZOc2quErFrjMGmr
         Q0E6CCeRBTKpBEOPlOGew3hAHSq9KFZJrZ42aoqbN0Hp8JClYpDaAFZPZpMQV//fIxWT
         98d5xoUqWQeO9IcIGM/Gq7aXEF3EP7mTjZVXpkdFdAegTv/QUJyNQTGsP/omLtoG/I14
         KJ4GOiWDWCuI5RfWPjVSi2hP310YYqCVkbaizy9Q9nZthAyKRAYV0poY7HxpZ11612Sy
         x5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742335908; x=1742940708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HD9NpfmchfroViUWqm7KH0wfqC0Fje7BCCs4RB1DhO4=;
        b=Qp9e+ulbbBvrv2+gt0Ppyf+oHVU3fVfYTw7v4f7aiSG0Kd7inTB7jcxhHgRPdnAOZN
         0P8yROmxaBQg6JwiHTNPiqako3u5AY3HX3ohHIKJ9n/AP1RgZH8HaVUPAabLBEtvzarN
         l8F3qCX6BD2M6XY73ymJZoUF30VIv9BdvN6LP4gwRRXaKUzs53B+Tvv5aSmdJY9UfHCn
         8DIq7j7wJVFMDZJzpUBj6C5wY6Kt4dF1TmJU4POcNA2B3gf9wSxAHFTJTlJS1yt/vs9u
         5jAHwqNCp/36sKxcdHecVzLsa/10qnkbBFnBHwgdnID3OGeRmAHkHBJSW0/2hkyglRGu
         6sGA==
X-Forwarded-Encrypted: i=1; AJvYcCU//l3IveaDVOBpBTrqrIyTdgynRm0Jdsn5kcR3SPVDxp1CKI2eiNXEMaNTkqHabmjCNHkVtgIDoze0fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBy5qPFXcp9zUCYma9OLyZC7uI/frMfX0aaCDF2HbMfYLhWD8
	rFryay2sYwqKjM+5mgeEEjzumdr7kg9XEuRfmvr0Cb6w7fY5SkZcPdEDBzGeoCE=
X-Gm-Gg: ASbGncuYtkKUvy/rKD0Wb1rj1Skt0k4cqml8quAU9QH2zlykozIM+Reed7AhMPgNjGv
	xh3i3+rnO2CpohhnyAqWeKd8dPmgKJHDjB48sz9G5Ns6q8Zi5l6lBC+WOO4ksvOUsXfGWO1u98U
	9zxn72a6W9QQPRqxT798RJX8ZtoNOXyxAuAJM3BG8RsYmqUls3Vs3lzG1wTgL4xr0OLRt0tdJFM
	yO2S2N+R7zBzsaxNmCP4SBpbyXrLBTJlqv7jKYawvQ4RLPdjH0/B09VeD9Um2ctPlWY1o6q27/n
	cPANZ+TGc1kYZq2I8J2Xv3JRex1bZHd9SwXdMOSFUNEgbT6ktHM2EbtygxpB7fga7VkwJQlKZpp
	gXfT3GX3ckrZB/Hu/89dsyjdfyJU5dRPezsw8v2HBtRuC0EiNatAxgYibeznjDjJPmuIQYeBBU6
	9XRga+rtKzxFqdXprEI2ndIApvbQ4w8s8=
X-Google-Smtp-Source: AGHT+IEXE0inCD4aajK8MsM22xf4Qjmf2+sGSHBGZhUMUr3KQpAvROEQ6rhZOgUPF7EZOPYuIMSKxQ==
X-Received: by 2002:a17:907:d7c8:b0:ac3:3f84:4055 with SMTP id a640c23a62f3a-ac3b7a97443mr34239066b.4.1742335907931;
        Tue, 18 Mar 2025 15:11:47 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce9a9sm908266966b.110.2025.03.18.15.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:11:47 -0700 (PDT)
Message-ID: <cf244e11-96b3-49cd-8daa-df9c91435e6e@linaro.org>
Date: Tue, 18 Mar 2025 22:11:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 10:33, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sc7180.c | 2 +-
>   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>   drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>   drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>   drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>   5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>   	.pd = {
>   		.name = "vcodec0_gdsc",
>   	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
> --- a/drivers/clk/qcom/videocc-sdm845.c
> +++ b/drivers/clk/qcom/videocc-sdm845.c
> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>   	},
>   	.cxcs = (unsigned int []){ 0x890, 0x930 },
>   	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>   	},
>   	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
>   	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
> index 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780 100644
> --- a/drivers/clk/qcom/videocc-sm7150.c
> +++ b/drivers/clk/qcom/videocc-sm7150.c
> @@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
>   	},
>   	.cxcs = (unsigned int []){ 0x890, 0x9ec },
>   	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> @@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
>   	},
>   	.cxcs = (unsigned int []){ 0x8d0, 0xa0c },
>   	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
>   	.pd = {
>   		.name = "vcodec0_gdsc",
>   	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> @@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
>   	.pd = {
>   		.name = "vcodec1_gdsc",
>   	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   static struct clk_regmap *video_cc_sm8150_clocks[] = {
> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963 100644
> --- a/drivers/clk/qcom/videocc-sm8450.c
> +++ b/drivers/clk/qcom/videocc-sm8450.c
> @@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
>   	.parent = &video_cc_mvs0c_gdsc.pd,
> -	.flags = RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>   };
>   
>   static struct gdsc video_cc_mvs1c_gdsc = {
> @@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
>   	.parent = &video_cc_mvs1c_gdsc.pd,
> -	.flags = RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>   };
>   
>   static struct clk_regmap *video_cc_sm8450_clocks[] = {
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

