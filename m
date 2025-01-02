Return-Path: <linux-media+bounces-24200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876F9FF5DD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 04:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159633A2430
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 03:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5640C03;
	Thu,  2 Jan 2025 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OPDGKpIw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2245829A2;
	Thu,  2 Jan 2025 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735789669; cv=none; b=QM85WPTaqqH73vWpf8pVFWBCFoAd7FN/sD/SZ+gDJft90Lz4VrF+MKUcpOugJ2ux70lDYmBg7dnV72mahG9ejzlSX7RRByPO5OfL8eqqO0qZoXkO3sg6+Xr72YFknBKzmqP5IIp3y70540S+RuhDL+qzpFwcxS4nw6TxPa15G9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735789669; c=relaxed/simple;
	bh=sLf8j2BMmF4UUVCBkvM/1IY57fmBXcXNfrrqbGpKZJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S4tKkCJFugqong/P8SbhHxgQw7BLUivDTB4kKidZDykSdbpa+MLDOxu3FVzUm13FRiIsHqrmpinJta0PhXqOti6PGuqfwnXCtxK3o7KvB23wp1HvniNW9wuY4di2u0qBaWvbUr/Oc3Xzq2esAOlLHuAbXrgOb2u9MCpA1FzHU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OPDGKpIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5020UUit032704;
	Thu, 2 Jan 2025 03:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpzJlVMdQkgBcfV01TbLRTzhwoTfOg6XzmsI6mOmtJo=; b=OPDGKpIwRJrfF1Kf
	FPMJlVn80au5royPobLBnr+GMZROhE69TeTLm3SarF7E/unWA82pNezECVezdl7C
	UyOxqvzakrNIHig7EeHi2IDL2xtZtEQsdkEebKQ5VrllinxjV0xjw2fFfehX95a1
	1XrGXwy3NoD31VVMZizxoyoNxJwdhEDJnkofFtyv1othRSKG4VLygHdEk6G50NA/
	18/Ki80+EutkG/qWb21UKIZ/WSedxJVoN9t4TCRxZ2nFlKvONk58m9AkgB+Znhen
	h8S2hLtHbWPUWQdrT/9ll0CbTeziLiL08OM6gix65X99tfyJNoHzudaM0shpbXY5
	TirfNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wfy40a63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 03:47:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5023lSFR031125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 03:47:28 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 Jan 2025
 19:47:25 -0800
Message-ID: <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>
Date: Thu, 2 Jan 2025 11:47:22 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
 <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _y4CcuylOPzfqCAqpZDvPR9_Ns7DCkVl
X-Proofpoint-ORIG-GUID: _y4CcuylOPzfqCAqpZDvPR9_Ns7DCkVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=526 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020029


On 12/23/2024 7:41 PM, Dmitry Baryshkov wrote:
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>>   	u32 val;
>>   	int ret;
>>   
>> -	if (IS_V6(core))
>> +	if (IS_V6(core) || IS_V4(core))
>>   		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> It is being called only for v4 and v6 targets. Drop the rest of the
> function and inline the result. I'd suggest keeping it as two patches
> though: this one which adds IS_V4() all over the place and the next one
> which performs cleanup of the dead code.
  Thanks for your comment. poweron_coreid(), poweroff_coreid() and
  vcodec_control_v4() are called only for v4 and v6. I will clean up
  the dead code with another patch.
>
>>   	else if (coreid == VIDC_CORE_ID_1) {
>>   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
>> @@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   
>>   		vcodec_clks_disable(core, core->vcodec0_clks);
>>   
>> -		if (!IS_V6(core)) {
>> +		if (!IS_V6(core) && !IS_V4(core)) {
>>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>>   			if (ret)
>>   				return ret;
>> @@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   
>>   		vcodec_clks_disable(core, core->vcodec1_clks);
>>   
>> -		if (!IS_V6(core)) {
>> +		if (!IS_V6(core) && !IS_V4(core)) {
>>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> The poweron_coreid() and poweroff_coreid() functions are called only for
> v4 and v6. The v6 case was masked out earlier. Now you've removed the v4
> case too. Can we drop such vcodec_control_v4() calls completely?

  I cleaned up the code, and finally vcodec_control_v4() looks like this.

static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool 
enable)
{
     return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], 
!enable);

}

  Functionally, we can drop vcodec_control_v4(), but architecturally, I
  don’t recommend removing this function, because I think it’s easier to
  read the code with this function.

-- 
Best Regards,
Renjiang


