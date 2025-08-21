Return-Path: <linux-media+bounces-40605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB7B2FB8C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00ACAAE3C41
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6832520B80B;
	Thu, 21 Aug 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZtgsXTS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429D198E9B
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783940; cv=none; b=cOqAhauysiC02XagEDOjnX4imyTO5hXP8vs1IMd03FzRsLLgNKHZVntCmA77qxCV4ZctBgNg8fs/wpXCAGd8HM6dyjuAg7lsFvB34owb9q1aIjz1j7KJGtqa/ChKnzHrqwFOrTxfx3Vt+kP7rCcNPFFHsrHCC0HzPyI1iXXHgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783940; c=relaxed/simple;
	bh=W5OpRpgQZSAYng9DpP2P+lhbg+Ejeokss/8tz9pCB5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRATcYXdyf45Fn51XKDkQLcp6pc5VD+GuFLqd0SFSFkkTcmGGQWnnept0UpYb0EGqb4Yb4h+tekhqS8HspHIxZ2NG2FT5yP20x74ZvxhhrBtb2yGND3OAMChVJuC9+UMnrRfcNmVQ2tjOXYQ3Fq2ZKPtsiPVzDA+JPQxWSwd9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZtgsXTS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e413a219so759155f8f.3
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783937; x=1756388737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2htF7UYkLJf9Z7CPGicbBUD/Z2w4PEBts+j2YgNwTZo=;
        b=kZtgsXTS6BBRX0H/XH68AeKv692CNdEZ246xQpqaRjdlSCXkNT+7pv6AsdyoldwkIT
         t4CsLnIyheKK8BJfMNB1XJCd//CtMvDdTVOkZuOTdWOJy9HiMva5TwTC4mStiz6jgZAV
         NRQx1Pjz9fnwKrHnbETV6/zyfbkl+BOGypV3HdkA5EaKoBceVOPbsdnw9IJcez5s7FsD
         AGqjp3omZg27KFX/q6VXccfw1C7p9lNo+p+iQtC7mKBebtcz0YbE4CNgutnSlZYqbsVO
         OIPHzlDZ7a3ZijkXoaE44qWgfuJ7UpOLqe3iPRmfFBtF0ZdOwe6HtU5mqiYVyZjUKWyp
         Y3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783937; x=1756388737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2htF7UYkLJf9Z7CPGicbBUD/Z2w4PEBts+j2YgNwTZo=;
        b=V+QEhiCm1PcmxsWvQKTaU7kRySZbsiDTBx6RVp3BPBl86sUEd10j3rVzfT7Wn07hxU
         oUUczcRPwvielzTL0M33vflZBJpEEK1Sb3HwjvF28lBzvuuNABmsn/TVP1MlWCD6ln5S
         H/am41nq0WF/1DIbSbD+VqpFlqz2yW2rsXvM0zpe2LiIojB4fp/P6F7TGybnGJk6jC7q
         Nz85oR/cpQubzw42PG/wPx0Bol+pcv9QXplhfEnsn0hLwPL25u7dbWm9PaqTdZ9biJxu
         c/HXsQDdawFNvkzpi3SNLG+Qu7stfhPaCmw7ffkISsDp0AWGsHE4erND16USLN8xLMYS
         bX0Q==
X-Gm-Message-State: AOJu0Ywkbi6SAS4Ch2irqCPpDXc1ESmQZZ/mH6XxYLI+c3jKT/mBj638
	RwfBg9/mYzzyHJgK53WCPoNlgHZftAaXUc9XTFpjd9XS7gk783+kbIEgKaUJm3Vss69OZrTgQc8
	Jpj/NFIc=
X-Gm-Gg: ASbGnct24ZLacFF3lSf5+QZ8dM9DpzaY0uDOpX2k251at49p0s3r4OKiCRnoQ+DEQQP
	Ex5uIk2eZggdmArKm66Eiw1LuBcT4bUWW8EYo4zWjtjw37UrGyzUSvnQdMHXfRnecXS9eqMof8k
	Qiumcf10s2cifMBdaCl69tV9Mw1Q6UOVoBBfrsww0a8cZjjVm1KBwXy5a9aElCqxiu7rrBplBXy
	cNoaVT1ePkxNaV1jWEUTEZSv9bq/BOSAmVqOpuqapF5zNB4Fh/WR0ZiOtEWzTtPbVehSd5Gn9fL
	+MhdQPn5qkxECDhE7IOSd6EYdX9Siq/obrPLjhzaAI5ZOw1ZGS/44tliyyDy3fvJ+3WCaH6EUKO
	TJbts1abt3tBtGnQu+QiGkiO/XNye9aB0AHAzyUfNR6HZdxoeCF9O2dK9wyfohftC
X-Google-Smtp-Source: AGHT+IGrfdqa8HYNFWMTlms4ECBMzRvLwkRwupDy9hYePkEXxbabsC2NpkM7F7VGAfJ6CBe0qSalDw==
X-Received: by 2002:a05:6000:40dd:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3c494fc7fe2mr2403420f8f.12.1755783936977;
        Thu, 21 Aug 2025 06:45:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14683405e9.2.2025.08.21.06.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 06:45:36 -0700 (PDT)
Message-ID: <30e1e803-0218-4841-a73b-5c19d8bf48cb@linaro.org>
Date: Thu, 21 Aug 2025 14:45:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 11:54, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes in v3:
> - Fixed the loop to capture the  success of the last power-on command (Bryan)
> - Link to v2: https://lore.kernel.org/r/20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com
> 
> Changes in v2:
> - Restructured loop for readability (Jorge)
> - Used defines for bits (Konrad, Jorge)
> - Used udelay for short waits (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c | 32 +++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..bfc52eb04ed0e1c88efe74a8d27bb95e8a0ca331 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -19,6 +19,9 @@
>   #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>   #define REQ_POWER_DOWN_PREP			BIT(0)
>   #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
>   #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>   #define CORE_CLK_RUN				0x0
>   
> @@ -109,7 +112,9 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>   
>   static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   {
> +	bool handshake_done = false, handshake_busy = false;
>   	u32 reg_val = 0, value, i;
> +	u32 count = 0;
>   	int ret;
>   
>   	if (iris_vpu3x_hw_power_collapsed(core))
> @@ -128,13 +133,36 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   			goto disable_power;
>   	}
>   
> +	/* Retry up to 1000 times as recommended by hardware documentation */
> +	do {
> +		/* set MNoC to low power */
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done = value & NOC_LPI_STATUS_DONE;
> +		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
>   	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>   				 reg_val, reg_val & BIT(0), 200, 2000);
>   	if (ret)
>   		goto disable_power;
>   
> -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>   
>   	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>   	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

