Return-Path: <linux-media+bounces-36545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA26AF1422
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59093176E13
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A261F26560D;
	Wed,  2 Jul 2025 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fACBcku4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526EB26CE18;
	Wed,  2 Jul 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456305; cv=none; b=j38tVvT6N4vgQQRmOCNh/WXQjsCPg1AfzoPOcjvVGcbtlq4gCLjzy/hl/4sNSnxPGi+9YoHMczQ0qHVf6QxLBkSMVDEPpA8h0fA6d9haQIFGoB0oXmnTQOb/gwxDbxCFijI8w99W8xOBa9hpHcNyH4Xh5TsLatQ5053+vFgBBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456305; c=relaxed/simple;
	bh=8056Uj0wz0wgEnIFo1WgItTu5Ag81jUe+yTOlA3bAfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qwVsE2Z0ejGE1r22VsSO4mpfv0Uo04pS9nJQJaHcfwVUnpqdfp6/xZDdJXKKuoWxi0Gy/GgjMSUWtQ2+L8SBbENNxQiFnO6fLWMoBetWSn45qSv8p8m8VMRI5oo8gqyeOoc+g1wsZDAHS6M52zY04FNpw9OOLgRcAF8LV6hLFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fACBcku4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629iHOT021088;
	Wed, 2 Jul 2025 11:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a57o9xe8zYx2IGmqYKV1sTFeDgomWcmqi8iH3JX84gw=; b=fACBcku4teKNmZEn
	tL/ebXOnzuzme3GVFnX/EcNA25xv0XXeQjFV+RD6bTwgi/t9bd1eMLZ3h44iDA/a
	IPmP1lgGEM11ASut5stYuVqgqqZsC+etvtrJS4LfXKkT0KIgE0VNgh4uH5HL4VQU
	ZqQsN1LhEIR2lxGTiGkUkfS8P4zCqThMDgLu21wthSz7Fa5gYJWvwSyPh5AcsWrw
	+5D0w+i2oEstfI1yVk22tp0iWUNBRAEbYS8273uttlCpX9L2qeFJQtv+7/gCCSBX
	BolZ4qBcf55g/S+mp67GPI4VMnsKF17LjkYZQ8OU8hQX29F+H8UxM+7s9tyCEuCV
	dpmlhg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn34r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:38:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562BcG2B031671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 11:38:16 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 04:38:12 -0700
Message-ID: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
Date: Wed, 2 Jul 2025 17:07:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
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
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5NCBTYWx0ZWRfX1Zrov1N9vn27
 6nZ8yZvMi7mLfVwNNouH+IBqajXQdkfKhsl7WoRSonpuT4DakCiYAV2HRlKyjsABMbGLau7iBBt
 iR77jUwTl0DOUVb4BVMXT7GY6AmINvyeOEsj3kVTV09470muSkkxeOyIfFkr8OcRGu2+ndlz3Wu
 L6nscBsik7C7Dsn8yQ4HtJ7ul1yTyySTo1EAr+VBAgw+Wft6dk3Dl5ncOdxW24rgIRiX2YWKh7k
 XO7SxPfnvEex8vgGD23dWoYOMPpJRFCTL6UMjXRzvBzfe7aJ6qZ0vLfzKDA7Xa2qRSVZAim5FUw
 8HBryy/8TlSO3K/Aqa+tDr7dZZ92GqyDZhBVbyt1yPzwgNupDI0clhuloQKQiYJkpQ2rLJqo4XQ
 Zqc8gGN4IxcqtRuZCGGT7uk5jUrTvNfYI/gAD37EKUJksXNRX4xNWR353w/K4rOeTTyCPrN3
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68651a29 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=FAPGtHrcAQRzihrybRgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o__H4BpoLMtwVIiAUdCGrtdgNXd17NV8
X-Proofpoint-GUID: o__H4BpoLMtwVIiAUdCGrtdgNXd17NV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020094


On 7/2/2025 4:48 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>> This series introduces a sub node "non-pixel" within iris video node.
>> Video driver registers this sub node as a platform device and configure 
>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues 
>> and internal buffers related to bitstream processing, would be managed 
>> by this non_pixel device.
>>
>> Purpose to add this sub-node:
>> Iris device limits the IOVA to an addressable range of 4GiB, and even 
>> within that range, some of the space is used by IO registers, thereby 
>> limiting the available IOVA to even lesser. For certain video usecase, 
>> this limited range in not sufficient enough, hence it brings the need to 
>> extend the possibility of higher IOVA range.
>>
>> Video hardware is designed to emit different stream-ID for pixel and 
>> non-pixel buffers, thereby introduce a non-pixel sub node to handle 
>> non-pixel stream-ID into a separate platform device.
>> With this, both iris and non-pixel device can have IOVA range of 
>> approximately 0-4GiB individually for each device, thereby doubling the 
>> range of addressable IOVA.
>>
>> Tested on SM8550 and SA8775p hardwares.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>> Changes in v3:
>> - Add info about change in iommus binding (Thanks Krzysztof)
> 
> Nothing improved in commit msg. You are changing existing device and the
> reason for that change is not communicated at all.
> 
> There was big feedback from qualcomm saying that some commit in the past
> received review, so future commits can repeat the same stuff. If qcom
> approaches that way, sorry, no you need to come with proper commit
> description.
> 
> Please align internally how to solve it, because my response that past
> imperfect review is not justification for whatever future issues was not
> enough.
Sure, lets take this as an example and you can suggest to provide a better
commit message for this case, it would help me to compare where is the gap. I
have tried my best to capture and explain the limitations and how the changes
address those limitations. If that is not sufficient, we might have the perfect
message from you and compare to find the gaps and improve, I am sorry, but thats
how i feel at the moment.
> 
> Best regards,
> Krzysztof

