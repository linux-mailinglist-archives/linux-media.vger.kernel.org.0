Return-Path: <linux-media+bounces-29593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C412A7F912
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE7D3AA3CF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6819E264634;
	Tue,  8 Apr 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GrSGcBuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FFD846C;
	Tue,  8 Apr 2025 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103595; cv=none; b=vF+iOJcuvQO6YvQs61ns1l6V9qpCzEZEnXTmAiQC5O539nRZLkBhVnOK0nkoCDj3iGd2P4WX8Hu6gi5uz260sDWLN/Uo3mudWfH2MDi2A58LYWuplxm0/Z1hJCGkaoSAJ/JByjf+xS1i5baOCD51jmQidTecJExSPyf09KT13Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103595; c=relaxed/simple;
	bh=i5r7oEjgWUA+b1HeF5u5uITYjMNQ7s1rA/YNBB2iQpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kqCODrhvMs9zAUwJhC1cV/xDktfP2JV7f9IPWoM9JbJaujRfXMk4rndTes0y4TBhGR7vxw2L4l8AmhC5aQCEcJBZtzMs/hdzj4MtaXCbza99+GDbdukkeWM05cFatKE4KhVjrEUu3kaIXVMpH6CXbrKNNv/XoPYzUAOISilGh88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GrSGcBuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GOxE019576;
	Tue, 8 Apr 2025 09:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4q6CZVNRIYMvOjmxxY5bMBaX+Eq4LizsiRo2GNXuV3Q=; b=GrSGcBuZkGwpzYJs
	qUafz4j+VCpJs/cvxqJmQ1BsNfpdSpQj/yuLzyzJak8445QgF6DG2D5XgJMArpZJ
	ocT2Hz6m9ydghHNYH63gZvG1QD2B3oKzdmvqPHBKULeJdyfEBu3UzgZyMszPqMFL
	LB9QpiZ39OsBd4f28wg4wqyBy3lwSUxlTY3JNRDG1bUp5MVMgcHmhiK2U1asraKd
	pflMCI/keZ5ucyrvz9UIBU/DGrNF7ndMypp3+NafyEKgaQqcxIKjCaYHTNiyEv3j
	N3UYmf3Hssyy/k+a5qfBXtSDw0otNebFcCQKFqICV1/W14RgjI5M2GvzdivPAl5z
	82V6TQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3f61v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 09:13:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5389D7ZU014835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 09:13:07 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 02:13:03 -0700
Message-ID: <ba4c5c09-2303-35c9-5b68-45321aff09bf@quicinc.com>
Date: Tue, 8 Apr 2025 14:43:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/4] media: venus: pm_helpers: use opp-table for the
 frequency
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-2-e9a74d3b003d@quicinc.com>
 <fde279ad-27ed-4947-a408-23139bcd270a@oss.qualcomm.com>
 <351a9654-ffa1-4727-b772-95d4ed113c81@quicinc.com>
 <ac145c57-1db3-4747-88e2-02825f958d5a@oss.qualcomm.com>
 <6f11921a-4ee8-4f40-9131-529f548f681a@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <6f11921a-4ee8-4f40-9131-529f548f681a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LEMQU5laDtNjuqy3a2qTkGCbluFRdns9
X-Proofpoint-ORIG-GUID: LEMQU5laDtNjuqy3a2qTkGCbluFRdns9
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f4e8a4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=NXlXLHYT93F4r1eCyugA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080065


On 4/7/2025 9:09 PM, Bryan O'Donoghue wrote:
> On 09/01/2025 13:05, Konrad Dybcio wrote:
>> On 2.01.2025 6:38 AM, Renjiang Han wrote:
>>>
>>> On 12/23/2024 10:17 PM, Konrad Dybcio wrote:
>>>> On 19.12.2024 6:41 AM, Renjiang Han wrote:
>>>>> The frequency value in the opp-table in the device tree and the freq_tbl
>>>>> in the driver are the same.
>>>>>
>>>>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>>>>> for the v4 core.
>>>>> If getting data from the opp table fails, fall back to using the frequency
>>>>> table.
>>>>>
>>>>> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
>>>>> ---
>>>>>    drivers/media/platform/qcom/venus/pm_helpers.c | 53
>>>>> +++++++++++++++++++-------
>>>>>    1 file changed, 39 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> index
>>>>> 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..b61c0ad152878870b7223efa274e137d3636433b 100644
>>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>>>>>        const struct venus_resources *res = core->res;
>>>>>        const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>>>>        unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>>> +    struct device *dev = core->dev;
>>>>> +    struct dev_pm_opp *opp;
>>>>>        unsigned long freq;
>>>>>        unsigned int i;
>>>>>        int ret;
>>>>>    -    if (!freq_tbl)
>>>>> -        return -EINVAL;
>>>>> -
>>>>> -    freq = freq_tbl[freq_tbl_size - 1].freq;
>>>>> +    opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>>>> +    if (IS_ERR(opp)) {
>>>>> +        if (!freq_tbl)
>>>>> +            return -EINVAL;
>>>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>>>> +    } else {
>>>>> +        dev_pm_opp_put(opp);
>>>>> +    }
>>>> I'm not super convinced how this could have ever worked without
>>>> scaling voltage levels, by the way. Perhaps this will squash some
>>>> random bugs :|
>>>>
>>>> Konrad
>>>   Thanks for your comment.
>>>   The default value of freq is 0, and then dev_pm_opp_find_freq_ceil is
>>>   used to match freq to the maximum value in opp-table that is close to
>>>   0. The frequency values ​​in opp-table and freq_tbl are the same, and
>>>   dev_pm_opp_find_freq_ceil is used to assign the minimum value in
>>>   opp-table to freq. So the logic is the same as before. I'm not sure if
>>>   I've answered your concern.
>>
>> We talked offline, but for the record: my concern here was about
>> clk_set_rate() not scaling RPM/h voltage corners, which this patch
>> fixes
>>
>> Konrad
> 
> Konrad is this an RB from you, do you have any other concerns with this code ?
> 
> Dikshita, Vikash ?
I have reviewed this change and it looks good to me. It was mainly the
dependencies to videocc for qcs615 which was keeping the change on hold.

Regards,
Vikash
> 
> I'll give it a test myself ASAP but any other comments or R/B would be helpful.
> 
> ---
> bod

