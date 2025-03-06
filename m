Return-Path: <linux-media+bounces-27707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C21A54AC8
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD29A16C62D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A36220B80A;
	Thu,  6 Mar 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pb+3C9Nd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AA1FC0E5;
	Thu,  6 Mar 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264475; cv=none; b=Q9imjkj36MH3mXX/O+uNZHRx3YmPJJkEr6dNQHrkMWzyB2SgIumK5avRP02DssAcJswb0um9Q4/RA2VK2GV4MBzac+GbzLWcO3mg+6PFdOliqPhE2Ul/csXVN2CrSDkP+htvpISGDUnHzc/cMKAkuz/AXI7E5RD3w+y9qzYJ3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264475; c=relaxed/simple;
	bh=65hdsP0lwELLMQE1D/Mi/b7L044+bM80dXXbMcA8cPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qxmRUSp8beL8wzYvsZss2DbYUYT6PDQY4yMl6H5qyONmcepEda0UwTsSh+am++5SqEEqeqQcHEBamlKrTyyfhu+xjQq0clQFhFZKpGl4N0myGVbWwLKg7EcANqOTAAZGTjNuKBbKXl9ncZd3I4b18nJOGI6jWkWlsnQcN7Y3mdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pb+3C9Nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5268gFYA020886;
	Thu, 6 Mar 2025 12:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36bXT+WM5K9bw4Zb40hn1wj4HKhtjhNBCzHSZ6DFiyw=; b=Pb+3C9NdQ/KizQVs
	MTZyGm+7n5bB6glwy/EGUqzsaYj3jmsGbjvaAws9t3seJGq3Tf/l3sGckPSrbn8m
	uH0xcHOOpHBpNZLXnY5W+PN3RwsuLSJXPZq0IsVE13/j98jrAFhMQQFKEU7hxeLd
	PD8c4xNLD3aOpomtwlC0N6m+L0Vv597YwG0eJ03f8RxohRnW5zQDyO17no22sQ9B
	k4h5tE7HfiAokNhTV2cIOVTZqJU1mqFs9hamxEZVSv/YsxF6J6Jo+1fFaJTzSFvm
	6PXMlJs2XVgNFOXWRTD3mP+C+3nJtOkGP/wNkkWPMjxlm48tm4+WK99ijkTYgLR7
	x9OZ7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuj82s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:34:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526CYSnQ010317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:34:28 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:34:25 -0800
Message-ID: <31cfacfc-fd69-d488-e2f7-7399bd5a680a@quicinc.com>
Date: Thu, 6 Mar 2025 18:04:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 00/12] Add support for HEVC and VP9 codecs in decoder
Content-Language: en-US
To: <neil.armstrong@linaro.org>, <quic_vgarodia@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <mchehab@kernel.org>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <6d88effc-2aed-4f92-89a7-17d48f43ccd3@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <6d88effc-2aed-4f92-89a7-17d48f43ccd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lQkEYeVp8Fd49uyUhCKtBKVFHdnmPP9n
X-Proofpoint-GUID: lQkEYeVp8Fd49uyUhCKtBKVFHdnmPP9n
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c99655 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=9FZtKMY-L_oLx9VXxCsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060095



On 3/5/2025 7:52 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 05/03/2025 11:43, Dikshita Agarwal wrote:
>> Hi all,
>>
>> This patch series adds initial support for the HEVC(H.265) and VP9
>> codecs in iris decoder. The objective of this work is to extend the
>> decoder's capabilities to handle HEVC and VP9 codec streams,
>> including necessary format handling and buffer management.
>> In addition, the series also includes a set of fixes to address issues
>> identified during testing of these additional codecs.
>>
>> I'm sharing this series as an RFC because compliance and conformance
>> testing are still in progress.
>> While initial functional tests show positive results, I would
>> appreciate early feedback on the design, implementation, and fixes
>> before moving to a formal submission.
>>
>> I plan to submit a formal patch series after completing all compliance
>> checks. Meanwhile, any feedback or suggestion to improve this work are
>> very welcome.
>>
>> Thanks,
>> Dikshita
>>
>> Dikshita Agarwal (12):
>>    media: iris: Add HEVC and VP9 formats for decoder
>>    media: iris: Add platform capabilities for HEVC and VP9 decoders
>>    media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>    media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>    media: iris: Skip destroying internal buffer if not dequeued
>>    media: iris: Update CAPTURE format info based on OUTPUT format
>>    media: iris: Add handling for corrupt and drop frames
>>    media: iris: Avoid updating frame size to firmware during reconfig
>>    media: iris: Avoid sending LAST flag multiple times
>>    media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>    media: iris: Fix handling of eos buffer during drain
>>    media: iris: Add handling for no show frames
> 
> I should be better to move patches 1, 2 & 3 at the end, after the patches
> adding support for specific hecv & h265 features, and please check that
> none of the patches breaks h264 at any time to keep bisectability.
> 
Noted.

Thanks,
Dikshita
> Neil
> 
> Neil
> 
>>
>>   .../media/platform/qcom/iris/iris_buffer.c    |  22 +-
>>   drivers/media/platform/qcom/iris/iris_ctrls.c |  28 +-
>>   .../platform/qcom/iris/iris_hfi_common.h      |   1 +
>>   .../qcom/iris/iris_hfi_gen1_command.c         |  38 +-
>>   .../qcom/iris/iris_hfi_gen1_defines.h         |   4 +
>>   .../qcom/iris/iris_hfi_gen1_response.c        |  11 +
>>   .../qcom/iris/iris_hfi_gen2_command.c         | 129 +++++-
>>   .../qcom/iris/iris_hfi_gen2_defines.h         |   5 +
>>   .../qcom/iris/iris_hfi_gen2_response.c        |  56 ++-
>>   .../media/platform/qcom/iris/iris_instance.h  |   6 +
>>   .../platform/qcom/iris/iris_platform_common.h |  25 +-
>>   .../platform/qcom/iris/iris_platform_sm8250.c |   4 +-
>>   .../platform/qcom/iris/iris_platform_sm8550.c | 141 ++++++-
>>   drivers/media/platform/qcom/iris/iris_vb2.c   |   3 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c  |  80 +++-
>>   drivers/media/platform/qcom/iris/iris_vdec.h  |  11 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c  |   3 -
>>   .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
>>   .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
>>   19 files changed, 931 insertions(+), 79 deletions(-)
>>
> 

