Return-Path: <linux-media+bounces-36595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF779AF5A70
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD52C48490D
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E2515747D;
	Wed,  2 Jul 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2VCwfGG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE12857E2
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464984; cv=none; b=hyFxKzvB8MXE1KtoFNoiBepHFexjasBErB2Cl3ulGdaY3ZJmV/vxf66zuxW3/QGicxYdsM1R4/hNClvlLKecIpL2nXrZSNEp1CNTFxJhdHhyV8dU+D/f6wkloozfsHmHza3esb0XCJafcWPqlnC6Lz8poGQ0IcrzLfMsdDRJbGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464984; c=relaxed/simple;
	bh=w9xLP90+ayLc+1sYeBMpVBhY8AdDb/1wgWcz4K04vhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GG82fL45ncx0iqlhAVXVkRVLxRoiJ47XEG1zTR9U9JpXf/gw4He/uTIltICHvt1oeHWnEzg5P0gOJ8daKbDotwK9CycsfLGJXIAQUFYEClwnFYHZ4NbdrjHQgPPsaB6h9jbonUsgm84SY8QiY2M0WqnX15hI3J0nVPAj9HXxhT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2VCwfGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629VCtW024441
	for <linux-media@vger.kernel.org>; Wed, 2 Jul 2025 14:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPCD0AbKy4uQjUrZK3gQh2e0DrRheClUuURBVYRNDDk=; b=N2VCwfGG6NBuKXHl
	QLYieeoIO5cNYNHy0ETMqS/cMpNi53RZpa2PRAYEB9+Xxxzo30D9i77nMXNfdVi4
	2QvdK7Shto7WW0OK4FIyJzp8ik9foWgBgS5uMBdVD4w0GZPpxzmWlbgEUrrhegmf
	FUS9wvDd6kt5dZUEvYxpT/uH7n+0dSPY+2G36CegYyBS+EF3WINN8aVXj+zydmu/
	hT0RxAZiarDcmyXT31LzpK2kfB1gmsXnPpaoKTU2RwLM/JIHMebdC7WeCuy3guU6
	0ixW0EML5rSg9IGyzMTexIj+MN7cJHN/qEiheQAPJjZzhX7Ek4i8OHbFErbn3qgn
	5pQLfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvvvea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 14:03:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09b74dc4bso148224285a.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464978; x=1752069778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPCD0AbKy4uQjUrZK3gQh2e0DrRheClUuURBVYRNDDk=;
        b=F5ipiTzc7rX4w1QQhPibLZmJkueEP9q16d52S1MQRhoSWsSs3R0spY1X1qER1XyKVC
         GE6Gg27NdtE9Ghi7w+RNRrO5UOTw+w+nLwZEaY1Cak5WNLshNGGIpLhunu4Hgc3Tep+7
         BhE4PHg6WVlJONptHJo2XQxcAMNCKvntANO3vbfEymmGTEYkg3Cd5ZJd+Ge2Mib+A0kp
         ZRWqJc2XK6ekU/jh4IOV8i9vGh9bc5wngZeq6RY0sdEAZnPVuSO6152ZlnYTHTXHOKwh
         cL2kMtGZCn0pelRG8OsuVWDbXxVr6DkwI4WjvBfySfnl3cw2Co+LlF1qHo7ALMghozwg
         7bzA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ20REUy5NL7H1dgRdEI+u/OKECysIWQ7D3atSx9kLG7f2MY58lveoDl9vzOjqOPftx+Mg/hLDUry3QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHRWkSo0KWslfgEdAhP/nDDnt9bKvzhTB8d/KizXbOVDA5rTG
	KNeiTY6Te8fKsbtPLCPKyptCh2FtoIrv4eO+ceTrOHLOPjkVtvUhDCkdtLdpf8VD06U6aKZDp+W
	HY2dCfCHcTbEroVo+JdfDBtk+l0dCEoRDw98NeDZhkiWvkQ6WFZ7iFtOrXj06oy+V0MjhzTwaCw
	==
X-Gm-Gg: ASbGncsibZF9pR/Ua7CSzlowu5NVxm3kubZf0n7njT4RLa8gaucejMQ866HYp38y1oV
	Rnlpak97qZaWrhGnTQbYGmZjtN5tYdVErMrAQ6b2RtEl+NH7bYvjQfILU7amT/ZbISFAX1cnuWN
	LWqrh75r+Z3pYCyvv4AL65wvkjiCfBSq6bHd1xOKXCYCAYqcKkjuVSLttlooSgAi33amStQ4GWS
	ohbIT/rDazxuh48iUC/hbZXjCuV0Z8DeMInRv3EtrMyk+0PkFeOtAPcCVXfTrr581m9j+O/mnVe
	/sgoarmPqnRv25AkSJVWT0l6ff+YllIU4zbe+pEueZBjLTkqagLqsUxbVgkaVgcQ9fspMU3sn8v
	qb0c=
X-Received: by 2002:a05:620a:6009:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5c4712edamr157508985a.1.1751464978160;
        Wed, 02 Jul 2025 07:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK0NLQr9opky8nQy86TjPixbKtYzWYESdBlrd9f6gMI8n3YCnfEIgoK3ktCcSinV5RnjaizA==
X-Received: by 2002:a05:620a:6009:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5c4712edamr157506685a.1.1751464977525;
        Wed, 02 Jul 2025 07:02:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831cd0dbsm9185926a12.58.2025.07.02.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:02:56 -0700 (PDT)
Message-ID: <803adfad-a601-4d65-b877-e8ec10969698@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 16:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GpKp2QFVMJ2W8wNAx2wruNoRsLICQ60L
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68653c14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=ORHsN169zhdEUPBzc4IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GpKp2QFVMJ2W8wNAx2wruNoRsLICQ60L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDExNCBTYWx0ZWRfX/3goahbdXs09
 xz48t37lUdbln8uoETMGVCpeEXFakM9Bv5rKkdLyZqDFvLOKtTOSDW95FlL/Nx44r98s1dHOUbd
 +246AHgoek3WFg4vVC5UyZcqBuAeJCoBvfuwPcAOA0zEf6UVHehkXBkhE7oBKGiP61Lwhft8kxZ
 0myNlEgx/TtJN9rJtRqna05yPmiFuh5T6pdEFyQ6aYfsSSZyeg9HHVxTCxxTaoELni+/0xataMM
 qILdkyEnRAbGWP+BCuTg5KggX1EL9ihuBrhU36so/cHqU9z77/8ysaTrOQwR4PYeEwWQXdUZL5N
 1UyN7ViAfEsyVFV2bSlAUte88197DdCtpGLRjpkrtWmw9O26Y0i42MdpiuJxVKnqiWTp1gjAUuA
 6nGK0tSW92S1dwFYmZCz4oTtWWv4jhxGlY65knNrUbeQ71kxD/BL/MxlgPLAvZmANwetpyH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=971 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020114

On 7/2/25 3:42 PM, Krzysztof Kozlowski wrote:
> Driver implements different callbacks for power off hardware
> (.power_off_hw) and power off controller (.power_off_controller):
> 
>  - iris_vpu_power_off_hw + iris_vpu_power_off_controller,
>  - iris_vpu3_power_off_hardware,
>  - iris_vpu33_power_off_hardware + iris_vpu33_power_off_controller,
> 
> The first group (iris_vpu_power_off_hw() and
> iris_vpu_power_off_controller()) is used on older VPU2 designs but also
> called from newer ones: iris_vpu3_power_off_hardware() calls
> iris_vpu_power_off_controller().
> 
> In the same time there is wrapper iris_vpu_power_off() which calls
> respective callbacks (the VPU2, VPU3 etc).
> 
> Let's make it more obvious which function is a generic wrapper over
> specific VPU/platform callbacks (iris_vpu_power_off()) and which one is
> the callback by adding "2" to callbacks used on VPU2.  No functional
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee..a2c8a1650153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
>  }
>  
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
>  }

I don't really like how v3 calls v2 ops internally.. and there's
nothing really vpu2-specific about what the function does.
Maybe something along the lines of "iris_disable_resources"?

Konrad

