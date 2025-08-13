Return-Path: <linux-media+bounces-39752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188AB24446
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2127234C2
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947E82ED174;
	Wed, 13 Aug 2025 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npiwyHt+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D342EBBA4
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073585; cv=none; b=D+bx8pKyfCsGLFvqsrJJ9IrqWu4Vy3RzUsyfWED6OetaUt7CfVg8MmDaE7+LnZLkcVCMy6OwdPqfCt8hcjygZRsgWjxVuhQyaoONyQ0s7x89sBxr3vgDaflYIENJjz2nBm0mcGX83UElF98rS3b3LOx9JQw9E4A/G+jhExHyPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073585; c=relaxed/simple;
	bh=ow3nCKIZJTiEJCUMKg884Dzp9UOiC9b7yUPwrBeg9sg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RnlTecIjNnRBOO5F0sVjE7bARhlx7ALRaRNIZvFAUlvJVpbeNp8ga0VS1HTCVuS7UGE6nM7cMBqCdItI7HrLug0x051nhLD9tHfFvrwQJg4N6aZTCuwvBSyJN6CmhuwnEint7RpVto83asnp04i0o7lWIsCSvPkvHrrc21bRHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npiwyHt+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so40396445e9.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755073580; x=1755678380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmVPi1TkVGoBOlA3mTfpnGt8GB15mzm46GxusQjBdHM=;
        b=npiwyHt+QzHeZxXuJP8zhCFonrTwUXl+4tntItSAZj23eitJWcl2HY6s1LFxNdWJc/
         Ef0fYQg7jULwSOARtpWl43DWnqAljjfXfS/MRws3pJCp1axRcFarib5/zX2cMl7GCMTQ
         M0b8Y+Iayrz9V8ucTKjoxnwfegugcnVCj6st7DCNq2ExuTi2wuhI4OjJnyd3gzGMkJ+o
         WpukAV9jxNG0kXbec2k2XZ5DqjW2n1ZtfucOzkHtOWrSI5koGi2VG5ca0fqnYDO1q4nx
         a2/0DCHBCRA7dZDdTepa0lV54gn/DCvSTkxIAaIdasjxsTpmdJ1uP1b5Vk2mBBX8vo4j
         yvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073580; x=1755678380;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MmVPi1TkVGoBOlA3mTfpnGt8GB15mzm46GxusQjBdHM=;
        b=kvMSULB9kON6RWPcLonhzCj3y/BgEUkNzjdeJySNtLtyVkqEZU3VlP57nPxJBcd5Wh
         SKBWOm1kZDH9VDwTiF+6+xH0mcxnW1AQf3huN5DajGCfGaqNBt76fjM2fy/tfxfYdZPE
         qaRxRX3rgXLAija1L7tlUdr/Td/rXQTfcofxX14Vu4ZZjGjPKiT6VK23PgraLZz8FKeD
         c0TuCL+fPf9mrYLozByBhj+FBwpJ+N7N1FGH1QL2+qUdN/KGDBU7wrmGcFGs9tozVxtU
         TOqXz8nXrPwLGBxX0F6oMTmGLkOwErXF2oz43Ws27HvspAJ7AE9x/8xOHp0tN8NXTbmy
         DtaA==
X-Gm-Message-State: AOJu0YzJo51+XlP25PQ3C0VPzgckLWO8FWra8lf2bBFi/P8UYg1j9P7S
	KHl01I99NZRa89iIi5LElGg6+e1SOVd+gEN/UvKcWKMJvQ1uSNvIYJaI4t0yOlTRJhk=
X-Gm-Gg: ASbGncswD6e+71tLtQcgqneqY4n+xTiBNg2LsdcTnyUlbodu8FOh5E81EULQTrd0BVs
	mf5T0YQFMpp2NJvfHdymkxS+ORokdx6dugGvgHb5oP0PuMQbGDnnfYA+IRbg0LB1SK7e+eW6aFK
	qNTBvSDWyqPzG4oKkHY/nuYpDesu299OhUH/44jIfCyBoIsBraeZLvAEmcimi5CvYD0djVnIjw2
	LMOvAnSlaE1GXW3Ey+0+lTG/09tGjcoo9/inlUDN7NAUtolYOTPWU5WViuRjP/b6TuwwwUXVp5p
	E9jklPQtKvS5IbpH6RALBpsyfiVP3up37FzXZXDJlmqCxONwakntmOCFENP+OR/EIaGC74ka84l
	/SUSU2y2njaE75bZZle2QrzS+z5o7LQRrh0EPL4PE2/P9av7jXrA71J/ajh318U0V5xPJiLpsew
	K4jLDOKgpLsw==
X-Google-Smtp-Source: AGHT+IF2tdy5U27h5sRbKSKrBXJKY7csqOtxELBj5eXcJuYRanuSo4SwNaNC2NdVLpSSWAwN538YrA==
X-Received: by 2002:a05:600c:3b25:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45a165db037mr15277265e9.22.1755073580429;
        Wed, 13 Aug 2025 01:26:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3e43:d171:89d1:18e8? ([2a01:e0a:3d9:2080:3e43:d171:89d1:18e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abf0csm45909628f8f.14.2025.08.13.01.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:26:20 -0700 (PDT)
Message-ID: <f1cff45e-5455-4151-b6f0-5a86859b1bd5@linaro.org>
Date: Wed, 13 Aug 2025 10:26:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
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
In-Reply-To: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 09:53, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes in v2:
> - Restructured loop for readability (Jorge)
> - Used defines for bits (Konrad, Jorge)
> - Used udelay for short waits (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com
> 
> Please note that I have not added "Tested-by" tag from Neil in this update,
> as the NOC handshake loop has been restructured.
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c | 30 +++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..a621878f02f7196de29c9e290a6c5acea34eba8c 100644
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
> @@ -128,13 +133,34 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   			goto disable_power;
>   	}
>   
> +	/* set MNoC to low power */
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	do {
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
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
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


Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

