Return-Path: <linux-media+bounces-33361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC61AC3BAB
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85BB83AF332
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E71E51E1;
	Mon, 26 May 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mV1/NZ4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA041C64;
	Mon, 26 May 2025 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248018; cv=none; b=HwqLdfpewDUWcUrBAragVtf6x5fKehy6/tfvCR3FdQ6ZFLsbPKKRs01/jhVe4IzRrCUQ83rL9EiRfyBJFJX1Y5P1ecNDvitxwl/sVL7F6Aa1erSXw6QpNvZd+s9heCf8lSFAUxorRquwCe6bD2StUGmNY0032zBzhVxT28GQpe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248018; c=relaxed/simple;
	bh=0McZ0gQ9QSprE/u+YU+0FI5C9czsGBnBCLpeWD6/XJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WT6O0BnpnfGuEmTwJLA1kl6nSZpperKa02g8eFiWy4oc7II+VKyiMOmkY56Sn90mnMnuKG4H9Ij5dbv7WWywYXJjsVSparS+gWr7IFX7DtrSTVgv3B3r1X9fWLXE0Ev2bcnlwLAqbMbM+C96wK+CckmohyPEdFB6NQjhsZn455E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mV1/NZ4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNF1hs012378;
	Mon, 26 May 2025 08:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5MkyRhBDoPh8kgsB2TQmnk0WBaUQ4YSc85Jvh7YWYo=; b=mV1/NZ4UZpX4+q33
	9KqV07X3dr4q6/HLj8c0ENhP5HMEhXD9C+2l5r/izJWwdaaOytuIqYRa4djRbz1E
	yBUMAgkR0rSTc/Lx0p6giOZxwGXpFI666UrmkvBFrsLZQFopzuAC6FTCrNHBiWs3
	xCkx+bJdP9hxhwIjlm4Tap+WYCDVCJqv6Bl1JuFr7EIE1W2hM5D8CqW/LV+XtNSc
	SrO38yRQroPCINVoFfjx/gbt7xX6cmaJrxx6f6JbvWH592lW5xvYheixbrqCO+zC
	F6+j7VE1nGLQlf4t/nBKIArGF1KLBeA24bhkneRw+BBVGe1tk1O4Ty4wWkdIstM7
	xbeQ7w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5khbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 08:26:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q8Qn1c002816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 08:26:49 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 01:26:46 -0700
Message-ID: <0b188dd2-c0c9-4125-83b4-86fb35b237f7@quicinc.com>
Date: Mon, 26 May 2025 16:26:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
 <cf244e11-96b3-49cd-8daa-df9c91435e6e@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <cf244e11-96b3-49cd-8daa-df9c91435e6e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=683425ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=yKG4cNEaDZQrYnTI7YEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA3MCBTYWx0ZWRfX/UxKCsHMYu9M
 trRY7zoYZ7VkRMDHUb2OBhObmhhxIu2GzaqMHPDPRAOJWD971ycRKCTp3xDNqneF9fiZ+Sso8vN
 aXSwGFDLYDMic8XA9zy5XMdCpZ/rAJZF7U4/QFgP1Vbt9Am+Me6ucX6A3xWvEY2llXE01U3GTlv
 +brDDFV351voum9ilgWMUqXq4NOj5wzlNHZqlhpMPY8YPjCG/qjsXaTueZ3ztC8fsNUj8GreWyP
 49N1vcnTcnICewIr5kJ2SK6mRfBIQVtBQeQKvD5W/4oYlA32a+faMUrNIiWvDPvGquXZtu7KV9H
 shqhG2b6TMwN0pR888w1Uc3LJd177S1wXG4wjuw6BVtqK/NoSlBSzp5pCwkilJIFSYNi8a7/aoA
 z/DzO9/NApnB60Fn4ZZmIqAUs8/+qAtxVOSJXBJWdFKT32qucTOtn7ydDx6bHxkj6/XTr4t4
X-Proofpoint-GUID: DTHybJFK3v-Kzyl27L32aODXXqN7V7My
X-Proofpoint-ORIG-GUID: DTHybJFK3v-Kzyl27L32aODXXqN7V7My
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260070


On 3/19/2025 6:11 AM, Bryan O'Donoghue wrote:
> On 18/02/2025 10:33, Renjiang Han wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> The video driver will be using the newly introduced
>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>> control modes at runtime.
>> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
>> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>   drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>>   drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>>   drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>>   5 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/videocc-sc7180.c 
>> b/drivers/clk/qcom/videocc-sc7180.c
>> index 
>> d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 
>> 100644
>> --- a/drivers/clk/qcom/videocc-sc7180.c
>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>>       .pd = {
>>           .name = "vcodec0_gdsc",
>>       },
>> -    .flags = HW_CTRL,
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   diff --git a/drivers/clk/qcom/videocc-sdm845.c 
>> b/drivers/clk/qcom/videocc-sdm845.c
>> index 
>> f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 
>> 100644
>> --- a/drivers/clk/qcom/videocc-sdm845.c
>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>>       },
>>       .cxcs = (unsigned int []){ 0x890, 0x930 },
>>       .cxc_count = 2,
>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>>       },
>>       .cxcs = (unsigned int []){ 0x8d0, 0x950 },
>>       .cxc_count = 2,
>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   diff --git a/drivers/clk/qcom/videocc-sm7150.c 
>> b/drivers/clk/qcom/videocc-sm7150.c
>> index 
>> 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780 
>> 100644
>> --- a/drivers/clk/qcom/videocc-sm7150.c
>> +++ b/drivers/clk/qcom/videocc-sm7150.c
>> @@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
>>       },
>>       .cxcs = (unsigned int []){ 0x890, 0x9ec },
>>       .cxc_count = 2,
>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   @@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
>>       },
>>       .cxcs = (unsigned int []){ 0x8d0, 0xa0c },
>>       .cxc_count = 2,
>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   diff --git a/drivers/clk/qcom/videocc-sm8150.c 
>> b/drivers/clk/qcom/videocc-sm8150.c
>> index 
>> daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b 
>> 100644
>> --- a/drivers/clk/qcom/videocc-sm8150.c
>> +++ b/drivers/clk/qcom/videocc-sm8150.c
>> @@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
>>       .pd = {
>>           .name = "vcodec0_gdsc",
>>       },
>> -    .flags = HW_CTRL,
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   @@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
>>       .pd = {
>>           .name = "vcodec1_gdsc",
>>       },
>> -    .flags = HW_CTRL,
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>   static struct clk_regmap *video_cc_sm8150_clocks[] = {
>> diff --git a/drivers/clk/qcom/videocc-sm8450.c 
>> b/drivers/clk/qcom/videocc-sm8450.c
>> index 
>> f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963 
>> 100644
>> --- a/drivers/clk/qcom/videocc-sm8450.c
>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>> @@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
>>       },
>>       .pwrsts = PWRSTS_OFF_ON,
>>       .parent = &video_cc_mvs0c_gdsc.pd,
>> -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
>> +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>>   };
>>     static struct gdsc video_cc_mvs1c_gdsc = {
>> @@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
>>       },
>>       .pwrsts = PWRSTS_OFF_ON,
>>       .parent = &video_cc_mvs1c_gdsc.pd,
>> -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
>> +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>>   };
>>     static struct clk_regmap *video_cc_sm8450_clocks[] = {
>>
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi @Bjorn

Could you help pick this into videocc?

-- 
Best Regards,
Renjiang


