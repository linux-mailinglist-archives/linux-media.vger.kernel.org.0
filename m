Return-Path: <linux-media+bounces-10970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2F8BDDC0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 11:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C2A281475
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9AC14D6EF;
	Tue,  7 May 2024 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JYFHBhHO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6614D2BB;
	Tue,  7 May 2024 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072813; cv=none; b=J0NnwFoeKdihOUM8zw7LMoYV0G7ZZukgI4hcHOxDZS/fooLKZT+9qRh/zujMh/neQ0fPAbNIxquz1Qc+x2Vcp2I6gvC6nJHt4zf8360sjVidBGvFru3+btuNxf7Ot3NJK2lpXpewcXVCdSvoc+Y/nN4Ud5vFqpn8erAQa495KEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072813; c=relaxed/simple;
	bh=wtw7hSmGwmn0lTDQ6W66pWog4VJFwb4uJMUZaQunLfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iB3iY+TYFECktOT9ApP0cIwFbaNcERhnbbZhVKPk3iBp6pLahhlgwy8yNfc7wAtTr76/TydyjZYNY/HIrCHfW5FrkQZPwj1VTUrifg/+ojNEF0YwSanIuAZr2OXxUSpUrWcAF8yy06o3nXsAZ9o9nKYcRL16V4WUq+h0HVBnH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JYFHBhHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4477AhYb021187;
	Tue, 7 May 2024 09:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PHmJ/5M+D6CDuJkqzi+AHStULaSwVRigZYyaLMi9Q8I=; b=JY
	FHBhHOUlGC0kxkVD0/KQYGuBXzOdG8TtoPoSs+wLrwFgsXlQC6sW3RNoqLAz2lzV
	daKBGFdOUof7BKHuj5lUjnnpHK9JGvKHc7cSkQP5ClNUOHEFEtAorC5lyKl+GZ65
	Y6VJSlTOxvK8B+FsPdPVBb8QMkJGU5oITCb17kdaG2YcmQNPgGil37yyaq8qTDNv
	Cpi7pVlpECEvT/7NO3i7oHPgVcGw2SwrJfFvhVjy2EbT/ydjToRXbkAfNqrcrm1t
	g0i9F9wxCcRdWpiYRYV7ApW3P/P8lFHToK/4m+c/ndBajHOK/gjSYjctGjmGCHtF
	AulGaPnq3fYPJkJxdBGw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyfhv089b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 09:06:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44796ikr026009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 09:06:44 GMT
Received: from [10.216.21.139] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 02:06:39 -0700
Message-ID: <62d4798d-51d1-94a0-da52-9804dea33be8@quicinc.com>
Date: Tue, 7 May 2024 14:36:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] media: venus: add msm8998 support
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Stanimir
 Varbanov" <stanimir.k.varbanov@gmail.com>
CC: MSM <linux-arm-msm@vger.kernel.org>,
        linux-media
	<linux-media@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        "Pierre-Hugues Husson" <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
 <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
 <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
 <4349e7ea-380d-4c91-83be-d74983e2cdb0@freebox.fr>
 <ddd78134-6f04-4ef6-a3fa-4a2932d81165@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ddd78134-6f04-4ef6-a3fa-4a2932d81165@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Of4D8YoLuNRC1a6fvDaRnljK63YMWE2B
X-Proofpoint-ORIG-GUID: Of4D8YoLuNRC1a6fvDaRnljK63YMWE2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_03,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070062


On 5/6/2024 9:27 PM, Bryan O'Donoghue wrote:
> On 06/05/2024 15:51, Marc Gonzalez wrote:
>> On 06/05/2024 16:43, Vikash Garodia wrote:
>>
>>> On 5/6/2024 7:17 PM, Marc Gonzalez wrote:
>>>
>>>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>
>>>> Add the missing bits for msm8998 support.
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>> ---
>>>>   drivers/media/platform/qcom/venus/core.c | 48
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/core.c
>>>> b/drivers/media/platform/qcom/venus/core.c
>>>> index ce206b7097541..064120127cb86 100644
>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>> @@ -554,6 +554,9 @@ static const struct venus_resources msm8916_res = {
>>>>       .fwname = "qcom/venus-1.8/venus.mbn",
>>>>   };
>>>>   +/*
>>>> + *
>>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blame/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-v3.dtsi#L403-414
>>>> + */
>>>
>>> There is no need to add the link to downstream code in comments. Please
>>> remove them.
>>
>> They are needed somewhere, to double check the values.
>> Otherwise, it's just voodoo programming.
>>
>> If not in the code, then maybe in the commit message?
>>
>> Since qcom doesn't publish datasheets, downstream code
>> is the best we've got.
>>
>> Regards
>>
> 
> Commit message is a good idea.
> 
> Do that.
I am good with this, incase you are waiting for a confirmation from my end.

Regards,
Vikash

