Return-Path: <linux-media+bounces-24861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA9A148AA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 05:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE299188CEC2
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 04:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05041F667A;
	Fri, 17 Jan 2025 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ACQ8smAi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26E8B67F;
	Fri, 17 Jan 2025 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737086483; cv=none; b=lBqHP9DPNcbe3fbsJalDnDSK+DI/XXTMMbI/qlg+xukyIscLxJCgl8dVZzdJd2ss5ii18Qe0Q69lC5cWXX0/jqKsvih8bA/tryL0rRRrEsm7vRsaXr39ufTlx6S4ENQUbMh4IrFUQ5ganmIjkIHl3ElwQx1vDz86uMiWl4mTZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737086483; c=relaxed/simple;
	bh=IaoP05f0zh0Xis0KyriM4CA8A8KSmsTi/urMLrxFSVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=og3OUgpnxN/V0pWqxwP1b2d24FY1hAv/HC4X3tLEiFrcAcTj0Ga0n4VhEdGUEwrwX2Zak8aLkZYzCzrW0QM5mEumuHGAIR2xNRZ8uYVrrnQjyNF4sKiO+xwIjR280SWMJxGlOozCklBNwq/3hY0mNUPmggMk8e4pbW6BYXvDXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ACQ8smAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H1sSiH012464;
	Fri, 17 Jan 2025 04:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEwMYzQzLGpWYNbsk106OsKba0yHpQIdRtjiuRg3qDc=; b=ACQ8smAi3fGTHS58
	7uEibGh4DC9+QfLY/tqqua0AfBabe8M9CT09ebOK4ui1l/0I7IZubwGzxVJzOKOq
	zrhPH24gODi+282Hgu26qChe4IZAxZ6RNR/znrVG2LL9ygtbIBhzQY6pBXVCbDv9
	KSO92Fax2p6B3LUMxuDpH5emB+IyWh91nm8sthP0otUGNVLWzjv3zZSpOcmibrPK
	BL0Xj0EVkEPlcRPYoFfDkJZFuTTm4AKDO7+YxffOfYy2a4jWwboGCdAEDTlMAJDd
	z9hgtIoGEVpFRGcY4e/E7F1B2TZWldsOI9kORQbo/yQ6aIy5uq4SlN8Hhk7ERSHR
	WaqNtA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447dy4g7wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:01:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H41Ej4004598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:01:14 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 20:01:11 -0800
Message-ID: <b121536b-5c56-4e5f-a5ec-d5bd844057c9@quicinc.com>
Date: Fri, 17 Jan 2025 12:01:09 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] venus: pm_helpers: Remove dead code and simplify
 power management
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
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-3-9a24d2fd724c@quicinc.com>
 <a6qhm6viuldidhtc32l7qajx24yh6wrntxi63jm4n4cvp7ktmu@sum7w5cwpbms>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <a6qhm6viuldidhtc32l7qajx24yh6wrntxi63jm4n4cvp7ktmu@sum7w5cwpbms>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4q63wQ2ULeZb5gZ2oTbbhm1-iRFJbNQq
X-Proofpoint-ORIG-GUID: 4q63wQ2ULeZb5gZ2oTbbhm1-iRFJbNQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=793 phishscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501170027


On 1/15/2025 6:01 PM, Dmitry Baryshkov wrote:
>>   
>> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>> +	dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], true);
> Check for the error here.
Sure, thanks for pointing it out. I'll update it!
>
>>   
>>   	return ret;

-- 
Best Regards,
Renjiang


