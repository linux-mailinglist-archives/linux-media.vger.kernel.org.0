Return-Path: <linux-media+bounces-50640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82727D1CCF5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2518A30619EA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72CD35F8CD;
	Wed, 14 Jan 2026 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPOUIh8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vit2peHp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38AC35F8AC
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375527; cv=none; b=bnC8LZZG38o+LAnYXdzRnnd1D7w3lB0g31MXomSOyxBkSJ5feUCmExn7Sy1TfRzaYhFsBvtkfolHXbbIn1SY45Jows6smr3IIEYBCzfvNVkQUnpTM1iHioc/XjQDWcJM8fkC7QHrmqzoy1xG9d5B0DwbVQ6w0VQ6/kgV07Y5jGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375527; c=relaxed/simple;
	bh=jaK92eoy/8AAGH5vt4scZ0Q4tGzYmBAfKteMC+eKBnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAbxgwoAzql80qZADPt6U5XfmwfTTmDQD+b57cimdS7oqUmG4KAy5MHwpTVYOiDDYF1FYrLnU8g2An0lqKWrWPLhPlDscuD0MMCwztwhlIlboxoecj34tXx1vq0Ugahv7lVBMrmAYjoLsxANvnoMflMqTVNn50yHLagictavsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPOUIh8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vit2peHp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66Mok2817615
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=; b=JPOUIh8JL8AIh38F
	T6ly9WdUMZhwcvqIYAb9kr4uOa00UrRr5rCUHqI1syDsVZ83hrMB8+8/5IMMmBHL
	AnzjE6Ydpi9a2XHXn3zIJFtUpWTmAkWbFa8uvL7dd1wWJlPkuMtwDNUNiEgftKG5
	9PXGO4FnXwmUShAbB5lT98RD3vy0GmtBXtebUTDLxbrOxCqjwykMLkU28nrzKY9H
	InrAWgCv+Qzh87QAUMHpxJLNQ69xKm0i4RBrxIkrehE7lMFT2+VxwMv0kf2Yjnmq
	xQF5Iq4V8T8LV5mS9BCnWtFCQIyzUrZs26XwrA3FkvrLpmdjkPNZiDK2mh+Vo/j9
	QcZtMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89hhqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:25:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81dd077ca65so4034133b3a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375522; x=1768980322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
        b=Vit2peHp1eQCUBzn5V0vwiavioiV7ZfX0uNJBwh8loGLDMzVYIuh2NgwB5kRmpJTFR
         SkGLDpyQ2xHhd1WXLt5idOQZPwRbuXj4sIw642Sf9i6RarfIAnHMpmLDd+chCCzSBWne
         +PSWX/8JuaN0pryfEFKFkgfguAJ0L/uQUrAKxwWRwzPoEWlTohxQTP7ksnWZ8oOdMBUu
         gd1KVD+SMfh0l981TK9QECuEonfj42mETRDJJFcG79HrTPG30yZcGfvLb8C5oiJei9km
         7NG4W+tdYfC+id0G+Xs4HQBg78A9jx6vu3q2pNdUhR2yoMVanKE9Zl6TMbvxRnEz6UfR
         E8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375522; x=1768980322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
        b=S8tuI5GJLTuuOBQiKPXsUHNITIF+ysR99uqhM/tVUDq+jMucRuXuxlUkMYFYyslBEt
         fkW+MzuuR2yYoC/F5h91bvJq18XH/kOYxrW2+Qw8ELLCVdlXl31HD9oVjlwU2FcGZxVJ
         weWoz67Er5lnviQZEYDzr/e4lNA1x9BaqlPL3ac2O+fxNAzfcs8fId/SoqgJSaLV8See
         8A6CQRtZio/t7EBmUIyC+WWy1NKdf3ynvYgSROGxHH2gwN9mMCQWTZ5ekGfSmlUEdQtg
         zBC1wRtPK3SVtZJkA8aOKQCSwC7wi8Z3CTQuJ/rSGBzwnSrogKqCl08klUqFaQc83q64
         vbXA==
X-Forwarded-Encrypted: i=1; AJvYcCXJw+A5wH3/NHbtl1LoJkxzNbN/zQ40pndp/pQoZB3AM/8udXQaROecOHlILVfrP4RPuqszaakD/blCog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUcPF3Gnp/xQE1gIJoXwDDKSjz/SjNSfTUaFcMna5AdhU1+7Ey
	LgI9L+Q/mVxV8UE2XG1/Hjcbz7oFwMgGO4fR6eut18ttFd2r9JWfdlv7k/bZXULcVZkXL5hgbLt
	GG9s7OJvZS8cTla6WE8gFumaE5MyCOhqBdhvUG8x5HS0pY0oiDOcUabYc20FNZ4EBdQ==
X-Gm-Gg: AY/fxX49my8EnN5DERnIJlbFHC9X1ekKs5VYOz8Qg9WiD1f9bUBqSEXJ3SQlr/xfol4
	6pIg80JSCa68Thx9DGOF/ZsTI4J5ywiicDlbZYrZlBKni+5uX5H7Ldrtmc/5I1p6rijzIpkIS4M
	NKSDDVxfO9OOeA72byLRO4Emt/DtTaUHnGuXeUzt6y7so1YedEUAwkLCuOadJO7rcOgQpZWVtAo
	3usUiLr9GVeliTytnzHJ0zg1o7Y8L+XLf97B+fHR5sDim6v/xSgf7cEvL1Sm3cVpA1gUDJk22qf
	yes8YM9XI/xEZHB/X21x9qJw9QYumv3aZxpxNs5qKqe3zidAWy0k1FNRgCHAFZUlvghs6RL0GsF
	wMmYLZxf38NvqUfEF00w88q4usZDWs+1H8UjUDCIeH/WA
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-81f81cc85ecmr1637004b3a.13.1768375521482;
        Tue, 13 Jan 2026 23:25:21 -0800 (PST)
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-81f81cc85ecmr1636982b3a.13.1768375521017;
        Tue, 13 Jan 2026 23:25:21 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f87aa4f97sm245432b3a.69.2026.01.13.23.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:25:20 -0800 (PST)
Message-ID: <bc537a18-04ab-0ea7-3600-2a35418e6a05@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
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
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX/mMXlqzr++QV
 uo1UObJH1Yx0FuVR5vQTXn4xjhdrX+Qr5v+e15Zl5Wqe1lo4AKPdFH1pS0dZQgiT+hhy9eyxlNb
 PHPOPUJLRFwds5I0moDnbTrZyCRquhN8APni5UN4QqefSWt9CmptW7zyI8nvoy8t+gaRQZC3hOG
 v8fiZE8GPZB4xIC/mnVxSHikE6L9k/KXHDFS40CO9Lcw/LaJYf5374NtNv3JbJCjYRhEKrBfqJ6
 xT+QQzHxuepHkVfHD62BKQ1eZtYYD1TXn41jK3odeohUyTn4G93A2656AYg961LWE9hY9wODiEX
 XRAZRagLYcPJUfAjo3KK59SFuq6FfDXlersCfTLxPLm4CP7c2JXv5mqNwBBXQyfJ1gBXBc+lowf
 mYHvdgiWEYLZBBjbjGmvy35GPZqgSWVuPR9yao1VCfokmLmnhHPiUUXvDbsk6pZBIzzOPi6iU+p
 PYM5eqnH7FaqiRfCcIQ==
X-Proofpoint-ORIG-GUID: TtYfMY_FxucFQ6g4hwhLZYrDprKjMhkn
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=696744e2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=52UxMbdsJFNFq4lwM_0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TtYfMY_FxucFQ6g4hwhLZYrDprKjMhkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index d77fa29f44fc..878e61aa77c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
> +
>  #include "iris_hfi_common.h"
>  #include "iris_hfi_gen2.h"
>  #include "iris_hfi_gen2_packet.h"
> @@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
>  
>  void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
>  	u32 payload = 0;
>  
>  	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->mal_length;
> +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAL_LENGTH,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8d8cdb56a3c7..3c5f3f68b722 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	mal_length;
>  	u32	highest_bank_bit;
>  	u32	bank_swzl_level;
>  	u32	bank_swz2_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248..c70cfc2fc553 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.mal_length = 32,
>  	.highest_bank_bit = 16,
>  	.bank_swzl_level = 0,
>  	.bank_swz2_level = 1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

