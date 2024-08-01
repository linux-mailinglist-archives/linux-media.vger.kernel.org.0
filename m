Return-Path: <linux-media+bounces-15674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B049440F1
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 04:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0C31C23DFB
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 02:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6396113D88F;
	Thu,  1 Aug 2024 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h2mhbLvh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C613D28A;
	Thu,  1 Aug 2024 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722477778; cv=none; b=mI2yvwq3xRXWM9Zpo6DMtj79VbBeWNpwbQs6FrghLZGnHcJM6uemeGDTBU9STW1l3D39YiKkYRMJSvkefQTR5ubvktEhp15wYyishGHNiCCI30UWEK4EdcxTtOCtqqiXOoTcZoG+PiwbR/pDd12LFzDdXyzEjefw9MGqS6Q0BTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722477778; c=relaxed/simple;
	bh=RM8bzkV27ZGixe4+2LS3a+K7cpVWgBklO7K1mtFPAak=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uEFJhJ7QYPJO5z5lzXIJYaLoaNFpsHSVzvQW2NTeBqE2Si8S1npERneEbhMN9obCzwVg1II5bkMrHYD1n9EpS5Uiq4sAQFK26/5RzMOvff5nlF/pf/P04dBz/KlPsjEw63voGfrOoX1hiadlEhMnqng20UGKGkKSsDyKzYE4Bek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h2mhbLvh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VNU2W5020127;
	Thu, 1 Aug 2024 02:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5iEeL2FqrpxYSDk3HSOacg6UiCc9jxGmslRVDohakg=; b=h2mhbLvhTN17rc5F
	/HApLfuvebEssFU1PvGgwP8xeeQSuNdKeW84YIaAgnKHR296fFM+vauqrsh0ax05
	KdFzTJ7UjQGMU2nyqntr1SgJp1gMDUHj6kqTbPvUSNh4LXMHm4RK1zcPB8tOxmIj
	vgws3zZ8xDSihYjzzD9bBH7dhkHzxwtIonSfzLjVFv++K+NLMG4HuiVnApqOoWUg
	S7nzOQgMhV9YOvibhsHMdTnR3LiWdLiwcI/d3ZHqs9RO4yDzs155tgzFkrMtoDmN
	fXwsEhcS9yPT/zB9hoYBXYkEhQapuHLzryeJGpq30vzZMud/jA3PwZClhuN6r7Cu
	dk51jg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qkv0t8mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 02:02:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 47122pjm013969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 02:02:51 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 19:02:45 -0700
Message-ID: <65c23a55-0014-49fc-90eb-c3e0e2a24390@quicinc.com>
Date: Thu, 1 Aug 2024 10:02:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-8-quic_depengs@quicinc.com>
 <f4cb1082-9689-4e09-89ce-bb83b7b485ba@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <f4cb1082-9689-4e09-89ce-bb83b7b485ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GMy_NBd8L8sle954YmdE6DxzhmFTg199
X-Proofpoint-GUID: GMy_NBd8L8sle954YmdE6DxzhmFTg199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_12,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010010

Hi Vladimir,

On 8/1/2024 8:05 AM, Vladimir Zapolskiy wrote:
> On 7/9/24 19:06, Depeng Shao wrote:
>> Add bindings for qcom,sm8550-camss in order to support the camera
>> subsystem for sm8550

>> +
>> +  clock-names:
>> +    items:
>> +      - const: cam_ahb_clk
>> +      - const: cam_hf_axi
>> +      - const: cam_sf_axi
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: slow_ahb_src
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: csiphy6
>> +      - const: csiphy6_timer
>> +      - const: csiphy7
>> +      - const: csiphy7_timer
>> +      - const: csid_src
>> +      - const: csid
>> +      - const: csiphy_rx
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe0_src
>> +      - const: vfe0
>> +      - const: cpas_vfe0
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe1_src
>> +      - const: vfe1
>> +      - const: cpas_vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe2_src
>> +      - const: vfe2
>> +      - const: cpas_vfe1
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_csid_src
>> +      - const: vfe_lite
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: cpas_ife_lite
>> +      - const: cpas_fast_ahb_clk
>> +      - const: fast_ahb_src
> 
> I believe most of *_src clocks should be removed from the list above as
> parent clocks with no need for own separate management.
> 

Sure, Bryan has same comment, I have removed the *_src clk locally, this 
change will be in new version patch.


>> +
>> +required:
>> +  - clock-names
>> +  - clocks
>> +  - compatible
> 
> I would suggest to put 'compatible', 'reg' and 'reg-names' properties as
> the first ones. 'clock-names' should follow 'clocks' property in the list.
> 

Thanks for the suggestion, will add it in next version patch.

>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - iommus
>> +  - power-domains
>> +  - reg
>> +  - reg-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - ports
>> +

Thanks,
Depeng

