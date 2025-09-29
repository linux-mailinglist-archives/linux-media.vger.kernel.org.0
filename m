Return-Path: <linux-media+bounces-43308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB1BA804D
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 07:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA4D189582B
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 05:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D847A284681;
	Mon, 29 Sep 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J0NkC8NT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7010F2;
	Mon, 29 Sep 2025 05:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124716; cv=none; b=g9VSfr1vYLSAJ3VkAvYZdrbZwAsj1wpx3vDDAoRVBel7pjmdpoOjCibal1abDGkJXMClHTzmoT6HaQJhpumf+hhAAbymMypqPOfjpHwufRrLCkjnNj0fXCd6PlVh+w+UhgccwvLu1CFS2RxzlmfB3RNNhu9+5EuCkKBvgoOU9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124716; c=relaxed/simple;
	bh=ViXsxutYnNcdpdIpquCXZ2yofhcp477yZJNrPjd+rkI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=n28snz2vDGn7cNyuTGLS7+J1vJj4yZaC0mHcXhPVCtUp19KLjPrvaUHXC/Ue/r1EqmH91P8Q4fFxuKHb2AWlWi5t3Qn8e1B/JQAcktk6yNIukXQRtd3uo4QLDTQIk4GFBh8gpfwz67PD9q7+RbCFWlO8JooDaU7uD4AJR568HtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J0NkC8NT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNMGVJ028756;
	Mon, 29 Sep 2025 05:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WICXgpsKjJR42YtRnfYAREEHE+H28jwHTYyvilaB6z0=; b=J0NkC8NTiMQaaRyN
	Ty+PL0X8whAPkijicoEzyGXOu51tA7WBqkZdka0IRe9TuXXUW2yGpbkjWWv2DVYd
	Al+pdOyt+n7qwiIMZAiJDPiMGmZO2IeUuqZ+jn06yiNbK/PfAF38wTLALk1Ys1JD
	EzvYSLiKHOSi1SGXZ/IsuO8ZIHIHmFm2bq8GufhujEXw2u0Kqz0w4p7SDIc3qWk3
	tfZxdcTDOIBf1nP/pbb9EJHmHdRjBBftHwLzuqHNB95ylLb14b7GWzxy4sayD9xd
	P816TxReDR9rx1Z28/1Y6kA2ewzkR3nz0qc/OjqipeIc3FRIlZOb4HJBjNKMHWV7
	bmx08w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tkynp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:45:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58T5j2C4007940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:45:02 GMT
Received: from [10.206.105.120] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 28 Sep
 2025 22:44:57 -0700
Message-ID: <96aca644-8fdc-8076-c94b-ed655ac526d2@quicinc.com>
Date: Mon, 29 Sep 2025 11:14:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal
	<dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
 <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX+H9NdMcZGD9y
 o0JWXHo3fLA6Foowm7QUbw6VRq3zlPqAw0YDo7FAxZ3X0nqe4AChUHLPdyONQVsvVAdZHphekjM
 RIDSM2vR5OvxKamtyWe1VDqUIjeOAFfUoeL4Cfy2nHNEK26ywPNruW8Up8VrVkAnov64V2YARhZ
 7aQyWfOxbuzBymaDqMWi9LNdnTJDc5BCefI6QsqDZ4SJm4LNpU2ywoFqK2M5SFo6TwHggcPEPQs
 6V1uzkmS7j5dduUFAREg/lMEtHVnJBMgx7kroyOfWeVASoprGAqYk4y5Wt5MQhxIODgAoj9PJyT
 wyZ2UyfZswMbZ//Fo/clkYPwt45TDw9JsGwCP2TUY0u/WZJPqjc+7ogkDMTljufPxtpnYRfferK
 GWmLybe+5TpgVHmACm4RlD5mjBqlrQ==
X-Proofpoint-GUID: uK3itEspNAC_0179Xv753Ux9WSq_hhjA
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da1cdf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BFT3Mo1g8h2goGSEskAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: uK3itEspNAC_0179Xv753Ux9WSq_hhjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/25/2025 2:40 PM, Konrad Dybcio wrote:
> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>> Some of vpu4 register defines are common with vpu3x. Move those into the
>> common register defines header. This is done to reuse the defines for
>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>>   .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++
> 
> This is a slippery slope. I think it's better if you explicitly say
> the header file contains the register map of VPU3 instead, as let's say
> VPU5 may add a random register in the middle (pushing some existing ones
> +0x4 down). Such changes are annoying to debug, and we've unfortunately
> been there on Adreno..
> 
> Because you're using this for a single common function that is both acting
> upon the same registers and performing the same operations on them across
> VPU35 and VPU4, it's okay to de-static-ize the function from iris_vpu3.c and
> refer to it from vpu4 ops, keeping the register map private to the former
> file which I think will end up less error-prone for the future.
> 
> Konrad

  Just to confirm
  1. You’re saying it’s better to keep the register definitions for each
  VPU generation in their own source files, instead of keeping them all
  in a shared header. Is that right?

  2. The vpu functions (power on controller, power off controller and
  etc.) which are common for vpu3x and vpu4x are moved to
  iris_vpu_common.c and de-static-ize to use for both vpu3x and vpu4x.
  (This code changes are there in [PATCH 6/8] media: iris: Move vpu35
  specific api to common to use for vpu4)

  Will this 2nd point is fine or Do I need the keep the functions also
  in the platform specific file and reuse for vpu4x by de-static-ize the
  function in iris_vpu3x.c?

  Thanks and regards,
  Vishnu Reddy

