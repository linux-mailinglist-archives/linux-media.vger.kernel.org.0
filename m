Return-Path: <linux-media+bounces-48387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6ECACEB4
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 587883056573
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E433126B1;
	Mon,  8 Dec 2025 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chg6s81k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4mu7xn4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC102D94B2
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191105; cv=none; b=JVtX1QWb0ElL58d6E/yCC02xS19GsbNqPGwleW/S+8cMhtJxOXXvhozG8HqnKTxTFGzXHAaKAK6Dv3qucO4aBPJqfS0bbqWwFIrXqKw5M+yTk3UUSfOHGCjO0synTxUl6hQ0kOqORtU7U7ZzbbGHHpePne+s9TPOSySnBt8ek/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191105; c=relaxed/simple;
	bh=dIjz5i9iOeX6HESxOCDW91r30lKYxEBVxXW2C+lsVmE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KGt7auX8nCi7ONnrktt1WqexbId+LZZid3W36Q8zYgxmMFWIhvWZXFGPkZLv3TsHw7EKvXnBI/w3vMD1HuLXzlXfdSbILx2fyx7tcUrsYBoGzZbscnkWkkLVxJdKNI9cD49dXSRuysC+oGrLYqpVi99Ql8+lycnDZbsMHMpOWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chg6s81k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4mu7xn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B89FAPq3863086
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 10:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=; b=chg6s81kMRH9B9Mj
	KI4iULNK86fEdXI1RzN5UJni4QmaOdIOPXZVrmqKDNc319ev0B5J/j38nCKzbu8v
	fjxnl67eYBNLC1jKawK1tmIGY7Rl4Iep9Tx6Pe1oS7YiyiSIMQbQLyzKtykCM7mS
	pAKhkoMkFGBjEkT9WAatoFE9/fER86whJNaiM4xIiDZgjgRLADlUNQ4/4JVxepbQ
	Oftv36LbgJUS58WkGMG6ixFeX5jSonkaWDAPHr8L6aP1hmiMEk9/B8ynam7zzL25
	FouQhQZHhq5UbMqFsTI3aFLY8NWuYE1VIFbJPhJhrTTBSZABj5ih6aMqywN+2cG8
	JxK3HA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuvg09aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 10:51:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29e6b269686so8033145ad.1
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765191102; x=1765795902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=;
        b=D4mu7xn4iwKamsviTi7HQMKQ7WBF9uUoIZNxyupJp2sy/H/QymwmE8MPRI20N+XDFT
         LrrxU4sRPsOEpyUgyr9mx3FvkKFjK23m5FTUmkisE063On6jsLS4+NCiEHlryqK0xeB3
         kDSFDHSyHBJzuuvWR26Jm9eWOB0/ykuwIgDTWPD2nmxo/bpjVyQrCwLXTe5eRCm8U1oW
         +T08oqbsVW8KPw2QiGMhZQocG82I1SXVfEGUNYXChCF1V1GK/BMn0um8lBPi5rlXW9Vw
         hryUqFdMS6mszVGPqDgkWOwsYpSOuWRfbtfb7JWtZpMcz3Q/6tGkLis9L9KB1HP8PjNK
         k0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191102; x=1765795902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=;
        b=rytSSuGau9jqeIvtEvuah4/WjJbVXOKGj3ZmOG1rLUVKJUotwaBw+7IxJof4yJVYBN
         UpP9Rrkx9pc3RV79YDt08zfOpV+t7M0q+LmJhZsy7/OwF2nQHfF8PkpnSkTzNdOj1w2i
         PLMM+dD5LgaE+eR9A3Lm8vs+TINvWCBcDiTar4D+1D7r/q+zRntaOUFVbmKF1KERZNNf
         yMLNsK58hjpGdtoi2YMZv43mjBUE9WaS1mN65/6C8MaW352c7p1hYlF9qloDoLJR3Qmg
         IyylS+aYdNpCKWD9vMCXahcg30xeeMs1R8L5gXJCS2YEdWAZ7IKTmz2gYe0xH9k1w7zq
         QuiA==
X-Forwarded-Encrypted: i=1; AJvYcCXncMorq/IZSNyy840oOxE7XYKkkU8nVN7gwrOsaF5GHno4tXeKGxbqx+2cx+L1dsj/dtb5k7hVSgl1qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUX2MdgHGNa45GXZpnvNNaeGsw4AiPVN2Q6INst+LEqCcPAWb
	z0XDMphp9vKBrjOeTjEiqLit604CMCAM6qABjhCHUjSKflN0gw64DjTHOSfMU3Puj2rUBMWeG70
	R4DvH82yudd2ywvCxCZuqxcz/iyiCxTnOBUVCvZnAIOmNaAfvgTSSLrbnMflzGbPS+g==
X-Gm-Gg: ASbGncvwemx94qePxjzvg5DC0ULLVx7ux5ba4qd4yvD7sVFR7Ja2BRX+GYGLkdwdRwY
	fOmJzi0pV7Qc72yzToHA541H9GrAKYqg4uzhizHK/VnkI62BDlbzpuhzV4J3cky0R1yVFEQtD/a
	5JzsqNBRijbYyL5hp3CQc56AvtEIPyW/WPxxowb720fbQLBvTNiYc0FVit6Gc3GyUQbid2hcMb2
	H0foVoofXX2vSDeuTshBGyPxGDFLndWgDd5t17eTkt2x+sl1bAdyI/8t5txyUZe1ISUf6GWg1YC
	ReLQ1b0X1iuQYRtLioAepu0IEt9e1WbZGektCFM3Ui6WnTO3x4HelkPYKwTOpVWdWMNxXfnf1dA
	3G0wGop3oVIzTDjPsAz/mED7ySwpeNnEBzz5NqflgSsGne+YVmaQdGFCvm6FW3H6RuKSuctoezh
	qtTsg=
X-Received: by 2002:a17:902:f607:b0:295:59ef:809e with SMTP id d9443c01a7336-29df5aaec03mr56353105ad.24.1765191102041;
        Mon, 08 Dec 2025 02:51:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsrbmu+rI/O0lOhiPE2m6GbulEKLPj5DRItLTQPuJuAGd0ETWZNT3veQNvA7DX0tWOz3vPQ==
X-Received: by 2002:a17:902:f607:b0:295:59ef:809e with SMTP id d9443c01a7336-29df5aaec03mr56352965ad.24.1765191101571;
        Mon, 08 Dec 2025 02:51:41 -0800 (PST)
Received: from [10.249.8.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm121133115ad.81.2025.12.08.02.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:51:41 -0800 (PST)
Message-ID: <c1fde623-9f2b-4904-8008-8dd9a02a352f@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:51:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v8 3/5] media: iris: Add support for AV1 format in iris
 decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfX5I1sheCCwuM4
 RMIpcEY+rVEgCkZuDeC6gVUgDcLjHrKbZTZeG7iQeKOVf0l5npBbAaBBC+bCPVLSkRbd6N88HEI
 LDqK7j6u6cm76MdAN1QbzDh4Oxmk3wWbWYwnRcEBu2bOyI8Bf4SVILtOxYy3FaKFJ+/Q5iHgrEP
 ewdVlJUDgYtvybbgad6J+a0E6sHoe6BEU3A5AszygJ4P1F2Uw6H7okv2GGtFtlIKSEC9jkaWAF2
 YjAOnD3+qIJIUM+UL9VZeLSQk0+w/bsdJWqcj7pjop+hWgjdNdBNLx4U8v5BWxEJZQcdwjttHq/
 joV9BF7HzEccuJMAnXuILeMMQ7ziEihYNrm1Fj2DoJX9qJxAH4DlmF10i2YvTYNNSiifIg+0K7T
 gp7mrj0ITF63ZA+g2UOwVGejouC9Tw==
X-Proofpoint-ORIG-GUID: ZMeCL2gfg_4ELAPR1-JNKz7VjtjQ0uxN
X-Authority-Analysis: v=2.4 cv=cqSWUl4i c=1 sm=1 tr=0 ts=6936adbe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ywScyDtGrH_zUvzyQ_EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZMeCL2gfg_4ELAPR1-JNKz7VjtjQ0uxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080090



On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
> +static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -759,6 +778,8 @@ const struct iris_platform_data sm8550_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> @@ -851,6 +872,8 @@ const struct iris_platform_data sm8650_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu33_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),

I noticed that you didn’t add inst_iris_fmts to the platform data for 
qcs8300 and sm8750, which will prevent the decoders on these platforms 
from running.

-- 
Best Regards,
Wangao


