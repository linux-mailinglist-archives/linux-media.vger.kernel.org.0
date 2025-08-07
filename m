Return-Path: <linux-media+bounces-39034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94159B1D656
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5344A18A2504
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4259F26FD91;
	Thu,  7 Aug 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aNLVsFCi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780221FF48;
	Thu,  7 Aug 2025 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564836; cv=none; b=EIMPWi3P6k+QB+cf9GjGtjLi68/XcTZjzz7mDsw9oNpw09NvBAfQbQWlvjOrSw0TrIJmZ5JSeH9LyXtvq0DLErdA7apxb1WXtfk/zmvGJNtly3A7KJyO73jzSK3LermRykCAUUG92x9ydycm6UHwjb8fpmlXRXj42rRQdxvUFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564836; c=relaxed/simple;
	bh=niUySpeViHXZwkORBV1VYWpO024HSc6/+OHc1WetGYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HaCkzK/DO5FKKNPJtohFyBRPBumzD61vPfqtaVHmbHp2+m1s0roY5j/H0vPDTYWLU0wNm7ExfYbvMjz8bXNTuWN2yuiktWjf4033CpT4szvJrW4bXNZNvUMKo01UOM/0BJyusGxcn5kBjToabJxS7DsAc87zvPYt8TtFRHEm8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aNLVsFCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DACW020466;
	Thu, 7 Aug 2025 11:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n34wNpSLzSEuog7FdguerPp4QK02qfMycIMwdnfFlG8=; b=aNLVsFCicSDCiyvh
	XmgID13we+JrBZ6awF9pmc2P5rnOYx2V0fQ+FMQXAWAlfC0Yaak1IS3SzAMY9VJF
	82sAzy9pge98mcSsee7Dpuv0I79gv7iyWpXrHMNrPX+ev56Djm+pAbhLJA7qm4CX
	q/K4SUanADJAlC+NLKalA4lQ6Gp53qB/TG7v2VpnrrMeJl0jOs+I3IJhzQgb7bx9
	Z1dnHh6QQunYchE+K0l8chHjWqQtUKZmdiiy/mNDWbvBGnv+A21UgPyurZf/w6t7
	TsysmoUS3tHhU6ZNiOPbiFMkZvCKm1MzF8L35XCPh8gxtqS/pfn9njR3qQ3Vg8vN
	1g7b/g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8e1wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 11:07:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577B79jk021319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 11:07:09 GMT
Received: from [10.216.27.221] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 04:07:05 -0700
Message-ID: <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
Date: Thu, 7 Aug 2025 16:36:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        <bryan.odonoghue@linaro.org>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <mchehab@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex> <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aJNTigOMy1JFOxot@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f9lgsuntnj7oh15903fYDQ8xhSK_NNLc
X-Proofpoint-ORIG-GUID: f9lgsuntnj7oh15903fYDQ8xhSK_NNLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwkXqWkSuKUbw
 nw9qFBjS2LBW1mWu5JbqfxlvRxTbRyWL0H14s+3x9OFSPWmf3f62DzUhLyWkVw+ZYf5y87PwT8c
 IPwDoea4JUm/b8xtwQn6XS7LkStW5l6xbVss+NFsqiPkJ6NwaPbAW/TtxX+13VV4q7qnwjTmOZF
 FFC+9SQNy7HXfvo4mrj1ZYKrtsuPo7+4NfHx/wrXtAQXG+otm0zMn0QELk0yLEoIABBzbYyM1O0
 +N7Ho3O8QgFQSd7ij9ISyMC0Uaw70jBohcnQhKRQGGuP2GnqRjBWUNTKPz9gyjDXnH/1Zg1ph0e
 5kV9FpREtvWsYInAS9AB4G24OgDUNcLdRz/CNZDcj6FPenqdOZqCuCv8PsDQhlLEFOhq6D2CW8h
 Nto7UdhO
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689488de cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mAuLG1Zk4bF_eBP2NYYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009


On 8/6/2025 6:37 PM, Jorge Ramirez wrote:
> On 06/08/25 11:01:09, Konrad Dybcio wrote:
>> On 8/6/25 10:04 AM, Jorge Ramirez wrote:
>>> On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
>>>> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
>>>>> On 05/08/25 12:44:23, Jorge Ramirez wrote:
>>>>>> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
>>>>>>>> Add a qcm2290 compatible binding to the Cenus core.
>>>>>>>>
>>>>>>>> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
>>>>>>>> encode at 1280x720 (HD).
>>>>>>>>
>>>>>>>> The driver is not available to firmware versions below 6.0.55 due to an
>>>>>>>> internal requirement for secure buffers.
>>>>>>>>
>>>>>>>> The bandwidth tables incorporate a conservative safety margin to ensure
>>>>>>>> stability under peak DDR and interconnect load conditions.
>>>>>>>>
>>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>>>> ---
>>>>>>>>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>>>>>>>>  1 file changed, 50 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>>>>>> index adc38fbc9d79..753a16f53622 100644
>>>>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>>>>> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
>>>>>>>>  	.enc_nodename = "video-encoder",
>>>>>>>>  };
>>>>>>>>  
>>>>>>>> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
>>>>>>>> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
>>>>>>>> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
>>>>>>>> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
>>>>>>>> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
>>>>>>>> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
>>>>>>>> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
>>>>>>>> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
>>>>>>>> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static const struct firmware_version min_fw = {
>>>>>>>> +	.major = 6, .minor = 0, .rev = 55,
>>>>>>>> +};
>>>>>>>
>>>>>>> This will make venus driver error out with the firmware which is
>>>>>>> available in Debian trixie (and possibly other distributions). If I
>>>>>>> remember correctly, the driver can work with that firmware with the
>>>>>>> limited functionality. Can we please support that instead of erroring
>>>>>>> out completely?
>>>>>>
>>>>>> yes, in V7 I did implement this functionality plus a fix for EOS
>>>>>> handling (broken in pre 6.0.55 firmwares).
>>>>>
>>>>> just re-reading your note, in case this was not clear, the _current_
>>>>> driver upstream will never work with the current firmware if that is
>>>>> what you were thinking (it would need v7 of this series to enable video
>>>>> decoding).
>>>>
>>>> I'd really prefer if we could support firmware that is present in Debian
>>>> trixie and that has been upstreamed more than a year ago.
>>>
>>>
>>> I share your view — which is why I put the effort into v7 — but I also
>>> understand that maintaining the extra code and EOS workaround for
>>> decoding needs to be justifiable. So I chose to align with the
>>> maintainers' perspective on this and removed it on v8 (partially also
>>> because I wanted to unblock the current EOS discussion).
>>
>> +$0.05
>>
>> I thought we were going to eventually relax/drop the fw requirement
>> when the driver learns some new cool tricks, but are we now straying
>> away from that? (particularly thinking about the EOS part)
>>
> 
> um, no not really: the decision was to simply drop support for pre
> 6.0.55 firmwares for the AR50_LITE.
> 
> Pre 6.0.55:
> 
> -  has a requirement for secure buffers to support encoding
> -  requires a driver workaround for EOS (providing a dummy length)
> -  during video encoding.
> 
> To support < 6.0.55, v7 of the driver patchset:
> 
> - uses the version to disable the encode node
> - enables the video decode node
> - implements the EOS workaround.
> 
> It was agreed that this complexity was not necessary and that we should
> just drop <6.0.55 firmware support (which would in any case only include
> video decode).
> 
> And so on v8, I removed the above.
> 
> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> the v7 functionality so I am waiting for direction.

the issue is in firmware for both encoder and decoder. Didn't like the idea of
driver carrying the hack for a firmware issue. Just because, for encoder, we are
unable to hack it in driver, we are ok to have it enabled in a newer version of
the firmware, we can follow the same for decoders as well.

Regards,
Vikash

