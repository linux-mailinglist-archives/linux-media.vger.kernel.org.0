Return-Path: <linux-media+bounces-5501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3485BDC9
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41295283529
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5270373187;
	Tue, 20 Feb 2024 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FZOA8OeG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D673165;
	Tue, 20 Feb 2024 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708437213; cv=none; b=BOo+Qj6vkwM99CrIAwkzeYxV2Fh/URw7KHJwqruswDdoDFtxyf5CrmwC1NasJmZoRhK38wWkg0UmGhtAI3PMxXyWfm2BEKlDr7wqEDtg66gASUzA4Uc4Bs1wnl4unE+AYUQAFaWvM1PqcYv3IrRS7s8SQO0AvfYxw7pFDpmbpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708437213; c=relaxed/simple;
	bh=MKVStnTEU2LSXevhm2uyuLuxpac7BUpgFO9DAXqk3rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G90n9UeK3KgQO44Ah9+sy0oJuyKYKht2YX0l/DWyUPD+bihwmInmAodx/hi9gwWEeMOLKMvFaMqsKUVoP3+XnQx+mYTAGcO+uWC0xlY320NUU8mMlmvfVV3UKKOJ3nJheoicpBb89NXsU+NjUzkYet7RmVBxxNJCUqKXR8g/RzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FZOA8OeG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41K884ll024023;
	Tue, 20 Feb 2024 13:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UaYhP3+GC6vM/TvkgF3lPBBN6jmDGfiKR//qNasxKnk=; b=FZ
	OA8OeGY7M9nlRnHzbHP5hVdjxsDTFHU1K6SlrAQtb/Oq7TUrsu8GXnNcoSTzQ1Xf
	yAI7s5xu/MXRHVuEX2sG0CJmhZWmErCXvaheUd2gikPxX11EpvqBoGxeeYDmiS3X
	/T3nSvBiXbOY1WP39ttrIqLRdCVB4UhN/IcXDkV42xPeDCIWyac28bX8YgdiXGkO
	M9L+lqoGM7eGAJl+pccZc5pCMhJRKIlyEwNkZv4FIq80vwqGkr5q+/jFNe3vbtdf
	mF9zODpMkCCkCscQowiYIvpRfG7xg6qSSPp6x2frBQG8SAY4xr9X83j1t8eACIyn
	LZR8u2MsDcc/jnK3ryyA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wcmqp92d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 13:53:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KDrMA3023412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 13:53:22 GMT
Received: from [10.216.7.17] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 05:53:18 -0800
Message-ID: <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
Date: Tue, 20 Feb 2024 19:23:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: DT <devicetree@vger.kernel.org>,
        linux-media
	<linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Stanimir
 Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: smi-yHFIgc65JDyxww9lXVxwZiyWaC_b
X-Proofpoint-ORIG-GUID: smi-yHFIgc65JDyxww9lXVxwZiyWaC_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200100

Hi,

On 2/20/2024 6:57 PM, Krzysztof Kozlowski wrote:
> On 20/02/2024 13:34, Marc Gonzalez wrote:
>> On 20/02/2024 12:37, Krzysztof Kozlowski wrote:
>>
>>> On 20/02/2024 12:21, Bryan O'Donoghue wrote:
>>>
>>>> On 20/02/2024 10:56 a.m., Marc Gonzalez wrote:
>>>>
>>>>> On 19/02/2024 20:24, Bryan O'Donoghue wrote:
>>>>>
>>>>>> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>>>>>>
>>>>>>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>>>>>>
>>>>>>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>>>>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>>>>>>> it should not be called for this device/FW combo.
>>>>>>>>
>>>>>>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>>>>>>> to name a couple.
>>>>>>>
>>>>>>> Then let's just disable it until it gets unbroken?
>>>>>>
>>>>>> Its functional on most of our upstream stuff though, why switch if off
>>>>>> unless necessary ?
>>>>>>
>>>>>> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling
>>>>>> is its better to minimize the amount of work and opt as per the proposed
>>>>>> patch.
>>>>>>
>>>>>> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we
>>>>>> come to tackling new HFI6XX and later SoCs ...
>>>>>
>>>>> I was wondering if the chosen property name might cause issues later...
>>>>>
>>>>> Thinking "qcom,no-low-power" might be a bit too general?
>>>>> Perhaps would need to mention venus somewhere in the name,
>>>>> to limit this to the video decoder?
>>>>
>>>> Yep, the word venus should probably appear in the property name.
>>>
>>> This is RFC, so I am ignoring it, but just in case before you send v2
>>> with the same:
>>>
>>> You described the desired Linux feature or behavior, not the actual
>>> hardware. The bindings are about the latter, so instead you need to
>>> rephrase the property and its description to match actual hardware
>>> capabilities/features/configuration etc.
>>
>> I added the RFC tag explicitly because I was hoping for the DT folks
>> and msm maintainers to comment on the property name ;)
> 
> And for the PATCH we would not comment? RFC means not ready and you
> gather opinion before doing more work. Some maintainers ignore entirely
> RFC patches.
> 
>>
>> Thanks for your comment!
>>
>> Here's the proposal for v2:
>>
>> qcom,venus-broken-low-power-mode
>>
>> Description:
>> This property is defined for devices where playback does not work
>> when the video decoder is in low power mode.
> 
> Would be nice to know what's broken but if that's tricky to get, then
> sounds fine.

msm8998 supports configuring the VCodec (venus core0) GDSC in HW power control
mode. Could you please check and confirm if the driver is configuring only the
VCodec GDSC and not the venus GDSC. Look for the attribute
"qcom,support-hw-trigger" in vendor dt file.

Regards,
Vikash

