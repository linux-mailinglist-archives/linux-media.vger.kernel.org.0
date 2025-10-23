Return-Path: <linux-media+bounces-45409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13ABC0214F
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446413A3DB7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C918C333736;
	Thu, 23 Oct 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGgAx3tO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA93370FD
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761232524; cv=none; b=OB+G54Pv8EIqPSR9B4Q0oaT+c2YokYga2rDB7MXe+MmnG+hCdmI7t+Zoj1kJ+bHj2xBHLmwM7pm1cRkFnPsgX2UuzBOZlcCTEhmDB/o7bEY9VwRhAHG0gRc/meXUdB59oFtDtPXNCAIDbR8JUbq6RiiqyvkIUb2WR30tdSYZdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761232524; c=relaxed/simple;
	bh=OOAM6yPU9k0f4vn61C3YarPrKdCfoHyQloocfiyo0ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhP6vH79KnoKBfQh/FN2dfeLELZ0J6wznuv/7yVionq2KAfnQvHmkMPG4rdUBWUPLrO8bRo7yE+F+dE+S3V82PJNY9Auh/4L6TuOIIRx1cpZMZ8p9un9kpuAoRK9r/8/orqmfasnT4nDPBtZ/OhbmeW7OE19GwM4LnIr1OlvxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGgAx3tO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d5e04e0d3so79154766b.2
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761232519; x=1761837319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SR6JVbq0maLqOTJovEolNdtdfndcydLjyHL6av7bzsM=;
        b=TGgAx3tOd+GJJ4WmQRCOBHUlviPyxyv0JQGFPm+b+/zwe6WHDz750TMShfTb9blDvF
         t1+6pRYMYpa10e9Luz6qs8JVakGwATctwokVTCQwdT9TGFlF17Y0Ph3hDLhIgQl0YypK
         nOwWyaBMAXeq4UTOrkaog2304STzIFda/viWfKYdKKajitrzEtxMLokPzg2MgutbW0zf
         UB07/kwzA3YRwTHN2ggZTgLa36uULWXcCk2NWzHtzhdMVIKJyPFGVEej7FiCGqp0kvKF
         EFQHuwnJEnrMrUqpuG03yb9Fn+HOimjkmvVj+t9Y7xsXd3n1HgekgjHWmNmiDIrGY1lu
         RgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232519; x=1761837319;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SR6JVbq0maLqOTJovEolNdtdfndcydLjyHL6av7bzsM=;
        b=BCCarWPfLQCuOFYjx3J2po3yt0uoxrsGQfQQ6wiD6UQvVh5OPnfA0dUmok7QwB85JT
         LO5X1tEF07dScGWOMiAbxJfwQGkHwG4WOoGrhu97uruBsGBJQKeV1gAgphBbQcgL8Wya
         Ms+0GLez0ux7qkgXVx29+sDOlF9tynQ3h4PYaYUmImTD6eaBJQZIrJtxzGP4jUK1293q
         UVLfyu1usGQwi2y9PPo1+UL8EDEJCxyn9P+g8Xxt5c3F9Os6+JurAaJcU5eiY4+Ld9YV
         ac7v1hlLt6hKt1YkQnRa+ciQsF1BZzyeqBwsm4BN/GgJehVbSlLGjWxb3Ze6/xHjeEUT
         M0uw==
X-Forwarded-Encrypted: i=1; AJvYcCVUY90LGRjzfi5BoK3htU8uc/vVlqQsURQBcsPhsmX7Mc+QqJMD6/i2xHBN03w4m3IRxOLt3le8kMikOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzavb+ZQTjFJW+ot4kvTmMKWO6TkOCGUfKqvbB+NvbqWcHYREB
	lXy2qo/uEGXoedJMFgbLJ7Ugn2A7EHOSdoQBt1q0kZ8xXjXG5x1CLUwNSTfm1KEO6mg=
X-Gm-Gg: ASbGncskGF1heK/yMpPtcBPGKlZZvLmeBQMYbRJDg8JCGxC8HPfCplaw5zumHsFmTkZ
	qI8WSOwTjy9qOEOtoGlX0AruOAFO9EevyBS1C3YpB9liw2ejvmU36Xlu/hhPpecBXKEGaK4lUqn
	5cBq1E6gq0aeMAxVq7c42ce7VFnME8XN0DPW2pPr+w+JtxULS0rTUFftB1N0fxMT+1hDukwCLKP
	mcOHFAgtGjj/TrvmvlKlJl7JtBfJpyq6N1IEFnWvUyHAoLPjtNXyA9im0WUzVvgkWDfqFeeo39D
	uZWuYT6I01nV1PI49riJBiqQKqH8LxD0rOg9BjHINCfVjzyT6ejnxdvEcL3GiLJR9idF7gdzgqT
	j1aB2qg0dyAd/v5pamQqbs825db17UHpiiR17ouAr/jIalWyYfByGeqgAp9j6E/4m59BgngYlU2
	/w2AUYBCjU4L/+Zbn4RqJjQMVj8zRdy8+n6DIj+jcztJAfpzJGOdVyVgL+bbAcB96a
X-Google-Smtp-Source: AGHT+IHX9Rk4VffmvhFkwQYCl3vwehPJmqTunPSggye27fB5qYt7XyAySiQ9tHQi4hnTNmN8WQLOSA==
X-Received: by 2002:a17:907:7f0c:b0:b44:2d0:e05f with SMTP id a640c23a62f3a-b6473951fa7mr3118312066b.33.1761232519106;
        Thu, 23 Oct 2025 08:15:19 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511d00e0sm241594966b.2.2025.10.23.08.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:15:18 -0700 (PDT)
Message-ID: <9f197aee-17a4-4025-811f-9824417967bb@linaro.org>
Date: Thu, 23 Oct 2025 16:15:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: qcom: camss: Add CSIPHY 2.2.0 lane
 configuration for SM8650
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <oI2q4H4_dd2aVoehFeJaA5dVC8-toT_0jw4tCgUBuTl6cjDBPSlEZromPtaLR8KncR6amP4u1qFIFW2LFSBThw==@protonmail.internalid>
 <20251017031131.2232687-4-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017031131.2232687-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 04:11, Vladimir Zapolskiy wrote:
> Add a configuration for all CSI lanes into D-PHY bus mode on Qualcomm
> SM8650 CAMSS CSIPHY IPs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 102 ++++++++++++++++++
>   1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a229ba04b158..619abbf60781 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -587,6 +587,102 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>   	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
> 
> +/* GEN2 2.2.0 2PH 4 lane DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8650[] = {
> +	{0x0e94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0ea0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e0c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e38, 0x1f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e2c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e34, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e1c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e3c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e04, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0e08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0e10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x00a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0c94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0ca0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c00, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c38, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c2c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c34, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c1c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c3c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c04, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0c08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_x1e80100[] = {
> @@ -914,6 +1010,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = true;
> @@ -1018,6 +1115,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>   		regs->offset = 0x1000;
>   		break;
> +	case CAMSS_8650:
> +		regs->lane_regs = &lane_regs_sm8650[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		regs->offset = 0x1000;
> +		break;
>   	case CAMSS_8300:
>   	case CAMSS_8775P:
>   		regs->lane_regs = &lane_regs_sa8775p[0];
> --
> 2.49.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

