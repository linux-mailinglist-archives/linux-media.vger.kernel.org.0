Return-Path: <linux-media+bounces-43050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BFB9977F
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F124C03C6
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01572E06E4;
	Wed, 24 Sep 2025 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NwIG0fVk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD312DFA3B;
	Wed, 24 Sep 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710605; cv=none; b=NZmR9CYMIIXDqyfZtSDvEzg4ZbsK1zdiEb/meFrzj6Al7EfugLmATE7pBjRIlp2OR5m3j7NaJLBkoJZy7+jwRW2rQboqJpwdTJqyVKBh3IwlTROWereli4uOKT7cH9gsgqKrqEWucIqUX3C1hNZcS0DQPaHELdSSqG/tJPlf3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710605; c=relaxed/simple;
	bh=uZ5aL+RvlvrxXl7y7TA2bmQpgsId4kMSh5rp1Xr/eFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HHTU/L6FrADt8bjx0tMgycnTtQFFu1Mi6vHfHW6E+wJPazl2Ipda0+4KLChk5CAbhUK7Jk9f+Mzz2ZQVyN0fs4TXiOALbuyBHySfHB7h+oQ6dAnKu8Frn6CLkUkjllP0Mwu2KQw3qpZnOXtl5enltTYH9Tui6Y6ZM8/AKdZIIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NwIG0fVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iD1i002114;
	Wed, 24 Sep 2025 10:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4ZWAcXNUh+a8/wDPonqbInQPP3wM6yFGOe9WVaaSKo=; b=NwIG0fVkiwYUh0hE
	ASk6cWHglQi/iQgu329LXzNzt8GQSFqVJJurjvodbtHONgDQYIKGdT41EdL902aD
	1WsZL2HoxRwzouRxX1vjp/uwd2BC5O/UkWA5Nr3482RF1h2oTZc27ztdUy1QT4q8
	r5v01BARry2ga90FLGxwHyZoEb5Vii2B6yNn+2Nk1vBnZtNqJps8nX2Sp/9r32sS
	UJWvQWCZ5QQbpI3I4Rp3fQFWKDyGroh9CpfMvuM/Wed7vR25Xe0e4PlusUk6L53B
	Up9mMyNuky8vKQx/A7ArppBOhLUT1QZLEyxviWhhoFIlPh844f7uFstkoDp4UdKJ
	q2RjjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98m036-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 10:43:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58OAhAXg010908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 10:43:10 GMT
Received: from [10.50.8.83] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 24 Sep
 2025 03:43:08 -0700
Message-ID: <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
Date: Wed, 24 Sep 2025 16:13:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vNd1xP1_rsbFs6rwfjmuLoMMh6YkVtUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/zgd4SBOr4o5
 Ah2oFQdcw1vviICGJ62lD+CjOlU0wj6rfiutAUNxfgBI7MjxDHj0GyeNwcuav5Ciq4woCveG4Mw
 dxKIRYGsUDjW+0aYfzSjQQmMwgG+mNMo05f8dTcTx8bTVXZCni+MD5HpdEP5j6RmZY3BVsCTFNi
 SRtrcoGKOn+YlwuZ8W1RICwUDAQjjnIykYzMx6ne6W1grBiLhKP25M+VNSi54KKrYXw56psa+qv
 rrPbyDuy69IQaBAJxoDO0kl2I0LpFWJSFcxnFizSpLtUaYQYcDW73GuSh1nastLWFWPOqpjbCUR
 gMUOdqhGkgStmnAnIjg2z3ZsNwLHkJ6PDV8fXPeapgNo4EEe+v74IlluJ57tKJBU3N8P/DMvRmT
 HrxGc2my
X-Proofpoint-ORIG-GUID: vNd1xP1_rsbFs6rwfjmuLoMMh6YkVtUl
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d3cb3f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=NEAV23lmAAAA:8 a=lFjzG4kKUw5I2YI2xoUA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018



On 9/19/2025 7:30 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 12:26:03PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/18/2025 5:47 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>>>>>>>>>
>>>>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>>>>>>>
>>>>>>>>>> are available in the Git repository at:
>>>>>>>>>>
>>>>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>>>> video-fw-qcm6490-update
>>>>>>>>>>
>>>>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>>>>>>>>>
>>>>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>>>>>>>>>> +0530)
>>>>>>>>>
>>>>>>>>> From the commit log:
>>>>>>>>>
>>>>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
>>>>>>>>>> for signing. Also update the version to add some recent fixes.
>>>>>>>>>
>>>>>>>>> Using different sectoosl isn't a determining factor. It's the security
>>>>>>>>> profile and thus different MBN header versions.
>>>>>>>>>
>>>>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
>>>>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
>>>>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
>>>>>>>>
>>>>>>>> its the same case here, qcm6490 also required MBN header v6.
>>>>>>>
>>>>>>> But why do we need to mention that it's v6?
>>>>>>
>>>>>> we need this to be able to distinguish from the firmware binaries which
>>>>>> doesn't need v6 header, we are following the same for other SOCs as well.
>>>>>
>>>>> Do we have anything to distinguish from?
>>>>
>>>> As of now, we don't. But in future if a new firmware is needed for the same
>>>> hardware generation which doesn't need MBN header v6, how would be distinguish?
>>>>
>>>> So either we keep the name with _v6 now or change it later when a new
>>>> firmware is uploaded which doesn't need v6.
>>>>
>>>>>
>>>>>>>>> Last, but not least, is this firmware used at all? The venus driver uses
>>>>>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
>>>>>>>>
>>>>>>>> its used here
>>>>>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
>>>>>>>
>>>>>>> Hmm, why is it using a firmware file different from the upstream venus
>>>>>>> driver?
>>>>>>>
>>>>>>
>>>>>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
>>>>>
>>>>> This doesn't make sense, QCM6490 and SC7280 are the same thing.
>>>>
>>>> yes, they are same hardware, while it is one of those fortunate hardware
>>>> generation which have the implementation in both gen1 and gen2 firmware
>>>> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
>>>> uses gen1.
>>>
>>> What does it mean? There is no board-level difference nor SoC-level
>>> difference.
>>>
>>>> Given that they are same hardware, we use the same bindings.
>>>
>>> Now consider the OEM having the fused device and OEM-signed binary. How
>>> would it work? Will venus work if it's a gen2 firmware? No. Will your
>>> driver work if it's gen1 firmware? Also no. You can't randomly change
>>> the firmware interface in the middle of the platform lifecycle without
>>> providing a back-compatibiltiy.
>>
>> I understand your concern. To clarify, we are not removing support for the
>> existing Gen1 firmware, so backward compatibility remains intact.
>>
>> We are simply adding support for Gen2 firmware for this architecture. As a
>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
>> Gen2 firmware (via Qualcomm's video driver [1]).
>>
>> Additionally, as part of our plan to transition all Venus-supported targets
>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
>> to maintain backward compatibility.
> 
> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> interchangeable for the hardware they both support, until the venus
> driver drops support for V6 hardware. At that point it's expected that
> there will be no V6 support in Venus driver.
> 
> You can not simply upgrade to Gen2 firmware as if nothing happened.
> Consider a device node on SC7280 / QCS6490 with the firmware-name
> pointing to OEM-signed firmware. Both Venus and Iris drivers would
> happily consume the device node and try to work with it. One will work,
> another one will fail. This is definitely not what we have agreed upon,
> when you started adding Iris driver.

@Vikash, could you please chime in?

> 
>>
>> [1]: https://github.com/qualcomm-linux/video-driver
>>
>> Thanks,
>> Dikshita
>>>
> 

