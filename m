Return-Path: <linux-media+bounces-23692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E754B9F63AE
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33FC616FB36
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0726319DF81;
	Wed, 18 Dec 2024 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WgynPDKt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781119E960;
	Wed, 18 Dec 2024 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518714; cv=none; b=Fa8uQgAZ5r9scEekC6S/tk4sat4LKvXUTmOdIxj8ztfkovd8grBEwKx90HoBqTwVk0NIDxn/UQLsS/vYpfp9uIi5LND9GMe9c6R4xc8/0l5T+2MTqb3TF27MOE0C09x1Z9whJY0sG6XmJsR9SmskZxtTBAEUAw5Q5u6B7mQviwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518714; c=relaxed/simple;
	bh=TRF4ZS/p+yAqI42KdwnobxqTC39RIEu4yLefuz7Uydw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UrYPOzvGKbtUwixemOnx1z13EcuU36xdxJ09AySH3zUXOlfUdZpH5vt9YDlPQGriNx1wN7MA5rjdwnMNXIUDADgTQEsroQD3cTNpQKIQKzrg8E35m3rmsHHWPq5lWAnI0PA9q/3h1TyGH361XVsnAaSFs/sGmMgtqmB5Q2+FZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WgynPDKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI78qrM007594;
	Wed, 18 Dec 2024 10:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wX0WMkQ9aXPiU65br9K9x0TeGgdEcggk6IpLsilb8aU=; b=WgynPDKtOU14DGBz
	UpartTsjZkKqA2cSUAAO9QrnD+aXodpVhE5SgeZn8c0/zb0JsuUDXFII+Bbq/mDG
	IBaLO7oN2pCIISsaBtkrGNL+BQCk1Xi3kvvTSJVXr8dSwcQIDuOTIAlzGyCsmbar
	XJ9na4uiMyQu1tByS830rV1OD3deqFO5phT1ZnsbXaHu7dH1bICwoZVNolcybLWS
	a8yKSpuR8GVy5GWC7/aBH9Fjt5hNWgB2PiLeAtvb1UyLVLpHkRGI4Iwxu7kasjp9
	hWAKJGLfDgH/aUoXW8xmNre/gB5IjPWl1Yb7zUyUTcyTCCBi+Wt5pDrraHmZPNLh
	qmdakw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ksra0h8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:45:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAj6IP028920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:45:06 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 02:45:02 -0800
Message-ID: <7c3c5d45-4748-4d0f-89fb-b3c01d16211c@quicinc.com>
Date: Wed, 18 Dec 2024 18:44:59 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_vnagar@quicinc.com>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-1-ef7e5f85f302@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-1-ef7e5f85f302@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BinOQiv6IeQwzICSMM-MIW1PmlztyY-2
X-Proofpoint-ORIG-GUID: BinOQiv6IeQwzICSMM-MIW1PmlztyY-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180085


On 12/9/2024 7:52 PM, Bryan O'Donoghue wrote:
> Add resource structure data and probe() logic to support static
> declarations of encoder and decoder.
>
> Right now we rely on video encoder/decoder selection happening in the dtb
> but, this goes against the remit of device tree which is supposed to
> describe hardware, not select functional logic in Linux drivers.
>
> Provide two strings in the venus resource structure enc_nodename and
> dec_nodename.
>
> When set the venus driver will create an OF entry in-memory consistent
> with:
>
> dec_nodename {
>      compat = "video-decoder";
> };
>
> and/or
>
> enc_nodename {
>      compat = "video-encoder";
> };
>
> This will allow us to reuse the existing driver scheme of relying on compat
> names maintaining compatibility with old dtb files.
>
> dec_nodename can be "video-decoder" or "video0"
> enc_nodename can be "video-encoder" or "video1"
>
> This change relies on of_changeset() API as a result select OF_DYNAMIC will
> be added to venus/Kconfig
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/Kconfig |  1 +
>   drivers/media/platform/qcom/venus/core.c  | 94 ++++++++++++++++++++++++++++++-
>   drivers/media/platform/qcom/venus/core.h  |  4 ++
>   3 files changed, 98 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index bfd50e8f34219db8a1de7960d7ea93b20db2982a..bc2e410b29cb415a36540a4f98709eae44f4ec35 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
>   	depends on V4L_MEM2MEM_DRIVERS
>   	depends on VIDEO_DEV && QCOM_SMEM
>   	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	select OF_DYNAMIC if ARCH_QCOM
>   	select QCOM_MDT_LOADER if ARCH_QCOM
>   	select QCOM_SCM
>   	select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4e26b18790537885a77d66c1917a4e7a146eaf57..88dfa9f240dc6d18a7f58dc06b1bf10274b7121e 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -286,6 +286,89 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
>   	return ret;
>   }
>   
> +#if defined(CONFIG_OF_DYNAMIC)
> +static int venus_add_video_core(struct venus_core *core, const char *node_name,
> +				const char *compat)
> +{
> +	struct of_changeset *ocs = core->ocs;
> +	struct device *dev = core->dev;
> +	struct device_node *np, *enp;
> +	int ret;
> +
> +	if (!node_name)
> +		return 0;
> +
> +	enp = of_find_node_by_name(dev->of_node, node_name);
> +	if (enp) {
> +		of_node_put(enp);
> +		return 0;
> +	}
> +
> +	np = of_changeset_create_node(ocs, dev->of_node, node_name);
> +	if (!np) {
> +		dev_err(dev, "Unable to create new node\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_changeset_add_prop_string(ocs, np, "compatible", compat);
> +	if (ret)
> +		dev_err(dev, "unable to add %s\n", compat);
> +
> +	of_node_put(np);
> +
> +	return ret;
> +}
> +
> +static int venus_add_dynamic_nodes(struct venus_core *core)
> +{
> +	struct device *dev = core->dev;
> +	int ret;
> +
> +	core->ocs = kmalloc(sizeof(*core->ocs), GFP_KERNEL);
> +	if (!core->ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(core->ocs);
> +
> +	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
> +	if (ret)
> +		goto err;
> +
> +	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
> +	if (ret)
> +		goto err;
> +
> +	ret = of_changeset_apply(core->ocs);
> +	if (ret) {
> +		dev_err(dev, "applying changeset fail ret %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	of_changeset_destroy(core->ocs);
> +	kfree(core->ocs);
> +	core->ocs = NULL;
> +	return ret;
> +}
> +
> +static void venus_remove_dynamic_nodes(struct venus_core *core)
> +{
> +	if (core->ocs) {
> +		of_changeset_revert(core->ocs);
> +		of_changeset_destroy(core->ocs);
> +		kfree(core->ocs);
> +	}
> +}
> +#else
> +static int venus_add_dynamic_nodes(struct venus_core *core)
> +{
> +	return 0;
> +}
> +
> +static void venus_remove_dynamic_nodes(struct venus_core *core) {}
> +#endif
> +
>   static int venus_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -365,9 +448,14 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_runtime_disable;
>   
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		if (venus_add_dynamic_nodes(core))
> +			goto err_runtime_disable;
> +	}
> +
>   	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>   	if (ret)
> -		goto err_runtime_disable;
> +		goto err_remove_dynamic_nodes;
>   
>   	ret = venus_firmware_init(core);
>   	if (ret)
> @@ -411,6 +499,8 @@ static int venus_probe(struct platform_device *pdev)
>   	venus_firmware_deinit(core);
>   err_of_depopulate:
>   	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_disable(dev);
> @@ -443,6 +533,8 @@ static void venus_remove(struct platform_device *pdev)
>   
>   	venus_firmware_deinit(core);
>   
> +	venus_remove_dynamic_nodes(core);
> +
>   	pm_runtime_put_sync(dev);
>   	pm_runtime_disable(dev);
>   
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 27784fd7082c321222b23ca4b2902a04c49e19ca..306231b4f7d0201175974b4a42574f30d23e08f0 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -90,6 +90,8 @@ struct venus_resources {
>   	u32 cp_nonpixel_start;
>   	u32 cp_nonpixel_size;
>   	const char *fwname;
> +	const char *enc_nodename;
> +	const char *dec_nodename;
>   };
>   
>   enum venus_fmt {
> @@ -171,6 +173,7 @@ struct venus_format {
>    * @root:	debugfs root directory
>    * @venus_ver:	the venus firmware version
>    * @dump_core:	a flag indicating that a core dump is required
> + * @ocs:	OF changeset pointer
>    */
>   struct venus_core {
>   	void __iomem *base;
> @@ -235,6 +238,7 @@ struct venus_core {
>   		u32 rev;
>   	} venus_ver;
>   	unsigned long dump_core;
> +	struct of_changeset *ocs;
>   };
>   
>   struct vdec_controls {
It is working fine on QCS615.
Tested-by: Renjiang Han <quic_renjiang@quicinc.com>

-- 
Best Regards,
Renjiang


