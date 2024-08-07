Return-Path: <linux-media+bounces-15929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734394A857
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F0D1F237CC
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3071E7A23;
	Wed,  7 Aug 2024 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Czl9PXjl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D422155C83;
	Wed,  7 Aug 2024 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036135; cv=none; b=M6FrQh7gXhRtPgtGbzE3dVCxL4IIQZqGV2t6igS8emCdr7j81zNR/8yEEDvBmSViBOomylmDzIcPz0AroekT+91tY2Z2jpY8meFqUcHLWBHyyEyB6T6fUbxoaAtbYCkm+SWtKUgNaZbV2yX4/MeypaCZr7khch4xQL/R5y+kMOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036135; c=relaxed/simple;
	bh=lg7vIjv3U+4G+DCxTaheuhCyjfxyBQL1dS8IA/3ZP+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Frdgaks3ylkyNJ3KtOzoi2ImpQuTojQH/4HJ2kdscLNlPW3JBM7Mt/qcJ5nYKBjXUwSxuoQPMDyYJFCrVUbQrSACRAQEwhnsGTxQZs3b1AOFfk3BItBkdrbcb3HxSpIdw2YTyBkWf+up6sS23VZYdbNmxxUCwQ8b8b7IEfXQRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Czl9PXjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778EAPP015715;
	Wed, 7 Aug 2024 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ux2RjKWv5kxPB3ZMa2HlizgJane9dvfGnlsalQv7QO0=; b=Czl9PXjlIOdzMw2i
	4gDtmFpi6FxijxsuBUbpivzJrobAIGVxQ7dFy0GLXAensKkqZ+chEx0ChrRS97eg
	HRbiGxMB8+AcKU3ppx45CrPfEhXfCUux2i6bbr2oLVpwYxc9yskWW5cTrJpPLMZ+
	rrBFmfKQTPMNdI8Cds32N1flrcpD+5od9aXPBGcoWjNGZxlHPDCOcO59ITIOljUw
	Lx4eB9zDTBmRz01fVuUFGvlvaMM9iazlvjbyBqrWkfsZJka0w7IIC8qYzl7NNlSK
	F47bDFcHxvSC5Kmo6dyq9UY714EXuzzpQzY/GLDkPIrN2KaICP5PxlMuFZw4B0zv
	ulov2Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sc4yar4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 13:08:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477D8m97020818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 13:08:48 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 06:08:42 -0700
Message-ID: <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
Date: Wed, 7 Aug 2024 21:08:40 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yjw2aWuv5mqKqZUv-_gUwtkQZx64Fzsa
X-Proofpoint-GUID: yjw2aWuv5mqKqZUv-_gUwtkQZx64Fzsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_09,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=913 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070091

Hi Vladimir,

On 8/5/2024 5:26 AM, Vladimir Zapolskiy wrote:
> Hi Bryan,
> 
> On 8/1/24 11:16, Bryan O'Donoghue wrote:
>> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>>
>>> Here.
>>
>> What name would make more sense to you ?
> 
> according to the implementation the .init() call just fills some data in
> memory, so I believe this could be handled at build time, if it's done
> carefully enough...
> 

This camss-csiphy-3ph-1-0.c is reused by many platforms, the old 
platforms have same CSI_COMMON_CTR register offset, their offset are 
0x800, but some new platforms may have different CSI_COMMON_CTR register 
offset, for example, the CSI_COMMON_CTR register offset is 0x1000 in 
sm8550, then we need to add new file to support the new csiphy HW, e.g., 
camss-csiphy-3ph-2-0.c, so Bryan asked me to develop the CSIPHY driver 
based on his changes, then we just need few code to enable new CSIPHY.

Regarding the hw_ops->init interface, since it fills HW register 
configurations and HW register offset, then maybe, it also can be called 
as HW operation.

And looks like we can't move it to camss-csiphy.c since it does platform 
specific operation and it is related to the registers.

Please feel free to share other comments if you don't agree with it. Thanks.


Thanks,
Depeng

