Return-Path: <linux-media+bounces-33603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9448EAC786F
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 07:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A72816B8BE
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 05:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E399256C93;
	Thu, 29 May 2025 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CEPOJhW1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC3215F5C;
	Thu, 29 May 2025 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748497739; cv=none; b=sHUIAQxD6zl3xdfm3eTArM7sgkR0O5jHbziPD9t5q/2Ydy+Ag7wiMiLsX7AYBlFTZd7npOyNIc7df1In781iyDEwiC2voZ3wC1YIHqMiNuRq6EkVcCc1XKqqFVHExUZPh94SSasa4zkSmcFmkutE879vzR6MgjaI4mqq1beGZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748497739; c=relaxed/simple;
	bh=S8UNchBBJhi2UrJY0H1tu0d9qIIgX98DDQVEztCdghQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o0sadSybTl3Gd7tQvpRs76bGrCd6dEEPiJvadkW1aH8qqXvaRg0POv1OrHNyUOliOwnTRnTa0C8+Cay8VYSbq/RGDuIOZ83UXr+Aztj/zuJahiEnDTdhWmkB5MmcUlbwqMo2nn8EJLPl+/o/TgVyjGWwu6t66QMVrD2ncG5JH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CEPOJhW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SLbw7F029656;
	Thu, 29 May 2025 05:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc0o/d0xxNEqNeL0dflc84uZVMljW/odphq1/CXiFcw=; b=CEPOJhW1jeC5jsAA
	zvBsO8614ZzhQy/LU/rBUIQhrnCdy5BNR22S93MQPJFaOBTCGwAZIlAGTKbE0iMr
	c4g2yKDwJOoCb46fhqgdUe1DvwEOeD2DkgUGRw20J3wRAHM1VAqKogRbmorlUfWn
	DTcD7Dy5XRq96b8+tJfbZ0b8gq/J8ZjFaLux4O75yAampAHWq5Tf27IlGJyCTi8A
	RL+1hwvym94gbHth4dyMAvhEsvhNfuaAou6oiJN1HJQv2MvXEeGUjVixhFmnfTLm
	9JG/YYTyH1aVrQBrkpxMumrZSa77lt35n1i8YFAXK4nTtg2VAybj+wIyAkH/OmI1
	ztkHhw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691f46w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:48:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T5mbbD010297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:48:37 GMT
Received: from [10.50.39.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 22:48:33 -0700
Message-ID: <2d45f138-c16f-76f5-ea05-6153b1566d9f@quicinc.com>
Date: Thu, 29 May 2025 11:18:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Content-Language: en-US
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
 <cf244e11-96b3-49cd-8daa-df9c91435e6e@linaro.org>
 <0b188dd2-c0c9-4125-83b4-86fb35b237f7@quicinc.com>
 <6je6eryfahdmjspvouvgtaxtv5w76jll3sp4b6hel2syblathw@7i4lts7eoew5>
 <13b6a35a-7add-4d25-b386-f152bd5c3baf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <13b6a35a-7add-4d25-b386-f152bd5c3baf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6837f543 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=8lTnAzGZgzAC39naZ30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sJC6fJfxuJN8wciLmYcAZKZ6lfuZf4ef
X-Proofpoint-ORIG-GUID: sJC6fJfxuJN8wciLmYcAZKZ6lfuZf4ef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1NiBTYWx0ZWRfX9NAf9sa3HBFb
 0Dfde7rcLigZyquN9vZwwR/AvtGFtaJAbpuIGaRKI5nsuHV6ErwTWfDXVs9HNU6QAC7DX3pFpSg
 AlQPKa0jmTmkd1VJ9U/eumG4WG4iR6m+6mHC/cvXVvpHWnotBKf9FUogXd5Dxd9yLFp5eE//GjA
 KRlI8JCYRdo3+kNmxgtieUOpZYtxJ7yRgcoumIPfN+h0CgbuPkaJvBZGIhQIcdl/tLwjPLnFGay
 ogplsqUyhFCZCa8rUgNcvYHVzd0ilk4rs3GioWfPv0+pRJD9qZLVkKMy+xrbn4m/mBS7FXg+noT
 ImZVgXYGAaPGGaRLP1/DD2LUaGdui/mek1GN+3Tt+BgO0I3voVo30f9wVQJsU43WRhCWbuzr7h2
 HaNwa+Sm1BGY/GYG22Euly6v47d5Q2Hzui/WeXGG1X7Ec4NANYcaQZUrsHUJ4BgQ62DG4ZU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=869 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290056



On 5/29/2025 7:23 AM, Renjiang Han wrote:
> 
> On 5/29/2025 3:30 AM, Dmitry Baryshkov wrote:
>> On Mon, May 26, 2025 at 04:26:25PM +0800, Renjiang Han wrote:
>>> On 3/19/2025 6:11 AM, Bryan O'Donoghue wrote:
>>>> On 18/02/2025 10:33, Renjiang Han wrote:
>>>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>>>
>>>>> The video driver will be using the newly introduced
>>>>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>>>>> control modes at runtime.
>>>>> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
>>>>> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
>>>>>
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>> ---
>>>>>    drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>>>>    drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>>>>    drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>>>>>    drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>>>>>    drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>>>>>    5 files changed, 9 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/videocc-sc7180.c
>>>>> b/drivers/clk/qcom/videocc-sc7180.c
>>>>> index
>>>>> d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134
>>>>> 100644
>>>>> --- a/drivers/clk/qcom/videocc-sc7180.c
>>>>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>>>>> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>>        .pd = {
>>>>>            .name = "vcodec0_gdsc",
>>>>>        },
>>>>> -    .flags = HW_CTRL,
>>>>> +    .flags = HW_CTRL_TRIGGER,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    diff --git a/drivers/clk/qcom/videocc-sdm845.c
>>>>> b/drivers/clk/qcom/videocc-sdm845.c
>>>>> index
>>>>> f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5
>>>>> 100644
>>>>> --- a/drivers/clk/qcom/videocc-sdm845.c
>>>>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>>>>> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>>        },
>>>>>        .cxcs = (unsigned int []){ 0x890, 0x930 },
>>>>>        .cxc_count = 2,
>>>>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>>>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>>>>>        },
>>>>>        .cxcs = (unsigned int []){ 0x8d0, 0x950 },
>>>>>        .cxc_count = 2,
>>>>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>>>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    diff --git a/drivers/clk/qcom/videocc-sm7150.c
>>>>> b/drivers/clk/qcom/videocc-sm7150.c
>>>>> index
>>>>> 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780
>>>>> 100644
>>>>> --- a/drivers/clk/qcom/videocc-sm7150.c
>>>>> +++ b/drivers/clk/qcom/videocc-sm7150.c
>>>>> @@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>>        },
>>>>>        .cxcs = (unsigned int []){ 0x890, 0x9ec },
>>>>>        .cxc_count = 2,
>>>>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>>>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    @@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
>>>>>        },
>>>>>        .cxcs = (unsigned int []){ 0x8d0, 0xa0c },
>>>>>        .cxc_count = 2,
>>>>> -    .flags = HW_CTRL | POLL_CFG_GDSCR,
>>>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    diff --git a/drivers/clk/qcom/videocc-sm8150.c
>>>>> b/drivers/clk/qcom/videocc-sm8150.c
>>>>> index
>>>>> daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b
>>>>> 100644
>>>>> --- a/drivers/clk/qcom/videocc-sm8150.c
>>>>> +++ b/drivers/clk/qcom/videocc-sm8150.c
>>>>> @@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
>>>>>        .pd = {
>>>>>            .name = "vcodec0_gdsc",
>>>>>        },
>>>>> -    .flags = HW_CTRL,
>>>>> +    .flags = HW_CTRL_TRIGGER,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    @@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
>>>>>        .pd = {
>>>>>            .name = "vcodec1_gdsc",
>>>>>        },
>>>>> -    .flags = HW_CTRL,
>>>>> +    .flags = HW_CTRL_TRIGGER,
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>    };
>>>>>    static struct clk_regmap *video_cc_sm8150_clocks[] = {
>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c
>>>>> b/drivers/clk/qcom/videocc-sm8450.c
>>>>> index
>>>>> f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963
>>>>> 100644
>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>> @@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
>>>>>        },
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>        .parent = &video_cc_mvs0c_gdsc.pd,
>>>>> -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
>>>>> +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>>>>>    };
>>>>>      static struct gdsc video_cc_mvs1c_gdsc = {
>>>>> @@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
>>>>>        },
>>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>>        .parent = &video_cc_mvs1c_gdsc.pd,
>>>>> -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
>>>>> +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>>>>>    };
>>>>>      static struct clk_regmap *video_cc_sm8450_clocks[] = {
>>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Hi @Bjorn
>>>
>>> Could you help pick this into videocc?
>> This patch can not go if the venus patch hasn't been merged. Morover,
>> venus patch should directly preceed this one.
> yes, venus patch has been merged into kernel.
Better to drop the video driver patch which is merged and put the new version.
This would avoid such confusion.

Also add my RB tag
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

