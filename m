Return-Path: <linux-media+bounces-27685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C00A544BA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271253ADD12
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1E0204F8B;
	Thu,  6 Mar 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVBIkaXx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA91D8DEE
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249388; cv=none; b=NNEDPaaLKQyTqpW8LF49jD9RsWbUxBk9AN0+6iMSldx4sindmPqB282+H1N9KUQ651dHn1Z+vXVZWkDMWKjnK2wE8ImHRHUTEu3uF9pQ24Kbge7GJAJkg6OAW/n5HAHcN/Uwv86v3zdIu6RtNn3shJahX4PDCcJWLyyZItGYous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249388; c=relaxed/simple;
	bh=TBM7ZdoAEJmWV4G+EtplAqbhqX+oEIuKc0qcEJTTXSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+hDTq7RJB71OKGZPKH3vfilFRgFu7UD4mMVOxzZxRGfnYy2UPCU64C6TSYSp2sKBfaxrk8rXI1TBAqjQJ5SzuFUDp9NBS7AN1gM6qiAc1K5E7jRkpZA6FbZOwy7AYNyTUQvKAa8eD7/PM8nh5ZQKFVCjOqIgSOwNB+KrnzZ/Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVBIkaXx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bd45e4d91so2312465e9.1
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741249384; x=1741854184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGuGofdiBgeCaS66wbZZbCbyCtmGJE9XpjuRggbUJ/A=;
        b=oVBIkaXx9oyiyv2b9+I+j38kslqoHppOYGgfBzuFCWpJl50cgcdXh1bVFet2lC8Mov
         D+4j+jcsIT8CcBGJ7XbJ8PbpDap8Fqd9/fq9KxsBfhyRNk2EYL4bv8Uiq9GJcD5rgQb3
         fyOzj/JbIt36rnFKZEPBPrMCQjAo9uET2488P86+9pDV23OT9YT79dLby3/uWdC6P7f9
         j9r3EgA5c9S/G2t3k1weZFMU89QqDgINgTE9m4t/5IhxNjyela6bG2Odecm36xpcok2i
         cPjuOjSqo4x4aE7x96210tGViPKqjZO/IYiiIE/9pmjaIMXuBtX3/UrcBvpNJiV3SbBe
         zEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249384; x=1741854184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FGuGofdiBgeCaS66wbZZbCbyCtmGJE9XpjuRggbUJ/A=;
        b=dOFSHPcBDTwSoDYNUopNTBTkGslFHyuPU/Hok1EgYNFBABeV4eFJISvQs5j6Ait1Ru
         KZZkvwPSwZ98Q7JUA+x3z07yN52GGcrnoqeeY8RJsTm62gQ3TdBbbJSjSPIAKuSCkYjf
         WTpNLNRpos+cFDNAwCy/SKudQDSl982PypoomQbH7suV313xdsFqPH4IoDXH3IeIqieC
         XnGXPpNZdZo8/hLyVb+nxk/0L8MO+4eW1aFkeNt9jqTefIVWIg4sLelSQuuUbeeXrWR6
         wKcTXVvYHQC6eMQIjBxcbHQRsB6E6WA6X1vNcQ6FmWUzPfNdbwtByZSSNL2zFP4sKTNO
         uarw==
X-Gm-Message-State: AOJu0YyC58fYBsSELmN3FF5RR1YPZK3fbJoOYdJCOrwUqsTF3P7Z/F4W
	x8DNLGbJTM9VeIdimnQMaZEfNAJKQHFpn6OXW9+xbR9Xy5+wppgANtnWB6mXKS0=
X-Gm-Gg: ASbGncv2EoRVgZYFcKYnuhULwZPDBpHSvjRHbtPnTYMmVqVWrFw5gIpXVZX8klID4HV
	wWZBjTiaSnpJpag5ABQVjwUcbWJBH7s4ZlC29bxV3ObYApX0cwArjsjwzRwOYrdnNj6Ixk02SHR
	33EItrtm1NE2fZwex0qL5jsU1fsMYsEN696UrFNXENSJ6kiDBNK8cwX0ButMo5gUtJIMLC6cYCE
	QpA+9x3A+VCzNlGlKo+FY6833fnpA/wYYA2K6xuX041Ndp2uvEuB1d3pFjzT12asXR8Ua7P6FKc
	aMGMVMMHrb5DHWamQ+cTPQzYGWGTgrqtOlIw2p2g4fh5Ef5UQUz00vBFhA==
X-Google-Smtp-Source: AGHT+IH151lwQVNoK7D/gsd6Nuf9nzMnhqbH1DqJBNBByko64LML2udj6wgGGTZX+oEUFfskKpkrrA==
X-Received: by 2002:a7b:ca55:0:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43bdb37ce80mr16864395e9.6.1741249384220;
        Thu, 06 Mar 2025 00:23:04 -0800 (PST)
Received: from [192.168.1.101] ([37.167.203.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c6203sm42080905e9.24.2025.03.06.00.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 00:23:03 -0800 (PST)
Message-ID: <ffff2d49-d90b-4512-a12e-cf7c4251b4a8@linaro.org>
Date: Thu, 6 Mar 2025 09:22:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/7] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-3-bd65a3fc099e@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-3-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 20:05, Neil Armstrong wrote:
> In order to support the SM8650 iris33 hardware, we need to provide a
> specific constoller power off sequences via the vpu_ops callbacks.
> 
> Add the callback, and use the current helper for currently supported
> platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
>   4 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>   
>   const struct vpu_ops iris_vpu2_ops = {
>   	.power_off_hw = iris_vpu_power_off_hw,
> +	.power_off_controller = iris_vpu_power_off_controller,
>   	.calc_freq = iris_vpu2_calc_freq,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
> index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
> @@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   }
>   
>   const struct vpu_ops iris_vpu3_ops = {
> +	.reset_controller = iris_vpu_reset_controller,

Seems I sent the patches too fast, this is remnant of v1, it should disappear, I'll fix it in v3.

>   	.power_off_hw = iris_vpu3_power_off_hardware,
> +	.power_off_controller = iris_vpu_power_off_controller,
>   	.calc_freq = iris_vpu3_calculate_frequency,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index d6ce92f3c7544e44dccca26bf6a4c95a720f9229..3b3e1ca1e42183561ee78c89f50946fd0cc3c3ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -251,7 +251,7 @@ static void iris_vpu_power_off_controller_disable(struct iris_core *core)
>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>   }
>   
> -static int iris_vpu_power_off_controller(struct iris_core *core)
> +int iris_vpu_power_off_controller(struct iris_core *core)
>   {
>   	u32 val = 0;
>   	int ret;
> @@ -284,23 +284,29 @@ void iris_vpu_power_off(struct iris_core *core)
>   {
>   	dev_pm_opp_set_rate(core->dev, 0);
>   	core->iris_platform_data->vpu_ops->power_off_hw(core);
> -	iris_vpu_power_off_controller(core);
> +	core->iris_platform_data->vpu_ops->power_off_controller(core);
>   	iris_unset_icc_bw(core);
>   
>   	if (!iris_vpu_watchdog(core, core->intr_status))
>   		disable_irq_nosync(core->irq);
>   }
>   
> -static int iris_vpu_power_on_controller(struct iris_core *core)
> +static int iris_vpu_reset_controller(struct iris_core *core)
>   {
>   	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +
> +	return reset_control_bulk_reset(rst_tbl_size, core->resets);
> +}

Same here, I'll remove this now useless iris_vpu_reset_controller() function.

Neil

> +
> +static int iris_vpu_power_on_controller(struct iris_core *core)
> +{
>   	int ret;
>   
>   	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>   	if (ret)
>   		return ret;
>   
> -	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
> +	ret = iris_vpu_reset_controller(core);
>   	if (ret)
>   		goto err_disable_power;
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
>   
>   struct vpu_ops {
>   	void (*power_off_hw)(struct iris_core *core);
> +	int (*power_off_controller)(struct iris_core *core);
>   	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>   };
>   
> @@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>   int iris_vpu_prepare_pc(struct iris_core *core);
>   int iris_vpu_power_on(struct iris_core *core);
> +int iris_vpu_power_off_controller(struct iris_core *core);
>   void iris_vpu_power_off_hw(struct iris_core *core);
>   void iris_vpu_power_off(struct iris_core *core);
>   
> 


