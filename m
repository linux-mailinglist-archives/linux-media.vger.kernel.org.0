Return-Path: <linux-media+bounces-52142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K4gBUmEgmneVgMAu9opvQ
	(envelope-from <linux-media+bounces-52142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:27:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE3CDFBF3
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 213F630B27B7
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 23:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867E132AAB8;
	Tue,  3 Feb 2026 23:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFvJ6y6N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1593043BD
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 23:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770161207; cv=none; b=b8at1lJrqva4Sv646R0jZN76H0h+Ou9qHItWSynPIevIoMFzy8XqqfrXCFZcGFPJG9yXk2rcVfi+r1mRXUhgMuD1rQjw1Dre8+kKP+UUeIzbYFsTB+uRgToTnYphVVf62y4pPEqS6wQ33crxhAMx3rtpFPrYdW1iDRrln0UPYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770161207; c=relaxed/simple;
	bh=JDYCeisgg5aZVwzbn4acHjDfSOtvsMosCHQV7abm4ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9Rtb2U4oyTBBeszYVifOm5QQ29aUxIgQzzIGP+4Y5aCMfK3gfwKTBNWTDQanQ7wQoA4fZ3zNBzy49MlQxHoTV4vxt0ST1dmWSGhhdjGG0WHTIskcgOudQq3XMp8FuYoHo3a352QzmOXk+KjZRCSEhfqt/wIlaDtHbAzNEh8LNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFvJ6y6N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso1174735e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770161203; x=1770766003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tOMpWAco5NL2cPjWFFGjdWexXwfjBlWZysiwEErnHs=;
        b=jFvJ6y6N1WaMqstfqy0JlluauEXfN3jsVlA0tAT8eOXFVcv0s+z530c+ckBz3HPMlz
         PwxjtYkXwgXN52Iy7EHJbw2DHOrbOhIwmMbinUT8BPlJ34goKqvfL4TpjWEU07JMshAI
         pu5JbSPneWU9v2Yce7QzmJNToE16tsoK+abd8nEch3ogzXtPD0MfOmnEkncn5/MyLfm2
         URfAfyUyb63F4cLvOpRdILhoDcMP16Pernk5df49o7jZoEkIPwHUOjIBR8+ES7BblFlM
         HBSIVOYndSQZqcTMhvRGrcUMCNH3VM3eTupLoONkG4fSIxx/4qcTai+E8roamLPfAJj0
         il9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770161203; x=1770766003;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tOMpWAco5NL2cPjWFFGjdWexXwfjBlWZysiwEErnHs=;
        b=mNrTi5C/BwVvIWhnzWJfFvzocGnMDngCJNBcRBRPJU67n43oMK+EaWG9ouP6RPAUoP
         zKehukskI4qDzcG5aipei088xnX5xCyTDoZdleKzg6YEAzwrQi4J8AFS6ThYlcJILOSs
         NNmlc5y9zQusUr7oRp90GVld7wqeWyLifymQDN0Z/oNNkljwmmhqfH9DIJkROR6NlO33
         8t0PWtdYSNN++4/1L4+QV7kC4NnLFvwc9lPucvMtYTU1ha0cHVFCS7LgPtCdaUfW5EjL
         e5JvpL/3M2Oviqgjm7rIVtZSEt5xSIDACluAFfsKC+arqwkRoY3coZAiFqtvGOqqBZGA
         XuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeADqLaXJSNpVD4XcDCgbJj/fK5FH6DzG9IXjvY/Ntkg7gIFppr6wUBBLC1uUy70GTpm6V93+MfgT6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSlXuKH1H22YhG3lrJL0h67TtqqPOozM+I9/j3OKsm9h/ealH
	MwiEN1859vm0KwD2Y3ujE1uf/FBOtfbN8HD8FPp+g03+VcHAIkadNArnzt/oK/0cKKQ=
X-Gm-Gg: AZuq6aIt7ueOFEPlBQlk5iMlbgpTnXeYpaPdWOvRMgnVKkmFQbSrnGKB0fif1quATPu
	ayJDMosGPA2mznqQkGZrNWz+ZeZPewT2pHl4o28Sp2dgg4Ps4MftMgk3KhbPemCv1YQEUAb/Dct
	Q6D9AG+3t48KqrRZB9vBmn/HbqgyWd/1Ahf9CWMGhiOFlFzG7smfKOzpzJ7ZKLO6GSuk4DuPbs/
	0A386oiGMIf2L+tNzW0E225EtlTUpv3c+4YphE1ElNn9IHL9CKVxrqOV2Kldp158HpzZGiIZ8hl
	so9Hp9Nb31gMFNKsRe5DQN2POQV6vonZbqV/IySkTxNAJVZdq7tJ/YntpPpbWrG010DhsETXU1N
	Ha1CxjZi6NhXc6vSFZILsfYUu7m+zEJz+pmaQ2Omm1o0u5H+lDNUj+00RSvu1lqJGDPm+oB2evw
	12uPA7A2M4d04bGYFN7Tx+nZl7H+lhvmHSr4clth1aVtnVo29Hwe8JC5NCpYJ1YDc=
X-Received: by 2002:a05:600c:354f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4830e92457fmr16197645e9.5.1770161202709;
        Tue, 03 Feb 2026 15:26:42 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38fbbsm2437596f8f.13.2026.02.03.15.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:26:41 -0800 (PST)
Message-ID: <f90553fe-9f10-489c-9f8c-f9d538b1bfe7@linaro.org>
Date: Tue, 3 Feb 2026 23:26:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <_7umWxzVDHQ1e4kaoIIeTAMrOKoeuDc7ugiknoM_vrCHqzpXjpw8QWe44KAlf4frFpNY9wFxLs76ZXAP1V9r1A==@protonmail.internalid>
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52142-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.90:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BE3CDFBF3
X-Rspamd-Action: no action

On 01/02/2026 10:49, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c       | 7 ++++++-
>   drivers/media/platform/qcom/venus/core.h       | 1 +
>   drivers/media/platform/qcom/venus/pm_helpers.c | 8 +++++++-
>   3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 646dae3407b4..cad2df84ce60 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -882,6 +882,7 @@ static const struct venus_resources sdm845_res_v2 = {
>   	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
>   	.vcodec_pmdomains_num = 3,
>   	.opp_pmdomain = (const char *[]) { "cx" },
> +	.opp_pmdomain_num = 1,
>   	.vcodec_num = 2,
>   	.max_load = 3110400,	/* 4096x2160@90 */
>   	.hfi_version = HFI_VERSION_4XX,
> @@ -933,6 +934,7 @@ static const struct venus_resources sc7180_res = {
>   	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
>   	.vcodec_pmdomains_num = 2,
>   	.opp_pmdomain = (const char *[]) { "cx" },
> +	.opp_pmdomain_num = 1,
>   	.vcodec_num = 1,
>   	.hfi_version = HFI_VERSION_4XX,
>   	.vpu_version = VPU_VERSION_AR50,
> @@ -992,7 +994,8 @@ static const struct venus_resources sm8250_res = {
>   	.vcodec_clks_num = 1,
>   	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
>   	.vcodec_pmdomains_num = 2,
> -	.opp_pmdomain = (const char *[]) { "mx" },
> +	.opp_pmdomain = (const char *[]) { "mx", "mmcx" },
> +	.opp_pmdomain_num = 2,
>   	.vcodec_num = 1,
>   	.max_load = 7833600,
>   	.hfi_version = HFI_VERSION_6XX,
> @@ -1054,6 +1057,7 @@ static const struct venus_resources sc7280_res = {
>   	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
>   	.vcodec_pmdomains_num = 2,
>   	.opp_pmdomain = (const char *[]) { "cx" },
> +	.opp_pmdomain_num = 1,
>   	.vcodec_num = 1,
>   	.hfi_version = HFI_VERSION_6XX,
>   	.vpu_version = VPU_VERSION_IRIS2_1,
> @@ -1102,6 +1106,7 @@ static const struct venus_resources qcm2290_res = {
>   	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
>   	.vcodec_pmdomains_num = 2,
>   	.opp_pmdomain = (const char *[]) { "cx" },
> +	.opp_pmdomain_num = 1,
>   	.vcodec_num = 1,
>   	.hfi_version = HFI_VERSION_4XX,
>   	.vpu_version = VPU_VERSION_AR50_LITE,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index c7acacaa53b8..62ab747291b8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -85,6 +85,7 @@ struct venus_resources {
>   	const char **vcodec_pmdomains;
>   	unsigned int vcodec_pmdomains_num;
>   	const char **opp_pmdomain;
> +	unsigned int opp_pmdomain_num;
>   	unsigned int vcodec_num;
>   	const char * const resets[VIDC_RESETS_NUM_MAX];
>   	unsigned int resets_num;
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..14a4e8311a64 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -887,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
>   	};
>   	struct dev_pm_domain_attach_data opp_pd_data = {
>   		.pd_names = res->opp_pmdomain,
> -		.num_pd_names = 1,
> +		.num_pd_names = res->opp_pmdomain_num,
>   		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
>   	};
> 
> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
> 
>   	/* Attach the power domain for setting performance state */
>   	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
> +		opp_pd_data.num_pd_names--;

Setting this to "1" would be a bit clearer IMO - there's no use-case for 
num_pd_names = 3; num_pd_names--; for example.

Its stylistic rather than functional so entirely up to you to keep or 
change.

> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	}
>   	if (ret < 0)
>   		return ret;
> 
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

