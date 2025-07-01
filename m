Return-Path: <linux-media+bounces-36400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0DAEF4ED
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 580733B18D2
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55BA2701B1;
	Tue,  1 Jul 2025 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6B/bv/C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485AC1F3BAE;
	Tue,  1 Jul 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365425; cv=none; b=WmP5fC9o5ZgaCKfzifFM3a8rPTPWQn993MoExrGtXQKqp/UpaWazYgzdtxvszf4Kiu3TYLf64pNjnYLYHjAX8e/14GUz6iD0B4fRM+DySDkN4LNsi7xHsowTGUX5UP20YS7z8IWNnIIOPW+kdeVKrfzmtoLEgI8BoCnYYlPSmyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365425; c=relaxed/simple;
	bh=b58GG1PUJetI3dDN4zmDO00cKecqi5fWe0Ho3y4zR3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A3fNSjAtObqu+VWY/rALsKU6MWDCCvehy/PzPZrrSiiArha70EQFDF5cgm8m4RempV7WM+E+sm+4HXcQhzn7x6YZyxU6IPDz9bG2pcOrAFi8tCIum5Ye9P9kDLO5hEMejyeXtsD24vwMzP70EexMKmro8GmhTTFotr1ZTtJHXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6B/bv/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qx5W025373;
	Tue, 1 Jul 2025 10:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhcNFYODXWYs5Uhj7FrQv094mSfyCDY5gv6KZUKL8BU=; b=L6B/bv/ClumpbnD5
	gXx4KpfNocYEwe5Q+YjUilnoCd9mZEMDyLeNDwnFOZiGMMl7FnbkWGDyfanMs+Vp
	LgEXi1/E1ZJijMQVEO9DA8M0+5Z0viFByyJ4OjpSnH4oRBzqjRC1phXcdDg5yehT
	AIH1WUK1vclIwC5TiUH3n8hkbTgLYxGQAs3LOADIJS2Tp854P2nsMPHC1KmioRPv
	3BneLtGLi533hpt067GQFfifR3lijJXafPn3USjkA2o69iFJv3cpoaKg4oLn0zZp
	kBDo4g+m60BaccXzuDLevw41m0/czGfpx1t/EOjGWCCJMs9rYlXfYg4PsfJZgHsg
	OVt3Eg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64nne1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:23:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561ANTev028916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 10:23:29 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Jul 2025
 03:23:25 -0700
Message-ID: <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
Date: Tue, 1 Jul 2025 15:53:11 +0530
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
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863b722 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=jMYyL5frt0AsD3xASfkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MiBTYWx0ZWRfXzz+E1vl4QJ8u
 No2RQs6VxCsGeqPYRbWPD/cmxt4wTmPBCWcUzAqTrGmyYbmjEQwPiEBLKIZ2FEWNc3cjE7oCBuq
 dhsDAqvsDG3arzqG5uxCKZ57gUkwIPePWUnhuu20ctq3bboEowU0CsUFjg7MRqO+I/2IlU+zFC7
 wmE69YqgM7MmJnNsXe49fNaUUxF4n4AlUwCJGntA6pOpt7yebOT1XDA1SCaW5LNFZmLr/yWTz4I
 rBOqS8LMwh1NjrUtia4/QfMCz1CnOmW9+b6mEslz5bR5xBshd6/3mo9PxVnCOCr+8MA3UM133gl
 YvASRuwWKvgq6Eqrpb5+0FrivEDcMqxpnrRLItY45483VCakSDGpXaxbhDhJfeOsyIrjuAWf6d8
 UB80mWwHhMCEYcVwYAx3lmK8oyLBnFj0aiVbEqZ8nZFgG1+UKEJq+sGfnrKUtsc4COWxkuzu
X-Proofpoint-GUID: Jep6seOWPGZDc6nkvKDAYfsKnMgF7KPS
X-Proofpoint-ORIG-GUID: Jep6seOWPGZDc6nkvKDAYfsKnMgF7KPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010062


On 6/30/2025 11:34 PM, neil.armstrong@linaro.org wrote:
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
>> - Link to v2:
>> https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
>>
>> Changes in v2:
>> - Add ref to reserve-memory schema and drop it from redefining it in
>> iris schema (Thanks Krzysztof)
>> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
>> - Link to v1:
>> https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
>>
>> ---
>> Vikash Garodia (5):
>>        media: dt-bindings: add non-pixel property in iris schema
>>        media: iris: register and configure non-pixel node as platform device
>>        media: iris: use np_dev as preferred DMA device in HFI queue management
>>        media: iris: select appropriate DMA device for internal buffers
>>        media: iris: configure DMA device for vb2 queue on OUTPUT plane
>>
>>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>>   drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>   6 files changed, 119 insertions(+), 12 deletions(-)
>> ---
>> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
>> change-id: 20250619-video_cb-ea872d6e6627
>>
>> Best regards,
> 
> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just reboots
> a few millisecond after probing iris, no error messages nor reboot to sahara mode.
> 
> The DT changeset for reference:
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59

I was able to repro this case, the issue was due to a incorrect node name in
driver. Fixing the name as per binding, fixes the issue for me. I have made the
comment in your code branch [1], which should fix it for you as well. Please
share your observations.

Regards,
Vikash

[1]
https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59#note_23930047

> 
> Neil

