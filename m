Return-Path: <linux-media+bounces-43837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F1BC17A6
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAF6E4F5F73
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 13:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6522E0B6A;
	Tue,  7 Oct 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htfyjoaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D072DC76A
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843310; cv=none; b=Nc7pH+SZi8XWXKWATHaY1UzE69FVp2I1jvPjlcYJSnTJRchcfhLmQt+jLnL3qGa7jECguh5Tz7oD3d8P+hMVJo9ll7DbCrh7AvhI6jPTtenSX8bSWghYGxX38RZYDoCkdLDV9zAXj+FHNkWbdeEOsSw8g1HBRk+X7rUVn/SlfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843310; c=relaxed/simple;
	bh=KfH/1jqNQyHXHlWGnPskC3l+clWGf5otYkYARvsHOOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpqLSdErprk5TvZZsvwd6Nbwbg3yjgd3bM5GyFar78tsOMD17MIhPdMDL5YckTtRo2H4DOurfQnmcV29FGn+B+LZ4EOPPpM9rA0tLOxAIIexoqwfHkFS0TtI/3X/ScnATppnnh1CoZdtUo3QXA6b7aprFAxMfa7z5Pn5W2fLoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htfyjoaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5977pwib019847
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 13:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69V/u5q238Ax0jCPnsahYPkllbnBSkqASEz80OzIQtA=; b=htfyjoafLsGxy0kf
	J+cwEuZi3iW5da95gdZb4eYdL4GB1PoBOMr0hP5CRbMFROI+xzgYw+vGX8v5s10t
	5A11p6GUoXh8elM3brpF4mqBlnBHG2WOrUjiAOrPZ9BYzfJQSrqd2uZmL2ENHiBz
	Y0RKVVFX2pmjU21TqcDXMjCzGz/phgWANAQRMfbQHtdImwDNCy33xNDnJBOTfXn+
	uCZc24RxJQoL/i6K2AZA1Swr5yz3o4CIbcqVJHNkpxlp83LKjOpC27MIFT8YZOXK
	Irr8b8KdZNbHG5WR+NlVGbZRV58s9hwA+D4zqGn/Bt0A3IuO6tIoLtxp/kn/2hoc
	vGAJiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpt4ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 13:21:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso18097871cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 06:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843307; x=1760448107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69V/u5q238Ax0jCPnsahYPkllbnBSkqASEz80OzIQtA=;
        b=pXXiHrioePUR+DqPicMN5i4CNC5o5td9Xe6YsrcsXeASJis7kSxulRy6qpbdwC1Ae5
         fYn/dwrdnnmmNMYjuMy6em5EH//5Uj4TIIGrAwjQCyfM9z8QTvjFkPk29kGZiZwD/Y8T
         r+8Inbzc8aBBJMlnFpXUYxdrm7lOUct+zgXQzWFwMfCYx6MG2dLyBZJzSqQ293ZEPS8r
         H043liG5+htWTf9bePyaNEu8x6MijaI1N/H/tLcK9xkLEfz2XHPMvDLOjwEij9Lo7/8x
         7c0T+6HIR0f9OIIuIpP0ievxQeBLujhqcLUBW2Syo9HOJ0L+fg/k0p4MfLg1JCZLiDj/
         AwqA==
X-Forwarded-Encrypted: i=1; AJvYcCVAKilGb1xcIsRO3U388TJ5zGTyE/XN3JrD5/qNBe1imNfZXenLHiu/M8PMh1YSIbGi0txscA7AnkVn8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnq8AkqXXtI+pkbkL8WjT3vfdfwIVEGyg3Tlb4swItmO7KuT+
	/t6WfhxZ81k+Su6UUkKXy05k7oaQPhfldBIjHmsUwmR1hehY4Qg/F+4CgEhA9q3MrknR7wp6Zqa
	uFcew/i1FTNqj+i+8qJBseVcbd/86p5CThQv7GsBK1e2gquxGglcO7/kcG3betlKoZA==
X-Gm-Gg: ASbGnctWDz4g9vQjI/8floZ9F0myHaeedHjCbohgQDtykVzk0kA5M3y0EDytBh5m1fP
	uCk0MCZsgBl0SnPlb3Fuwsh1VSVQ2u3ZIO7v8oiEwV06A2pOEFcZZIG9k7Lfav0thtG1Zp6sdQ8
	blTYIO2F/iGIGH77iQPjr1Z2inQqIbSNQ8qH+AjcZW5filkVVUFSwYAAD3Kyfxn0QdtqJEaj/Zf
	K5sbnPiL7cNLKBlwQUUyajZ0KGL+bbiS/lbuE8oQhS6XJnRrIRCEaQOTl7J/zbxt/riz76GjbOZ
	4B4Q0lY1IhzXsJr3KNGwRtfaiLRR0l3yKWrZIfkuJwoBhoYAxBm8NmFAShJLZuAhe24S6zvJgo9
	iVQFOZKZDfoIg8hnhrzSpVB3V12Q=
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr137439731cf.8.1759843306720;
        Tue, 07 Oct 2025 06:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV+5gLGyTtm2EcoLGMjErrwgnYOqeTHtg3sD1ZGygw+OnNB220PhRNrlGL06lG+1LwfOeQBA==
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr137439001cf.8.1759843305826;
        Tue, 07 Oct 2025 06:21:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f7eacdfe6sm194442766b.27.2025.10.07.06.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:21:45 -0700 (PDT)
Message-ID: <fedbc219-7935-4d7a-a9f6-3df05e27be92@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-7-e323c0b3c0cd@oss.qualcomm.com>
 <3355306e-4059-4af5-8865-3b5335356382@oss.qualcomm.com>
 <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NZJyWjSy01bdOLCKcFlWzOPAuwPS6Lu9
X-Proofpoint-ORIG-GUID: NZJyWjSy01bdOLCKcFlWzOPAuwPS6Lu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX8j+wMU27l/Vp
 eFE3m2ptglPIFddd3HQbJzK5qqe3rYrb5A99CfdmsHHSwUrTWqq+3/giRZIrxrF6uoa7xaBshS+
 5rPEOzFFBHfJsb5/04/Eq2EnYwSUjYVzBJ7U/FC8c5ywuPZDd/nx2Suu30JGYsJU3sDj8fB6cEd
 ugdOy/AypsZs4SofEUMAfD1GDPw9bkLOBclGEsBeiByKrRaMWHzIXrcjDuJEVtCakuE2mnBIGQ+
 M3bXQ+1ES7vuic9YjCJW4phfqKislS5/tcn0Bj749HbGJ1BGgFaq4y6eCgmhFeFzWXuQZg/fPYA
 e/V4tiNeMVqZG0gqSvMPjrb5Px8EBadnq1WnzDcv2Jl6NO4UtbvsECqhnIrVLnJYC4U7I2RV33r
 +J0TQ0hs35jfF/GvXXI6o2OCi2TcZw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e513ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bkvKUzPmFnKcqkYD6asA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/29/25 7:45 AM, Vishnu Reddy wrote:
> 
> 
> On 9/25/2025 2:48 PM, Konrad Dybcio wrote:
>> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>>> Add power sequence for vpu4 by reusing from previous generation wherever
>>> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
>>> earlier generation wherever feasible, like clock calculation in this
>>> case.
>>>
>>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/reset.h>
>>> +#include "iris_instance.h"
>>> +#include "iris_vpu_common.h"
>>> +#include "iris_vpu_register_defines.h"
>>> +
>>> +#define WRAPPER_EFUSE_MONITOR            (WRAPPER_BASE_OFFS + 0x08)
>>> +#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST    (AON_MVP_NOC_RESET + 0x08)
>>> +#define CPU_CS_APV_BRIDGE_SYNC_RESET        (CPU_BASE_OFFS + 0x174)
>>> +#define DISABLE_VIDEO_APV_BIT            BIT(27)
>>> +#define DISABLE_VIDEO_VPP1_BIT            BIT(28)
>>> +#define DISABLE_VIDEO_VPP0_BIT            BIT(29)
>>> +#define CORE_CLK_HALT                BIT(0)
>>> +#define APV_CLK_HALT                BIT(1)
>>> +#define CORE_PWR_ON                BIT(1)
>>> +
>>> +static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode)
>>> +{
>>> +    u32 value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>>
>> I think this could use some explanations.
>>
>> I'll go ahead and assume that the eFuse tells us that parts of the
>> IP are disables (hopefully not all three at once.. we shouldn't
>> advertise the v4l2 device then, probably)
>>
>> You read back the fuse register a lot, even though I presume it's not
>> supposed to change at runtime. How about we add:
>>
>> bool vpp0_fused_off
>> bool vpp1_fused_off
>> bool apv_fused_off
>>
>> instead?
>>
> 
>  Hi Konrad, Thanks for your review and suggestion.
> 
>  The poweroff and poweron ops will be called in each test. There is no
>  ops available that called onetime only to cache these values.
>  And, to create any variable, Need to add as static global in this file
>  because these are specific to this platform and I feel it's not
>  recommended code to add into any common structures as a member.
> 
>  Do you have any suggestion from your side how this can be do it in a
>  simple way?

Can we not just read it at probe / fw loading time and store the data in
iris_core?

Konrad

