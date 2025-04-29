Return-Path: <linux-media+bounces-31298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467FAA0909
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D557845481
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC801E231E;
	Tue, 29 Apr 2025 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AKZDmVp7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C62BD59D;
	Tue, 29 Apr 2025 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924301; cv=none; b=cVdorjeOL4jSZ6EEG3j67fzt+t2imEJimXD8OeuX3FVIWAzZ1HOAmKXGr/GSQ/4M9iQ78uhnTMxY6wAHtJXwfQ5MCNThj2fTzUeZ9bQi2L2GwZ30Q1ZP0f7L2zC0HWKfUuI4mIgolTevO51UmgBRnnQqKP2RVtbJeAric14D5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924301; c=relaxed/simple;
	bh=7yqJb04/du8szosVpYU+M0nMBFv0R1rnOJ67ux1vJns=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VIgaOV3uB2mUga39dZs16o+IDBNF1ssmqWwXrzzCFwWJy3JG2i8Go9UDhdH55+10FMBCfLoSfzeA//n24IjiOnNmZKGatqdO7UK8QWH2YZYdM+Va2mVIPHX2GfZxXHvYJgn3zR6OMXBq3g3Fju18vcTfax0z0REkzuzo9jDtEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AKZDmVp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA4ter012691;
	Tue, 29 Apr 2025 10:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jC6F1Z4b6kdxNWjS7UuoEd+SQubhF9nB4iMARJJSX4=; b=AKZDmVp7fI/umvl9
	J7PWkKiGZW/IPcVI/Nci0mvsZ6QrNcU9pZ472S2w6rkcrDbDD1pdCr3WGWjPSPOu
	itn8V8TYtsPBDtGbZtQWEVcTrsA2FUBNQz3Z/jq6czrf65jNkHvtWYPZ7eUcciUj
	1v1l8dmLRlFMTdx9Yfoe3ou349Yuyiw9lP46Fu5yM5YIFyE/B6XxpEWsOimm1G63
	8351lt3bQY8hq0aVxsZq6KZ4LFBMURirrppIyuhFPIGA4VF4cLE4wuq+7akuiipJ
	m0qN03QyTAcFsDn/88SnDHp9aMurcwwd8Bv1AhG4icu5Kd4yEeK/VkXXzqVaQ4Tk
	oLch0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9cab1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:58:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAwCtT032229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:58:13 GMT
Received: from [10.50.5.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:58:04 -0700
Message-ID: <2c431232-e0d6-1e6c-cd22-a912b5f08f7a@quicinc.com>
Date: Tue, 29 Apr 2025 16:28:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
 <a056266e-612d-4abf-916f-3db49b00dbde@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <a056266e-612d-4abf-916f-3db49b00dbde@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810b0c6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=t8wUSylDH0XA4G90k0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LGhnwJroeOAOuawBJfSqEC2j_DCAMqFf
X-Proofpoint-GUID: LGhnwJroeOAOuawBJfSqEC2j_DCAMqFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfXxG60tWbI/WqM j3jmEmFMfTHugufKqfLbKGs9H46Zh0R0vyvvX/dmf63RDETMi+paKUu6fJpieUsWvHjauhR/moO rpLByUSfKrDH+FEcO2JGns8syhOEQfLtqOs2lRLQUCsq+/NlOZ5b4WUYi5Mfxn2p6o/hLflH19W
 pFRUYksBhtLTaXV2E2PRvc8L54MthP38qttX981M7GvkousOUufWRrRfRUBJ1aCyCsdFZxf0i02 OdYvvbIn3n4acsXj0bjVtPGhw9YbZeHsA0buPBz4udheyLVwjuJ0K7xa9llEozf958XWo393bsj cyYLh7sk4c6puCebr/HxXg3KJyzCzJB9MTmjcRIO1NCZhsix8VItQ8ZI+mn0OQnhqAk5g1/s9kU
 BSYKh8ArnCVC8aQ4L86PuCRqJJt0ovvLooBoq1Fz3mGlB3TdXfYy4Krban7dBTWReVLwi5wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=936 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081



On 4/29/2025 3:13 PM, Bryan O'Donoghue wrote:
> On 28/04/2025 10:28, Dikshita Agarwal wrote:
>> +            /*
>> +             * during stream on, skip destroying internal(DPB) buffer
>> +             * if firmware did not return it.
>> +             * during close, destroy all buffers irrespectively.
>> +             */
>> +            if (!force && buf->attr & BUF_ATTR_QUEUED)
>> +                continue;
>> +
> 
> What's the effect of the firmware not having dequeued the buffer though ?
> 
> My main concern here is APSS and firmware have a different view of DMA memory.
> 
> We release on the APSS side but firmware has not.
> 
> Surely failure to release buffers by the time we get to Linux::close() is a
> failure of the software contract sufficient to require resetting the
> firmware ?
> 
> i.e. we release memory on the APSS side but firmware writes into it anyway ...
> 
As I mentioned earlier as well, during STOP issued before close, firmware
is expected to release all these internal buffers and the check I added now
in this patch will also ensures that.
Firmware also has a check to make sure all buffers queued are released as
part of STOP and then only firmware sends the STOP_DONE response to driver.
STOP is a synchronous call and driver doesn't proceed without receiving the
response for the same from firmware.
So we will never run into this issue where driver release buffers which are
still being accessed by firmware.
Please note, these are internal buffers which are allocated and managed by
driver only.

Thanks,
Dikshita
> ?
> 
> ---
> bod

