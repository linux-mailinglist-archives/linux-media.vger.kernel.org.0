Return-Path: <linux-media+bounces-22059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C61689D90EA
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 05:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BFBEB23A4C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 04:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8DA156F54;
	Tue, 26 Nov 2024 04:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WJqj2KA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D146B5;
	Tue, 26 Nov 2024 04:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732593867; cv=none; b=Lagxkar0R7T/wiUgESTmWOSVP/IwjNseXT/9HLCZIngAzKZlKwu3k1zq7P6+L48Yv7+u0Ckd4qijaJjZUPutsQd4ahESHeSj3Xs44cEFWbV5+linKwWKPgH5f1dEhyMVCTSFVDeyDGBa1Ceaul42jFE2bAXbr3gkZ2YfLDlIPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732593867; c=relaxed/simple;
	bh=6qSi+MEWtrGesXEq6Cctb2rTO7MnWIvONuEWyJHi8B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XUxTA36Q8is5D6pzg8JjdroS5+dq30on3kxJ1w73HPw7k/urZEe3MbxtYHugU/eiNK3ioS14yeYhnzrY9H8KDHkyZkPqkBO5yls/f0/kK2vm0C/4VDIflzOsfAUfT3nBPA1LogHX4sdb4bpC8WXVtX5dCeSn5DCQv2aEq7QxZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WJqj2KA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APFgVGm014266;
	Tue, 26 Nov 2024 04:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Exc1jY3GZrGRngw3e0Q5JtiVIsb5LXeRDCp7NVM+u3U=; b=WJqj2KA4V26uozqp
	K/TQWmmjmR+iW5QJdDDNLXqk6kfggvEJfRVHQmCtZXORBvoVP6np941dRJWA+dpU
	oQeFUV3lhXLZyGhwVO30ntrUiGCNzcI9ES3hR3tG+57rrtL+tIYVnCdyfuhWW52g
	qeMUeyOx5GkG9TuM2VG/4D72BNM3DdCp7NiUo+3wdVkDBYoauIacPSxAngn4mdkJ
	DmSHimXRj02KPKxLn6XXFPIUWMw8fNvMk2jFLECkjXz8jAtsaw7L7cQTEn8BFakj
	5tJmpk9peC6I9nBq1RAOmW02WBpdN0obt6Xtbn7vPpNLxM7Bz/JKnR9QLPKYni/E
	IubzRA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg2w8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 04:04:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ44J6a003865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 04:04:19 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 20:04:15 -0800
Message-ID: <5be1ca54-6a9c-46da-81cc-882ae1596cae@quicinc.com>
Date: Tue, 26 Nov 2024 09:34:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Renjiang Han <quic_renjiang@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kURCGXSHlK3U5zGc2xV4geoA003bOF5h
X-Proofpoint-ORIG-GUID: kURCGXSHlK3U5zGc2xV4geoA003bOF5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260031



On 11/23/2024 5:35 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 22, 2024 at 10:25:44PM +0530, Taniya Das wrote:
>>
>>
>> On 11/22/2024 4:29 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 22, 2024 at 04:01:45PM +0530, Renjiang Han wrote:
>>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>>
>>>> The video driver will be using the newly introduced
>>>
>>> 'will be' or 'is using'? Or will be using it for these platforms? Is
>>> there any kind of dependency between two patches in the series?
>>>
>> The video driver will not be able to work without the clock side changes.
> 
> Will enabling this flag break the video driver until it is updated?
> 

Yes, my understanding is yes it will break. When we first introduced the 
flag we had got the driver and the clock changes together.

>>
>>>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>>>> control modes at runtime.
>>>> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
>>>> Qualcomm SoC SC7180 and SDM845.
>>>
>>> Is it applicable to any other platforms? Why did you select just these
>>> two?
>>>
>>
>> The V6 version of Video driver is already using them, now the video driver
>> wants to migrate to v4 version of the HW to use the new flag.
> 
> I mean slightly different issue. We have following drivers:
> 
> videocc-sa8775p.c - already uses HW_CTRL_TRIGGER
> videocc-sc7180.c - being converted now
> videocc-sc7280.c - already uses HW_CTRL_TRIGGER
> videocc-sdm845.c - being converted now
> videocc-sm7150.c
> videocc-sm8150.c
> videocc-sm8250.c - already uses HW_CTRL_TRIGGER
> videocc-sm8350.c - already uses HW_CTRL_TRIGGER
> videocc-sm8450.c
> videocc-sm8550.c - already uses HW_CTRL_TRIGGER
> 
> This leaves sm7150, sm8150 and sm8450 untouched. Don't they also need to
> use HW_CTRL_TRIGGER?
> 

Yes, I am okay to add the flag, but looking for the Video SW team to 
confirm they are well tested on the rest of the platforms.

>>
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>>>    drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
>>>> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
>>>> --- a/drivers/clk/qcom/videocc-sc7180.c
>>>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>>>> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>    	.pd = {
>>>>    		.name = "vcodec0_gdsc",
>>>>    	},
>>>> -	.flags = HW_CTRL,
>>>> +	.flags = HW_CTRL_TRIGGER,
>>>>    	.pwrsts = PWRSTS_OFF_ON,
>>>>    };
>>>> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
>>>> index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
>>>> --- a/drivers/clk/qcom/videocc-sdm845.c
>>>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>>>> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>    	},
>>>>    	.cxcs = (unsigned int []){ 0x890, 0x930 },
>>>>    	.cxc_count = 2,
>>>> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
>>>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>    	.pwrsts = PWRSTS_OFF_ON,
>>>>    };
>>>> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>>>>    	},
>>>>    	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
>>>>    	.cxc_count = 2,
>>>> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
>>>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>    	.pwrsts = PWRSTS_OFF_ON,
>>>>    };
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Thanks & Regards,
>> Taniya Das.
> 

-- 
Thanks & Regards,
Taniya Das.

