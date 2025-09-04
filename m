Return-Path: <linux-media+bounces-41746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0DBB4307D
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 05:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B72E4E0240
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 03:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A844D2853E0;
	Thu,  4 Sep 2025 03:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eJJlnZZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C8227EAA;
	Thu,  4 Sep 2025 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756956836; cv=none; b=QafNBVpRUtAVKfqaooqPLcByzOzcG+wbk15UOd3TeCtR4vmULMm7UjFU1FV6em81ELsedbVRtF3kEDmkDsn+8oGDbhT9eSgjijrkttAm49izsLYcPRdd/kJBEbf5YKKfthrJl6Ez6ph1ROeob+V+S45AUQZqEzO4fDy81uGFnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756956836; c=relaxed/simple;
	bh=TaYJEHe192jCRVqCPO+HLiKPyJywO/tW0Y+b4kvyOH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FDFK1tQZgTAfG5GRSqMg4tHVImSA2Llmy4P9HMppOmALC8s3H+8aaMCO2QLK6Dylc/ikHceRns1nyvRA9i9KfHdHSJ4XKwX8UjBt+x5Zfb2F3BY3miSEE7BJsGDe0oIpDfYpD++Yx+RJKNrefatEnUTQv/HDL2umT7dc9MwlXZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eJJlnZZB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841Fw2s005260;
	Thu, 4 Sep 2025 03:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ueTbf1bkRqFDb1lBeKEaIYecqBgTZcgygdtEDvtw/WA=; b=eJJlnZZB0KPl3Hof
	Gsmc/Wufu1Q/B25FzZG3zw5tHgy2ZtLHdjI6YPJC2H0ykHqsmwGeMHj0KxSrUwev
	fmiE84ZNAFBzB2NHWfVs9yeH4isI75/AwpY9h17cpwRQGwvtyIoi4PEtLZ7vT8FQ
	D42FFzup5kbcjEkFT+06fn0qToeC711P0WHIJ6ShIPqL3iXoeQmj/IlrvBBZQfG7
	y7CqnvmGfqGMH8kznai9+vxqeBtl8pNkXBg1uy4ebPlMmKbfUehdoluEwF6tBSOV
	+9hz8CpP8BwT0qHE7ksFYqaS+fg+vdQJGyOxykfU51sjh+3//QTx8cduyqcdZEuk
	TU9Jqw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjnyeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 03:33:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5843XnQK001291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 03:33:49 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 20:33:46 -0700
Message-ID: <b19ff26f-7dc7-4022-aec7-49922ab521cf@quicinc.com>
Date: Thu, 4 Sep 2025 11:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
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
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <6dc33f02-6691-4ad8-b04f-423e4e5caea8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b9089e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=ypURPpTzfF91ioEp2gAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: URZt8tGUo6M7WipheIl2-PJCoMRBsjsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX9eRWyYhO1DBw
 U05j2W7awKstGxqM0GMW1Xs44gI5oxpqZmcNYlQ6LFtyzOlmve950stmGc9xhpOcPociNjGMpwz
 Ac7aGRnBbmk/uuz6+A38qh9KYZBk6UuxhQJN+d2dIPDDLkPnWv/zPQoUAYNTreTUKFvlJnsyND1
 ETVrGjFnBShDxmctFCEVC2jS2CNx4tKXKgIMHUTO8Pa3YTUXBhRBXlI/Xfe6exrR305FPYkdLyQ
 Zu1XcOKOcp2tF0Znf0yqsMvzaL3HGZeLNFiyt4JZPELUBDTqlfj6p0uQ7K+uyCJsoNMF8NISzPE
 LfGfmG5T6yJx5LhARPK0U+YUCiQUrk23OUozztmCKJBBjcGk22xsRjY+mJnOvAvpxSdu4qHKpSo
 dYt+QcCu
X-Proofpoint-ORIG-GUID: URZt8tGUo6M7WipheIl2-PJCoMRBsjsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024


On 7/28/2025 11:20 PM, Bryan O'Donoghue wrote:
> On 24/07/2025 08:53, Renjiang Han wrote:
>> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
>> do not include an opp-table and have not configured opp-pmdomain, they
>> still need to use the frequencies defined in the driver's freq_tbl.
>>
>> Both core_power_v1 and core_power_v4 functions require core_clks_enable
>> function during POWER_ON. Therefore, in the core_clks_enable function,
>> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
>> it needs to fall back to the freq_tbl to retrieve the frequency.
>>
>> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the 
>> frequency")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
>> contain an opp-table and have not configured opp-pmdomain, they still
>> need to use the frequencies defined in the driver's freq_tbl.
>>
>> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
>> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
>> retrieve the frequency.
>>
>> Validated this series on QCS615 and msm8916.
>> ---
>> Changes in v2:
>> - 1. Update the returned error value as per the feedback.
>> - Link to v1: 
>> https://lore.kernel.org/r/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c 
>> b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 
>> 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 
>> 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>>     static int core_clks_enable(struct venus_core *core)
>>   {
>> +    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>> +    unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>       const struct venus_resources *res = core->res;
>>       struct device *dev = core->dev;
>>       unsigned long freq = 0;
>> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
>>       int ret;
>>         opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>> -    dev_pm_opp_put(opp);
>> +    if (IS_ERR(opp)) {
>> +        if (!freq_tbl)
>> +            return -ENODEV;
>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>> +    } else {
>> +        dev_pm_opp_put(opp);
>> +    }
>> +
>>         for (i = 0; i < res->clks_num; i++) {
>>           if (IS_V6(core)) {
>>
>> ---
>> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
>> change-id: 20250721-fallback_of_opp_table-4ea39376f617
>>
>> Best regards,
>
> Note to self add a
>
> Closes: CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com
Thanks for helping review this patch. But I'm sorry, may I ask how to
understand this comment?

This patch has not been picked yet.Is there anything else I need to do?
>
>
> ---
> bod

-- 
Best Regards,
Renjiang


