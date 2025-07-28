Return-Path: <linux-media+bounces-38569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641CB13CCF
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F0F542A6E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5109D26E6E8;
	Mon, 28 Jul 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RH3MwOZd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252D826B759
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711828; cv=none; b=pA3KPRLrS16zrtax2HZHYH+Hf1DXo1tm4SJni9sa3wuhoUK4U6DsSqWHsy4aVyZW+O3z11Hgu7nUmZYfw7JUhiuiKqFdTN9WKUXc4Yvarlsu3KWtqR7kI3XmFdcTbnVfRF3ajEf24EzRg4IIslfxvWY/qSYoMYQBu0HfcTcXpVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711828; c=relaxed/simple;
	bh=8QWt017xkISsAk3LCIBNjlD5r69fSzYxEYbKfuENFFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWAcIkOkC/qzOH0ZS4wb//xqK+/y/+VXBbjMig0gvgs9C6zsV7PGTbh8nBkQMVdevEPLc3yCrZniDUN5moAroL30Ysfh12qk4DqxlM/J6vuZ9BouvrVsDS4Gxsms/+hPjnbusqs9lbjFiqpocoZjxuRXLrOjdmOf0ePFbb0S8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RH3MwOZd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so866815066b.3
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711825; x=1754316625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=RH3MwOZdFiMKMjOOi0PMYga09DUNVvtSFQfi35uL2Kh7amlQJM1InUPRmtsP6KmU4j
         jGtmfAhcGU9sRC31dT42wj+DasrUhxgnJUzbpdJNE6lENXli3lJDQ+N9NNNI24eiqOty
         IZ2HVnOm7/RiRincuISGf3LhKqTHaLMGyLZA6nAChTePPyclTz8uAlG9+dSxNdChx8Xi
         FtedShhRY4cvpS/fzFqtg1FlR+U+bNNO3dPkQkNTNEcLzaODwlSTZj2H5kPPzwi12hlP
         Z0OeYdqTCMgfR6MPldzL1DN41ZMddDtDbNkri6LeFoVxV/DsXhkexEWvxidal6Xh9n9c
         N7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711825; x=1754316625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=cXtGbzlhrPxnbjtjiBGimm1EjtatW3FROezdtPcJZdkcg/9DtwV2UZfj7kGKs+vCaS
         IB7T7gMq38q7+nFx9oM+lB/JKVL3DvHOdZxbJI4uEZhS+xhRBzYEnaTiKS6bfKAU92n5
         IQEbQ1kk/v7ksTwDT6qy0CXpqw7JWwnAASxa5K+/0EI1QVSQeco1fwyfpIgFYt368LW8
         Lkv0tm7sTUQsAZrJUqJcLtnkOc1G5KMwQ/jKcGwDflQJdM8bUbRd3MWuxspWY7aSdyM7
         RoQ1I74I3DgUQuqeM+CtLlKGoMidPO6yHeHGU5oiDg6BrFERcWvuVa/g2P6xJm2lJ62N
         655A==
X-Forwarded-Encrypted: i=1; AJvYcCWv6MX3TzcGi5bNudfUXzFDNJgl5InlYM6CvsTEfBPxVk2fr3ko9Rn71YnnYGEz7EygkSHqDlmUoCqgSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8o2i8HWFPtJR79dtLomlPTWEQDm9UlFop+A26qiDOMIr1hrYU
	XDu0/FYSa2pGQETSMyROQ/jXOpJetMqDTdEviBbXegQRCeZkaQKZt/7Z3qZznKH+/bo=
X-Gm-Gg: ASbGncvXv0E2e/wtwezIz3yn+jDo8mk70Y4mH/Y4/i0OaQqJZ+Qrg7+68oPJRsTwOQW
	4mXFz8KAQVr59Nyh7fDTj17ehVCLiTSr7M8i6Ew2Rsf/wTVGjQEkpVWqUep1NDrPrbAt5pDig9U
	EQWeMyyZLw5Dbnez6dLbRspJPFIX5VAMUeS/tBQcKudwOUlr/XvBgneJ69Z7cBOzoKoqbX5a9g2
	kedZI+Xi8DGSfMc1JuJeHiuX+RFkOXYT2R8EuhHW3vBy5E+XKZxEXWHvwCsb6bYszNMXvsvioC0
	th4SfesrcE23I70xbom5RVsRW6DVj/avhoF35YJ9lfYxgAgRuNHFxOpDK2NhCe+5IZQrEHmfmO4
	hzm4LeI9j4dfMu+M7/WCYqj7rLu0mjnz9tWwdI5F8GGz5UmY2KStqLo0eQtvtlm4=
X-Google-Smtp-Source: AGHT+IFw4HemneYmErhcNEVhL/wWhjoTApex97MjdvezqczWzvkDScv5n0Pf+ajLxJrV76XF66pw0A==
X-Received: by 2002:a17:907:c2a:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-af619aff29emr1265342966b.52.1753711825333;
        Mon, 28 Jul 2025 07:10:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a669c8sm420485966b.72.2025.07.28.07.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:10:24 -0700 (PDT)
Message-ID: <5eba28a7-3d5a-4323-b74c-1bdbc738b9f4@linaro.org>
Date: Mon, 28 Jul 2025 15:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] media: qcom: camss: Enumerate resources for
 SA8775P
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Enumerate csiphy, csid and vfe resources for SA8775P.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3a11c0a98eb1..b6e80088d1df 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4185,7 +4185,14 @@ static const struct camss_resources msm8996_resources = {
>   static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8775p,
> +	.csid_res = csid_res_8775p,
> +	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
> +	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_sa8775p,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
> +	.csid_num = ARRAY_SIZE(csid_res_8775p),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   	.link_entities = camss_link_entities
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

