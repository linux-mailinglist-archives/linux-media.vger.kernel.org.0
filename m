Return-Path: <linux-media+bounces-23768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A59F75CF
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 08:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97ED1882E7F
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 07:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528792163BF;
	Thu, 19 Dec 2024 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EUxjucu4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5C2163B8;
	Thu, 19 Dec 2024 07:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593894; cv=none; b=QyKMkTpI7w/b4Fnmo4Ex6PMSjmkqVH2N3SQlHVa3Xb2WWLVznpD9JZuaQWlb8OYvlfRXPN/P05RQhhf97rlNFOWSNKrMOHlCN0k9EAXrHsQzjIq8ucM/AAT11tVsinVdpWwNRobjvRfGgwslaTUxcFNgqt9iR2DXYpuQr2r4vdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593894; c=relaxed/simple;
	bh=gs0fveixY8nOEXGrLqQIGj0PCsTih0xSbVyJBYI2uHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=roIJPt3b3c4lLXFeoxrrjv1WOK4uPnYINb/gb4qXFTtEbmTTg48EuRcgjb35l3BbyYr1BE/vtgaop/V2I7Fim7/bjbo4e70IPSxdTBuy4tudcyBFfNXs7HwFFckIOnMVJ5EHbnpFo2urYGrt0U1+RVu5vzjbOfDCU16nXVKE1xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EUxjucu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ1luWJ030014;
	Thu, 19 Dec 2024 07:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ys2jKCjPfUJtrUH+pLyRixmbs6s7U+YV7WzDUqW6OE=; b=EUxjucu4LBWpsJYL
	XVuS1yV7gAllIkzNHwFOQbURMoNvQ4kT9e+OwwnSpSwC84CQpmwgA/dQpPwgoZdZ
	wTVg+nYsCqf/cu3Klthxh25ivi6lFxBbS4ifz7w6d79/1FOgS8YyFRoI4Xzlh/gn
	yWt6wEZPhlJ1T78NhPrVh/aMlribJXtrefMaTO0nhtTj0cvGF+k+rh+4gcV41El3
	Tyk0078sFLg13Nt9ISmVdj11lESsGiPb7yShQ2MYXsvLIWZM1mDvpt66sRM01k5X
	WlXa9fyr3NgFbOS/uJYqwTj17kmkKkT4FS4gT/iVGZpglDqWjcNubcZBUzldKE4x
	kE4EeQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ma4wrptb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 07:38:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ7c7v7031566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 07:38:07 GMT
Received: from [10.216.3.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 23:38:02 -0800
Message-ID: <d8cff621-3e19-da49-0a20-8df74123ac91@quicinc.com>
Date: Thu, 19 Dec 2024 13:07:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_renjiang@quicinc.com>, <quic_vnagar@quicinc.com>,
        <quic_dikshita@quicinc.com>, <konradybcio@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F9gGkQo_rp8jRWOJ5-kUJfJ95zyeK5b3
X-Proofpoint-ORIG-GUID: F9gGkQo_rp8jRWOJ5-kUJfJ95zyeK5b3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190060

Hi Bryan,

On 12/9/2024 5:22 PM, Bryan O'Donoghue wrote:
> v5:
> - Fixes venus_remove_dynamic_nodes() on probe err path - Dikshita
> - Link to v4: https://lore.kernel.org/r/20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org
> 
> v4:
> 
> - Adds some unavoidable conditional CONFIG_OF_DYNAMIC to fix media-ci testcase # Test build:OF x86_64
> - Added logic for of_changeset_revert() and of_changeset_destroy() on
>   error/remove paths - Bryan
> - Link to v3: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org
> 
> v3:
> - Adds select OF_DYNAMIC to venus/Kconfig to ensure of_changeset_*() is
>   available. Instead of ifdefing and have the fix not work without
>   OF_DYNAMIC, select OF_DYANMIC with venus - linux-media-ci
> - Link to v2: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org
> 
> v2:
> - Removes useless dev_info() leftover from debugging - Bryan
>   Link: https://lore.kernel.org/r/ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org
> - Trivial newline change @ np = of_changeset_create_node(ocs, dev->of_node, node_name); - Bryan
> - Fixes a missing goto identified by smatch - Smatch/Bryan
> - Adds Krzysztof's RB to deprecated - Krzysztof
> - Link to v1: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org
> 
> v1:
> Various venus patches have been held up due to the misuse of DT to provide
> a configuration input to venus as to which mode a given transcoder should
> be in.
> 
> Link: https://lore.kernel.org/linux-arm-msm/436145fd-d65f-44ec-b950-c434775187ca@kernel.org
> Link: https://lore.kernel.org/linux-media/ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org/
> 
> This series provides support for static configuration of venus from the resource
> structure via:
> 
> 1. Adding two strings to the resource structure.
>    One string for the decoder one for the encoder.
> 2. The string for each SoC has been matched to the existing in the
>    DT which currently specifies the mode as decoder or encoder.
> 3. New logic in the driver parses the DTB looking for the node name
>    specified for the decoder and encoder .
> 4. If the DTB contains the node name, then no new node is added as
>    we assume to be working with an "old" DTB.
> 5. If the DTB does not contain the specified decoder/encoder string
>    then a new in-memory node is added which contains a compat string
>    consistent with upstream compat strings used to currently select
>    between the decoder and encoder respectively.
> 6. In this way new venus driver entries may be added which respect
>    the requirement to move mode selection out of DTB and into driver.
> 7. Simple instances of decoder/encoder nodes in the yaml schema have been
>    marked as deprecated.
> 8. Since the proposed scheme here always defers to what the DTB says that
>    means it would be possible to remove decoder/encoder entries for the
>    deprecated schema should we choose to do so at a later date but,
>    that step is not taken in this series.
> 9. Some of the upstream encoder/decoder nodes for example sdm630/sdm660
>    also contain clock and power-domain information and have not been
>    updated with the static configuration data or had the schema amended to
>    deprecate values. Because these nodes impart hardware specific
>    information and are already upstream this series proposes to leave
>    those as-is.
> 
> However if this scheme is adopted it should allow for addition of venus for
> both qcs615[1] and sc8280xp[2].
> 
> Other SoCs such as sm8550, sm8650 and beyond are expected to be supported
> by Iris.
> 
> The sm8350 and sm8280xp in the second series would then be able to excise
> the offending compat = "video-encoder" | "video-decoder" in the schema and
> DT.
> 
> I considered making this series an all singing all dancing method to select
> between encoder and decoder for all SoCs but, the objective here is not to
> add functionality but to provide support for configuration in-driver
> consistent with current usage and to do so with a minimal code
> intervention.
> 
> So far I've tested on RB3 by removing:
> 
> video-core0 {
> 	compatible = "venus-decoder";
> };
> 
> video-core1 {
> 	compatible = "venus-encoder";
> };
> 
> This works - the code adds the nodes into memory and the video
> encoder/decoder logic in the plaform code runs.
> 
> Similarly if the nodes are left in-place then no new nodes are added by the
> code in this series and still both encoder and decoder probe.
> 
> Thus proving the code works and will provide support for new platforms
> while also leaving open the option of dropping nodes from upstream.
> 
> I've left the dropping step out for now, it can be implemented later.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
> [2] https://lore.kernel.org/linux-media/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Thank you for the changes, looks good to me. Let me come back with some
validation on few SOCs and update here.

Regards,
Vikash
> ---
> Bryan O'Donoghue (3):
>       media: venus: Add support for static video encoder/decoder declarations
>       media: venus: Populate video encoder/decoder nodename entries
>       media: dt-bindings: qcom-venus: Deprecate video-decoder and video-encoder where applicable
> 
>  .../bindings/media/qcom,msm8916-venus.yaml         |  12 +--
>  .../bindings/media/qcom,sc7180-venus.yaml          |  12 +--
>  .../bindings/media/qcom,sc7280-venus.yaml          |  12 +--
>  .../bindings/media/qcom,sdm845-venus-v2.yaml       |  12 +--
>  .../bindings/media/qcom,sm8250-venus.yaml          |  12 +--
>  drivers/media/platform/qcom/venus/Kconfig          |   1 +
>  drivers/media/platform/qcom/venus/core.c           | 104 ++++++++++++++++++++-
>  drivers/media/platform/qcom/venus/core.h           |   4 +
>  8 files changed, 118 insertions(+), 51 deletions(-)
> ---
> base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021
> 
> Best regards,

