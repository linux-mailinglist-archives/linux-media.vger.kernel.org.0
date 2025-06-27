Return-Path: <linux-media+bounces-36077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F3AEB30A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839C616CFC4
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783D6296158;
	Fri, 27 Jun 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LoyZXSiE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14466293B5E;
	Fri, 27 Jun 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016870; cv=none; b=YsHLakakBFqqpHa3bBglQwyyKfI5YhO1JmcQLkDVqqhAjZSFuNLm5io/4yRqaCZEcMuf5MIX4bm/2mYX7xuHg3LzAvQg4xnpl2cdEwG9quTIRx2AM/yUneJvNiBS1gtsEaRKE7yY+wB809rvtZ3NUKAGYCqZdYSQAFyLZuCt8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016870; c=relaxed/simple;
	bh=8Q8oTM1y51Iie1Mf1I4h1+UZwJPjQB92ik5bHmWnJUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ITuG2jKbpvrb3pFY4/Lrsp8AnvzVg1Op2gwLJFjJaktsEjZXWHvOfQQ1ahu/J+6g1Zi0l4XbjfxrG2Vw5QolPYaU30IiTV2JDaMK7JPK+uziTMIwbJnt/GTfkIpBfn4ekiuMMU/BbZn0+6j6jkB3ZIe/SS7PKmPNt5Z24QEKYbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LoyZXSiE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DKaF007920;
	Fri, 27 Jun 2025 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+uqEwVa29pUgdcj52vQ1NCxmrssiNcqyilQAL85Eu8=; b=LoyZXSiEc4+iYMOJ
	2q717fEijK6ZacE2C4UqHLy8UkGcCG41Uej30OP1FUTf69JYuhp9Ex0Ed1q9NaVe
	MlyYbgs1UEu8EVd5O3cp+WPcG4DlZmPQbbUc5+4QX41Kwav6Q92RA6hqhXJQut7U
	NFbOHxYl02OQHhB9m4rC9eHjDn8Yi2ztlGU4buRiaUPpHL65wGlpoF6eHMxzwi5l
	YlDmRX1kZq7PoFO+rzgyfguQvDmF5P1Iw2fjKiyLXAtqCyrW9dn+cW+J2PX2BqUn
	+YoF2qCR3S9AY8WdrSoTOHp3aoFkhgLUh3nJaxaoCmP2xFT3T3Q7bdXOQ2YyHPqm
	laWURQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqvqwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 09:34:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R9YNfe005224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 09:34:23 GMT
Received: from [10.253.72.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 02:34:18 -0700
Message-ID: <1c6d8e59-eb9b-4230-a7e5-f0ffc30b8877@quicinc.com>
Date: Fri, 27 Jun 2025 17:34:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Add current load setting for qcom camss csiphy
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>, <quic_depengs@quicinc.com>,
        <quic_vikramsa@quicinc.com>
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
 <9deadaaf-7dc7-4616-a6e6-95a5f757779e@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <9deadaaf-7dc7-4616-a6e6-95a5f757779e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4xExga32zVGgEnbqW3uKJCbPkYK5p90z
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e65a0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=lQAp6sCOzUQraW--TEUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4xExga32zVGgEnbqW3uKJCbPkYK5p90z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA3NyBTYWx0ZWRfX15WDCFKBG24m
 xrALDlIf1v/lMkhkJ9GsRneXETPJzqGpJEZFBge42nzIIHlmR0CznK2qEMKOspveCVr8RuPe2y6
 33PudT3gJrkexYYpA2d5alCxj5mYHulQaBBfTf+g77wEbT9MZjgNk16bBMB16ZyuQigjhjRczNp
 1Mfn3Ge+CrQMN5wpKByK+mAMrHR8j4SikTCEpJ3eNRolGajNvk9iV0chK0Q9nqlg9ePhwzoU/2z
 aztlKtXc0MCN0OZ2iG1AoOI8ZBGxTLyR5nPNCRVa0ipiUmWCORkWYKl8RlfnJbKKTdKDReyK11J
 h3xXU2qFuW4kE5ElDUQmYTK+qQu1RMs4IM/o1+bNGY33G4tNcXReHdz8XMhbSyckmeEdw+buieS
 DaGxiwZBXBC/lrwFszYRw9VDJ8QnaabSuywcOVJ4KFgvEe1lg193yznh2SN6GUhY0mLQ7YK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270077



On 2025/6/20 16:23, Bryan O'Donoghue wrote:
> On 20/06/2025 05:07, Wenmeng Liu wrote:
>> Currently qcom camss csiphy drivers don’t set regulator’s currents
>> load properly using Linux regulator framework. This causes every
>> regulator’s initial mode set as HPM (high current mode),
>> which may have higher power consumption.
>> To address this issue, add current configuration for CSIPHY.
>>
>> Wenmeng Liu (3):
>>    media: dt-bindings: Add regulator current load
>>    media: qcom: camss: csiphy: Add regulator current load setting
>>    arm64: dts: qcom: qcs6490-rb3gen2: Add csiphy current support
>>
>>   .../bindings/media/qcom,sc7280-camss.yaml     |  6 ++++
>>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  1 +
>>   .../media/platform/qcom/camss/camss-csiphy.c  | 29 +++++++++++++++++++
>>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>>   4 files changed, 37 insertions(+)
>>
> 
> How are these load-currents determined ?

According to my discussion with hw colleague,current value is decided 
based on post silicon calibration, this value is fixed for the 
corresponding chip.

> Looking at other instances of setting current for PHYs
> 
>   grep -r regulator_set_load * | grep com
>             [git:camss-bugfix-6.17] ✖
> drivers/phy/qualcomm/phy-qcom-edp.c:    ret = regulator_set_load(edp- 
>  >supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> drivers/phy/qualcomm/phy-qcom-edp.c:    ret = regulator_set_load(edp- 
>  >supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> drivers/phy/qualcomm/phy-qcom-usb-hs.c:    ret = 
> regulator_set_load(uphy->v1p8, 50000);
> drivers/phy/qualcomm/phy-qcom-usb-hs.c:    ret = 
> regulator_set_load(uphy->v3p3, 50000);
> drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:    ret = 
> regulator_set_load(priv->vregs[VDDA_1P8].consumer, 19000);
> drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:    ret = 
> regulator_set_load(priv->vregs[VDDA_3P3].consumer, 16000);
> drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c: regulator_set_load(priv- 
>  >vregs[VDDA_1P8].consumer, 0);
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:        ret = 
> regulator_set_load(qmp->vregs[i].consumer,
> drivers/remoteproc/qcom_q6v5_pas.c:        regulator_set_load(adsp- 
>  >cx_supply, 100000);
> drivers/remoteproc/qcom_wcnss.c:            
> regulator_set_load(bulk[i].consumer, info[i].load_uA);
> drivers/remoteproc/qcom_wcnss_iris.c: regulator_set_load(iris- 
>  >vregs[i].consumer,
> drivers/remoteproc/qcom_q6v5_mss.c:            ret = 
> regulator_set_load(regs[i].reg,
> drivers/remoteproc/qcom_q6v5_mss.c:            
> regulator_set_load(regs[i].reg, 0);
> drivers/remoteproc/qcom_q6v5_mss.c:            
> regulator_set_load(regs[i].reg, 0);
> drivers/remoteproc/qcom_q6v5_wcss.c:    regulator_set_load(wcss- 
>  >cx_supply, 100000);
> 
> I think this is the type of thing we should bury in SoC resources not in 
> DT.
> 
> I can think of how we might want to change the current depending on the 
> pixel rate.. but then I think that is something we could calculate based 
> on pixel rate with descriptions as a base in
> 
> driver/media/platfrom/qcom/camss/camss.c::static const struct 
> camss_subdev_resources csiphy_res_SoCNumber[];
> 
> ---
> bod
> 

Yes, it's more common to put the current value in the code.Will be 
updated in v2.

Thanks,
Wenmeng


