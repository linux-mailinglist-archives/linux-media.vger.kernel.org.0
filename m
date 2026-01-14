Return-Path: <linux-media+bounces-50642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DD8D1CD5E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2AE9303D16C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200DE35FF6E;
	Wed, 14 Jan 2026 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlXtE8ES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKF375gf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF735FF79
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375681; cv=none; b=CUDhnnjvBDi1fMjQK5KDt1+NJ2k8Px6Ph9prNx1T24ICYVnoLogSEmX+pJ326mkzM1cWuTCWTmn6amhrD17pEch0jEAU96w5gDhv4M143SMmOIzdlWS2G3rjU5B+oCPMY8El0TlBUgQ9Uiit5GgHwGrdKIHhz/6ihM+A0zYpVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375681; c=relaxed/simple;
	bh=uR3IxCQuplSv7IFD1Fkh1tgHCbiSi/hk2qiPItRTYBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnxkB98I4YyMCN3ziS/wM5sZtNoXXgflqPBEO2nKxowCDwQSlPSRHF9MW2oA4IZu08OwcdTKQe+Hb5YM7T4oLpYKowfKdPj8P4l7bhqndf28tqWiBiUbt8iJmLzYgeQhsGWSvzaUjopDwyqBIFGHwxT8cB8y7XQYTQPyhR+4o5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlXtE8ES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKF375gf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66DMp2579079
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=; b=DlXtE8EStOut9Tqq
	c6QVOvtjFtFDyKD4kg3CVxU6TGHu49ALAFtucCUicRJBunj3hpxh40abnfwalanS
	7ChVNHvpU+oZ9l+Ap2MfqeGrKttPrH9UN0UZs254Oi0YwZ4Ux5rOGltUKkFbG1Zl
	P5yAQJXUz2roItr5ZHuI97jv0fiX+4UL/ekYYZUGhyp8tT/LH5DEdqyv2ZrOXgfC
	ywAIkbnIYRqdt5QUHdLOOhh8EvQfpVy/v0/A55cgXVD6trFsmSqCUXFwPtCQl2iB
	z51RlXlXoiiydUhAsBSGyerhJ6kQlWQHB2Yc9y8tCU2YiJBRAIe1rL8y9qXykVmT
	BpJDWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9ucq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:27:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7f21951c317so5618819b3a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375674; x=1768980474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
        b=OKF375gf74016HOIILvUdaEmi2wcFOi5ZZHJFWG0b1vy9Z+uTGx2hyS30nWCgGDH1U
         SoVlECzOc/w8HFxMuxMwhfhOmzQe2gbeZurWs3WlsOHNcOdamRrlaYPUr3g9QLZfCl71
         zepVh6SbTVB3QFEjsLa/A6QAAwqBQE4c7UKa4B09hpUm3XP17xWmBbFOfAxjmni4AxcF
         ElOuKhay5aH7Dg2pLxLQT3oK8FKW/dgppxeuVSCi1g6FTy93SvdnLrmNhKlUlgS0o28F
         9dEzDike8k7tLDV3HzoMKHLWSnnIdcNtWSnuvtZukSB/NrF7IVe1TewrWgmZ1nty0L/H
         Lo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375674; x=1768980474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
        b=t4NxjBGxzOmC+u6A2n1ZckqoQzfVeA46/absbqNuxuz06GnUzaLlnMxhV1f6uHscyP
         cmZwshPSgXxSZXQL27JeiSOzUYM3aAd1SjN9ywsKCr8qeojRMR6zVqdgBndG4Zyg9R1v
         FZkiz7AI+VTTlfTP9EL7LVK6MluzsRURk7JdY194FtU6QfdtYsguDVwP99l8TSm72k9z
         8d8neOrdMZBVT3xFvkZ+L6EzudAoC9uBFETNXHRhSHtfNu7/0M0vmnhYzLuckjUzrZ8T
         bDxIPMZlWRbgXz8r7oT/CSdgt1ajb0p3HF6SiBIcAKRDyV6bGiY+z5ZSH32ByQ3xns2Z
         0Daw==
X-Forwarded-Encrypted: i=1; AJvYcCWd2l6EAdei28LPTr5mr4GYL/JTHZT2K4V0qgV2TBUa4KVTw4JMnWrWV+RzoaZn5LK4pylY9uusJSEVjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoKVvs+EWMJ/VsKMMeFv6BX0UoCMyf1AXqC1NsqPJYLydXtE/
	JiImgxkMW8KPLONkg8aBSiE/uokBKCYUDwZsSwGUe2YQlgD1gxm+6klOkZZNUteBzXpAQRUT8iO
	Ziyp/hsd9cqctQbBxsqFKpT7acLfK6ZDrCItzzewrjrN7/m5iioXwdEgjrZ1upKtJ6A==
X-Gm-Gg: AY/fxX72TvXz5TvyVUOW7KwWyxKDCfhHB6i7VqTBHv5qYMcvhylsdcmzvSiiUisFIaz
	pAU/YiM3z4nN4ICkZRHXVAR7BxrbSYUR0H3FqF2fj5zRuJBDVBbAp3fly+5exHAXgkJvKhaOIuk
	RzEPE5HdqXQshlMH9U/x3HqMFBv/EgQ/qyQg1gMCBbGJtgMxrJq8MvBa4FXZxktGwGqEQ+BxE8T
	iTC+bUluZinsp8Yve16hFaKPBJ5Kv2QNuXRaN/Vhqk+E+bkfEVAWLXs1OloqVKk4S48VJ7zsTP8
	uELgqWvifVabJwYKF4XXGGnw7fwyuSBNqZm9oIKDRn0rBpB6IP90EXjKmHAsr61y/trRR9BsBrx
	MYtvsoOd3F/Df/5TYhhIxMHhPfQut1fEOPDFHHqB/4ed9
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f81fa1bd9mr1478046b3a.33.1768375674452;
        Tue, 13 Jan 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f81fa1bd9mr1478023b3a.33.1768375673926;
        Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfe1ca24sm2855229a12.12.2026.01.13.23.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Message-ID: <a6e15ff8-d674-de9b-3892-5db3748f3bef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:57:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX123Ghz4tEmMK
 2urcwmFhqDMzgbbuyNf9SaLI5Xi/i8ZmPugH83Uc8lvNE42H89AS0zGkxoCkn9cB+pevzYn80n+
 Hp2ld4NtVkZg73f5ADxGzqAMCnywRZW3CDJ3k+hD86kiKLnPwE+8XVwfk0e+EJwxTA3fKBwSI+B
 z3Oc4T99Q7gtnJSgrY/jgCvtik2tXxVteHvj1HKq3j15W414+kXC2p34XiRWMjkf6bE1ledphpX
 JrVugAvvVBAYWR9HJ624hYRDPvO3BBdyUP7YT209VdIcOY7es9cr9XxrWNNrBqfpYD3NRWkKeVy
 oC33IPkKSjsu+bSuXxokUGekwVReObkwzZ6U9/tI41IyscwlRBB/BxfHhUjlqOkznFmGfj2UQXQ
 kcakCT5r97UNFzcHCSDk2B7QECqzUjYExY+LUZ7W5P6UGu7vWh18qHXpXI9FSRqnu2G3uQ5PZaR
 hATHWypsk7MywqyCIuw==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6967457b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rBqFcrSGyHFvDjdq3-MA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f1TyhMubC0xMvM959VvkoZXsN9rxs0HA
X-Proofpoint-ORIG-GUID: f1TyhMubC0xMvM959VvkoZXsN9rxs0HA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>  	u32	bank_spreading;
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>  	.bank_spreading = 1,
>  };
>  
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

