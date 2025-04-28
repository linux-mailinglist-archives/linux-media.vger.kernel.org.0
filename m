Return-Path: <linux-media+bounces-31204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C24ABA9F05B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1AD460488
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82770266EF1;
	Mon, 28 Apr 2025 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BnbwcC8m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDE268C6C;
	Mon, 28 Apr 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842299; cv=none; b=ANpMGK/LEXyLZqNDp784FgtQoq7x9LajohU3EphmvhL2EqKsffmoNTXjzKM5rfbM3UoASUGnmzsmPqRv2IiYz34qWEEKCLfZWxiReyBNb5n2CBP/v/8VhIDYroz1Zymf3g2ZrJPQeC+RloHdC2TqaeP6cQS/XZ6UnE28aLzgG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842299; c=relaxed/simple;
	bh=Kdro8Nfkzc1zn/W0OH0Km6cpJ2OrmFc5U8Hjmq+sIlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VwwJ/9sl8mpclwj5YOLElLfZ1MYOt3BawtipanZmUvmT2pgfeHDaRfAu5MdzZ2/xR15nafAPyh1fwcnje1eGHZrDxRPN64quu1kBmyESkUeUuFZPqdLPbIo8ymnzaf+4BGUPoxUiy+QPa8Xi+XIhIsnvIQBk6c2DqrEt8Lu9Fhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BnbwcC8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S89mRk009824;
	Mon, 28 Apr 2025 12:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ee7jSkzY92GAOUo0Erqbc8naw575AjWcX8JO39e+vs8=; b=BnbwcC8mBI41Jeak
	x6BU49gldQzOcxC4/yFaUhWw8ZpRZp0P2jQ2fWAPA3O3lyTpW0zeZeZsBZ+PQC01
	1nEEkXwPnKgb24J28vcnPan7Zz93DE3mwt33D/ZD8YtSi/Ukb5yQOz5Sdey20KYj
	fev2IovAeBn8+sSPSXZbCqf26ItdAUJrKrD7wPkBpQm+3RRFGNxPPG5T5TctcBUd
	f8vhJjxgnilQJwbtlvY/Iol2ErodX3VzvxI5XxYYJNDPULQLHHimb7TPuTrZW07u
	stoinywQUC6geJNj213NuIxO7Sef65dS01hVr3GVb+2Ch0Xaq9svd+m1jtrRf3jS
	8WSWWQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jgb7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:11:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SCBWdw024155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:11:32 GMT
Received: from [10.50.5.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 05:11:24 -0700
Message-ID: <b1a48f29-c0ef-2c9b-b8e7-0d3766fd9cc2@quicinc.com>
Date: Mon, 28 Apr 2025 17:41:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/23] Add support for HEVC and VP9 codecs in decoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <dwslruo5gzaiuag7utvrtysjfkisvudnxd6qvzezkpodw4xul6@55ei2zuuiggx>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <dwslruo5gzaiuag7utvrtysjfkisvudnxd6qvzezkpodw4xul6@55ei2zuuiggx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwMSBTYWx0ZWRfX6cTYFI7/nM1v 8AC8ChK1uQPzSK3xMxS3NDEXgBIJeCwnCcGwzn7+/f8W4aSSynFOg+nnXOs24LiOBp7hgmsIF2j 8hWaPK4Hl+VoAsERNjN09ht0Kj90wWinyLA6oNccxKjVGcSdLto0J8d6KOmZdccmNsu2w5a7zCN
 rhAuWXrDjXMIVzeslxJTzbXFuTdhw199xEyDcVU2ivBikhvjmiAoiqbrlGzoc2IJNau0iNT0IUz yUWMJ53p/epo/3sS0Nx796ekFLEKcmxQ1KpUyIw8QeghoDT7UGZTNSr99z62EFBEDxGRQBnAlWP uk1mbv1zUO5M+vJvd4yGoGPZ13pJg4ud62qUOYbB5oHWpErkKsQbQNr755dW//rP+iQB8LIX2eb
 f23wqfWKwelLKaFvhy0swwYtlYu8hullFN1vSiXX+2NAQdmfB7z5XB4n916gu2Q21rP10uEN
X-Proofpoint-GUID: wp6jHqQyxocRuEbe2ysyNQkl5VHjxd5z
X-Proofpoint-ORIG-GUID: wp6jHqQyxocRuEbe2ysyNQkl5VHjxd5z
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f7075 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=U6Z9HZGeCIhQAKXtxSAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280101



On 4/28/2025 4:37 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 28, 2025 at 02:58:48PM +0530, Dikshita Agarwal wrote:
>> Hi All,
>>
>> This patch series adds initial support for the HEVC(H.265) and VP9
>> codecs in iris decoder. The objective of this work is to extend the 
>> decoder's capabilities to handle HEVC and VP9 codec streams,
>> including necessary format handling and buffer management.
>> In addition, the series also includes a set of fixes to address issues
>> identified during testing of these additional codecs.
>>
>> These patches also address the comments and feedback received from the 
>> RFC patches previously sent. I have made the necessary improvements 
>> based on the community's suggestions.
>>
>> Changes in v2:
>> - Added Changes to make sure all buffers are released in session close 
>> (bryna)
>> - Added tracking for flush responses to fix a timing issue.
>> - Added a handling to fix timing issue in reconfig
>> - Splitted patch 06/20 in two patches (Bryan)
>> - Added missing fixes tag (bryan)
>> - Updated fluster report (Nicolas)
>> - Link to v1: 
>> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
>>
>> Changes sinces RFC:
>> - Added additional fixes to address issues identified during further 
>> testing.
>> - Moved typo fix to a seperate patch [Neil]
>> - Reordered the patches for better logical flow and clarity [Neil, 
>> Dmitry]
>> - Added fixes tag wherever applicable [Neil, Dmitry]
>> - Removed the default case in the switch statement for codecs [Bryan]
>> - Replaced if-else statements with switch-case [Bryan]
>> - Added comments for mbpf [Bryan]
>> - RFC: 
>> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>
>> This patch series depends on [1] & [2]
>> [1] https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
>> [2] https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/
>>
> 
> [...]
> 
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>> Dikshita Agarwal (23):
>>       media: iris: Skip destroying internal buffer if not dequeued
>>       media: iris: Update CAPTURE format info based on OUTPUT format
>>       media: iris: Add handling for corrupt and drop frames
>>       media: iris: Avoid updating frame size to firmware during reconfig
>>       media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>       media: iris: Drop port check for session property response
>>       media: iris: Add handling for no show frames
>>       media: iris: Improve last flag handling
>>       media: iris: Skip flush on first sequence change
>>       media: iris: Prevent HFI queue writes when core is in deinit state
>>       media: iris: Remove redundant buffer count check in stream off
> 
> Please move all fixes patches to the beginning of the series. This helps
> maintainers to pick them up for the -fixes branches.
> 
Ack.

Thanks,
Dikshita
>>       media: iris: Remove deprecated property setting to firmware
>>       media: iris: Fix missing function pointer initialization
>>       media: iris: Fix NULL pointer dereference
>>       media: iris: Fix typo in depth variable
>>       media: iris: Add a comment to explain usage of MBPS
>>       media: iris: Track flush responses to prevent premature completion
>>       media: iris: Fix buffer preparation failure during resolution change
>>       media: iris: Add HEVC and VP9 formats for decoder
>>       media: iris: Add platform capabilities for HEVC and VP9 decoders
>>       media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>       media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>       media: iris: Add codec specific check for VP9 decoder drain handling
>>
>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  52 ++-
>>  drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  39 +-
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  58 ++-
>>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>  drivers/media/platform/qcom/iris/iris_instance.h   |   8 +
>>  .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>>  .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 117 +++---
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |   9 +-
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>  22 files changed, 1154 insertions(+), 210 deletions(-)
>> ---
>> base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
>> change-id: 20250428-qcom-iris-hevc-vp9-eb31f30c3390
>> prerequisite-message-id: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
>> prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
>> prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
>> prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
>> prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
>> prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
>> prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
>> prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
>> prerequisite-message-id: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
>> prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f
>> prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
>> prerequisite-patch-id: feda620f147ca14a958c92afdc85a1dc507701ac
>> prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
>> prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
>>
>> Best regards,
>> -- 
>> Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
> 

