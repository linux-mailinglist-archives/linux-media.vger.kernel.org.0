Return-Path: <linux-media+bounces-38573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A2B13CC2
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B3147A95BC
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D184F26D4CE;
	Mon, 28 Jul 2025 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOE6eT/f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99C26B76D
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712223; cv=none; b=UbGWy4Q33nvdgiibRzNyV5nrbR3aKckerYgoMZ5GPx1hXu/mtIfIxaZHw/4J6RZOa1cXe+Pnsl7FngtIU62EgrPkHPxUY+E08Ec9Of7Vhg/yS7NzBbts4VwF+VOPsuQZXWkFYy/PcIKNnmGTtyjrdbP0cP0NtD04wO5SYi2QJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712223; c=relaxed/simple;
	bh=oWZus/PApRRgGlXeH2+7LZZRDLYzvND/nR+5+yr2zkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrrW2MjAbzC8FPNggZ4PbEHledrJXIWFYunqbu2leeEwwCZNqvfi5f5x0pu/NPbxeDCPeYwKvZuo8aEgNvtBwHrYpoWiBWWIAsCHP8051qqUgH9u8ZPIwA4MSkVxB7T/jHzbgz5KD/0S2M0Uu9gb9O/xqFj2mydJser9/rjdDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOE6eT/f; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so9298714a12.2
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712220; x=1754317020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zOZIuYmUiChxW6T4ALeyJXTvfsAOgbBQ0gteD/iBsA=;
        b=EOE6eT/fyBqwOjx5z7DVmZVUBvv7siE/bCiNQDFzjO9STyTrQTfkUe6rqpxl8h+d/G
         SfZgr/XmO1p9x5Im03OMqQIJ477Uubj9o8WQ1M9UROfB5JMYhIKVxUvZz3PZuvvdWukl
         m+gGJHJbAA4czebjpye+djobkhhmTNcaKWjfALMN/JI+jHLOC8HuwYNmGnd76ogwT1jE
         zDH3XqH75QlA/AzJY2SNGrxYIL1ecfVtTWn1L8CAnBD/nRq3VQPeCFEM2vuvmcB2ZDdQ
         4r0RkoPupE08VhFpzqMilAyt/nfpLynwgbXCDvPuvV0zmoFakGYjztTnAwZlNkcELCDn
         1O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712220; x=1754317020;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zOZIuYmUiChxW6T4ALeyJXTvfsAOgbBQ0gteD/iBsA=;
        b=aXaAnzy/5gFJ/OdVWs1xaoZAvP1UOjtDTd4dj5Lod+JiVj6BA6Y6a6w9G+ZsaNU8YO
         o0xQa3WqtsinXet8GWMi2gExW45i2lXgqGDvXf3M4oxqCIgTqXvHO1VsJ1vzLSX2C5ig
         cieVERok2Pszsnel4AZP53BOZWf5T5EH99M2psOO96FwCsLlmh6Kg6HDpVK56vkeYz3G
         dK4+TXV3BBuqnUfsWKo2DJ8dZhcF/B/saRZ5o/rB08phVcWABHuQ0r1N33MGIA4SxAyn
         sYv/Cz1eoXGC9cVjs00QZ51mEY3fuZzk2CKkazlUNPoNkaROrEyenV/lq+5KMXgFH4kk
         CKEg==
X-Forwarded-Encrypted: i=1; AJvYcCWWU6xy5u8JaHNtkmtgX6TZ47N8ZO2KEqCYD+Z50rf6NnDwcH1PaMpW831bNcPVTVHsFZhZUmxRhqU3PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQcEfprm/qUztkdtYQZYtAE27yfnrY//f+l2I44cLeCXMBeo+C
	iHJgPMFwrP7+iUATIQ+ylp+CXZiXIZ1St6G+RR5A+2Unz0VoIxvBswIc+DKw1zL+OjA=
X-Gm-Gg: ASbGncvFQ0x5lT0yhaMupvloZ04OKkj0U38VnO0BYuzlsdqZtTNfm/ZJ1xJM4AABBT2
	gdt0wDZJa4Hi+qhVJ72t9BgOEd4OECfa8tV5/qtLVV9CLJd78mZLMks3LQfauf7o0UqGZetAjqD
	AGVxe+1pLasCKcDSSkfyPS2tvhGVKJWjfTqmkAt1QKSAOhrOQRhquyYhZk0VtRBjXADG0G7n2iQ
	TG2nibUWcCuCJDTyZ7jOCtrrE4T/oCMJgrEr2pW6o6qObuSsbCGBwXKDl5klOARayVn7/msIsYe
	AXyVTxtNWJ4V+SmcUXzos3QDZrUSU1ovnZfnoPjSawCL14OImFUbRYq5i1ZVqZOd5ud5Xf5atA6
	3gF0TuqsVtI2hptcfZ/ALx/Y7d9iCHhlkVZWvRnq/gsQgMwK/sEmrqKIQSnAC+2M=
X-Google-Smtp-Source: AGHT+IFF2jy8/UAzO9xj1temCnYhXpEOaVAh+jtnHHRa4ju0zBuFE/o752WTnfDGbuMr36P63jZ5aw==
X-Received: by 2002:a05:6402:42c8:b0:615:4227:3b2e with SMTP id 4fb4d7f45d1cf-61542273ce2mr3339176a12.23.1753712219586;
        Mon, 28 Jul 2025 07:16:59 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6153055f5a8sm1894547a12.48.2025.07.28.07.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:16:59 -0700 (PDT)
Message-ID: <4cb6fd0d-ae76-4a94-bbd1-ace79633c05e@linaro.org>
Date: Mon, 28 Jul 2025 15:16:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] media: qcom: camss: Enumerate resources for
 QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:11, Vikram Sharma wrote:
> Enumerate csiphy, csid and vfe resources for qcs8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 124bb56167cd..6cd6a5116f5e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4569,7 +4569,14 @@ static const struct camss_resources msm8996_resources = {
>   static const struct camss_resources qcs8300_resources = {
>   	.version = CAMSS_8300,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8300,
> +	.csid_res = csid_res_8300,
> +	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
> +	.vfe_res = vfe_res_8300,
>   	.icc_res = icc_res_qcs8300,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
> +	.csid_num = ARRAY_SIZE(csid_res_8300),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8300),
>   	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
>   	.link_entities = camss_link_entities
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

