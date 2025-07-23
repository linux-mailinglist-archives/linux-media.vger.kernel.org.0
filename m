Return-Path: <linux-media+bounces-38257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24739B0F2AF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BAD0546975
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C68E2E7182;
	Wed, 23 Jul 2025 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCT63NZA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221962D29C7
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275564; cv=none; b=LnYetkn4iBGAMf5e89vzTYYtL2NtJBPJs8mbw6U37CQlUyD85KMQjAmv5c0MZs/ftAqaCz/gSGH1TrVIUe5nkj/T9a5J8jUONwm/Xc7xZd8JqA4yYOTMCKeG6DU2Us2LqXS5OCn/NlbvzMTSkV9MTCUAIKwxu1fwVdPi8cr8QBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275564; c=relaxed/simple;
	bh=khCG0KptAP6NaZggBGTic01zIckJoToHWi0OoBlAkH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXXcFZCJxUqbScX+YRpGyeB2F8BOtW50r45tW9Q4ZWuuWoKZOkY8OFAsT+4NpUF91JUzXMNfmHeoEDZQM2ch2t4Kpk47zdIG/vWrCM/b45hvXhda3GryXx+5hRg32GzyRU/cRiL35wa17Ka8LzApv8vlijsUTJ26n/zgTTvnLXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCT63NZA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so50453065e9.2
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753275561; x=1753880361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHqIjMd+P/SJHy5xoLgnpaMPi1Gzrb7ETcwEIkD73xo=;
        b=RCT63NZAkpqCwvGtuL18zzLwBXsUO5xAsgeYkXH9fHw97FOuYstH+tf/HE/ZjN/tIy
         fmkNkourDUG4rrrgmc4tikcnEy0eBouV811PSrEhqoAEFNnV09eIUWJi2WyQZne5i/+X
         Jb4gym5f2Et9l+gxiyI5MzuX5vvlOiK/uAq4vgspYU4yHekyw9yveTbENK9glYSjdoAM
         4AaFAn4VPGCRzlPlmXVJHr3/r3sIHyaCeEMuPXFtEJepegp0vxPBGTFw8jlp0mN9U/J1
         90xIgqBuCELtWTKHhqvnfQr1P7WT6Kxg69VUMe3r6wbwdQZ59corkt2TaHFzlY8oRCwt
         yZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275561; x=1753880361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHqIjMd+P/SJHy5xoLgnpaMPi1Gzrb7ETcwEIkD73xo=;
        b=qIKrHhISzM3whaEA8rJQoJA6aoVDQH4oEAw6oRMmfs17rjTY058QXVZYMJNy7Eeig8
         yOFDvgSKgeWrSVAIroUAid1+hWhBiy6HVl1Nbx+YFY4kcjlzAzNJL2sGS2CoIpyu7Es8
         wl08H+YCchrO1/Z7jxICtXosceLYyW3FECSmF740C7UPVkeZivgj56gXKTw+0UN6DAdg
         m2o7or3KQt7XEc5lYdKW6FJZCwOKr8AvSx1hFooeYaYy+QhTI9qVFEmifIjVKFksg/RB
         0SWpVqQ4NGoPGyhCJw2cLFIFU249XTDAgmiD0efCgTINiCgrkAVPRMuXB4OBhHl0dUVE
         0Nxg==
X-Gm-Message-State: AOJu0YyRgMPw1Z0jsLPwvPDpDgBEIZVuSSq4cuGI5z0o81iShDmc9FMx
	G2rTAGGY/9wfSebp98QUAilTSIcaM+F9gXtj2kxgUKkDkOok2DTJa1QgTBZoMJvlBk0=
X-Gm-Gg: ASbGncuNZJZ83FPtoQ2J+K0GrFDumcrdOf4AwxeydyTInww7Ph9E53+0UZ8Q49vkrIE
	0m4GrSWoKdNroqU7F9JRbe7bjEmXtNCBBJDDhIyY931D2XnZfuenu5902MjGQ5PW0tRdtDqTRdb
	i6WZ0qTnQ4sb9WShw75q9/bpENctBgGDNdIJlx0gPQ0sIty0il8ZNVfpRwaTJ1nkMWrn4qNlBoy
	hnXVYJ2cu9aIZpAlcRP6+G9k7MBihCMqAnfVcdJ+G9wBB2Im/anyqFvwlzn7pjMrPco4pNHCRRq
	YOBwNmDMoIG6kWakDbfr4oWDIEj49f/oJX2sT98NNivq55jbOhmKIxhb270J0VUQhqVA5++XdwK
	UoT+aIDNacDlm58A6H1oEAYm6wMNiwsRwPbyHyZ1TMtURdidlcspFokJ4vlDHtLM=
X-Google-Smtp-Source: AGHT+IG0j8FcnTm0B0Yg7OBz1ykdRWeZiovtD493OaI4zAFXR6n36is0Svaup39AwGIP9E5+pbc5pQ==
X-Received: by 2002:a05:600c:870d:b0:456:1a6f:8018 with SMTP id 5b1f17b1804b1-45868c92070mr26199175e9.8.1753275561353;
        Wed, 23 Jul 2025 05:59:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45869198e5dsm23372175e9.9.2025.07.23.05.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:59:20 -0700 (PDT)
Message-ID: <59658a3e-6a5b-4622-9a3b-782d84d1d17d@linaro.org>
Date: Wed, 23 Jul 2025 13:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
 quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/07/2025 13:56, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..27b033a3a26e0474c37353a0fe7627586e6416e2 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>   
>   static int core_clks_enable(struct venus_core *core)
>   {
> +	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
> +	unsigned int freq_tbl_size = core->res->freq_tbl_size;
>   	const struct venus_resources *res = core->res;
>   	struct device *dev = core->dev;
>   	unsigned long freq = 0;
> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
>   	int ret;
>   
>   	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> -	dev_pm_opp_put(opp);
> +	if (IS_ERR(opp)) {
> +		if (!freq_tbl)
> +			return -EINVAL;

-ENODEV

> +		freq = freq_tbl[freq_tbl_size - 1].freq;
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
> +
>   
>   	for (i = 0; i < res->clks_num; i++) {
>   		if (IS_V6(core)) {
> 
> ---
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> change-id: 20250721-fallback_of_opp_table-4ea39376f617
> 
> Best regards,

With that changed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

