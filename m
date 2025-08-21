Return-Path: <linux-media+bounces-40548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C56B2F454
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255B15E3859
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42E82EFDA8;
	Thu, 21 Aug 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HVAe29ZC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392E29BDA0;
	Thu, 21 Aug 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769371; cv=none; b=sn0GoBWAMYVb1HX9BfxhRZwzsICS1cHdzTFX/n/IVmJ7RtnPWEvWryA42breFxR2ijKP1qJHYYsvA+otRMJw7HJOVvydFIeFlJrLepcbLwrS6wQ4DhxvpE2KDfi4Y5nnwQrMNlU1wdxDzigyUHUM9i39BjWz9YOa3fnPOLwFABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769371; c=relaxed/simple;
	bh=daHHXk6hGkf6STMZel23S0oS9VyuqpLyuFZi6TkLXIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hx8CeviS4swOehxUXcWzlH6ALgtTQQd9gmHF2QKxywtj/SuumW09kvGol1PSUAQH5I914b4B1+1kzAYTQIamHRPUyRc4pGbxWhYddlXs/Io1/iQPcJu7HEWGVw87V1TcODdbZb6S9pQDxyr2Z/KeaFuull7y2JIPBmMz9s1Cntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HVAe29ZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bJM1013297;
	Thu, 21 Aug 2025 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxuQGDuMIJKU3/yfOdhqngcZERhDk4reACtx5u6/wi0=; b=HVAe29ZCL54LUJ4h
	BCKOQUU9ZtC/9O56FVpEtI1AWr4uPiqc0ejzJgzrfF4IoAWXVc0N2qL1zKhPWbaG
	H4WJunwr/kKN4+ZNMMrXuQN100rTFN1lsORxcwDs+R+8ZoozcRyc8FyK7LlRaxfq
	T5LKDU8/B8LbOFatArLO4aTu29Yc92wkgqjBQoh8HqtJNVmLtnGN01u331yMaYKZ
	9LCcFhqnd8fMfBoTDRZZz5wHtuicWDTGC5wEqrAgZYXSuN0goCcmdZFMR+OjOiap
	+OHUZjSZfZQOxouRDiJ8sWEhX8+0bG9NpBB4ekZQKaEdGWhuJmozNzk56wukMNeR
	YTWPWA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dmvj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L9gZAL017835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:42:35 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 02:42:33 -0700
Message-ID: <6c93b790-6d84-aec5-5b4d-2584d249f74e@quicinc.com>
Date: Thu, 21 Aug 2025 15:12:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: fix module removal if firmware download
 failed
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXymIFYtlw7Wlc
 +GQWnTbstkTSkNX4hbhRR/mRJLglZ5iuqHhXjQ+l34pQxZqEAsyNYfWDquLtxCYgueZEY59w/Tj
 pAjHH3yB6Xqnq0vhGV9VcCz+qcvEktBN13kq+M4ADUAXBIbozeaF9AEbz106YooaRRsmaB0hyTg
 wVa4/RKjVQxwodJ2EKIwWfcLuQhSk084sqfE89wOSXVfDyFZSt2FXmdspgYe+xBFydIK7Zq7yQo
 j5zq2bnh51AJuuX/G7wVGyXUYZn8ric0V3fHS2hFdjcncv7wgugQ8CW7yJ+8ELguEbdPxRrNhpf
 IuNDjZlC/v5Q68OD2E2Zq5jN1tFcpg4z/hFIrj+PiO6u17JxiC3WL9Kac5qI1yy1pTUJEY6n1xY
 auVlnzlMr4N1O1rlJXl4rnPwLjXiyQ==
X-Proofpoint-ORIG-GUID: XF2zJmIe4FqVWKRRtjNIbo_1XtHV0-qI
X-Proofpoint-GUID: XF2zJmIe4FqVWKRRtjNIbo_1XtHV0-qI
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6ea0c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=MzbH1S0u4NuMHKOXcXYA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 10:36 PM, Neil Armstrong wrote:
> Fix remove if firmware failed to load:
> qcom-iris aa00000.video-codec: Direct firmware load for qcom/vpu/vpu33_p4.mbn failed with error -2
> qcom-iris aa00000.video-codec: firmware download failed
> qcom-iris aa00000.video-codec: core init failed
> 
> then:
> $ echo aa00000.video-codec > /sys/bus/platform/drivers/qcom-iris/unbind
> 
> Triggers:
> genpd genpd:1:aa00000.video-codec: Runtime PM usage count underflow!
> ------------[ cut here ]------------
> video_cc_mvs0_clk already disabled
> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#1: sh/542
> <snip>
> pc : clk_core_disable+0xa4/0xac
> lr : clk_core_disable+0xa4/0xac
> <snip>
> Call trace:
>  clk_core_disable+0xa4/0xac (P)
>  clk_disable+0x30/0x4c
>  iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>  iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>  iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>  iris_vpu_power_off+0x34/0x84 [qcom_iris]
>  iris_core_deinit+0x44/0xc8 [qcom_iris]
>  iris_remove+0x20/0x48 [qcom_iris]
>  platform_remove+0x20/0x30
>  device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> video_cc_mvs0_clk already unprepared
> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#2: sh/542
> <snip>
> pc : clk_core_unprepare+0xf0/0x110
> lr : clk_core_unprepare+0xf0/0x110
> <snip>
> Call trace:
>  clk_core_unprepare+0xf0/0x110 (P)
>  clk_unprepare+0x2c/0x44
>  iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>  iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>  iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>  iris_vpu_power_off+0x34/0x84 [qcom_iris]
>  iris_core_deinit+0x44/0xc8 [qcom_iris]
>  iris_remove+0x20/0x48 [qcom_iris]
>  platform_remove+0x20/0x30
>  device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> genpd genpd:0:aa00000.video-codec: Runtime PM usage count underflow!
> ------------[ cut here ]------------
> gcc_video_axi0_clk already disabled
> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#4: sh/542
> <snip>
> pc : clk_core_disable+0xa4/0xac
> lr : clk_core_disable+0xa4/0xac
> <snip>
> Call trace:
>  clk_core_disable+0xa4/0xac (P)
>  clk_disable+0x30/0x4c
>  iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>  iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>  iris_vpu_power_off+0x48/0x84 [qcom_iris]
>  iris_core_deinit+0x44/0xc8 [qcom_iris]
>  iris_remove+0x20/0x48 [qcom_iris]
>  platform_remove+0x20/0x30
>  device_remove+0x4c/0x80
> <snip>
> ------------[ cut here ]------------
> gcc_video_axi0_clk already unprepared
> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#4: sh/542
> <snip>
> pc : clk_core_unprepare+0xf0/0x110
> lr : clk_core_unprepare+0xf0/0x110
> <snip>
> Call trace:
>  clk_core_unprepare+0xf0/0x110 (P)
>  clk_unprepare+0x2c/0x44
>  iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>  iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>  iris_vpu_power_off+0x48/0x84 [qcom_iris]
>  iris_core_deinit+0x44/0xc8 [qcom_iris]
>  iris_remove+0x20/0x48 [qcom_iris]
>  platform_remove+0x20/0x30
>  device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> 
> Skip deinit if initialization never succeeded.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 0fa0a3b549a23877af57c9950a5892e821b9473a..8406c48d635b6eba0879396ce9f9ae2292743f09 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -15,10 +15,12 @@ void iris_core_deinit(struct iris_core *core)
>  	pm_runtime_resume_and_get(core->dev);
>  
>  	mutex_lock(&core->lock);
> -	iris_fw_unload(core);
> -	iris_vpu_power_off(core);
> -	iris_hfi_queues_deinit(core);
> -	core->state = IRIS_CORE_DEINIT;
> +	if (core->state != IRIS_CORE_DEINIT) {
> +		iris_fw_unload(core);
> +		iris_vpu_power_off(core);
> +		iris_hfi_queues_deinit(core);
> +		core->state = IRIS_CORE_DEINIT;
> +	}
>  	mutex_unlock(&core->lock);
>  
>  	pm_runtime_put_sync(core->dev);
> 

The iris_core_deinit() API should ideally not be called when core->state is
in IRIS_CORE_DEINIT. Better to handle this check in the caller itself.

> ---
> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
> change-id: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
> 
> Best regards,

