Return-Path: <linux-media+bounces-47261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F1C68BA7
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32A5D383788
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173EC332EBD;
	Tue, 18 Nov 2025 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn2itwLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d11MDPHd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5D32692B
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460384; cv=none; b=aLw0ma/9KeVpjCOeHE6rP+MXnJDMi5U85tlWDWs6hsyqmJYbFdfFetEFcHL8RwyejFd6J2bMc4HBvwIgCvnXRkU7bXqeLohrzFj9UKzlcIzM2FtuuowIsjRa89pzEb/5sZaY9Pz6d7gwlomaRhdNC/vXUV9qmkWmH6FFNTl2E1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460384; c=relaxed/simple;
	bh=KY2l8PHq7RVG3qLF9LgOeU40q+GxktV7lIxlZnv2EpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNjl8Gfth6y8yZ88AdU0vNe7dOAkUQM88X0LXj2UCwTvdUihrkK1WwtzA/cbCfFj6nMHfXsWCAmYZFV4tKbA27eoGhUiguKT4V68UjDa7PS8BBAvU8jO0H5Akr5KW3CwqRWfVUrQ9Z60iMAh10ikcv3dS7/XeIz6G9yue6MH/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn2itwLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d11MDPHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8DueF2194267
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzBTwNhUFUJYg6NGu4k4BlSP3SJfK6K5/WiEomAXFhw=; b=Wn2itwLWzwzBHJUx
	hU1coe7jrMwfno1O3pdFKk+jf2bovfTvtgaa4cqpiIrlYuOnk9cZnZxh3D1KuwNC
	gCR8mOGSOnojaB2PMpL6/TP/kLPqqdhIIzOehzN2me4pfS773LC8z+YhH3BRW6ID
	ZvwGex3pDl0+7EdQGauT1qKFR/AwhN5W+fzItwy3Cxw3DSZ/Hgj9S0TvMA+kOX2M
	3g4DzD9xTbx6/wgFycYcIshen6VJD2YyUO3Ci0K0EX5qsHUVN+memHYgu3PWAewp
	tM6t2Fa02D9DpcMV1g7F7RlejCK0rinAqrxsSV1OZgb9j/NyL05zjoN2wCh4Md10
	CSH+hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8bph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:06:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso25902691cf.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 02:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460381; x=1764065181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzBTwNhUFUJYg6NGu4k4BlSP3SJfK6K5/WiEomAXFhw=;
        b=d11MDPHdgGi6p2lfEW/+EOty8D2rANvYCKz/QwBsjy/zUfvZbTZlCxVZC1+CFnFkeM
         U1eZ9Q0qod6NN5c5mTNvsLfMkkummVD3B4Y56tePaNDXa8SRETAlPnvcQExt8bjG9936
         Xg6fIj4cApRadM9w4+GYHAn+0n595MbDlUXIZkgEiFi56gNfthwgYeOJUWlB8ePoJIZd
         yne88E6UW2LMRXDwitx5MSfyvSJeYKOg4seqcC16cuATA1yyQwcc5BZqpm/+XHZR4uDL
         68VZi6sARkVE6rn3AQmvxVDpwIifGNpxp84MBUQlp+9DvrVPdjMa34X68eHBCupBxPOo
         femA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460381; x=1764065181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzBTwNhUFUJYg6NGu4k4BlSP3SJfK6K5/WiEomAXFhw=;
        b=Xq7kHytYXdwZQNhLkXNVVk8sqRR76t6OdL+n1uVwRloZQW+vY7LYCpQi2b8I44iXAF
         gkpAwEvKVUR00LyswxlR+7u1fz4DtIV5Rw+GF7R4aS+5wJXjJLAxtaQ4LFRA0lUgi/gJ
         BxfPDqWy36OTEVSZ4H9a/xUQd/89mHBPCvMFPZ4gBj3Uh3X2+dRlq5H289Ip2SBaPOBS
         xQKvmIURoajjk2WsUbMJhPOn8xtr/b7HjhnjVLAf6i3zfhQChYMHE4XNuPktAQNA6MNX
         Ri0dc4wb3qMoh2qOmt9IxIbfidexv9eIhdVzbFcnqzkSt91H71kioTT5UF0SlQZuec0x
         wqpg==
X-Forwarded-Encrypted: i=1; AJvYcCUUYfysPoMFkkrdhSQ97u7o1Zk2uSew6upbhspUauVrE+o/XL+aje3c1dH1phoIfBnjT8+a1aaw6eMwvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/jGnzm+toycYFre5oBOS7E8Dp3eLoJa2IZ6B3xltWk3BNUuZ
	1KkHIpfN/XhYPmhIQI911mUs/1hk3SwETASR/J+QaTOooggIR4LysZpUlPtsuCZgHO3x93ytLDa
	FXelVzDeUOS+cFXRVBErrjgifRKOg1cwgV6msvOfEINFsepeFn0ovpVcogROiKPJMqQ==
X-Gm-Gg: ASbGncuZqO2hBq1TOOHRNI1iriLbEowBNNePjCGzOQ7bJKgmGktV0juV/4VjRphkaP6
	7B5tpaX+TFWTq68foHmQjSIwUOE0yq4VHLVNvPskIBS25opLnfUXjJ1b36r1q5sSaNWRcP4+hnd
	bd+OFhIFM74UHmicRPy9dDrwaWsY39iaQdFyM5yF+qYqJxhMRAMaBZmK5Oo3dRLivfJVpI8NTJ9
	GS2LMFYsOSj6Ot/L+SkuWGCDpOIifkwsON66FjSqcxdVg5JkVxxtUxWbYZbu3089t03fBZB59VD
	ptp27oQ00eeUPCUG7cStTfM8LPzNLJBj0gZHMkuv7FvJf0CPxu9U4SJkDviTX9zNfcf+2f02ywx
	RUaY9Xf4xCepBNntb2Ym2eoqJDk+bn+GQ+3k8bnkSkEeKWIZtUxakSb+AY5+7WDmOlsw=
X-Received: by 2002:a05:622a:5c8:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee317b4682mr20705141cf.8.1763460380783;
        Tue, 18 Nov 2025 02:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnOq/xkhybJYoebHJv4d6wLh3+wQrarETtemCNL/T2oYMB4/PkghvSjrNm52XXxeRJf+cyxQ==
X-Received: by 2002:a05:622a:5c8:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee317b4682mr20704691cf.8.1763460380242;
        Tue, 18 Nov 2025 02:06:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73785d0e04sm932538166b.47.2025.11.18.02.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:06:19 -0800 (PST)
Message-ID: <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:06:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
 <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
 <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
 <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com>
 <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MCBTYWx0ZWRfXwhDPsgqoBnUE
 gdsRBEXbKXL/WGjkCK/XKNGfrmD9DQoLA9GX2gHlZoUEwgkHJCGLeNhrE1dzCI5K34I3etbffPH
 vV+Z+fX82M4pFEXz18VF+qx5gFv4IfjFPMuzsvNtjFcVts/r4U8tZVvbLZV4Zmp9Jz8gqLujbjU
 fOz2RZBSHjH4SdO36UpZK2D3BhAo2tMWz9xAjmpCMp7dtvaJEMTlixPB9GT8s3ffSneUQui5FfN
 f3SoI7FdBBLCy1CQvRB7KFkXuma1DLzgLc28AHcxYMpMtgCL9LBzQ8p3oxHcsoYeWVjre7U1ro3
 8S9Wi5NpxM44mVBRfJL5Z/J8nnh7ZVqvN+x0QxbuuTCGNZ9jCR4gSg71Q+ltl0MDOvAw0+XlSzt
 OpbEeFClqzWWgYPpWmihLtml9hgR/Q==
X-Proofpoint-GUID: oDtSUcNL7txQVp0QPjcZsn5nNg-T4BnZ
X-Proofpoint-ORIG-GUID: oDtSUcNL7txQVp0QPjcZsn5nNg-T4BnZ
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c451d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Gbw9aFdXAAAA:8
 a=FLGiUj2T8VF-baS2uQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180080

On 11/18/25 10:33 AM, Bryan O'Donoghue wrote:
> On 17/11/2025 12:53, Konrad Dybcio wrote:
>> On 11/16/25 3:30 PM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 15:59, Luca Weiss wrote:
>>>> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>>>>> On 14/11/2025 11:15, Luca Weiss wrote:
>>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>>> SM6350 SoC.
>>>>>>
>>>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>>>> far as I can tell.
>>>>>>
>>>>>> Though when stopping the camera stream, the following clock warning
>>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>>>> while the clock is on, and 'off' while it's off.
>>>>>>
>>>>>> Any suggestion how to fix this, is appreciated.
>>>>>>
>>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>>>
>>>>> Do you have a full and complete kernel tree we could look at here ?
>>>>
>>>> Sure, this branch has everything in:
>>>>
>>>> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
>>>>
>>>> For further refence, at least two other people have tested this branch
>>>> in postmarketOS, nothing particularly exciting to report from there,
>>>> apart from that the sdm-skin-thermal thermal zone (thermistor right next
>>>> to SoC) is currently configured with 55 degC as critical trip, which is
>>>> quickly achieved when starting a video recording, but that's not really
>>>> an issue with camss, but will need some tweaking regardless.
>>>>
>>>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281
>>>
>>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
>>> index a4d6dff9d0f7f..229629ef82809 100644
>>> --- a/drivers/clk/qcom/gcc-sm6350.c
>>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>>> @@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk = {
>>>
>>>   static struct clk_branch gcc_camera_axi_clk = {
>>>          .halt_reg = 0x17018,
>>> -       .halt_check = BRANCH_HALT,
>>> -       .hwcg_reg = 0x17018,
>>> -       .hwcg_bit = 1,
>>
>> No reason to drop the hwcg description
>>
>>> +       .halt_check = BRANCH_VOTED,
>>
>> It'd be useful to explain why we should ignore the hw feedback in this case
>>
>>>          .clkr = {
>>>                  .enable_reg = 0x17018,
>>>                  .enable_mask = BIT(0),
>>
>> Konrad
> 
> vfe170 is what we have on sdm845
> 
> So I'm just asking Luca to try the sdm845 method of waggling this clock since what we have doesn't work.

It's of course going to work because this way you're not calling the
code that throws this error

I was curious whether you know the actual reason why this is being
done in some other GCC drivers

Konrad


