Return-Path: <linux-media+bounces-27708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C1A54ACE
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0FAF16AC61
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F020D20C02A;
	Thu,  6 Mar 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wahu4H20"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267220C014
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264495; cv=none; b=erPfzhfb+SiOg2NYJxZawNeXn55quTxXv7Vtwb3nrhhazc/cNJjeMOnn6GYFMN2oxpl64eMInVJM3yep/dtJht58D/y5eQRUmarHH7759YnBg8DATLVusACxNbiELGmOzErYJWQhAH0SJQQQ5P9MFVCSoLu/0VxtFJmEcVmvthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264495; c=relaxed/simple;
	bh=PQygVsrdXeDMpZ7Tj/Nb8RLss9RHfa2fpTVfus0xpuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCZIxPmj0G7LAKzcID9YDiiSQ/k5Z4P+mx2u7sWnhBo/H/2GVtHzdazOwUfkvU26lSg177R7R2fxnRtn3Bl0Wicsby/q2Xy8f8PuFsYtq9XcgvVHKwoeTYuGj7cXyN40MowFcT2N7bncbyaDHa5hcuNCbFD/QV9oTI4PtvxJsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wahu4H20; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so106392766b.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 04:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741264490; x=1741869290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQk+W9UnjEI727XCdsbdZAmPH0hj538LnJhUknTw6ak=;
        b=Wahu4H20r6kJ+Rm2Mo3PM6GJTBnACbJ1w5EbaQBJVUFG39/BwywQmsR8EzulGqVLvi
         MrJUkIRFRjWHUmtqhykUrvCzay5uOX4AgQwpmFzD+Iwut0fGVKWsDdzR8XNpI6pBlf8X
         72IA7QhwO8ov20pD8BfhzeDYGEyfcA52kY/YppggOJkPAdexx+HSO4a5mqjdBDD9Wy+e
         xmdU9sHGDF2v4z0e4cH8PmFOPrqZeplqX5KqKXXubHecynx2vQE9ekgPfN7TX9a1OU8j
         KcIpHX4+rUVQQDVUujQoCJwdjArJcXknuYiuBn+xZ6/JRzvR2z7H9zkmZ9CsH5z7lTwL
         0J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741264490; x=1741869290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQk+W9UnjEI727XCdsbdZAmPH0hj538LnJhUknTw6ak=;
        b=kLaFb5TuvvNIZ3qcNPZ7/7OK/sztx41bjNazQtrRgmHAdIrvWKCCeXCb4IGJHehtLW
         Rukm89tquaZ69zY6wnxlTKYJrjjpPYjc5kh6kLEs/eawsC/0fpV8J7sNfPZgFkq/ofF+
         Ql13RXXYufS5WpewonFG3X2mufvYpAnqpGz2ywEu5O/lGs9QQt+g6fT531oMpn/i3KgJ
         QGsGMdcOiDmCzyYms44I+3nNMivZQBCGrl5RaoTXhIFw7oFwrQTPFo/F3bEkcKBwZKaQ
         /vyHXKqzchSdKBOLxw24HK+/Q/kKQb5IRfm/QF6i/gPOjQdwlPB8QGDkL+P9snLl6kc6
         C/bw==
X-Gm-Message-State: AOJu0YwrW59o0lr+7Yu4wFSqTSIbkMMEJJ0OZYytxWZy4MxpP7s5Xiw7
	B1OhzT3m3ps8QV893Gl+CIl5aOmmLZ0vZs2dWRedhjK5m3wbyzV0JFDss2tYAcM=
X-Gm-Gg: ASbGncv1AFbW3ik4+CqhgfrhewvUUwffwMD9QhRdd0SV48kUstGNnX2h+FY5/hDKGr3
	d1PDnf1pXsdl91FI8QSzB1vL8u1UBhiEP8vxs/xFBpoHXwwqzBand8EJ1HPmRsChXr7PVCa+aWs
	SQ3+DAfwBesATtvn05aHH06vkvKU8Un+hJFnivUOuQTNTJcmaUY6aZUNW3K9MPb8S/+4XNbd381
	RyscO/nlzDGG86EeBLB2cV3hOzMNSDInEByTnKeC3M8lK1dGkpkcZu/Iej/N/Od1P+irS5hg7wY
	J6dywGZxwgjgTALYjWuaUYMO/SgD8zgD0Nf6R7kjElLrDbglhKyQ/W4OgXeI5RplLVQRAf7WaMA
	LJcRNp2DFZA==
X-Google-Smtp-Source: AGHT+IHkjGPRfdYa7OHu+XAJ3GgJlZ3qHNqYEcATDMhpQ5IfOOS79FbY2LfL26sEiKj98rMWg3iQ7g==
X-Received: by 2002:a17:907:7f29:b0:abf:7a26:c485 with SMTP id a640c23a62f3a-ac20e1dce23mr763535666b.50.1741264490411;
        Thu, 06 Mar 2025 04:34:50 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394894cbsm90195866b.70.2025.03.06.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 04:34:50 -0800 (PST)
Message-ID: <4cacd96b-8d71-4b0a-954b-8d6f4a769f82@linaro.org>
Date: Thu, 6 Mar 2025 12:34:49 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: platform: qcom/iris: split
 iris_vpu_power_off_controller in multiple steps
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <SPBTL2Mq2VFDygL8bL4vg-byfmn_GW3b6yBuJCG-0-RloybQS5iNNMZYiAKejJoPPUhp5CgkM46PXu5d3OLSRA==@protonmail.internalid>
 <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 19:05, Neil Armstrong wrote:
> In order to support vpu33, the iris_vpu_power_off_controller needs to be
> reused and extended, but the AON_WRAPPER_MVP_NOC_LPI_CONTROL cannot be
> set from the power_off_controller sequence like vpu2 and vpu3 so
> split the power_off_controller into 3 steps:
> - iris_vpu_power_off_controller_begin
> - iris_vpu_power_off_controller_end
> - iris_vpu_power_off_controller_disable
> 
> And use them in a common iris_vpu_power_off_controller() for
> vpu2 and vpu3 based platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 46 ++++++++++++++++------
>   1 file changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..d6ce92f3c7544e44dccca26bf6a4c95a720f9229 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -211,33 +211,29 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>   	return -EAGAIN;
>   }
> 
> -static int iris_vpu_power_off_controller(struct iris_core *core)
> +static void iris_vpu_power_off_controller_begin(struct iris_core *core)
>   {
> -	u32 val = 0;
> -	int ret;
> -
>   	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +}
> 
> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> -
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> +static int iris_vpu_power_off_controller_end(struct iris_core *core)
> +{
> +	u32 val = 0;
> +	int ret;
> 
>   	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> 
>   	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>   				 val, val & BIT(0), 200, 2000);
>   	if (ret)
> -		goto disable_power;
> +		return ret;
> 
>   	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> 
>   	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>   				 val, val == 0, 200, 2000);
>   	if (ret)
> -		goto disable_power;
> +		return ret;
> 
>   	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>   	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> @@ -245,10 +241,34 @@ static int iris_vpu_power_off_controller(struct iris_core *core)
>   	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>   	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> 
> -disable_power:
> +	return 0;
> +}
> +
> +static void iris_vpu_power_off_controller_disable(struct iris_core *core)
> +{
>   	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>   	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu_power_off_controller(struct iris_core *core)
> +{
> +	u32 val = 0;
> +	int ret;
> +
> +	iris_vpu_power_off_controller_begin(core);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	iris_vpu_power_off_controller_end(core);
> +
> +disable_power:
> +	iris_vpu_power_off_controller_disable(core);
> 
>   	return 0;
>   }
> 
> --
> 2.34.1
> 
> 

Have you checked that rb5/sm8250 still works after this change ?

---
bod

