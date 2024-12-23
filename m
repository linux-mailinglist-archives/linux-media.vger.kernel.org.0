Return-Path: <linux-media+bounces-24003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5989FADF8
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 12:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD350164364
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 11:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F611A83E3;
	Mon, 23 Dec 2024 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xl9LZqwF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB29166307;
	Mon, 23 Dec 2024 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954951; cv=none; b=U1/gI45kouNAKfuULnqVr3IfoHJcSJipJ4Iy8mfRUuCRYoYGz8jRn+0mkAtq52yFjr0qq3khO+XVaBtONOjmedF10DTX/5RJVVdtXn4FresOX5DZL3pbsDBneJI40xHMtiBJEWi7mU6U5N0V+dNY76KzQ05E0+mWWjrswKxoi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954951; c=relaxed/simple;
	bh=55mt979UyPOwsZIIw3itu68NXDCE89yBr3Bm0Z+m3Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AHotIAyp0arY2mMvVahQvSeaeX0Couzg8j5y+df+ioqZ5yLcXJngh6RKAMF+cdBqf0QNFaOStypwKOH/GmChw+eC+niNEZHG/4g9IhL780txqfo19XZ2e18dh526zZe4U5vobfeSKs+HnCjk1jk6UAbAVGv8kFwnZZNTFI+ygy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xl9LZqwF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN8oUZj026565;
	Mon, 23 Dec 2024 11:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTPD8Q3U50PIWV4iKj8dhwhrAWIPxCDplmtXCS4jBOI=; b=Xl9LZqwFXO4j3WZz
	5f5chQQGm/ANWDvZIkIa13pCjAs0h6zUwEVYez0VoFfyTYbMzua058b3AXaXOV14
	YhYf0oPm3NBqezerHA7rsBnfGIhBvAZ+pH3la0uRnHUUNsPTbo09czUkfVtnJd/p
	JS7fyf1fRLPOKOpGxbEaSR/oIlK/oeD0ybXlG9J2cdsIFsqxrq8WN72aduo8afdJ
	7awXHAJO7UufOeiK+XluoVM4aXhPU7/a3KHCFvr/9obQis4UfJ9DaGPqpjiWcAAd
	n92iZjH5/iK6F+RT4ureWeW6X4OzWxhOjaT5nIQh22KV1z0nKQyNrzHIdVuf5EyA
	9/Rypg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q4q4reej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 11:55:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNBtiru003171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 11:55:44 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 03:55:38 -0800
Message-ID: <697738c6-6867-4a7f-b0a8-8b425413ae65@quicinc.com>
Date: Mon, 23 Dec 2024 19:55:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
 <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
 <ef9a65a6-339e-4428-8487-ead242b3b2d4@linaro.org>
 <add63655-626e-482c-a309-f124f3b18115@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <add63655-626e-482c-a309-f124f3b18115@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PwlGcZjqReWUOYlmHQAR4YPoi14k32bM
X-Proofpoint-ORIG-GUID: PwlGcZjqReWUOYlmHQAR4YPoi14k32bM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=963 clxscore=1015 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230107

Hi Vladimir, Bryan,

On 12/12/2024 3:57 PM, Vladimir Zapolskiy wrote:
> On 12/12/24 03:35, Bryan O'Donoghue wrote:
>> On 12/12/2024 01:06, Vladimir Zapolskiy wrote:
>>>
>>> This is a massive and a functional change
>>
>> It shouldn't be a _functional_ change at all, just a refactoring and a
>> reduction.
> 
> I've just tested that this change breaks not only TPG on SM8250/RB5, but
> a regular image capturing from imx577 camera sensor is also broken.
> 
> Hope it helps.
> 

I will remove a modification to update the enable_irq order in this 
patch which is asked by Bryan in v4 patches [1] and make sure there is 
no logical change between old code and new refactor code, in case any 
regression in this change.

>> I'll take a look too, see if I can spot a regression on rb3-gen1 and
>> replicate the breakage on rb5.
>>
> 
> Thank you, very much appreciated. Splitting the change would be still
> welcome.
> 
>> @Depeng we can probably get you remote access to an RB5 if you need it.
>>
> 

[1] 
https://lore.kernel.org/all/47aa934d-bdad-4c76-9420-ce65950f67d1@linaro.org/

Thanks,
Depeng


