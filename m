Return-Path: <linux-media+bounces-37999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CADB08CC3
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5179C3B753E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16CE2BD02A;
	Thu, 17 Jul 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DmmnQv3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5329B778;
	Thu, 17 Jul 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752754980; cv=none; b=P8SDClT7m/CEXlgjP8Up3yvZBxYxQ7ncEYLW1xe19EybUI9Z45z5h0vGEVWzGM6Jdufwd1v9nwiW0EnndrtthWNARM+HzOHZaQdtIXQXvb8j57m0PLc1d4Dx65e2Jdiu9H/MiVR1H3jqqytKTZAXwol8/x4L0HB8G2LM629o2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752754980; c=relaxed/simple;
	bh=B7ww9Gdmq8coyPUzi4n0g49oPshAe9aGb1zwGU6ES1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fhmmI4cy4A0Wh4J3v7psaw77RR1xyL+QSQuPPSPX9HdRxhZJLIk5O6d8EnXTeQyeFRoDfjGVI9vy5s9FpjJr5prmxx6DuaIslvAS+CFMQNVRBH7+XjrNSfCMObtRTGBnOc00+lwWjt2MyKlyIULRHJ7V3zOjosUjDop9B/Sa8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DmmnQv3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HC3Nmb028129;
	Thu, 17 Jul 2025 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nViHrpPLRpL8oAy8TwuGCXwpivbIXxn3VdU5LaOzh1E=; b=DmmnQv3bN+YPhPEU
	C4smPdaAa6yVuQSb8Li2OwE4LepnQI5qKyaP6dqsa+jbkdSNP7rdrD37IAJzKd/6
	GoaU1vChW04dzsQJDFmxTzwV8hS1VdOccsqh93nbQgYtSRJXaiSWlNlbpioa4/Lg
	CS+aWVcQ5Mv+UkX8DPrm3zYkLl9iCuZHXBzxCf8CzvU1Ndq02T8FVbNFC25VvnOL
	cyzzTEM7wzuJ4i7Wgrgi0nRosMSM9RSZth/v1oKjPYlbQRge04ghiTkYvCc9xEvb
	6nwunj8o23vaDixnUUejCyFBqSngkQyL8byccC4q8GLaK+EVRO1yxAQ0RPLdjk5v
	bfTZEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5yu29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:22:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HCMk5k019352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:22:46 GMT
Received: from [10.50.48.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 05:22:41 -0700
Message-ID: <fedee429-fad8-ab4c-7e8a-91ac13232501@quicinc.com>
Date: Thu, 17 Jul 2025 17:52:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
 <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
 <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
 <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878eb17 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=3OfcLH3czNDrsoscvLkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 899-AmlEeGYHcB7lsa50SeeMgUYAPLax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEwOCBTYWx0ZWRfX3a6GI0r7Ya/C
 jSO/kbwUGoCwmfscXaY+a3FKa0g7j1/B1ZO9djtAy/GTWkweeXndx2bVWkcF02WAo55T4NuQ1R0
 SIP2IUPhrUD25saH1aMj6H0bM3rlqYkeh6Id6hK0w1Eb3zJxozrxTbGDMHMB/FjDQKdPaM8VBtO
 zjb1JQ+yolU37FwRyGjyb9XlKM2t6l49fIreq+GBk+Y5LhhhfNupgJyWYej5QDC1W+dglHfCVWg
 b2L7NeQKj73INOCv6bCB27Uq0QY9yILE3KJHmmASsRtINxoleCKGi0KVyBs7ZFiTi6W9sxeXA8b
 bDT/Uj9bDN1Rm+5DOEr1v99n9V5F56yrl5PFF7uMNQUuv6dfhE3pHPHFY/ybnIIgVLNxslryJZh
 bvUH56EWS1mrk8hkAzkm44qY7Fsxg917DjJfPBI+9sHcNbBFS32bkKTbIO0EpcZRGaw9RYaD
X-Proofpoint-ORIG-GUID: 899-AmlEeGYHcB7lsa50SeeMgUYAPLax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=901 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170108



On 7/17/2025 4:24 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 12:50, Dikshita Agarwal wrote:
>>>>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>>>>> +					 val, val & 0x400000, 2000, 20000);
>>>>>>> +		if (ret)
>>>>>>> +			goto disable_power;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>>>>> +				 val, val & BIT(0), 200, 2000);
>>>>>> what are you polling here for?
>>>>>
>>>>>
>>>>> This is not different than existing code. I don't understand why you are
>>>>> commenting on something which is already there.
>>>>
>>>> Which code are you referring to?
>>>
>>> To the existing vpu33 which had Reviewed-by: Vikash Garodia
>>> <quic_vgarodia@quicinc.com>
>>>
>>> You understand that everything here is the same, everything is a copy
>>> while adding just few more things?
>>>
>>> My patch is not doing in this respect anything different that what you
>>> reviewed.
>>>
>>
>> It seems to have been missed in vpu33 power off sequence as well and should
>> be fixed.
>>
>> Still, as mentioned earlier as well, your reference should be
>> HPG/downstream driver of SM8750 not the previous generation (SM8650).
> 
> Yes and partially no, because we write upstream code matching or
> extending existing upstream driver. As you said earlier, downstream is
> not the truth always:

You're writing the power sequence for a new generation, so referencing the
previous generation is totally wrong. Power sequences can vary between
generations — that's precisely why HPG exists.

I've already pointed this out multiple times, but let me reiterate one last
time:
The current power sequence code is incomplete.
Copying the SM8650 code to SM8750 is not appropriate — it's the wrong
reference.

Regards,
Dikshita

> 
> "That shouldn’t be the case. The downstream design is different, which
> is why the driver requires the above code to move the GDSC"
> 
> so here I built on top of SM8650 and re-iterate whatever mistakes are
> there. The best if someone fixes VPU33 and then I rebase on top,
> re-using fixed code as my base.
> > Best regards,
> Krzysztof

