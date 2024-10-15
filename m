Return-Path: <linux-media+bounces-19643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19E99DF42
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 09:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E3F51C213EF
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 07:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD15F19F104;
	Tue, 15 Oct 2024 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQdc9DVF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE719474;
	Tue, 15 Oct 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728977211; cv=none; b=FXkYfJkdi75rFLdhdXF7RY3bAmnX1ZfyDuDHI7RxY43XvMypbNNTUaud/P0tWhWFDTyIUsbXsW4oItR1mPRgRghLlP7VtlVtWsmiPamXYD4iLxLQWvLhWxDTbL8IDi7u/zInWPo5lmZSmfkhsCqKqoSmgxFfmJajx+bm2XjKulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728977211; c=relaxed/simple;
	bh=AFwOLTJBM7YSONnnjQ8PrBR6mSkmXeYFl9Z1iatT4Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QeEWRUi3NLGuSbCZDbmeDWJAQ2i3/aRHuEKi4UJXAV4Aznfr4ZVesOd+wIAr23omM3x35gtFdKv+kLlUQyavpr7pK/w6OW4Il5Udp0kLH14fCUHLkfI0LWa69WVkqlb4NbD6JFw/+aWoALP9KHl01dC10IYfDnwrSk/ARh+otwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQdc9DVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F0l0KZ011535;
	Tue, 15 Oct 2024 07:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q526+r0Dcxm3qRY0GFP4GetrV21kKQI4ls6mq6CHL6w=; b=GQdc9DVFk8PN8GUS
	5RHr19x5Ruoc/tMxM9VValt5R8ZURrju0GflIkHimqVS6wCP+cac58UF2AThebGs
	vARlrt4QRFg6g1Lf+t1RGsnmrWLlEAPuk4YKW8qGzGr4eM08HFXwnBQalUnlYGa/
	SvYZRtPsxNFAsG1fPQ64ZS5rOW1F/7c7HE9e3X1U9FwDGUzKDS5xv/LBVDvbV49B
	LY//cyD2snH+mIl5zu19aGhAzBK//JvkBEwAfIb8u6BLsKaZK3pGhxySg3Zd7J2q
	UaggEYW54SN0UkgfXJPmJ7esldj+eOl0bHYeX83lFG7qOM+jqOhwsCcR5ZbPJpBJ
	7ugwJQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429e5g0s8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:26:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F7Qfce007232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:26:41 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 00:26:36 -0700
Message-ID: <ba4620df-7933-3730-eb9a-ffdd5cd98adb@quicinc.com>
Date: Tue, 15 Oct 2024 12:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/28] Qualcomm iris video decoder driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <e954a3b7-296f-4dbf-8325-b5993d11da92@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <e954a3b7-296f-4dbf-8325-b5993d11da92@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3FJMYedsetfFeeXfYQEGnrlFEi1Ss1a5
X-Proofpoint-ORIG-GUID: 3FJMYedsetfFeeXfYQEGnrlFEi1Ss1a5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=880 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410150049



On 10/14/2024 5:24 PM, Krzysztof Kozlowski wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> Introduce support for Qualcomm new video acceleration hardware i.e.
>> iris, used for video stream decoding.
>>
>> Iris is a multi pipe based hardware that offloads video stream decoding
>> from the application processor (AP). It supports H.264 decoding.
>> The AP communicates with hardware through a well defined protocol,
>> called as host firmware interface (HFI), which provides fine-grained
>> and asynchronous control over individual hardware features.
>>
>> This driver implements upgraded HFI gen2 to communicate with firmware.
>> It supports SM8550 which is based out of HFI gen 2. It also supports
>> SM8250 which is based out of HFI gen1.
>>
>> This driver comes with below capabilities:
>> - V4L2 complaint video driver with M2M and STREAMING capability.
>> - Supports H264 decoder.
>>
>> This driver comes with below features:
>> - Centralized resource management.
>> - Centralized management of core and instance states.
>> - Defines platform specific capabilities and features. As a results, it
>>   provides a single point of control to enable/disable a given feature
>>   depending on specific platform capabilities.
>> - Handles various video recommended sequences, like DRC, Drain, Seek,
>>   EOS.
>> - Implements asynchronous communication with hardware to achieve better
>>   experience in low latency usecases.
>> - Output and capture planes are controlled independently. Thereby
>>   providing a way to reconfigure individual plane.
>> - Native hardware support of LAST flag which is mandatory to align with
>>   port reconfiguration and DRAIN sequence as per V4L guidelines.
>>
>> Changes since v3:
> 
> You send the patches with b4, so why do you strip the link to previous
> series? It makes out life just more difficult. Include the link, how the
> b4 instructs you.
> 
Sure, Noted.

Link to v3 -
https://lore.kernel.org/linux-media/9b116753-9a21-4f9c-b86f-dded20713b53@linaro.org/

Thanks,
Dikshita

> Best regards,
> Krzysztof
> 

