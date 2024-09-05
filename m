Return-Path: <linux-media+bounces-17638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA996CEF0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA4D1F251B9
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A3B1898EB;
	Thu,  5 Sep 2024 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T3wBOWam"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490C15746E;
	Thu,  5 Sep 2024 06:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516783; cv=none; b=imneCkuYp/Fdd0U/ydfaY5dfFlr2+74gmKRo19a1rNbWWWb5LxMLNPo7x3a3n51gIWBbhcFZWWE+DXgNxTpIFptLEkd2cRyNZNoaol5/gVR6EDudDmw05iufnQC5MER8Sev0EiETHrypLg1NbyPc0kcHjc9POpxVNnfY5jKcoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516783; c=relaxed/simple;
	bh=sXUVpanWHfBGkj3PNEuGCNiWl6RexLVEGodvCs7dCwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kp7eAqt4/OpX0sxl8kVxbjE6Lxg9WBcAEZ1thlZfS8kFuvNBlZuqMpUDJ6lwxwqEvsuBX7ZxjOxYBt9E4SqK9BkLyY2+ibLgFK+YufM2P2vHCjC9hJt0gPdankAZLZOt3qwboUrm4zVysjqUG2CDK6H0sWSmiOFDFTvjJIifh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T3wBOWam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4855i5MK007855;
	Thu, 5 Sep 2024 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2pns0qfVcul1R6I7vG0iXVNgB7V/W4qcjyJEQ9830U=; b=T3wBOWam3gZJD3NU
	jL4Ny5aVjfU8mrOm6gIQpF4FoLAgrsFbGNNDOoJGqGg14Nqmo8tooDwBKCUcHEFI
	CFdUFitB/lwQ5tovJ2bokP+PB0IVpL/rfYA5f1o3DFR1KG9c+voFCfDjysKqOL/a
	FwzpsJLe/78BQqp0V97foVUzyHIM4Lhc/eSELZJdfZBZsMcIbPCdIr9gGMZpt6m3
	9at/1NM5MSxywqC3qBJoElngl6Zhuopc1XlpwlbulKJoGBG4Vy4+h0bsMpz9Olvf
	rSIolVfJJIHf8IeffOyhUtKRapJNW169DNYeLXCmokvxXGUEQfobqHxuBkxT8ABD
	DuJpsw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f6rng1uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 06:12:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4856CrDg029659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 06:12:53 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 23:12:49 -0700
Message-ID: <fa674301-9c4e-c4de-361a-1d1abf413ffc@quicinc.com>
Date: Thu, 5 Sep 2024 11:42:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
 <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
 <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0G1Fsyd0Byws6iQtMcqIPcMkn9uooGfd
X-Proofpoint-ORIG-GUID: 0G1Fsyd0Byws6iQtMcqIPcMkn9uooGfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0
 mlxlogscore=993 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409050043



On 8/29/2024 2:43 PM, Dmitry Baryshkov wrote:
> On Tue, Aug 27, 2024 at 03:08:03PM GMT, Bryan O'Donoghue wrote:
>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>>> +static const struct of_device_id iris_dt_match[] = {
>>> +	{ .compatible = "qcom,sm8550-iris", },
>>> +	{ .compatible = "qcom,sm8250-venus", },
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, iris_dt_match);
>>
>> The enabling patch for the compat strings should come last - if its first
>> then the time between the compat add and the last patch is a dead zone where
>> things are bound to break on a booting board.
> 
> But then it's impossible to test the driver in the interim state.
> Moreover enabling it at the end only makes it hard to follow platform
> data changes. What about adding sm8550 at this point and adding sm8250
> at the end? Or enabling qcom,sm8550-iris and the fake qcom,sm8250-iris
> now (and clearly documenting it as fake) and as the last patch change it
> to qcom,sm8250-venus.

Sure, we will add qcom,sm8250-iris at this point so that it enables the
testing of the driver, and will add one patch at the last to add
qcom,sm8250-venus.

Thanks,
Dikshita
> 

