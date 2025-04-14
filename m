Return-Path: <linux-media+bounces-30144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC6A87E24
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB445189642E
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD4727CCFF;
	Mon, 14 Apr 2025 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OVcLs8kp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26627CB2E;
	Mon, 14 Apr 2025 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628099; cv=none; b=OJu7hLFOuUqHarmjY2KFGZKoEHMIaXsHpe9otCWSpwjK7ZrSeWOBw43mOC3xpmJncQmrVuiMqgM3720c4VN0mxFkTxHF7W5z3BN1qNz6SxHQqNOOLDfd1L4st3WWH1v35GKlYm3xZr9ItEhH8kCCar+/Onlkr+GSotSZHvbJUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628099; c=relaxed/simple;
	bh=PogYEh6yK0izoEyQMmmryQwDMp4cJbN4Ay3InPJFHhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IpOKKuQcVOd+13+++1cSiVthwvoPZjMhrVzBukB5SIrKkEXuQvKN8CS73JpARcOgMsiTfb7lqNG10fPqiFaesuMLzbZyU0i2q3egbDZRNifREJd+QmeImb8eY1oW8L2a2TgX26TSLQJINoyFAcuD1ZaaUUS6R3H57cJiwWZNytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OVcLs8kp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qg6001766;
	Mon, 14 Apr 2025 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZ/lDXu7qiesb1vmPom54xx1ZrNlSDlA7rR1BqQX3cM=; b=OVcLs8kp1ECQRJwH
	CwDxzAbRYuo6WHIdRt9BJueRXv3GtmMFCTylFw784LSalnRtDDB06An8ZvJMAW+a
	zx9gsv4K/NqBmCxj64UtelO5z2q2rQ/S6b8+CO06Ovgby+p+Qow3Cv1qSW+/m4BY
	MTtsY2Tt2a/On8f93u/+A8ULdPz+mmRA5YZLiFWLz/ZdTHcb50IqfXzrs23PpqXA
	qqX8NhmebhQMAE8lQfZeSmVFVCKkKuel6dBvlNaBM6k2Fr8bAkIcMFqExtL9OjZd
	g1+ZJvfTdW/Hy4X6Wl+05jfcj1NBDacbJ418ITfY/QsioK5a0gvIKcewoUSpAopo
	AGSIDQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq4g91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:54:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EAslwJ005866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:54:47 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:54:43 -0700
Message-ID: <96953447-cff5-98d4-053e-8cc31778849c@quicinc.com>
Date: Mon, 14 Apr 2025 16:24:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <2740b178-34cc-4b95-a8da-7e6862cabc92@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <2740b178-34cc-4b95-a8da-7e6862cabc92@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XCRZg9Rz-JzV0yEaT2iAi7iIkQ61qA8X
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fce978 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=fPU9YJLUV81MxjcyFtsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XCRZg9Rz-JzV0yEaT2iAi7iIkQ61qA8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140079

Hi Neil,

On 4/14/2025 1:05 PM, Neil Armstrong wrote:
> Hi Vikash, Dikshita,
> 
> On 10/04/2025 18:29, Neil Armstrong wrote:
>> Re-organize the platform support core into a gen1 catalog C file
>> declaring common platform structure and include platform headers
>> containing platform specific entries and iris_platform_data
>> structure.
>>
>> The goal is to share most of the structure while having
>> clear and separate per-SoC catalog files.
>>
>> The organization is based on the curent drm/msm dpu1 catalog
>> entries.
> 
> Any feedback on this patchset ?
Myself and Dikshita went through the approach you are bringing here, let me
update some context here:
- sm8550, sm8650, sm8775p, qcs8300 are all irisv3, while qcs8300 is the scaled
down variant i.e have 2 PIPE vs others having 4. Similarly there are other
irisv3 having 1 pipe as well.
- With above variations, firmware and instance caps would change for the variant
SOCs.
- Above these, few(less) bindings/connections specific delta would be there,
like there is reset delta in sm8550 and sm8650.

Given above, xxx_gen1.c and xxx_gen2.c can have all binding specific tables and
SOC platform data, i.e sm8650_data (for sm8650). On top of this, individual SOC
specific .c file can have any delta, from xxx_gen1/2.c) like reset table or
preset register table, etc and export these delta structs in xxx_gen1.c or
xxx_gen2.c.

Going with above approach, sm8650.c would have only one reset table for now.
Later if any delta is identified, the same can be added in it. All other common
structs, can reside in xxx_gen2.c for now.

Regards,
Vikash
> 
> Thanks,
> Neil
> 
>>
>> Add support for the IRIS accelerator for the SM8650
>> platform, which uses the iris33 hardware.
>>
>> The vpu33 requires a different reset & poweroff sequence
>> in order to properly get out of runtime suspend.
>>
>> Follow-up of [1]:
>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Reorganized into catalog, rebased sm8650 support on top
>> - Link to v4:
>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
>>
>> Changes in v4:
>> - collected tags
>> - un-split power_off in vpu3x
>> - removed useless function defines
>> - added back vpu3x disappeared rename commit
>> - Link to v3:
>> https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
>>
>> Changes in v3:
>> - Collected review tags
>> - Removed bulky reset_controller ops
>> - Removed iris_vpu_power_off_controller split
>> - Link to v2:
>> https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
>>
>> Changes in v2:
>> - Collected bindings review
>> - Reworked rest handling by adding a secondary optional table to be used by
>> controller poweroff
>> - Reworked power_off_controller to be reused and extended by vpu33 support
>> - Removed useless and unneeded vpu33 init
>> - Moved vpu33 into vpu3x files to reuse code from vpu3
>> - Moved sm8650 data table into sm8550
>> - Link to v1:
>> https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
>>
>> ---
>> Neil Armstrong (8):
>>        media: qcom: iris: move sm8250 to gen1 catalog
>>        media: qcom: iris: move sm8550 to gen2 catalog
>>        dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>>        media: platform: qcom/iris: add power_off_controller to vpu_ops
>>        media: platform: qcom/iris: introduce optional controller_rst_tbl
>>        media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>>        media: platform: qcom/iris: add support for vpu33
>>        media: platform: qcom/iris: add sm8650 support
>>
>>   .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>>   drivers/media/platform/qcom/iris/Makefile          |   6 +-
>>   .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>>   ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>>   .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>>   .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>>   drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>   15 files changed, 598 insertions(+), 300 deletions(-)
>> ---
>> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
>> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
>>
>> Best regards,
> 

