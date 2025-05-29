Return-Path: <linux-media+bounces-33561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71FAC75A0
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D204E7C84
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 02:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E97242D6B;
	Thu, 29 May 2025 02:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JTHvUX3r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAED2417FA;
	Thu, 29 May 2025 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748484253; cv=none; b=K/HHM3l51mXV4QPGWfV5ZOLKvzQ/FeVyf2bz63NrRFpDojMOVIsz941nWLvN5c3RjnvtYXp1FtUxPjSJO233lnVsa3ObZSq44Qv0G5JRINHlJfe+jZuQ/b06lCHvxht0uaZnEdQJLVumT7ScZISJZ7uM1uMAgAzCoB1ZqfMbwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748484253; c=relaxed/simple;
	bh=JtzjRDKTVjL67ffPdQX14MIS2p1fLm1q4MyiTPbiltE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pRcuUMeuFqOHDXsCHRvf0D8988EiQwGj2v+1CqV5hu4hJ1vhxOmyS0+ilBcXEYooFUV3Jn/3ExP0ShJ0HbdHyIorHPQpOw8w5uMPYaeFGnmK0K8AJHzH6yg7DgSGwfchs1a3rtSaycDhPHJF4kTwX9O++kq56Epol9kAYNj1n1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JTHvUX3r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SJbCDr007970;
	Thu, 29 May 2025 02:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5ixF+Bc5BFjy+M1gS3u2BSxRZsjEb4y4WkDseBBJdo=; b=JTHvUX3rrw/8PND/
	BZknfWnc265mxMIAk8K141eqbE8zTM/6q1s/vSHfGhKUt0deL7q97GfeEby7exbs
	IAhgLmOECrShbntGpLHXhi2u1orluhwHetXoMW7i4ingcIe47vQAyvjym892Y2eD
	F4W6d41AA5Vg9tcQCdFoYQSzAmx3BeRjM4m170ogx7rSKe019VXlW7CBD1AnUcMI
	TJfl8jtOyO0ajEwU4Y0KSXTOyWCNei0RJKdDk4v/0WqWWQCa3u5UTkBTMYqzQkmP
	gA6oOkTq07fsas0+sX0p04kbaPjHn6cvExBNcAlWW68qzk67vxnkAQtkbLkDX2R1
	Qfkbow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek40j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 02:04:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T23xGr014631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 02:03:59 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 19:03:56 -0700
Message-ID: <ee143088-89fb-4d4e-bc47-816e90dc7fa7@quicinc.com>
Date: Thu, 29 May 2025 10:03:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] venus: pm_helpers: add compatibility for
 dev_pm_genpd_set_hwmode on V4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
 <zewub4somwmi6jvym5m44t6cumeonv2pcrtsntbkujlznotefp@bhfrerykhfqu>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <zewub4somwmi6jvym5m44t6cumeonv2pcrtsntbkujlznotefp@bhfrerykhfqu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6837c096 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=qW5kxXaVTDtZ0SX8UZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uBAoquHlSN_q66YoVZ8qpmRquCSTdpnE
X-Proofpoint-GUID: uBAoquHlSN_q66YoVZ8qpmRquCSTdpnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAxOSBTYWx0ZWRfX4QE9ulK4V1Z5
 e141yGJmu038qN82cU51LqpTquEI+py2tnVoNtgErFCCEV2v1rIcock09MQ6l1CJ+LLd93wSDSh
 84pon/lxfcIhymiKTADShVsFW3v4O0PBDXynUTXKUDYGW+jDaBB4mY928kh+3MdMPP96cGizbA1
 w29jYgjsw7WMkNHAjmJfKzewbvBdK/2Rbh01MGGHJAiKGspqiDsQ7wDDwsHIGPHLOXmfAXq0d9D
 KjeBeILffm8/5wBgu6YGSI/MLNsaCActCiuZnFenOPjyHKOcz3+sobJw8yB08b9UtBfSozCoqpD
 X/4C5Vz5Ux+oCdtuC7e3+x7JiSGmdZnRkPZJadjwEGdz+hp4pM0AANxB0QZWKQeOdG3/3rBIWC1
 AcG5nhfYrr6RRBcfnAP0a1ibnuq39Bu/DiyNTb/Nz76LeQ0JSiEkWR4c3h7mXkxTGE/yKJqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290019


On 5/29/2025 3:27 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 04:03:20PM +0530, Renjiang Han wrote:
>> There are two ways to switch GDSC mode. One is to write the POWER_CONTROL
>> register and the other is to use dev_pm_genpd_set_hwmode(). However, they
>> rely on different clock driver flags. dev_pm_genpd_set_hwmode() depends on
>> the HW_CTRL_TRIGGER flag and POWER_CONTROL register depends on the HW_CTRL
>> flag.
>>
>> By default, the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode.
>> If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it means
>> that the clock driver uses the HW_CTRL flag. At this time, the GDSC mode
>> is switched to write the POWER_CONTROL register.
>>
>> Clock driver is using HW_CTRL_TRIGGER flag with V6. So hwmode_dev is
>> always true on using V6 platform. Conversely, if hwmode_dev is false, this
>> platform must be not using V6. Therefore, replace IS_V6 in poweroff_coreid
>> with hwmode_dev. Also, with HW_CTRL_TRIGGER flag, the vcodec gdsc gets
>> enabled in SW mode by default. Therefore, before disabling the GDSC, GDSC
>> should be switched to SW mode so that GDSC gets enabled in SW mode in the
>> next enable.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/core.h       |  2 ++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
>>   2 files changed, 23 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 43532543292280be15adf688fc0c30f44e207c7f..0ccce89d3f54cf685ecce5b339a51e44f6ea3704 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -168,6 +168,7 @@ struct venus_format {
>>    * @root:	debugfs root directory
>>    * @venus_ver:	the venus firmware version
>>    * @dump_core:	a flag indicating that a core dump is required
>> + * @hwmode_dev:	a flag indicating that HW_CTRL_TRIGGER is used in clock driver
>>    */
>>   struct venus_core {
>>   	void __iomem *base;
>> @@ -230,6 +231,7 @@ struct venus_core {
>>   		u32 rev;
>>   	} venus_ver;
>>   	unsigned long dump_core;
>> +	bool hwmode_dev;
>>   };
>>   
>>   struct vdec_controls {
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..409aa9bd0b5d099c993eedb03177ec5ed918b4a0 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -412,9 +412,17 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>>   	u32 val;
>>   	int ret;
>>   
>> -	if (IS_V6(core))
>> -		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
>> -	else if (coreid == VIDC_CORE_ID_1) {
>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
>> +	if (ret == -EOPNOTSUPP) {
>> +		core->hwmode_dev = false;
>> +		goto legacy;
>> +	}
>> +
>> +	core->hwmode_dev = true;
>> +	return ret;
>> +
>> +legacy:
>> +	if (coreid == VIDC_CORE_ID_1) {
>>   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
>>   		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
>>   	} else {
>> @@ -450,7 +458,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   
>>   		vcodec_clks_disable(core, core->vcodec0_clks);
>>   
>> -		if (!IS_V6(core)) {
>> +		if (!core->hwmode_dev) {
>>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>>   			if (ret)
>>   				return ret;
>> @@ -468,7 +476,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   
>>   		vcodec_clks_disable(core, core->vcodec1_clks);
>>   
>> -		if (!IS_V6(core)) {
>> +		if (!core->hwmode_dev) {
>>   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>>   			if (ret)
>>   				return ret;
>> @@ -491,11 +499,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   		if (ret < 0)
>>   			return ret;
>>   
>> -		if (!IS_V6(core)) {
>> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
>> -			if (ret)
>> -				return ret;
>> -		}
>> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
>> +		if (ret)
>> +			return ret;
>>   
>>   		ret = vcodec_clks_enable(core, core->vcodec0_clks);
>>   		if (ret)
>> @@ -511,11 +517,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>>   		if (ret < 0)
>>   			return ret;
>>   
>> -		if (!IS_V6(core)) {
>> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
>> -			if (ret)
>> -				return ret;
>> -		}
>> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
>> +		if (ret)
>> +			return ret;
>>   
>>   		ret = vcodec_clks_enable(core, core->vcodec1_clks);
>>   		if (ret)
>> @@ -811,7 +815,7 @@ static int vdec_power_v4(struct device *dev, int on)
>>   	else
>>   		vcodec_clks_disable(core, core->vcodec0_clks);
>>   
>> -	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>
> return vcodec_control_v4(...);
OK, thanks for your comments. This patch has already been merged. I have
another patch that cleans up code and removes dead code, but I haven’t
submitted it yet. It depends on the videocc flag, so I plan to wait until
the videocc patch is picked before submitting it.
>
>>   
>>   	return ret;
>>   }
>> @@ -856,7 +860,7 @@ static int venc_power_v4(struct device *dev, int on)
>>   	else
>>   		vcodec_clks_disable(core, core->vcodec1_clks);
>>   
>> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> And here.
>
>>   
>>   	return ret;
>>   }
>>
>> -- 
>> 2.34.1
>>
-- 
Best Regards,
Renjiang


