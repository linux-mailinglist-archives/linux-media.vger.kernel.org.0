Return-Path: <linux-media+bounces-36123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F17AEBC65
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8B3176C00
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760582E9EA6;
	Fri, 27 Jun 2025 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nwqyTLeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883F8171C9;
	Fri, 27 Jun 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039428; cv=none; b=t7wSNlVIoX0+tELKGN5KvBcBpGZ/cI5vkH1vF1s7mI/pX+UGba9YqlWtJtIC0YfW/F6DDfzT8fYTD8dhyWDtGy4UXGyK1DJKlqC+m2f0+MNzKqRvDNoz2HPiP3blG0FJKktyH1AqN3KGmZuYrLrDvvH63BVr4BQkSyDDn+qDLUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039428; c=relaxed/simple;
	bh=zOgUx5OEaqBgHZlUvwCeBhgaMky7zPZKglHFTP2JPx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HGcCGwEdMuKXB2KNg3PifOIY5YYKyXW/4F4DBAi90Fco9IdzLeWjApRrI7OQm334zXkQfYfaOXAccHQwj/LwqyiuIY5wU3qjCH0T9P718MqWO89sUkVxtI4eDbPTHWFtm4ARfDsu1/NF59BdOyjqXSfnMqJID7aNQX0FAorWdVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nwqyTLeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC0Jvk009547;
	Fri, 27 Jun 2025 15:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPoFI44PUq8vfbWlomYLlyS0jk0gTJf6CYrD709ui74=; b=nwqyTLeZZrT+V0nU
	wlevjrrLPsddRhgNK8U8PQI6jxne/mR1ARfpFjgXQvWlrl3Ifz0LCIMvbkveLbW0
	WOmtVy4Jv2BnzbRxwHvUtJJYaC4wxTTCwCgYPT6dXeHnXYhgtzIphHikIPX+Hfjb
	+Ze56geTIeD/X3vdxdnw86/QhXcRb8/cWv4axcART+OxxhUoWOT1x4H1V+N5Qp5q
	8gLAwxaLExODvsF9byp0tNsDlRwbts0f0tE/9mSAVYfWG2Z4k1nb0U8+cX4ADF1h
	9ydF5XY8VA782Rq68+yjwH1i0TjxjjPwGZjQNRMtXztQV+nfDV/WnhUpYKlZ5Ux9
	7SIA5g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b478u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:50:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFnwH6008571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:49:58 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 08:49:55 -0700
Message-ID: <a8be1465-3a99-7ca8-7098-34c97bc1f890@quicinc.com>
Date: Fri, 27 Jun 2025 21:19:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/5] Introduce "non-pixel" sub node within iris video
 node
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfXzRgzhdS4IeaP
 JM7LSSekVwJ3YrnZ4xvcH7dca+QUuR4GwclbExXtoz6uthWJXK2gO1/CFJVehFSbakkBD9G+rNZ
 U5HPR1bWi8msISLboCZMXMHs7XONVwbMPj4Sgk5mIGUo1UDBgiNLupvqSwtCpv4LQA6CGRB0iij
 IAEsdGWJMNSpg0WVYaWsGUooWICcrycoZdt3YodOISXwblMf1mPbhEbduFD8k+LhLgybBiHnUhv
 J4Mj5wGb7ai76IV8Lv9I3UWp1972H7+JffB4RBcQuD9Hd1ZVyrc+JVLOHZomDUzEpxCl1acglFy
 30JuqXV4J1FqWlmPs13aN8fHVqfjC9ueUX6JBWIW6c5CVNMNsq8FGQk7Q4GMSF9P5PLBUeQiatr
 /M2xbN+dPy8hGzSKF92QQ7wNZIcfXoSKjKQWudH3p053JbOVGv+P6ksUcRrgN41XgaaAINmH
X-Proofpoint-ORIG-GUID: zYBoQGvx6AVZyVsuYfGqemm6R07emmWb
X-Proofpoint-GUID: zYBoQGvx6AVZyVsuYfGqemm6R07emmWb
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ebdbd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ZSu0RnUukzXJBaev4ewA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129


On 6/27/2025 9:02 PM, Vikash Garodia wrote:
> This series introduces a sub node "non-pixel" within iris video node.
> Video driver registers this sub node as a platform device and configure 
> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues 
> and internal buffers related to bitstream processing, would be managed 
> by this non_pixel device.
> 
> Purpose to add this sub-node:
> Iris device limits the IOVA to an addressable range of 4GiB, and even 
> within that range, some of the space is used by IO registers, thereby 
> limiting the available IOVA to even lesser. For certain video usecase, 
> this limited range in not sufficient enough, hence it brings the need to 
> extend the possibility of higher IOVA range.
> 
> Video hardware is designed to emit different stream-ID for pixel and 
> non-pixel buffers, thereby introduce a non-pixel sub node to handle 
> non-pixel stream-ID into a separate platform device.
> With this, both iris and non-pixel device can have IOVA range of 
> approximately 0-4GiB individually for each device, thereby doubling the 
> range of addressable IOVA.
> 
> Tested on SM8550 and SA8775p hardwares.

Please ignore V2 revision as i missed to address a comment on V1. Posted V3 now
with all comments addressed.

Apologies for the inconvenience.

Regards,
Vikash

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Changes in v2:
> - Add ref to reserve-memory schema and drop it from redefining it in 
> iris schema (Thanks Krzysztof)
> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
> 
> ---
> Vikash Garodia (5):
>       media: dt-bindings: add non-pixel property in iris schema
>       media: iris: register and configure non-pixel node as platform device
>       media: iris: use np_dev as preferred DMA device in HFI queue management
>       media: iris: select appropriate DMA device for internal buffers
>       media: iris: configure DMA device for vb2 queue on OUTPUT plane
> 
>  .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>  drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>  drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>  6 files changed, 119 insertions(+), 12 deletions(-)
> ---
> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
> change-id: 20250619-video_cb-ea872d6e6627
> 
> Best regards,

