Return-Path: <linux-media+bounces-17697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE196DEF6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 17:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A1C2815B6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716B219E810;
	Thu,  5 Sep 2024 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dmsIolbe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D00B77F10;
	Thu,  5 Sep 2024 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551673; cv=none; b=Z7DbzClJq+uiSIg6UTatAlzagzDZCUE8ZZVCBnrqDxRp7EY0yP03CdGwJUProE/GspGMpWvmdvky8VBm9JD1adSeNFlWegw8XA+O1wKZCQnw/XFV1ntSCk3Kn8xXbkNTeepVwMYckL4V0BzUMIwavX50cpjj+r21sB5EiwqXxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551673; c=relaxed/simple;
	bh=po6Qk86gCCG3krO/MI74td3P9X8LiHmQoxJqD1dZrnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q1cZFFAkYPTzt6SS70dwc/zTSDp5C5M8IG2Bd5A8zFTcQzl8sCGi0N2bBgbyLXAZh3hESSu2rlveJkiZJCJNZyoHh5N7B8S7K2WC5v/argXJH7olcR95FxKbuBe39LtKUv4FynY6Qp/FE/1d2ghZJsrV4atc8fjOp/I5gh4yJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dmsIolbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485979a6002643;
	Thu, 5 Sep 2024 15:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JghrPpYq9efMop04Wig4QSxBpwXkkOyJH8ZJGpnfB3k=; b=dmsIolbeqKgyKfj4
	u4d0YJrhvDerhGFxODcDW3ZRfcMexAQ5f1MC0iVMvSflI1B6nxj9XjJA2Sd8LqH1
	MUN8GBgWYQ6R095mhe38P86zq40IXJPJFVBrvq2noy1ySv3uDUormcjdNy5PlKTu
	D5NVFWjJzVr73sTzK97uWyYH3nRwRd7Chu2neiCtGyEizp/Cm7lO7FHpNDRCkKSI
	S7FL6JQP/c+5jmnPzUkgJLpg5I+YPY6ogp6AWiUPHBC/8uRntZ9BJYIcO9zMsRBb
	URdRR1w283/JEjv/jIbH1abm9hgWaax3h1Ag8Z/DvJTy0xjIHi74B/Q7jgnOqxKv
	gJHTmA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy27yg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 15:54:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485FsOkU006745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 15:54:24 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 08:54:18 -0700
Message-ID: <5108c3b5-36e4-499c-8191-a628196ae156@quicinc.com>
Date: Thu, 5 Sep 2024 23:54:16 +0800
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <d3e7e8cd-fe53-4fd8-87fe-afbbca1b218e@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <d3e7e8cd-fe53-4fd8-87fe-afbbca1b218e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HGUWb0uATNhlKGZVUPpTn7pdpM5_SgT7
X-Proofpoint-ORIG-GUID: HGUWb0uATNhlKGZVUPpTn7pdpM5_SgT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=843 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050117

Hi Vladimir,

On 9/5/2024 11:20 PM, Vladimir Zapolskiy wrote:
> Hello Depeng.
> 
> On 8/12/24 17:41, Depeng Shao wrote:
>> Add bindings for qcom,sm8550-camss in order to support the camera
>> subsystem for sm8550.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> 
> <snip>
> 
>> +
>> +            interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
> 
> Please change all interrupt types to IRQ_TYPE_EDGE_RISING, this
> will match the type set by the camss driver itself, and I believe
> a rising edge interrupt here is correct.
> 
> A similar change would be needed in the dts file change.
> 

Sure, I will try this change. Thanks for the comments.

>> +
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite0",
>> +                              "csid_lite1",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "csiphy3",
>> +                              "csiphy4",
>> +                              "csiphy5",
>> +                              "csiphy6",
>> +                              "csiphy7",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite0",
>> +                              "vfe_lite1";
> 
> -- 
> Best wishes,
> Vladimir

Thanks,
Depeng


