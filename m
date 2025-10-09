Return-Path: <linux-media+bounces-44044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8DBC77D9
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 08:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8E63E5CC5
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 06:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D10296BD7;
	Thu,  9 Oct 2025 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccAdLBht"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2823291C3F
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 06:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990144; cv=none; b=JgoTsv9zrX8h/FXan2tGgobFKeZicAlznpX6S9fsOyTqk3oWeyZON6fepNsYiwltUgqXmVt3JORDQQN8tBli9NCeYQdzp6Km+wd6rpigwj1LNnEaLjWyFa3hXrC/RaWx2Ewt3nwVCL1SkvGDxu0Gj8Gft2NeCoaXY1FkzleUB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990144; c=relaxed/simple;
	bh=IMVK40sm2NcG5ZRmo+Oju9RpeHsPjuUbEtnoHjf7C2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reB7GopcxOkJoNuFIhgOn44j33ivtZ9Q8OJlOuDb4//GuRu8SdTLZj2Rn4zojqLG6AQYPbLCrqq/Z2gutBUF9md/gPCDfZWoGhlrG2Q/wcrSJFotSl14XZ2DFoaGd0IdSxpgpRyhG9CyzNsjVfmZlFFICYjiD00f2OmvOmRX+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccAdLBht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598MX8me003608
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 06:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5VNYivDnUfLZTl7bMdUNMetQ/vZqVVN7I186AOfTvuM=; b=ccAdLBht9ARxvcBK
	9ifZEihC9Ti1n/pVIV9w9o+V/b/0A8ycvz9c/0NmGPozI+W/nk6ZZ6ull/ED6CLD
	AG/Zw6lLW+xj3RIu7U2xg/2IoBpkQPCLNC3mq1sWhyTS1dRZjKM1FRVoMqtk8NLS
	gNC8tj1vWj5L2CCr0KZLAYdtQjQ9FIlo5ycmeKD4LBzGvnEr3PYxlV906kEHrWV+
	XnOQY8UbxdqsS0eFjDW2vxvkE4biFDUqmT4Alh8zSc6/kwQ7KvwuiQjfFbIj3+qh
	CxXUCUBp9/pC/RBqn4hJcVOJcR9BK/9N3p5c9kjPUgU3eBmp7J/DYHj0067wJflQ
	KmG+oA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nsn64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 06:09:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117b8e49fso1623388b3a.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 23:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990140; x=1760594940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VNYivDnUfLZTl7bMdUNMetQ/vZqVVN7I186AOfTvuM=;
        b=ZNueJhas725u+VOx8BwWAF8qWjqWUnAbDS1W9lR3MzzLl2X0gIjubYJFcdQ+0Gc1Pa
         tY9tts8Vj5iraaUKHNqnU40SPFJwJ+1a0p39ghkgcxX3kZ1BPv/DiLsmGXc2iPv7g0b+
         4jn7F2XcLH24ym68uFK9RSP5K56vC5ngjc16ZMkYjwvt4pcnk2ucjjvxBMyVOuxaz0PQ
         UAczi6a/7xMokqJ5vkpwLe1kk6wm09/qXq4r7oD+XioLdxvaNXRHDBZy0W1kIKRglCJ1
         6ZLjs2yI0F6YvQr2ctvXZOSZioBs7V2yogrrzaVoOdm5a4M2SQimn6exvarL4DZT53yh
         FSTQ==
X-Gm-Message-State: AOJu0Yw4MrPeDVswEIPWaPJDp13j6+jOZxXnk4o2AQrtrNMwoynWQNtu
	yncSsN1swwaWG+YMMWWrCdBVmEjXi9CL/QNEfyM0hMsYUQf7JrI/1Z/sLGZ/jeLoNnh5IQfi/ei
	cIOHEli3+D9yuHUQfvOstaPr8skaKs4DhQAdSl2q9nIG88yLxHO21cA9BN+7OV4fcMw==
X-Gm-Gg: ASbGncvGZ2K7M6S4/SuzO+Xqj2gmyPzZb8nwaCXDRG6Gd6Lfckr6xVkz3G4k/tPnIse
	mUevjwmYd9u1VO4aUAJ6FPeUvR5xC3pAYY/WuYILHFpQDJaWhO/qsnQ+8zIi/X9F9d4iqm7zxPj
	PYfazTfIAHspaNc8jDJfsXz56Mv0nDufEVhaafG8zjmslF/X1D2eo9WhbUrDWwwagQR+HiJDn/A
	eHvu44SWbNFDvMAiJABsf3xkCYfKG49Hi7raW2+kkqOK5gVIdS//+OPV1tOuoxaDn6z0HsAm/XE
	qYMZqIhqPigsVwHxz9DCo7SdakeWsyPo/f+jCwDfYzuu8VUulCbn1vIaP18oJ0X3yLvraDiBHIg
	N/Q==
X-Received: by 2002:a05:6a20:7291:b0:2fc:a1a1:4839 with SMTP id adf61e73a8af0-32da80da6dfmr8474797637.10.1759990140067;
        Wed, 08 Oct 2025 23:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoguXu0CzQN5H5zRwQz23DknYXLZsw40ludZKkvNZtteCPuXC5RG+TdbBcFj6VRg4s0Wgg1Q==
X-Received: by 2002:a05:6a20:7291:b0:2fc:a1a1:4839 with SMTP id adf61e73a8af0-32da80da6dfmr8474752637.10.1759990139503;
        Wed, 08 Oct 2025 23:08:59 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d510d55fsm1694334b3a.32.2025.10.08.23.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:08:58 -0700 (PDT)
Message-ID: <206dad42-7a7e-5293-55a0-d6d5bc702c07@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:38:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] media: iris: turn platform caps into constants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l-Zl1QTEiGVuWfTXV3qEtq177BOIYEZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3RuRcHoUrAAk
 VHe+StGG4MpcZ7jRwDOklhhLKBmzMaj6+nGbrycNs5AyMSlsU5M5wWiDpHdAdipG/EpRvo/3qaV
 nrnOZzgU8mrT7MlBmO46cy6d0jq2HsWD3jGur8Mxn+mGcg8fNsIC9U6tJ720aww21uX8ty+md7X
 mg3nEwzhh3VCCkqhkp1eCO/hbD+cnrWnAJVdYv9LNBaQpri2IIq2036/WRsxgeA2L8hYV4YKiW8
 LH1TXTBipgwjfaBQ6LB5NgSabAgDr+ZV5ISePNh25aZJRBhlySU9iFFk4NvwwdseIC3Qt1SKbki
 Qql3B7hwvTxiaG6Pspg2LhUVzsCKB3tk/y5Qx/yXxxv5lsL+9N2pjWdGk1mivbT5lsnh8JhfkCY
 SDPp2nGp4btTYUpTOumO/rODJMdAwA==
X-Proofpoint-GUID: l-Zl1QTEiGVuWfTXV3qEtq177BOIYEZH
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7517d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JkJZgjudll8f3RTsVYkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 10:02 AM, Dmitry Baryshkov wrote:
> Make all struct platform_inst_fw_cap instances constant, they are not
> modified at runtime.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h  | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc37630bb861012301df7a2e7342a1..9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -301,7 +301,7 @@ int iris_ctrls_init(struct iris_inst *inst)
>  
>  void iris_session_init_caps(struct iris_core *core)
>  {
> -	struct platform_inst_fw_cap *caps;
> +	const struct platform_inst_fw_cap *caps;
>  	u32 i, num_cap, cap_id;
>  
>  	caps = core->iris_platform_data->inst_fw_caps_dec;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..17ed86bf78bb3b0bc3f0862253fba6505ac3d164 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -215,9 +215,9 @@ struct iris_platform_data {
>  	const char *fwname;
>  	u32 pas_id;
>  	struct platform_inst_caps *inst_caps;
> -	struct platform_inst_fw_cap *inst_fw_caps_dec;
> +	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>  	u32 inst_fw_caps_dec_size;
> -	struct platform_inst_fw_cap *inst_fw_caps_enc;
> +	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>  	u32 inst_fw_caps_enc_size;
>  	struct tz_cp_config *tz_cp_config_data;
>  	u32 core_arch;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..cbf38e13f89e5c4c46e759fbb86777854d751552 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -19,7 +19,7 @@
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
>  
> -static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
>  		.cap_id = PROFILE_H264,
>  		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -203,7 +203,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	},
>  };
>  
> -static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  	{
>  		.cap_id = PROFILE_H264,
>  		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 35ea0efade73caa687d300779c5b1dc3b17a0128..87517361a1cf4b6fe53b8a1483188670df52c7e7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -5,7 +5,7 @@
>  
>  #define BITRATE_MAX				245000000
>  
> -static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	{
>  		.cap_id = PROFILE_H264,
>  		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -189,7 +189,7 @@ static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	},
>  };
>  
> -static struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
>  	{
>  		.cap_id = PROFILE_H264,
>  		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..e29cba993fde922b579eb7e5a59ae34bb46f9f0f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -17,7 +17,7 @@
>  #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>  #define BITRATE_STEP		100
>  
> -static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,
> @@ -38,7 +38,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	},
>  };
>  
> -static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  	{
>  		.cap_id = STAGE,
>  		.min = STAGE_1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

