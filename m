Return-Path: <linux-media+bounces-44807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA7BE6A1F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6C7C4FF76E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F20430F944;
	Fri, 17 Oct 2025 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwL2vK1Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D02630EF67
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681910; cv=none; b=GZayG7fTOJWmZLXnm+CYX+bSa9bF2o6lV1Jx/9yAOO9BK4O1Kr/GWhzSQIpDAfKpyjzd9IhtT2f5fIeKwa8srIQO3m6/3+wdkFtFqdfWTES30QF44yq8J7rk6EzrEnCbyY57cHiPsYO/gJ/sgcP2vjgJ0Xf+8tZK5eR9lq6gQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681910; c=relaxed/simple;
	bh=cLdHVMGkg/uBHFPRADqLysNuG2fWTEaI7wCxtZaTusg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgX6IYXljd6+Ilu65Soy6XnDkMcMNySjRz9/fUv+igwhsIBhB2GrpZB4haaUcRaBpMaRwJziLryUbGah+R3hRGKPF7RaQPzPUb5Zjcbl8GaMWMbhzuuPfJAWea9Ynf15QEWXM5wQl1Haj1byomS9QpZzBmd+2z0FgB60rw2djQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwL2vK1Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLR63016175
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12MGkH5cw9DWbLNSOakkfhLLME9RWD5IhyTaBBVeGo0=; b=PwL2vK1QeoA35wIW
	jRLVuRGG93GYmBXmFVIAAbFPnnmS1X/VOOEpNbXRGkF5hTCD/nFqPL2JVuXxSJZk
	+t1kxk5lNmVjCkPK1zOMZfPO5lQLydywMXvmXEIfS5wwJBsTdKiVEily9h27RlO1
	y7agdHYbfEpz2bowrHLa+uzuZGooefIpjnsDvzGEgM9ZWvLcYhYR1rg4GtwjaORp
	uipiXra038UwOvCmIAl7fQDwfgh4AEk1FdfY2qaqSz0C8Zy85/Sw3dEUFXlmzpcT
	RIVJWjKRi+/yN1q46wFEYfZIkCiz4SiTvpukUfj5kMBhapuRkxHju6rbShdBzmr5
	pegYuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5u81d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:18:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so1318911a91.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 23:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760681907; x=1761286707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12MGkH5cw9DWbLNSOakkfhLLME9RWD5IhyTaBBVeGo0=;
        b=jDYNuQyWTaZXEY+IOZlUBaVsiEXunFQ4F8RnbaEyqu605XDKRykQmRgLmDZTJ5K2J3
         ligJzposW+hZtmNKEAst73haAHnQHcQlQeWTk1Zrs5uS2E/5Nk+3Gvfe0cCHGupRcRoF
         /IvGAe383S04VLBfHr14Q3h3uPqSIhV+4+JOJ9q8uvUBl2OWGFVBBneGOAgrZcHg7Afa
         2GsJu8OC3hT8ernLCcZnSN2KMW6NwMBUx+D3G03MqeN5oBeRqRn7wmGnsy7rjKaW2zqi
         jPKMjBPl3on7r9BoL/cIvWydihmWFXGn+5JqddB4+chBKBodVCGJj2Yy9kx9Za+9yhFF
         Ut8w==
X-Forwarded-Encrypted: i=1; AJvYcCWiZpKseMVOset+RgQ2yA0448HSBjCUsdeo1wukiCNxVolht3FE6N3DOnOY+Q43IA6EzXtjtyOeW9ZdDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rWB4YbYKW+CmKSp+en2QpTcNhc6B9nz4DR9f0lM8MC461cmP
	WZPRQOnGYV4cFsf8WNim66nuA+6fxiNAAQzWdAQpAuILyroIS3oKgPycr7Xh0xN4Qb3BeJWr5N7
	L8BS/Db33D3k8K1nhVmY3inXVh5MkODl2bLD3ynFyL8f2byKiTFpexMbTuKSlJ7on/5sss3T+0Q
	==
X-Gm-Gg: ASbGnctoKnURDK5a+vqKZKXFZV+XF8f81CbwE3/UQESdLtOjVeX0w1LGMtjiGQmCEj0
	8Y/vxaff2y+OkRaNQ9FFc0612MWzNSLyIT/izgwRYFkQB/mJIKi9SjSmhluSBx/ou469V5Dlr5D
	PfDkM3i+wEvZ4joV/PXTXV9x1W3RXkk61KFWnkbaiGUBbLEvIQAtXCuVOSnz1vM0bGzm01VHCQe
	eU7cDXFpz1td5kAvCq1Kuvho9l9RvLx/C6CjRARxd/cDrVkKIssHwhYQT6mSYX1faTIFd/V2cj2
	LdflXgyNO9sQYhREXo6n8M1u+C71ITIsze/bdb6OH9hxrux6t8VYPSLCGmvaTh7dMSdtoQfOIc/
	7Jnh2YMbre8y/h5GDXosgqa1pFOPYoh8=
X-Received: by 2002:a17:902:f68c:b0:27b:defc:802d with SMTP id d9443c01a7336-290caf82b93mr32883185ad.28.1760681906735;
        Thu, 16 Oct 2025 23:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUAV5xzlaoN8tL8L8ACYEiMSXjhbKQNNw0S55lf9JlxkAXmoHYJ9teNZ3tUbBRnrasjgpqaw==
X-Received: by 2002:a17:902:f68c:b0:27b:defc:802d with SMTP id d9443c01a7336-290caf82b93mr32882915ad.28.1760681906250;
        Thu, 16 Oct 2025 23:18:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a9a7sm51736125ad.18.2025.10.16.23.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:18:25 -0700 (PDT)
Message-ID: <1d497f90-a64a-7a37-be22-f83d9af382c3@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:48:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: drop unused module aliases
To: Johan Hovold <johan@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan ODonoghue <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251017060540.8624-1-johan@kernel.org>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251017060540.8624-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UgO2com2nFEI6GsIHbFrKlj2QiVNc3lJ
X-Proofpoint-ORIG-GUID: UgO2com2nFEI6GsIHbFrKlj2QiVNc3lJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX+5k75NNhJ0Yq
 06OK2e1PfwpZ6t0qdCdvTkY/s5gw0MR4vfArhDR/eY/JnhDqmLABlMFKJDd4+IU/Cw3Zg08KEGp
 W0m/0Rf6L1A+EDmLbsgFMaQgkDZixXzHAEPyEbDOceSelufycjFV9n5xcC68l/8PAewbKCWMYi1
 Xel/SKY6Gzd4JBFKmKZcFVLQYVX55wD2CB57VC0dPz6vXy4NC5teXlyBk95GpPm4WmKQUfYlfPl
 HvrWxorI9KwriD2ZMbWFTXSD84x22HmtSHNwHeOKUGMT2sX3InDzqMbjOZgKVod6yGDLvs8MV+T
 ql0fkIblVi6g9ngLcT8a5r5eeNLdSTMBN/0r2y5Onw8nZelLA25/xsEAR061o9fPG++9XzIEkl6
 2IDkyZGOvBwgWkVYR2Yv4vI0GYt1Sw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1dfb4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QFjVjgdLP3Ufk_jjaVwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 10/17/2025 11:35 AM, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module aliases.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 1 -
>  drivers/media/platform/qcom/venus/vdec.c | 1 -
>  drivers/media/platform/qcom/venus/venc.c | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index abf959b8f3a6..24d2b2fd0340 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1146,6 +1146,5 @@ static struct platform_driver qcom_venus_driver = {
>  };
>  module_platform_driver(qcom_venus_driver);
>  
> -MODULE_ALIAS("platform:qcom-venus");
>  MODULE_DESCRIPTION("Qualcomm Venus video encoder and decoder driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 2d822ad86dce..23376b87b6a4 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1879,6 +1879,5 @@ static struct platform_driver qcom_venus_dec_driver = {
>  };
>  module_platform_driver(qcom_venus_dec_driver);
>  
> -MODULE_ALIAS("platform:qcom-venus-decoder");
>  MODULE_DESCRIPTION("Qualcomm Venus video decoder driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index f1abd2bdce6b..f86ca5a3b23f 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1661,6 +1661,5 @@ static struct platform_driver qcom_venus_enc_driver = {
>  };
>  module_platform_driver(qcom_venus_enc_driver);
>  
> -MODULE_ALIAS("platform:qcom-venus-encoder");
>  MODULE_DESCRIPTION("Qualcomm Venus video encoder driver");
>  MODULE_LICENSE("GPL v2");

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

