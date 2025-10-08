Return-Path: <linux-media+bounces-43933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE215BC3BFC
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 10:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4551940227A
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 08:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84112F291D;
	Wed,  8 Oct 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co+kXAzV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320D2F0C6A
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910635; cv=none; b=DRz9d1wpvsg5KPGRk+hPQt6yJ97/zjYExVZKeUUeYwFdV9awkcUw1QNwdHLfXiT2Cbmqr6k2/lTOHimTEFVGwS2q/oYJcSyLGxm+ZgU7M4dHUBhojTSbL+RnLuEuUROpypiqg+H2hh3kEVSiAFVjcho77VE2ufH9jPB5dFH4f+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910635; c=relaxed/simple;
	bh=cZ+CGhMJyte1AFBapr1UWxlFCeVreG3WjH6UVO2Zk+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF7T8pUgbI8kAt8b+ruiTEbRRu5L/mEl68Riau2UDkx6uOHco38hPnVqcBaKPe/tKo5YfOM1xF4mEfzMDGc+evt0yzlf44UenpCsLu2rgB/A1ru62gFMlKgJv1xBfWsiK2HdsF44ylcEUjEy2Ah8xyt6pWJ+LKBo4Yy96zwToaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co+kXAzV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aWVf003359
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 08:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLFhrNT3xxkAGIPFcKIeeLwCuF2mI7yMFZU7xOawpq0=; b=co+kXAzVc1383Au7
	S9U3iiGAu8z8puHXRJJyLG5xU4KxQNk2cv4DrGPReFIu+8QXQbY3Q3wZXeJd5vvE
	ZWMGNpQBzta/vQF640X989SdXXgrtk2G0gXgIkl3zAmb1mZdkCMqlT3ZnjY8oV4J
	x+6Fmnct8czsA2W5j///VtR6OLo9rY7Zin+jXUNnrxV3OesbbmObddGFDeu1vLFC
	WWZtAjviQfukjIN1CMaMuEL6X0cxYR56oz6VhtGxj8Ov0/zztJ490L0LBW/zVpGe
	0PeOlfQ8za9uJpsleW2FG75RLWVysXGhu4qrhazfVUfUoDrx/g7BG57pY71hkPzY
	lr8u0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy71qyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 08:03:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-819d2492a75so330701085a.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 01:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910632; x=1760515432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLFhrNT3xxkAGIPFcKIeeLwCuF2mI7yMFZU7xOawpq0=;
        b=pEvh+pmFDUyrKWHODSzRl+0HfDyzs3+PABF8ficX2xvktRb+SU1KnUP/mVyUSOP0Qk
         bUd/iw5Y6R1+tzdIJ/LR1DRTFqPbG313QAwSCrNSd/YzjO5mIhq25TT6l7zhRctoULY+
         UTognOdwhp/bWtzSLJAQE/bWdTMIoHITrWw3LKbKZPygfEPs/3NITCM/N6DSBz74A6tG
         EGLMvi4//AUwJDJnJCEWFuiHsFRt8398r6AIEXf4nWaJ4iRgnP7dkHPfYVq6r4wgVC5X
         AxaxB0ERjWTHcw9Q8CyI7W2EMXojp3lOrUbPDnmKAzdX/lClnnyFVCorPgM+Jvj3cwp3
         4D+Q==
X-Gm-Message-State: AOJu0YwepHG++pSCGXIA6No3aPZbjlsXowuV/O8fmqQocXTbQFti6pR0
	3pWHCotMYvKGh5oFfLJrxtydzoVpJElJKfXlYDFffXLB/VijTP/ZDnLXtqRFSGqmQZIcWa0rL7h
	otgN8dQxuz4OAC5XxTOtnKOMH2N2GYieOvhaBa4Zd8anc1W5ggxVp/5msACHQNkpT8w==
X-Gm-Gg: ASbGncuW2rrx6FIFxBcpa55zweUCO35B9SKgbv1O26z498IbKXCR03yhnf3p72RbTXG
	Jg6QZA1Q1Q7iWiEcvW4hUhkVytbDFq2hN+MWW68RcvMVRPdBQjlYitj8KTLo1HvN8CVJ7/q3TOH
	Z78+J3A1JaUJvPts8RsxYJUtmwn69+nNMVOYN3wzWhJ3DqhiIVpITerlkAFV8Fq1TzBUNiNWrY4
	syrimO/RiGJ/jFR3wUhhFrB46QXJypvp5uyUIEee6KwG45UYUMj1Ru+qkBaMuTAhikKR0qOJ+/D
	a57KmpbOs7mHxhcoF/ViVNoTif5TsToTIEfRw6TDg5BTWfJ74zbhzfD55/qyc1vaMXkpP7U6Sy5
	ZRc0BU/6Q5HkZXU5F7CopNsOU1Xk=
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr250960685a.8.1759910631555;
        Wed, 08 Oct 2025 01:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUen+p7TkoJJtINpFELadPj734JpkHmGQl5lhM+jJkqG23scWPoS+3uXq/eIFHltmLRIhShw==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr250958785a.8.1759910631027;
        Wed, 08 Oct 2025 01:03:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a786sm1649182766b.46.2025.10.08.01.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:03:50 -0700 (PDT)
Message-ID: <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e61ae8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=yRfd9HfqWQK8yE8Ax7UA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2GivrmvEmwgnIQGYSJ-obaJY4HzZCpvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX+hIv2JMl/91N
 ohhnKiGBFHObjx40aZKAb5NGowSCZk6zSN2TOGg36PdA+pKZynq5F9H7UPUqp5mfXI2cgnEaTuq
 Gy75FIuBvL34wfrGWQlczNMeUWRbzTaPFtHHRk7iPvyZeoQnsHC4HYww+v9gX+W+1WpWJOiNJhL
 /J1ErzBFSqLiVZB7ZHvIyl5jUKj4xL8ptFdGJ/WYyNeDWrOKe8r/5mZrxufsaiUrLE7FNc23zAo
 Rqu78XAXtbtRiIBGc5xDSyT7e5Y4DycvEeO4wo8tcMcQsvfC8Oqr8bnjngvN9P/TxPKIybMKzE6
 L+hraQzuaBifyl8IEP46TzA2h+MslY+j645TwaLlerKFqo252arh48dtJxRi2R5a8rJIChv7Y4X
 OLEOrHeffdxsvrHh4bW6FOMqLyN1qg==
X-Proofpoint-ORIG-GUID: 2GivrmvEmwgnIQGYSJ-obaJY4HzZCpvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].idx = i;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		if (cap_id == PIPE)
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +		else
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;

I really hope this if-else won't grow in the future

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

