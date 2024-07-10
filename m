Return-Path: <linux-media+bounces-14833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B9A92D012
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E223B26E66
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C8218FDCA;
	Wed, 10 Jul 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l9c/6mNY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632F18FA26;
	Wed, 10 Jul 2024 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609181; cv=none; b=epG0r9ue7KQqXBq7lupWERQDpzNcz2Y8va1Z7K7hiWkMN1UPSrfGGVRW6Lvv0o4ZE00TpBWDoFXrcKpEA9w4PJZ5SOdN+LJ6nR92YAsl6S+FZww9MgIepkEvT16u4D+1tUPGGKZYodOEHovfZnVdPLoM+rrdg5vasOxvlgcZ7GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609181; c=relaxed/simple;
	bh=kg0MHbQo7mTSIs0kpGcsnsZLqG7Um6RBEDqFM46iOdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NEn17mU0x2W858tIdQWdBR0u33cq06W+P2wDPzd5C3S9ZC93lKguwlM0hQdd8VcM3+aKHiKz+rY034RpVz0kfx9Semx1CtQVvxkOpOukMdYtQ/JyQz8v4uQAno2c9Qf7Q/bvqLp1xXpNbpDRUgBk/EnSYwbxti8g/a/IsiSv1WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l9c/6mNY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A1nhb1017547;
	Wed, 10 Jul 2024 10:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvCj65ZqytZh3T8+jyBogQeubZVkc9QK22BYOoEszuM=; b=l9c/6mNYO47N186t
	gf81ik6GfhN8LOWPRceo6S4as7Dtg6SPGIfbjVwUfSOHfoq9P2VFbeDca9HLAuU6
	TXETpNSMIxeROZ6zdqwl21S5jPynzsAhV8TCODKbbvMLGmMK10hKqbW3vQMj/+5P
	d0KDMyK2gvM7c8DBkQsBHRhBLrcwBdlBpQZVz10MDxcA/N3aAUL3ZOonnNUE7qPc
	APfAe/75XQ9zHZ+Q3/31m4ASu6rTLblTHVXYBvQKR9+ulDKNaigCk4PYSAfG/pMB
	GsYHopxs3iaTXfN4otFhIYOcPzxno/72mBgOoXdYg7QQsYDx89rKNlq2DPZGR940
	eI1vpA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg41ayu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:59:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46AAxTuq012360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:59:29 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 03:59:24 -0700
Message-ID: <9acab683-dd6e-4257-8a52-fe2be8945290@quicinc.com>
Date: Wed, 10 Jul 2024 18:59:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-8-quic_depengs@quicinc.com>
 <01f6c25a-5803-4986-b754-0a3661d435b0@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <01f6c25a-5803-4986-b754-0a3661d435b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WmwbdQdPll9-PCVDnrGWS4dyCOE375yl
X-Proofpoint-GUID: WmwbdQdPll9-PCVDnrGWS4dyCOE375yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100075


On 7/10/2024 5:37 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:
>> Add bindings for qcom,sm8550-camss in order to support the camera
>> subsystem for sm8550
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
> 
> Hey Depeng,
> 
> Thank you for your submission, looks good. I have a few comments below.
> 
>> +  clock-names:
>> +    items:
>> +      - const: cam_ahb_clk
>> +      - const: cam_hf_axi
>> +      - const: cam_sf_axi
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
> 
> These "_src" clocks are almost certainly not necessary. The CAMCC should 
> have camnoc_axi_src as the parent clock of camnoc_axi, so you don't need 
> ot list the "_src" clock.
> 
> Please go through this list in your yaml, dts and .c code and remove.
> 
> There may be an exception where a _src clock is required but my 
> expectation is that all of those _src clocks can be removed.
> 
> 

Hey Bryan,

Thanks for the reviewing. I will try to move all the _src clk and verify 
again.

>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Image Front End, Global Distributed 
>> Switch Controller.
>> +      - description: IFE1 GDSC - Image Front End, Global Distributed 
>> Switch Controller.
>> +      - description: IFE2 GDSC - Image Front End, Global Distributed 
>> Switch Controller.
>> +      - description: Titan GDSC - Titan ISP Block, Global Distributed 
>> Switch Controller.
> 
> Please name these power-domains in the next iteration of the series.
> 
> The dependency on the ordering of the power-domains is a bug which new 
> SoC submissions won't be replicating.
> 
> https://lore.kernel.org/linux-arm-msm/fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org/
> 

Sure, will add this in new patch set.
power-domain-names = "ife0",
		    "ife1",
                     "ife2",
		    "top";

>> +
>> +            interconnects =
>> +                    <&gem_noc         MASTER_APPSS_PROC          0 
>> &config_noc SLAVE_CAMERA_CFG  0>,
>> +                    <&mmss_noc        MASTER_CAMNOC_HF           0 
>> &mc_virt SLAVE_EBI1           0>,
>> +                    <&mmss_noc        MASTER_CAMNOC_SF           0 
>> &mc_virt SLAVE_EBI1           0>,
>> +                    <&mmss_noc        MASTER_CAMNOC_ICP          0 
>> &mc_virt SLAVE_EBI1           0>;
> 
> This tabbing looks weird, do none of the checking tools complain about it ?
> 
> See:
> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> 

Looks like no complain about this, but will update it.

> ---
> bod

Thanks,
Depeng

