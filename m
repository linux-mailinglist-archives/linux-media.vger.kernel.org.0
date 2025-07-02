Return-Path: <linux-media+bounces-36547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C63AF145D
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D54E4A4017
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F115E266F1D;
	Wed,  2 Jul 2025 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QGVr1kTm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B52376FD;
	Wed,  2 Jul 2025 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456732; cv=none; b=YrWVmT0nNThHa10wYUxz3baT37cFYOkpgcoJe2tH4Aeh59tgsgu0rXmL9If2fQcsZOmgadtq9y0MqbFYhO/nDupmyGMlw6vjE6ysJHcccTyY9n06mwZAD1PTW+18Am/XuwjSAKVonWr62ldRVfnPcmdIOUt475esHgxOqe5uDuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456732; c=relaxed/simple;
	bh=0qBLL4MrZIW3ZZ5sQ+/kb/T5ilhI+MlEe6LkpCOgkk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IXpQ+LrjZcAArBoYuUtD9v2vXZ8iyA8cApUr7YpFd718bDLGt8Tp7EjwgzqfqfBygOB6tPLgwH7klx9nELSThXqyvGi7A9p1Pau4orbiovVykELLFahBH8+BiujeXA3T/CqXBW+inzb4kkDyo7S3eUm6zG41fpSAMDuPFYy50WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QGVr1kTm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56260L3O018912;
	Wed, 2 Jul 2025 11:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3M4o9DaqZKGHsSG4uOuSNcc33mp1ZLZrxl2qoLnbGyw=; b=QGVr1kTmp5egDNV1
	qhxjM7PyP2KQ9vEDqwmih4ZulHQpS2nGXr+iSLKGEErGmmse2JG8Sr0787da8bv7
	qiWQAxEtwTJqqIimkhUVN7YLcre9djJpNvhKf+WX3ihjJF/ywMx13doxSXOkD4kr
	qqUoOSR0Axivd00J3poyS+JSq+WWBEGmTfd9guedx3mgoJ4NrGXUuBP4XretV9BF
	YHFz9mMhvyDbEWsgUFMe+1AGNOvEy5EvF8VoTNqVpmFtSOnWM0C4XBIJ5TPORF0+
	BFOzal+4lO1h+mW5W6b1nolXbMbqBOGMOJoEQKUY7jrK7BRLRdxeNJdcWVVkTcui
	Hd8Ftw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxmj9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:45:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562BjOia015112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 11:45:24 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 04:45:21 -0700
Message-ID: <dc6e82a1-82be-b8b8-31c3-8b85447d4e43@quicinc.com>
Date: Wed, 2 Jul 2025 17:15:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5NSBTYWx0ZWRfXygkWKhnI/AI6
 zF6t6acUuixyoLpCu/eL9OWsuj8YgS6d1nH6O3xKuRAzSz756GVFMI6YpyX/EbZDUbTkiq/UgyV
 u/yV93pR+0sGbnyJvhsHfbXDUksosgXgFdRV0yyTmEK9MdyzyRGVGFK7otHxh4DOoMnBn27haW3
 xhVerq3LpqiBojE0/pb9H8bAvWUaNY77FWU3EEXhumjyqqX+jCIqTKAjlWDV5n0NVFQkdDqOavc
 JmlmvBG9Ce49IIwBwNtA9bHoEXUCb/0/9mktqiVcTMoP1whsJxszRem5FWHrPlz2TDI3NsloMYE
 YCitrRRXYH7AzBBtaLiyHowS44nd/uG2hMZ+MWKeiw075ANa3xvF6hhD0xOLgbTG6AG7PrA5NxZ
 +I4qVOVzwA1WPykH3U4pMYlNDWkO84FLybMgbE9W699LkcZ6o8bZJVZB0CNRXgy7cUTakZGK
X-Proofpoint-GUID: -UaVJ4p0zlG3L1PvF3S-YZAS2joEnsyx
X-Proofpoint-ORIG-GUID: -UaVJ4p0zlG3L1PvF3S-YZAS2joEnsyx
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68651bd5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=h4pLCbNqtuXA62LqIm0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020095


On 7/2/2025 4:53 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>> +
>>      video-codec@aa00000 {
>>          compatible = "qcom,sm8550-iris";
>>          reg = <0x0aa00000 0xf0000>;
>> @@ -144,12 +176,16 @@ examples:
>>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>          reset-names = "bus";
>>  
>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>> -                 <&apps_smmu 0x1947 0x0000>;
>> +        iommus = <&apps_smmu 0x1947 0x0000>;
> 
> I missed, that's technically ABI break and nothing in commit msg
> explains that. You need to clearly explain the reasons and impact.
No, it is not. Interface works well with old or new approach.

> 
> Best regards,
> Krzysztof

