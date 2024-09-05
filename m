Return-Path: <linux-media+bounces-17640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22596CF00
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F19A9B21CF0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17331189BA2;
	Thu,  5 Sep 2024 06:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZXykdPke"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350B14A4F5;
	Thu,  5 Sep 2024 06:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517091; cv=none; b=ufUzoYZCArCTau7LQJVjzYGb7xpS/Ivpt5EN5kvkaDDZgXRLYCjOcQV5rt/dT189SndK7x6gzSRbgOKqnMO99FxlcL1p4MBTz9gCVL/8BUxMivti9JwHVjk7ro3nU4NblpeW06Ba1ivH+oEOwd7psz+D1jfx8t6/r544DA30YEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517091; c=relaxed/simple;
	bh=4QG7wiWMjDmDBsdXd1KKTKRcrvAqlGBEaAIBNLal9W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ec/ldAxxayp8ZNfS9kQ+wPzd8xqylIv7NMZKyNwvwO6PkjkHc09Sgl58oESJ+G5TFwi+JdWKGi3VVRNpKQ+2dVN5Wsl4fRARwX+2C4ofJrhyJvGSNV0rY/d0eSwwAunfW7ZYoYMCmBmii0Vu7hT/LkgJc13V/3QhgzGq/jAminE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZXykdPke; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484GJxt0010553;
	Thu, 5 Sep 2024 06:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zu16Kr2lhKHcwDtcgaHPLiUJsG/yAp8onjv9Wr4Vsdg=; b=ZXykdPkenCpvEDOu
	rfgGBAJeKa6w6UuhYOhseOGEvuwe6oHqUWVaKgv+1/d3JF760HDE24EUdrEIKl8o
	KYjZYwDlgUEZMcsXx6M81j1ey0fF+OOvF33KxIuNAGuCnwCWQZ2UKz9emo8/au0J
	7NF1x7hfpe8j8mQWdWbKpISya7HzPpLfgT8DDZtxVzxjNG+5DiG4DcvfPtt0LdnV
	I6pKKw0wTCEX7dX5rFZbbfwT30jg1+/GRAeHKg/D6TgGEzgb/f8aXOpLBH+O/RKj
	Y7MjVozKVav7q8AyeYdKaiNj1QvvEsR4mOimNBCljIuoCIFz4RqJk55n2iBlc3BW
	7Lw5LQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhp8b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 06:18:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4856I1Q1002419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 06:18:01 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 23:17:56 -0700
Message-ID: <7c3a066b-af1b-4651-b9a0-7ec41f32dc24@quicinc.com>
Date: Thu, 5 Sep 2024 11:47:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 07/29] media: iris: implement video firmware
 load/unload
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
 <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
 <293f3ddd-531b-443f-a58c-a789337e2b35@linaro.org>
 <trgsgzvsfvlzbymjrlav6blhxojkyom2652rcxpi2xyh67eu46@27vaonzutgmc>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <trgsgzvsfvlzbymjrlav6blhxojkyom2652rcxpi2xyh67eu46@27vaonzutgmc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lcINsFS1zPWj9nwIl517kow_KGH2CkVG
X-Proofpoint-GUID: lcINsFS1zPWj9nwIl517kow_KGH2CkVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050044



On 9/2/2024 5:34 AM, Dmitry Baryshkov wrote:
> On Sat, Aug 31, 2024 at 02:18:16PM GMT, Bryan O'Donoghue wrote:
>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>
>>> Load/unload firmware in memory via mdt loader.
>>> Firmware is loaded as part of core initialization
>>> and unloaded as part of core de-initialization.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/Kconfig           |   2 +
>>>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>   drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
>>>   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 +++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_firmware.h   |  14 ++
>>>   .../platform/qcom/iris/iris_platform_common.h      |  12 ++
>>>   .../platform/qcom/iris/iris_platform_sm8250.c      |  10 ++
>>>   .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
>>>   8 files changed, 203 insertions(+)
>>>
> 
> [skipped]
> 
>>> @@ -38,4 +45,7 @@ struct iris_platform_data sm8250_data = {
>>>   	.clk_tbl = sm8250_clk_table,
>>>   	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>>   	.dma_mask = GENMASK(31, 29) - 1,
>>> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
>>
>>
>> RB5/sm8250 on this kernel
>>
>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-stable-24-08-29-iris-v3-rb5?ref_type=heads
>>
>> CONFIG_QCOM_VENUS = m
>>
>> Loads fine and I can run this simple smoke test
>>
>> ffplay -loglevel debug -codec:video h264_v4l2m2m -i sample-5s.mp4
>> gst-launch-1.0 -vvv -e filesrc location=sample-5s.mp4 ! qtdemux ! parsebin !
>> v4l2h264dec ! autovideosink
>>
>>
>> CONFIG_QCOM_IRIS = m
>>
>> [    2.130077] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>> counters available
>> [   12.282381] qcom-iris aa00000.video-codec: Adding to iommu group 13
>> [   12.463983] qcom-iris aa00000.video-codec: Direct firmware load for
>> qcom/vpu/vpu20_p4.mbn failed with error -2
>> [   12.474396] qcom-iris aa00000.video-codec: failed to request fw
>> "qcom/vpu/vpu20_p4.mbn", error -2
>> [   12.490919] qcom-iris aa00000.video-codec: firmware download failed
>> [   12.516391] qcom-iris aa00000.video-codec: core init failed
>>
>> In venus the firmware name is
>>
>> .fwname = "qcom/vpu-1.0/venus.mbn"
>>
>> What firmware reference are you testing on with your rb5/sm8250 stuff ?
>>
>> Mine is linux-firmware / Debian sid.
> 
> linux-firmware Git supports both firmware names, but I agree, the driver
> should be using the old firmware name. At least until linux-firmware
> gets released and that name actually propagates to several distros.
> 
Sure, will update the firmware name based on the status of linux-firmware
in the next patch.
>>
>> root@linaro-gnome:~# dpkg -S /lib/firmware/qcom/vpu-1.0/venus.mbn
>> firmware-qcom-soc: /lib/firmware/qcom/vpu-1.0/venus.mbn
>>
>> https://packages.debian.org/sid/firmware-qcom-soc
>>
>> Anyway I don't see much logic/justification for the firmware string change.
>>
>> ---
>> bod
> 

