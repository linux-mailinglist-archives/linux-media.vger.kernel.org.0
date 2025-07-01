Return-Path: <linux-media+bounces-36456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7549AEFF2C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096E717DC82
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDA827BF8E;
	Tue,  1 Jul 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QpK5NmcV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7744275AFF;
	Tue,  1 Jul 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386294; cv=none; b=R6aaUnNFttOpdH8+VV2TD4siuGZJJV167VKZSto0ZTMXfU29X/4SyJq80BFYoi/7zAjKw1As+0TNN9QYek0oG32XgeiOHIdddu+BF5AV093CWpgsho4LY4SfCCGKtbUGd3o3RLTsWq1VzDQ9UOrFrKS4NIdd5TGkVDLjIIc/klQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386294; c=relaxed/simple;
	bh=Hywc03h+hIdorAmPrJ9fmU7eLVyWgGqiBZO2Wi4piPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ajN0/wpsNKP1F93nFhpoC8bei/ZlVIWFfETRFRtNbGVKQOy1hrRZV5EpOlf/Y85VOPRei9O8hF7M/6qGifOxyhusCa/n+rQQkJ4gT3apqyqO0inv20u6e7J4vT1Fj06H60qdiAtOTTE7zDKWnIshldOWf/fVPXLbybYNpSTSKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QpK5NmcV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A1Pon029335;
	Tue, 1 Jul 2025 16:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecLfu3Ayg6Kny6LfFNotM8xkub6X/s4aA0yzi56hotM=; b=QpK5NmcVM2KLU3xF
	+oRy5mHRnSf4mS0STcRn1oYHj9mOsgp8v6naLnmmxo/VmuVPgPbKax8O3jTzOH4h
	kDfGzy6+TaC20YvskwDhNlgAqW9fTvbgVbH1lBePGsyouhUXMNV/Am2pEw/0M/Re
	cIw0gBWJHcGfLjLd8/VNZ3w6yecq4lbdqsDR7+8ARcVUMq1OiHXO/x3aEY7P8dix
	YmYRJun6loJDF93tnxDRsMpvZbC+deW4uPIzruPT7+W6+4/k4OXS2F2AQdghbLYR
	i53D4nv86BOJm1M8hUDaOi4UL4sTE9RIMAP2zTlcAfbSsEZ6YV6RkANJlR/uLb/M
	7c2ZWw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j1b6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 16:11:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561GBIOD003320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 16:11:18 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Jul 2025
 09:11:14 -0700
Message-ID: <ceeaf6ee-2ff7-5f60-2a59-9b5484f3ac5d@quicinc.com>
Date: Tue, 1 Jul 2025 21:41:11 +0530
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
 <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
 <cf53e9c1-7d38-4458-8708-a74852cd594c@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <cf53e9c1-7d38-4458-8708-a74852cd594c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwOCBTYWx0ZWRfXwLtzP3w41Dcb
 aaFu5rFjKn7DgoF31wZVLeOBDffkhxqDcQ/Q3fID5M51WdpHgWdPUMzSNzR6zst6m1+QDPhIvid
 3GnlJSbRGkjnCyJUjcUu4ucnMy1IKFFglYZ8O/7wET1KjQGjxXiP7IbbzlueQ3BURiWVPtWRWDF
 +h4p5EHzkAfYZBdJYorOi8kTZwy6+NFBmXYzDiCza6fazTWCvbfuTl22eFWUurgxshIUuSwkIyh
 liZEdVCQJkxN5rV33Jmv8CgKF7WEtHkkeWMdNIwy+11bDBMeIf2ncbKfgsD4CHO9XTcBinYycG5
 slhaVB1RuA+l69o3eBV14qMD059hleUXjhsuQ0h9zwqYkFtUZaAiooM+0Sx+wuXyp/Ml6wb7Gk1
 HLxAdY9lqbM6v3Mx4nkOl8SdmvHWI1JnU9T0A06sOox9EKf2lFGx1oyvlF8cT6Kb/ICCeH0l
X-Proofpoint-ORIG-GUID: QWjxbh5UFegZixVCLexNIAXbOkwK-nwL
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=686408a7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=w-7cus77DbmKhDpQkB0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QWjxbh5UFegZixVCLexNIAXbOkwK-nwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010108


On 7/1/2025 6:49 PM, Neil Armstrong wrote:
> Hi,
> 
> On 01/07/2025 12:23, Vikash Garodia wrote:
>>
>> On 6/30/2025 11:34 PM, neil.armstrong@linaro.org wrote:
>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>> This series introduces a sub node "non-pixel" within iris video node.
>>>> Video driver registers this sub node as a platform device and configure
>>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>>>> and internal buffers related to bitstream processing, would be managed
>>>> by this non_pixel device.
>>>>
>>>> Purpose to add this sub-node:
>>>> Iris device limits the IOVA to an addressable range of 4GiB, and even
>>>> within that range, some of the space is used by IO registers, thereby
>>>> limiting the available IOVA to even lesser. For certain video usecase,
>>>> this limited range in not sufficient enough, hence it brings the need to
>>>> extend the possibility of higher IOVA range.
>>>>
>>>> Video hardware is designed to emit different stream-ID for pixel and
>>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle
>>>> non-pixel stream-ID into a separate platform device.
>>>> With this, both iris and non-pixel device can have IOVA range of
>>>> approximately 0-4GiB individually for each device, thereby doubling the
>>>> range of addressable IOVA.
>>>>
>>>> Tested on SM8550 and SA8775p hardwares.
>>>>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>> Changes in v3:
>>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>>> - Link to v2:
>>>> https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
>>>>
>>>> Changes in v2:
>>>> - Add ref to reserve-memory schema and drop it from redefining it in
>>>> iris schema (Thanks Krzysztof)
>>>> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
>>>> - Link to v1:
>>>> https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
>>>>
>>>> ---
>>>> Vikash Garodia (5):
>>>>         media: dt-bindings: add non-pixel property in iris schema
>>>>         media: iris: register and configure non-pixel node as platform device
>>>>         media: iris: use np_dev as preferred DMA device in HFI queue management
>>>>         media: iris: select appropriate DMA device for internal buffers
>>>>         media: iris: configure DMA device for vb2 queue on OUTPUT plane
>>>>
>>>>    .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>>>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>>>>    drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>>>>    drivers/media/platform/qcom/iris/iris_probe.c      | 50
>>>> +++++++++++++++++++++-
>>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>>>    6 files changed, 119 insertions(+), 12 deletions(-)
>>>> ---
>>>> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
>>>> change-id: 20250619-video_cb-ea872d6e6627
>>>>
>>>> Best regards,
>>>
>>> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just
>>> reboots
>>> a few millisecond after probing iris, no error messages nor reboot to sahara
>>> mode.
>>>
>>> The DT changeset for reference:
>>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59
>>
>> I was able to repro this case, the issue was due to a incorrect node name in
>> driver. Fixing the name as per binding, fixes the issue for me. I have made the
>> comment in your code branch [1], which should fix it for you as well. Please
>> share your observations.
> 
> Indeed, with:
> ============><========================================
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 8da2b780395d..06657b42da49 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3264,6 +3264,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>                         iommus = <&apps_smmu 0x1947 0>;
>                         dma-coherent;
> 
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
>                         /*
>                          * IRIS firmware is signed by vendors, only
>                          * enable in boards where the proper signed firmware
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index b53a9aa5adbf..7ada62ee411e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5011,6 +5011,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> 
>                         dma-coherent;
> 
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
>                         /*
>                          * IRIS firmware is signed by vendors, only
>                          * enable in boards where the proper signed firmware
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
> b/drivers/media/platform/qcom/iris/iris_probe.c
> index 8fe87e30bd40..c57645a60bc4 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -136,7 +136,7 @@ static int iris_init_non_pixel_node(struct iris_core *core)
>         struct device_node *np_node;
>         int ret;
> 
> -       np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
> +       np_node = of_get_child_by_name(core->dev->of_node, "non-pixel");
>         if (!np_node)
>                 return 0;
> 
> ============><========================================
> 
> It boots again and I can run some decodes on 8550 and 8650.
Nice. Thank you for your efforts in trying out the patches. Would that be ok
with you if i can put the tested-by tags in next revision with the amendments ?

Regards,
Vikash
> 
> Thanks,
> Neil
> 
>>
>> Regards,
>> Vikash
>>
>> [1]
>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59#note_23930047
>>
>>>
>>> Neil
> 

