Return-Path: <linux-media+bounces-50645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BAD1CDD3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D82F63007939
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF9137B3F0;
	Wed, 14 Jan 2026 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOUvy5u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlF55g/l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10337997C
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376124; cv=none; b=pawFIMHANXU9Ctlp+CeXMdVn/ZFjxCkroNIA5TRWKL+kG3KD/DGhzCNahzBBQvJe5YzN0S9A99wFq/NMEO0ROSht5L/4EYRTFzvmx8+7OFiOlkgnXBCbzQfmsC3Uq6EGhxdjWKIZKrKe3bMHznOFqRNVR3I3YHDGa7ENAJhXvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376124; c=relaxed/simple;
	bh=yAuabqmFq7pOIxAYeRLZ6jzDcEaGEYutHfOcs1I2snc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNaYCNK+iTT16vlCtLFQHumhMVgwcFbrb6hUAF/YnRgL3UGjGGkJ5CxjXdBf9k/fV3cI6Dz4m0PnfZ4S2lqsxACp+j9AbIHanZMEAhEbGBnDeomQLfQoRPFXCGZvIqnttKMJ62tnBhbN7l1DsjBHaPo3bt1kFVVTeTWfr7ENuUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOUvy5u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlF55g/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E668mB2138913
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=; b=mOUvy5u8heDw6tUK
	WaCC5X1PgxI1b21NvrdkW+7V87Yabu9iN3s7zGRj9imEPhrZ/V3TAEBXe1tIls3J
	YOv4GzrAlv7a3PcaCcTINM1O2PqxEiM1pxlk6JfkQS1bmkT8cCbPfkZKMjKf5WJO
	JGcagbhXal0yS14ltDvbraqmpslE/MpaDtdCqlrY6Il6kM6LGQJK3pRNPS9YKyuA
	6P9z8VPor9F2KtCY8Iy6yHGQPlFj+OK8cx4Ez1WGfzPKY5vDsSuzehx/pQ37Q16g
	fCs7S3tQVEnq0m1kazfHpM7WrumT2jcASEMc9sdxkniofVJObsZaHNbvsi6Ggye3
	F+hS6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0duwxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:35:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so86896065ad.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768376114; x=1768980914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
        b=hlF55g/lZoos8b4u8lxJtKjti5nBIcVpSGv2Ld5zP0Qrt+rmhq6kCCXIUkrcvK+eUc
         SJLF4OzAYPOn5okaypVXUydyTo0EyUW3UefmitsXQ14Ht5jRqgKHATWKfDv4Nl1qu/cM
         HyqUlmvkML95vZqQvSQKEojbjCq/RB55YAx56lW+FjNFkKlN5GLFm1h67sPwk6Vqim8U
         +s/riWNZA0wKie9dhr+vYIXfbWSs6tYEouUpJjGc5XdGXeMcAIbUKYwyXVqAwfDVfwTO
         dFImJsHi7E5mD4CNDLei99y6igm7XZw19/lKSTn2SYArf7gchdp4zQMLf5y4K5b8y9G2
         zFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376114; x=1768980914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
        b=Gj7M6nMR9mG+CGju4EcaGxcgYDZe3rnzC5OBQro9ku9qKDdCm1bRJ7gnPdcpecjM1c
         6KQlULmRNPEo69QFIvfBZCP6BZIlKF6fIAPwO2RQGjjH3A6GAMMYMEbPuit81Q0ui4i3
         JnU2VpsHIME62ju1ZoK2NffnMmw/xoPnOqOuY3sI23DejwtnZluU3maXOa0LLQm0bDpE
         cDKBEn2QwPo+9g9yQSDi6XDSseIaNUp9H3k6kaE4jr4uBJaXKEpYPtrT5TNump+Fkfx6
         IbSUb9bk/hbY7XV5azmWqf2GTDTvwPo0XSkwfIzGX7zRKEzpDZCNnyy3CCOiYmFK+SrU
         s3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOb5AaEBEiVbyq/q4qh8Q61GGZaxvglHCYNk1QdBt9NIXIWsPs8hapadnCFqaVRvsl3YDxiTXU7kONug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS62bbbXuujcCUs3QOosnM5NOA1foLnAfUY7Er7MnU+Xe0T4T5
	8y7L+YXVUDYj0hreGVGE6nqXe3fKkmM514ES3Yt80f0HyMh/ATLnKa2Lq2xOO2WYINjd17cdCK3
	Pk7RErZp7QI3+juxYf7Vx7Wm7jaexW0zkKKvsJEAbK6RaEuFx2uR0OfveRfX3GD3e/g==
X-Gm-Gg: AY/fxX7EPk4WH9OUBQRKg+zyhdd/DPkc5rsyrB1FlNK9kAvyijEvzr7l5A2Rsz+/w9s
	b0Cmy2XObT8Ip0nj8qhFhVcU/vODEukvtev0M+juXBSxPOzoHARPW8COimVXztkG3IwoXUVv/lW
	zVbBXVhE6DoeZnc7rCG7JA0YXqxbf7XZEyB7vjLg1cLTA5uarW1H0LuQqYe2uT9RNoDZ+eN3W4s
	nVcRe05KYXKymQMD/HsCYyT8Zjd7Gh8MC0orluAbHWNU8mERojp83u05gpFmuogoXpr05I74wQy
	a9gU/z6i63PGe79hH0AzD+JTy4bitv6iNTsjpbFf7cNpdDIw8XQjW76Vf5VseG5DYO+wMd2e8nb
	U64Y4L418mvpnRwmHScsY0T1CjfR5IPNTSuBXuxpBKN8Z
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a599e697e0mr21455375ad.59.1768376114017;
        Tue, 13 Jan 2026 23:35:14 -0800 (PST)
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a599e697e0mr21454945ad.59.1768376113468;
        Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm216764535ad.88.2026.01.13.23.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Message-ID: <66f99363-046c-85fa-0cf2-05f45755532b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 13:05:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
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
 <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69674733 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mgZWc8mK_52uscwXSFwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b-mbkH08mDdwHVSOmsRPrsRp638JgrF1
X-Proofpoint-GUID: b-mbkH08mDdwHVSOmsRPrsRp638JgrF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1OSBTYWx0ZWRfX7aYNu/6jwy1K
 AkiRIKy/oT5TMLMx4unr7xVIQWmPvvel5deLpdvgIYLNlASro2tdRS918dOPEdDVVRtBNOO+7Ah
 O88liVWdbQ5rvqHJ2mooOjujLPydsYfLOw2rFF2YYtHW/o8AbxFF1fHmPHGW3igUiNtBaju15ai
 fgcURjMnC4UhZF24nMdAr97dFl419pxvzLPZpm0j3iZnIemDMyQ6NxvXQ8r4ldPmOfxOvpWHr41
 8sG60VTjW74vAG2tyhD8JXDKGBZPleC68JbngS0X0j+Fdl8BhKCLV+15M5Rgt4NBrRMVtODyzmD
 fiOKEzA5o5d7Gsjv/BqMYuV6/rognAFViVgymbf0ueuIE/Qvu4397v+56zLBE44H0lIN9f6oIkN
 4Nx4ZJWXbX4rSxFtCiKY92aXvy97+zsNLHfZoqIWDWLmLhwFdZHUzPp9FgMYOmAirnGj417fvDz
 uPqM75f5rWhc+0Yg6DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140059



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4abaf4615cea..3b0e9e3cfecb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -71,9 +71,6 @@ struct tz_cp_config {
>  	u32 cp_nonpixel_size;
>  };
>  
> -struct ubwc_config_data {
> -};
> -
>  struct platform_inst_caps {
>  	u32 min_frame_width;
>  	u32 max_frame_width;
> @@ -218,7 +215,6 @@ struct iris_platform_data {
>  	struct tz_cp_config *tz_cp_config_data;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
> -	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index e78cda7e307d..5c4f108c14a2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  	{IRIS_HW_CLK,   "vcodec0_core" },
>  };
>  
> -static struct ubwc_config_data ubwc_config_sm8550 = {
> -};
> -
>  static struct tz_cp_config tz_cp_config_sm8550 = {
>  	.cp_start = 0,
>  	.cp_size = 0x25800000,
> @@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 2,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

