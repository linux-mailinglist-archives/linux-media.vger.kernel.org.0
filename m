Return-Path: <linux-media+bounces-24387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE0A0576B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 10:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A3541886F13
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787F51F7077;
	Wed,  8 Jan 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C6UprORK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F118A6D4;
	Wed,  8 Jan 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330009; cv=none; b=ULhGWOR7uocErioTmiyqSTnre93tEBzpHqfj8yNFfCdqAa/qWTkwq197mvdljTlCBvmEdGcFNJ5IM6itsAQxXM0T3Xwy2+UiKJaNED7j9ITy+oTZBRFWT0+znKesF6qm6aWqPD6ckfEPaULNS4+l4/rbYF4oL5vLimU86EN3zOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330009; c=relaxed/simple;
	bh=15UAD0GHWN9dydjhsFdy+PrccU9Hmech/HztUrS63Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ch6Yg4651XkClylvMHXmlO0Xlx62wzuEd59lXu99cICYpM/Nz+772zRBasMLlVvTI24d5xrAMA7goOVq0VDCSVa6olnnWpArx7Qk0MFvxhpbgOax3elGYyxIBv6AYszWpllQe0p7b26vyojYTeJzID8CoRaFZhAx+BgYCElUXUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C6UprORK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089Cvaq011973;
	Wed, 8 Jan 2025 09:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0urlPGc13u3XxtnPVLz351psJrIdN+pnMbsk0my2IA=; b=C6UprORK7XKqTHUc
	2eVZ1ZgShSTQ9BEu31CW+89E+d2r2efK4EMZdNql6H64RBRTzcYS1YSGfz6QUCIi
	XOnQELSZ2/TFjKEDB7vCCbJC3CkWh15sadQP30UwPCKhv+WARyaejClvI0UVazYI
	x91QnMa7lWZldd8Ac5TNYzedtprw2KZgz8Lo2n14swoQAylxdXBheV1P29/TU0uE
	K/SkhqZUMthD/F3ilV5zsQiTH4rT+9UDvao9TosNJQ7UjY0A7KtlxNVL3aEx5huQ
	6A8T9QuBEFkaJHDDYdsGV/UvXOwBs3jLQjWBFzodtOYn8n8+X63qQECutriChrCu
	Z97E2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441phg83f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 09:53:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5089r1i3009495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 09:53:01 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 01:52:53 -0800
Message-ID: <8c1fbbb2-0970-f102-c416-93c1b8ccfc82@quicinc.com>
Date: Wed, 8 Jan 2025 15:22:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iCYbVuGC6LgLqcPDoad5JGCSgngPk_aV
X-Proofpoint-ORIG-GUID: iCYbVuGC6LgLqcPDoad5JGCSgngPk_aV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=638
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080080



On 1/6/2025 6:06 PM, Joel Stanley wrote:
> On Thu, 12 Dec 2024 at 22:23, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>> Introduce support for Qualcomm new video acceleration hardware i.e.
>> iris, used for video stream decoding.
>>
>> Iris is a multi pipe based hardware that offloads video stream decoding
>> from the application processor (AP). It supports H.264 decoding. The AP
>> communicates with hardware through a well defined protocol, called as
>> host firmware interface (HFI), which provides fine-grained and
>> asynchronous control over individual hardware features.
>>
>> This driver implements upgraded HFI gen2 to communicate with firmware.
>> It supports SM8550 which is based out of HFI gen 2. It also supports
>> SM8250 which is based out of HFI gen1.
> 
> I tested this on an x1e based machine, a Surface Laptop 7. I had some
> errors with loading the firmware which triggered some warnings when
> trying to tear down the driver. I've pasted the WARNs at the end of
> this mail.
> 
> I was using the firmware from linux-firmware, as packaged by distros:
> 
> 4d2dae9a8187b728939e9c79fa68012b  qcom/vpu/vpu30_p4.mbn
> 
Hi Joel,

I tried again with firmware (qcom/vpu/vpu30_p4.mbn) available in
linux-firmware[1] on my setup i.e SM8550 MTP and don't see any issue with
firmware load.
could you pls share from where you are taking the firmware?

[1] git clone
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

Thanks,
Dikshita
> It appears to be signed by a test key, which I assume was the cause of
> the failure. Replacing it with a properly signed version worked, and I
> was able successfully decode a test video with ffplay:
> 
> $ ffplay -codec:v h264_v4l2m2m test.mp4
> ...
> [h264_v4l2m2m @ 0xffff500054b0] Using device /dev/video0
> [h264_v4l2m2m @ 0xffff500054b0] driver 'iris_driver' on card
> 'iris_decoder' in mplane mode
> [h264_v4l2m2m @ 0xffff500054b0] requesting formats: output=H264/none
> capture=NV12/yuv420p
> 
> Cheers,
> 
> Joel
> ---
> [    2.587909] qcom-iris aa00000.video-codec: error -22 initializing
> firmware qcom/vpu/vpu30_p4.mbn
> [    2.588095] qcom-iris aa00000.video-codec: firmware download failed
> [    2.588250] ------------[ cut here ]------------
> [    2.588251] Unmap of a partial large IOPTE is not allowed
> [    2.588256] WARNING: CPU: 4 PID: 659 at
> drivers/iommu/io-pgtable-arm.c:649 __arm_lpae_unmap+0x3cc/0x468
> [    2.588335] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
>          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> [    2.588338] Tainted: [W]=WARN
> [    2.588339] Hardware name: Microsoft Corporation Microsoft Surface
> Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> 160.2.235 08/05/2024
> [    2.588340] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    2.588342] pc : __arm_lpae_unmap+0x3cc/0x468
> [    2.588344] lr : __arm_lpae_unmap+0x3cc/0x468
> [    2.588345] sp : ffff80008259b690
> [    2.588346] x29: ffff80008259b690 x28: ffff80008259bc30 x27: ffff80008259b8f8
> [    2.588349] x26: ffffb973346978d0 x25: ffff68590225e7f0 x24: ffff80008259b8f8
> [    2.588351] x23: 00000000dfc00000 x22: 0000000000001000 x21: ffff68590396ce80
> [    2.588354] x20: ffff6859068fa4f8 x19: ffff6859068fa480 x18: fffffffffffef6a8
> [    2.588356] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> [    2.588359] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> [    2.588362] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> [    2.588364] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> [    2.588367] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> [    2.588369] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff68590bc25640
> [    2.588372] Call trace:
> [    2.588373]  __arm_lpae_unmap+0x3cc/0x468 (P)
> [    2.588376]  __arm_lpae_unmap+0xf4/0x468
> [    2.588379]  __arm_lpae_unmap+0xf4/0x468
> [    2.588381]  arm_lpae_unmap_pages+0x70/0x84
> [    2.588383]  arm_smmu_unmap_pages+0x48/0x10c
> [    2.588385]  __iommu_unmap+0xf0/0x1c0
> [    2.588387]  iommu_unmap_fast+0x10/0x20
> [    2.588389]  __iommu_dma_unmap+0xb8/0x2c0
> [    2.588391]  iommu_dma_free+0x2c/0x54
> [    2.588392]  dma_free_attrs+0x9c/0xc0
> [    2.588395]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> [    2.588399]  iris_core_init+0xd8/0x138 [iris]
> [    2.588401]  iris_open+0x3c/0x318 [iris]
> [    2.588403]  v4l2_open+0xa8/0x124 [videodev]
> [    2.588406]  chrdev_open+0xb0/0x21c
> [    2.588409]  do_dentry_open+0x138/0x4c4
> [    2.588412]  vfs_open+0x2c/0xe4
> [    2.588413]  path_openat+0x6fc/0x10a0
> [    2.588415]  do_filp_open+0xa8/0x170
> [    2.588417]  do_sys_openat2+0xc8/0xfc
> [    2.588418]  __arm64_sys_openat+0x64/0xc0
> [    2.588420]  invoke_syscall+0x48/0x104
> [    2.588423]  el0_svc_common.constprop.0+0xc0/0xe0
> [    2.588426]  do_el0_svc+0x1c/0x28
> [    2.588428]  el0_svc+0x30/0xcc
> [    2.588431]  el0t_64_sync_handler+0x10c/0x138
> [    2.588433]  el0t_64_sync+0x198/0x19c
> [    2.588435] ---[ end trace 0000000000000000 ]---
> [    2.588438] ------------[ cut here ]------------
> [    2.588439] WARNING: CPU: 4 PID: 659 at
> drivers/iommu/dma-iommu.c:841 __iommu_dma_unmap+0x290/0x2c0
> [    2.588497] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
>          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> [    2.588499] Tainted: [W]=WARN
> [    2.588500] Hardware name: Microsoft Corporation Microsoft Surface
> Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> 160.2.235 08/05/2024
> [    2.588501] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    2.588502] pc : __iommu_dma_unmap+0x290/0x2c0
> [    2.588503] lr : __iommu_dma_unmap+0xb8/0x2c0
> [    2.588505] sp : ffff80008259b8f0
> [    2.588505] x29: ffff80008259b930 x28: ffff80008259bc30 x27: 0000000000020100
> [    2.588508] x26: 0000000000020100 x25: ffff68590bf76a08 x24: ffff80008259b910
> [    2.588511] x23: ffff80008259b8f8 x22: ffff6859113cd260 x21: ffff68590bf76a00
> [    2.588513] x20: 00000000dfc00000 x19: 0000000000001000 x18: fffffffffffef6a8
> [    2.588516] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> [    2.588518] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> [    2.588521] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> [    2.588523] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> [    2.588525] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> [    2.588528] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [    2.588530] Call trace:
> [    2.588531]  __iommu_dma_unmap+0x290/0x2c0 (P)
> [    2.588532]  iommu_dma_free+0x2c/0x54
> [    2.588534]  dma_free_attrs+0x9c/0xc0
> [    2.588535]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> [    2.588537]  iris_core_init+0xd8/0x138 [iris]
> [    2.588539]  iris_open+0x3c/0x318 [iris]
> [    2.588541]  v4l2_open+0xa8/0x124 [videodev]
> [    2.588543]  chrdev_open+0xb0/0x21c
> [    2.588545]  do_dentry_open+0x138/0x4c4
> [    2.588547]  vfs_open+0x2c/0xe4
> [    2.588549]  path_openat+0x6fc/0x10a0
> [    2.588550]  do_filp_open+0xa8/0x170
> [    2.588551]  do_sys_openat2+0xc8/0xfc
> [    2.588553]  __arm64_sys_openat+0x64/0xc0
> [    2.588555]  invoke_syscall+0x48/0x104
> [    2.588557]  el0_svc_common.constprop.0+0xc0/0xe0
> [    2.588560]  do_el0_svc+0x1c/0x28
> [    2.588562]  el0_svc+0x30/0xcc
> [    2.588564]  el0t_64_sync_handler+0x10c/0x138
> [    2.588566]  el0t_64_sync+0x198/0x19c
> [

