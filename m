Return-Path: <linux-media+bounces-39496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFAB21DE9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E101889C50
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFB32E0410;
	Tue, 12 Aug 2025 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HUVRS7Bf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C52D239A;
	Tue, 12 Aug 2025 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978804; cv=none; b=FuIhXk4JRrbt+uLHO5HFgcnhF0HOFZeW4Tns8qVGM1lhEZpjfIdaYxmIIKAzpXKErMxStY4KGrVE34H+n8r4NcSSKuhlQYMkOxpyFpQJRQxUedXwjPaZdaC/PLk4Wf2MkloS0hKHSakQzlSPSmdgExsM2ugBhljluDMBzV1WBU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978804; c=relaxed/simple;
	bh=apMP4ekpsYIJk4A0RDbaySbVTi4hpd1ZOt/PXNJNdPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XHLd54L630BPoVoIVrOQIK9dkKeoBkNNTjOsF5wtkB42fcFabbCWanjTinMHjNr/6EqbeXO6+VU+5R93Kw/PqSh9H7GFXK9MtZ6AwObO+mJ+YPCgiuivj2s7VoiGw3YDrgaUefJSQ7HJ+QcIfQHiGsORacc7ItmabCLircsTq10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HUVRS7Bf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BK2gBc005519;
	Tue, 12 Aug 2025 06:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8vishNfstTVMhUB07t1AD+/M0h9hK1mTL6rcDYYgmw=; b=HUVRS7Bf693dTKrI
	avtMEjx4Y5XPj7n21oAHZvROGlfh6n2yaubA2BPplV+H1+Kzoxi/iAuGVvsfKDjH
	ypbhkVy4LHnbSuysDPY2byinAQGW6InDMZXsbWA0wpQY/OGbNafDXdw/lZZFT8ax
	u/0eztcjksq2KUAi6+17OmAlH+oYSE4i1PTOyFlv296dLLWSeAZjzevAjcqavMPB
	iNOgVWJyZmLWPc/t64S+5ugNWFNo/UVkSJUqUXc78VP7MpVf3Kkg4XZY9G9j64Bo
	Tsnv0nyG6DffjpmxZBsamkC0M7/6y5ti2dueO4uSL4pJtAcgvCH5O4QAjjYfGzKy
	LAmSPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6jugt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 06:06:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C66ZFt019077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 06:06:35 GMT
Received: from [10.253.14.152] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 23:06:32 -0700
Message-ID: <e08cb2a3-e96b-4b06-b56e-0b630cff38fa@quicinc.com>
Date: Tue, 12 Aug 2025 14:05:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
 <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXzzbbl8hAav8n
 oHlhq9BDrflLIoFWyvxnOwlWsdaOV51bh0ahA4hHV5b58r72CvP2qXppvDH3WHulXynI3PuZbLI
 gqio3N63HKhJdiL7FguOMoK1/8Pzt6iGe6aDxsQ1lxdmWgV2yneb38Aw2WytXwAlsZNpCYKt9Kw
 MO+NG0b4yvu8p+2pRNz9A0NKbFXOxXQ/ohBuqEIOlG20+r86S8gmmjemwBVl0wfr5A/Xn3pE0RJ
 OTcFVSOXaX/0NVYnzOg94revAXep3+/ILGLTJ2rXuGIV8BKTKwcNhntFGh0zxKMiuA3BnGUfSGO
 82t5GniYLJeEqjzxj6hbtEzTzvy5BlRougWCyzXItL662fCTxCs+KdLMBu8R17H9QuPpbihqxaP
 ohT0sfUV
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ad9eb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=FIJzFur9OfJVfuh530gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l930B3BglghgRcKGw_0vLFz7CEq1cZqH
X-Proofpoint-ORIG-GUID: l930B3BglghgRcKGw_0vLFz7CEq1cZqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075



On 2025/8/11 18:39, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 03:24:55PM +0800, Wenmeng Liu wrote:
>> Some Qualcomm regulators are configured with initial mode as
>> HPM (High Power Mode), which may lead to higher power consumption.
>> To reduce power usage, it's preferable to set the initial mode
>> to LPM (Low Power Mode).
>>
>> To ensure the regulator can switch from LPM to HPM when needed,
>> this patch adds current load configuration for CAMSS CSIPHY.
>> This allows the regulator framework to scale the mode dynamically
>> based on the load requirement.
>>
>> The current default value for current is uninitialized or random.
>> To address this, initial current values are added for the
>> following platforms:
>> SDM670, SM8250, SC7280, SM8550, and X1E80100.
>>
>> For SDM670, the value is set to -1, indicating that no default
>> current value is configured, the other values are derived
>> from the power grid.
>>
>> ---
>> Changes in v2:
>> - Change the source of the current value from DTS to CAMSS resource
>> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
>> ---
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
>>   drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h        |  1 +
>>   3 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>>   			return -ENOMEM;
>>   	}
>>   
>> -	for (i = 0; i < csiphy->num_supplies; i++)
>> +	for (i = 0; i < csiphy->num_supplies; i++) {
>>   		csiphy->supplies[i].supply = res->regulators[i];
>> +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
> 
> Could you possibly refactor to use devm_regulator_bulk_get_const()? It
> would save you from this data moving.
Initially, we were aiming for a minimal-change implementation.
Consider refactor for save data moving, will be refactored in the next 
version.
> 
>> +	}
>>   
>>   	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
>>   				      csiphy->supplies);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>>   	/* CSIPHY0 */
>>   	{
>>   		.regulators = { "vdda-phy", "vdda-pll" },
>> +		.regulators_current = { -1, -1 },
> 
> If it's unset, it should be 0, not -1.
I considered existing implementations as a reference:
https://lore.kernel.org/all/20220804073608.v4.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid

but based on the implementation of regulator_bulk_get, setting it to 0 
seems to be a better approach:

drivers/regulator/core.c
consumers[i].init_load_uA > 0

Thanks,
Wenmeng


