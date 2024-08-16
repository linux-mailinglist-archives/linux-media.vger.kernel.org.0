Return-Path: <linux-media+bounces-16366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592A954356
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 09:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F4F281F24
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 07:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3537B142915;
	Fri, 16 Aug 2024 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KGjlAhWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22613DBBC;
	Fri, 16 Aug 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794372; cv=none; b=tDBzsNng7xTqxjtKVXHWVM53D+ob0lnXq6ht85QH1l5Y1zJdQJLn6b9MQCyAS+zaptd4rGReZJpBAKhEuNn02ZkxpZwe2qMBO9UjvIpPOB0X9ESZlYs9CaIhXeO2wslWKiwV6gYV7PFQRkGsnZX9ffnhzKz7C947pqv5ascA5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794372; c=relaxed/simple;
	bh=961HR25fBK6+U+34IivlTuUdOrvdw5kInN6SiWfWruI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hZcVbTqyEckVddnlGB4bNQ5nN3fdxqObGO2ef57JDycB4Wns54/7XTydoW4DJvBwCl1qONt4BNv7YVsBYlJQcKwHwDVeEX2lmF8qYVZhmPkYRo7HexGyhDo92btUA+PyoHP4jMHYJd5s2qHjWI4GhY+EqH8DiTAA95FeSeQgaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KGjlAhWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FLTJSM020572;
	Fri, 16 Aug 2024 07:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7/Oc25XBlXJTMUNL+LN07bCOIRiR0fvFcEP4h10F+w=; b=KGjlAhWc5CIlvVUh
	XuTeXr9KgoR1D58k4p8kjaWpJVzqARjPcRo10p0xPnVD25xd9Z5nGUHAXbH05ws8
	9G0FZir12r/v0m6MWWdnv4WhYBKmHD242wEwMfth2VAqj7bYAFGa96XY+3wXRori
	83FLHLulp9/JguFQueuy7zeqcRBTA9wfyXJ3HzVujA5zsvO8yKfXoJRe9D39emla
	PP0u9XytCPypm9/5WvIFhESq0XUnAFmo48NbHlE7tRaT5PZyYIPcOiDNpAj+J7UQ
	HlTtuqo07b23EWmueoTrWxYPYq3FlaHrdwFKQdIGBMZwKM5WREFulTHXmhQsyI5n
	r7+HoA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4112r3v2xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 07:46:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G7k2qf019214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 07:46:02 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 00:45:54 -0700
Message-ID: <aa12fd2e-4869-4909-a04f-6bf24f76ed51@quicinc.com>
Date: Fri, 16 Aug 2024 15:45:52 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <cb905d5e-6d70-4395-894c-55b3542e2ebe@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <cb905d5e-6d70-4395-894c-55b3542e2ebe@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nz1EZt51V966XEKronGAHqNzJZJ9mJDL
X-Proofpoint-ORIG-GUID: nz1EZt51V966XEKronGAHqNzJZJ9mJDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=938 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408160055

Hi Krzysztof,

On 8/16/2024 3:01 PM, Krzysztof Kozlowski wrote:

>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - reg
>> +  - reg-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
> 
> Order is still not as expected. I already commented on this - keep the
> same order as in "properties:" block.
> 
> With the order fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Thanks for catching this, the order was correct in my local build, then 
Vladimir posted a new comment, so I updated it again and forgot to 
update the required item, I will correct the order in next version series.

Vladimir: "I would suggest to put 'compatible', 'reg' and 'reg-names' 
properties as the first ones. 'clock-names' should follow 'clocks' 
property in the list."

Thanks,
Depeng

