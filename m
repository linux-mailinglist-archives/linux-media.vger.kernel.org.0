Return-Path: <linux-media+bounces-21848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03119D62A8
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 17:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E687281DD4
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 16:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986A92D638;
	Fri, 22 Nov 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WUfYg6q7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9791D9598;
	Fri, 22 Nov 2024 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732294559; cv=none; b=WC5/9Tv9kjWGOGeAri5YPUoz0+eUyk8GvhLP4lajOd9EvYuL+/YDSrxoMTupz1Y5nUtA4VUmicWv0GUe5bQpWFX1JNXBWbt2qxaHb/5w1Hxsl3ibMpxJWJkVg4shjFTJHqk53qe6RsRJZ+NTAqnioWe04rBUYpEq+D92c5Ab0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732294559; c=relaxed/simple;
	bh=K7zANThvysCQ/txnui5kF4ne4VDbguuQ4yVlE+Kr2vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j7TSU07qvgmf16r9Kudvg0Y6F3JnTro0od1rdZntpMrr0adVyYX2/KQI9k6h5Wi3LjBxX6rlDCVuojbFhELXJy3ZAbgCjQC9IAdbP4OGn6zRGoOJkjQtTJTIr/ieFdAJOkV4h4yRtKm5FF2ui+izYFIPJ+mfRnZRMFBEkXPUN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WUfYg6q7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMAF6vo026593;
	Fri, 22 Nov 2024 16:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u71DI60ZaHWRWvJCIoBzihCJXN9AOpSUdo3yd8ctQeM=; b=WUfYg6q7pQPyZRpt
	/NAHrAXzgigdM277F2WCcE9iEd2AK/NaQ/vBM9fRhfobiAle490TC2vh8il4Nx/J
	DSlmEpeZ3Es32mOyt0gWlmN+Y5NkfTvc66qVd/OfJ8omR0Z1e0lUMRpJz8qyHoEy
	kkhKmAg/ijSzQwbEJ/7OfLKcmnWsFFaASIAdWqPZOsEMKg89BqkiXUR9smEbKb9K
	yS33xSACINU5bz1vX2R/HoWWkWiUGfv9ZArQcSTkczRKY+fxkG2OsNP+6FFkTYS4
	gY6oZQUJlkP3uxOGlgvXK7kddjHNOAj233p/xsdJnIOdoccE5fW9p48OaNwJR+8o
	li6stQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b2k06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:55:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMGtpxh007748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:55:51 GMT
Received: from [10.216.6.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 08:55:47 -0800
Message-ID: <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
Date: Fri, 22 Nov 2024 22:25:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eaOxrrqvuyjs49Wwwwrb61u_GvCdXa1i
X-Proofpoint-ORIG-GUID: eaOxrrqvuyjs49Wwwwrb61u_GvCdXa1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220142



On 11/22/2024 4:29 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 22, 2024 at 04:01:45PM +0530, Renjiang Han wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> The video driver will be using the newly introduced
> 
> 'will be' or 'is using'? Or will be using it for these platforms? Is
> there any kind of dependency between two patches in the series?
> 
The video driver will not be able to work without the clock side changes.

>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>> control modes at runtime.
>> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
>> Qualcomm SoC SC7180 and SDM845.
> 
> Is it applicable to any other platforms? Why did you select just these
> two?
> 

The V6 version of Video driver is already using them, now the video 
driver wants to migrate to v4 version of the HW to use the new flag.

>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
>> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
>> --- a/drivers/clk/qcom/videocc-sc7180.c
>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>>   	.pd = {
>>   		.name = "vcodec0_gdsc",
>>   	},
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER,
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
>> index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
>> --- a/drivers/clk/qcom/videocc-sdm845.c
>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>>   	},
>>   	.cxcs = (unsigned int []){ 0x890, 0x930 },
>>   	.cxc_count = 2,
>> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>>   	},
>>   	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
>>   	.cxc_count = 2,
>> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thanks & Regards,
Taniya Das.

