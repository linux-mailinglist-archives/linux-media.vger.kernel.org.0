Return-Path: <linux-media+bounces-43596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47956BB380C
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 11:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF91F17A104
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9497E2FF66A;
	Thu,  2 Oct 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuXulkm6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A72FC87E
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398074; cv=none; b=iJyt7aXzRNA9snDw6qf3z7gbaw2W/1m+i00Mk550i7Ph14g3RPHCWGj/gknriHGrdIcOp5t93sALQqgy/iOoWlDcW7NrX3mgpLOPLcUON0523KefKYkhF5lqxAE9SxuQgFnvu5YQr1AlxbVlr7DmfqceFRuRmhHBs/9GPtFvHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398074; c=relaxed/simple;
	bh=2+RRAWyE3suax71TISctQT8u03cKa4jIUKTkgo65cH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsShvtB/wu0MKFMoC/CZLkLeH4d0pR8n+xW+6IaO6ddvph05CzWoa0aZCDtT74m4S9Btp+2VXgW48MKCs+Ju/aQ47l7s+kx3jYssbj/S3JFaeVJgj9f0QHyfubQS4Xgm6R+7HJT+8yLV333L6wD30kthrImc4lkJWM2WsWfLLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuXulkm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5925kd8o008512
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 09:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4CJbkv1E7Ldtfiyrw9vrB/hvoYfQbk84yyOwtlJNz8=; b=EuXulkm6i9qi73ZC
	ixdp4+t+0n/M4f1rI11MCWmSiTuOGIP2Y0KbFgn7pDzlg6VRrGx1xCl+rpOr4Dfl
	T1sxs/Ykds5QttvZD22+l0nH11UdW7jBdWpyYDe2oB6WXRjl+eTvKUF25lnSOW+Y
	0D3X9u2S2Rl8hhrNPcuhm+RJB1ZAqKmmBEzEnOxXDerhbJXOcCdJmQ4T7DekePsW
	DHoeN7teK5tCbW1X1X7XuykTzphuzxR+xZCwANgYZgmrMkCbv2h4qDCCsDJJS7yy
	8dSooBiG3UcyWtOqXWs1oqdsMC8DbYQJIc+ucjahSoxfxUKzb1XRgdAO2+by9sph
	UU9a0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh0j03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 09:41:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3305c08d975so881250a91.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 02:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759398070; x=1760002870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4CJbkv1E7Ldtfiyrw9vrB/hvoYfQbk84yyOwtlJNz8=;
        b=vIn3x+ZBPU8OkKPP8iQgoGLjDlDnR+ah6cVqou5Fr7wgVqydO8Tphux8MAxKbMlXRh
         GmJ3u8l9YLDngW1wjXs3XDVqw2AxbL8L5aB1PVPFmKu82tSfKeL5y0nhcq6OWIoSriI6
         Cz8kSxdovG7e7eEcEQrPG51LBQ39FWgGy2jpCQSscZO1aO3KhfwmyMcHbFi/KM4cb/Xf
         k3xYV0VIRKxfT9Zitjnd87bp7KhSLQC/Z0vL0TrgWBoKW6QhhH/sxIbCr7TuR+ro0lls
         xSg2w9lyK56eC/LM4poIkUtmoF73jJCBH3hcaiWZ1cEjoq9xYaNsPE3u4bjGmh98PBKy
         BdcA==
X-Forwarded-Encrypted: i=1; AJvYcCU4kJ4s0MQDb9QB0okpYG/Kc9LSJfI4qbZlovACpvmf1i6nAeXmaPlC0GyeiiC7x+1p1GWUN0X9w1VIvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHr5aJtmMt+S28XW4gz7lkcZMVMQusSUZsVgmj6+V8ILFqCJLP
	gZXez7SulPzGw2TqL7o/F3gkxwkK1iP9Yg7MramzNfXVtEL8JgqSPrLYwOCC7UiQboajUHPseaZ
	qDvJ5LpCDKRpsUCTlJ3gs6fgYandK4LUvlH/KrIb/fVh3Z5mydriN9JuRglOQZDxAHw==
X-Gm-Gg: ASbGncuRovWhU2krvB/iKHRs3BF91DTDW+eYrfNpuAhUriVPaNUAPNIKBNKUxLPvpU+
	ltRgvdaXfHJbsup2pnQGIKB28//oq7JwJQQaBsk6lfrOXyVY44oSzJY8vC05PujevTkJgb9VmCA
	Q7Ybm1Dsoq3t+StrH4rbyBXA9eJ3FGi6HKHJ+pnT27YA2ymwH83IFFr1SYU386ZOmrS8IWZ2JK4
	+mgnoPgeT/wpiSGFLzeQWdCTayWz6vHafvK1nmP3zf+RrLgsgBXl3fO5Za4iLCZloeccdRVuZ7p
	iiJq5RIPsbruyGe2G6s3e72Om++5taQvRpD7gvU/Uvwjh5d5i7iruPdUSTWFN0C3Y93FwdkkvU9
	MZCU=
X-Received: by 2002:a17:90b:1a91:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-339a6f58396mr8008610a91.26.1759398069899;
        Thu, 02 Oct 2025 02:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrQXdvyBSld64O1fXcWJnNXjuF1iF9neRdC1GOocwtAa/1NbRXNWOkpTU61PS7Mqc8K7jbKA==
X-Received: by 2002:a17:90b:1a91:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-339a6f58396mr8008587a91.26.1759398069409;
        Thu, 02 Oct 2025 02:41:09 -0700 (PDT)
Received: from [10.204.101.186] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c061sm4473608a91.22.2025.10.02.02.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:41:08 -0700 (PDT)
Message-ID: <9b8d587d-553f-47aa-7203-a2a573208990@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 15:11:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
Content-Language: en-US
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wk37b1m01wHyJlP6UM_mrOvjwhE01jSb
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68de48b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bkvKUzPmFnKcqkYD6asA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfXzmZoAoSm4IuC
 mZtDlfo5xrR3lliv8OSKmUfMR0HB1UPFQnorlM/48kMyFNKAD5/rvIv7fcJodF6HoPv4gtgWu+g
 +WJX25MIJHZk8lMIrXZHiohKQa8R8KwF5Z/lw2hu9PV7yX2L701zOzp4wbwo0gTW79298E6SZmC
 o+cSWR/+MY5Ou3TQ3hOnqOT+1Dxi9IynMfBSzMN21zsvJEd3UiXWsckg7Wu+UG6MqWsZXJa37qN
 obX3iuVi3jWfZphJpDcCw4e9j9mA/7n8O90nqle0aCceL45m+M85FZWpS68U//Tvgg2SVaAUhGB
 03aVZ1qDOlEDWr9XKjwPMw+hhKZMEjlP/oRcZTK5hmAqKioTR7gMsme4cGJC5G6vhLiPJ6KVdYJ
 mmMzzgiqzIqiBhcov/fXXrvph9CErw==
X-Proofpoint-ORIG-GUID: wk37b1m01wHyJlP6UM_mrOvjwhE01jSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047


On 9/29/2025 11:15 AM, Vishnu Reddy wrote:
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

IMO, its a fair point from Konrad to avoid register read multiple times. We will
recheck this and optimize it to the extent possible.

Regards,
Vikash

