Return-Path: <linux-media+bounces-42710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69170B840F9
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624661C82EED
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DCB3002A0;
	Thu, 18 Sep 2025 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nzMr3VRW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2E2F83A2;
	Thu, 18 Sep 2025 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758190896; cv=none; b=FTP2bVp3vljnvYBX9DUWF5Q2zyvZsQFJF57ys6bsMskMycJ71LKaHOmNCO7vrLWT2PnnOxDdMoLGUNUtCcWFz8GQEZxOBdRGMnNFSrcpewDtbQ4ES/0STHkD4XlgmoXTBHjY7tZdn04EX48TZGXUsdY2FqqVbAqC2F1nI3COC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758190896; c=relaxed/simple;
	bh=uNXT/0JREa+Nh4GzlzZrxzd51ny3zVTh4GdNr/fAUdM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=nbQs0E0V55MV0T2AVwwGILJ18fYquBemi6fHlo7OFDj76TsXGox6PQiWVcN+QiNBY/5544Ew3lzGmI2mKJk27nr3c5qsPWQ64QwXnAqZS+l3w8ClOhPylbbnKkxVD6EqGN/OpgTZQmdHlQyzW8fz6tYwrw7Jv/lf42OCkcIIkEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nzMr3VRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3Sh0H010955;
	Thu, 18 Sep 2025 10:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+KjP0JmoaORf+P7FXbapIQaWjRClfTTV+64FSDzW8o=; b=nzMr3VRWRDLoRD6q
	FOSmP+1IAfgfMKSQsuiNBDFwkqmVTKfN49sWpos6kCvzbtEFpvZ7sD1Iir5R8AHP
	k/lebmItfbRtd/syCuy7Nb+ly/T1Qw4BBTZTsu9zd8U3yl3+bBz1zbdtMwL7j1R+
	6Yeim1FWNkJg3l2JGIBF21ub5TFe+gjdwxwBCadRe1Lgf9eBwwliiKlU7lhyYHgu
	UY1TWTOi8+7ieSnZ+Impmu7q3r5/ifejlFEjpz2RUJQI+QuE3vsr0p3sl0S7pOQZ
	WukXZwX2FMxKIiE5Zx2WmA0Gfg50VkidMyRgI9d+uJ8UU+vBteyTAPDgzOprCGZ4
	hV6Uvg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxwvwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 10:21:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58IALS6C010609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 10:21:28 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 18 Sep
 2025 03:21:26 -0700
Message-ID: <b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com>
Date: Thu, 18 Sep 2025 18:21:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
From: Renjiang Han <quic_renjiang@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_qiweil@quicinc.com>,
        <quic_wangaow@quicinc.com>, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
References: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
 <6dc33f02-6691-4ad8-b04f-423e4e5caea8@linaro.org>
 <b19ff26f-7dc7-4022-aec7-49922ab521cf@quicinc.com>
Content-Language: en-US
In-Reply-To: <b19ff26f-7dc7-4022-aec7-49922ab521cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwNDW3J6mqLCc
 69CNnTJDYxiCyYx1RLf+aC+Dyr7CshdZeNc2e73es12KJOgwdI9UuDm7DmuW/5c9jUoGWEO3S6h
 1pqSrPtFec8YSycFvVdGqFasG0tP+M4Fmk+q1cttR3BHZcjlDTHIiKmqdo0y7UKCER53EPaUhxZ
 6ja6ct+o28yKTmiczG2GWkiUGefO1XF4649Yanb6lOKdr5C0its4tjpsxnQtD1qxuZKFEUZ3MlS
 4ku45WqQQjp75fkK4XNSThDXNuLqid6bA85FRaKLm35+EaDIkQELhTYFWvaxmEz6QMQTBJxqefe
 POMBchZ+hcCkeWSHHI22wR9zkeVlEn35d+7sMNz5IJJjtfjMUpX87tonVVGkmdQF+wFWrAiL+V0
 YLK0FKEL
X-Proofpoint-ORIG-GUID: YLb4l6e4PzbUz57bKG0p_u61ABjH0SRW
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cbdd29 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=spnusgalC2gk_GGubCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YLb4l6e4PzbUz57bKG0p_u61ABjH0SRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/4/2025 11:33 AM, Renjiang Han wrote:
>
> On 7/28/2025 11:20 PM, Bryan O'Donoghue wrote:
>> On 24/07/2025 08:53, Renjiang Han wrote:
>>> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
>>> do not include an opp-table and have not configured opp-pmdomain, they
>>> still need to use the frequencies defined in the driver's freq_tbl.
>>>
>>> Both core_power_v1 and core_power_v4 functions require core_clks_enable
>>> function during POWER_ON. Therefore, in the core_clks_enable function,
>>> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
>>> it needs to fall back to the freq_tbl to retrieve the frequency.
>>>
>>> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for 
>>> the frequency")
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>> ---
>>> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
>>> contain an opp-table and have not configured opp-pmdomain, they still
>>> need to use the frequencies defined in the driver's freq_tbl.
>>>
>>> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
>>> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
>>> retrieve the frequency.
>>>
>>> Validated this series on QCS615 and msm8916.
>>> ---
>>> Changes in v2:
>>> - 1. Update the returned error value as per the feedback.
>>> - Link to v1: 
>>> https://lore.kernel.org/r/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
>>> ---
>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c 
>>> b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> index 
>>> 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 
>>> 100644
>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>>>     static int core_clks_enable(struct venus_core *core)
>>>   {
>>> +    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>> +    unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>       const struct venus_resources *res = core->res;
>>>       struct device *dev = core->dev;
>>>       unsigned long freq = 0;
>>> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
>>>       int ret;
>>>         opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>> -    dev_pm_opp_put(opp);
>>> +    if (IS_ERR(opp)) {
>>> +        if (!freq_tbl)
>>> +            return -ENODEV;
>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>> +    } else {
>>> +        dev_pm_opp_put(opp);
>>> +    }
>>> +
>>>         for (i = 0; i < res->clks_num; i++) {
>>>           if (IS_V6(core)) {
>>>
>>> ---
>>> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
>>> change-id: 20250721-fallback_of_opp_table-4ea39376f617
>>>
>>> Best regards,
>>
>> Note to self add a
>>
>> Closes: 
>> CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com
> Thanks for helping review this patch. But I'm sorry, may I ask how to
> understand this comment?
>
> This patch has not been picked yet.Is there anything else I need to do?
I’d appreciate any thoughts you might have on this.
>>
>>
>> ---
>> bod
>
-- 
Best Regards,
Renjiang


