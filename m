Return-Path: <linux-media+bounces-22853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A579E8B85
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 07:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED8AF164101
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49958214803;
	Mon,  9 Dec 2024 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="psYNofrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935520FAAE;
	Mon,  9 Dec 2024 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733725761; cv=none; b=psuxnZNiriTzZCbTn46vNfiNnA8DIjZI3pCgM8w3sA05SbJGOI8om6p/GTTTXy67RFeMtCoY8Jokt+akMTXuYc3co6NQWErPH63yXiu220qI7Oxbj18q4PnTPadHYYeJK2l6WCyVBKekq729IgPPHXzL+6afelwhQ4qtA1Ci9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733725761; c=relaxed/simple;
	bh=C6Ozj+41J3K0Dcc8OHRv4HW6OtQ7Gn6kwdvx7sdg3gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GHdOf3iAxbPkaTwFeJUvLW82Jp8D4oU97i+GjnNCm8EcZhYRvTlw1WedBqHIp4UX9QivvTBldF8NuwNpPw5YRO0KDI2yrX6IPhTWwQAqfkCYCRoCEElrUkl68Lz/b7XjTcg3PoNyWmBlXntfFbiJUZs2pF+uTJhWtmmEjpTLwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=psYNofrM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8Lb4pe021468;
	Mon, 9 Dec 2024 06:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZhUDPv852Bv/S+p4NSiBHLX8omGyZI38LtywNTennc=; b=psYNofrMXp532dDS
	8IySHrcNdShefcIAPyq3iLUycD0Wes1axCnsMoTHfrAqAMovkWUg4TrVldi2r2KP
	glNmijgXlLDzzWEw4/OjPucqiz9ID7/Qk8vS37/LRk9JsC3IqrBtloyD0c6aJpvF
	HbJEQiYYHECS5OIH3hRwEIgm4B0UKbNMOd1CGZi5my+SobV16H3aMLPeZzBXkt9j
	8whJIgoPgANeJ7fPffFOrpZr7IGCpqHVZ+ndbnvGIhNNSyhbn14asOJaNpcaIddA
	3BMfXtqOqozdiDA2bCH9Vkb7c+AEJmz5d7TjT18lCB3sq6foSpG8s8ZzS5QYSQAN
	u8AYzg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1uj7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 06:29:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B96TFBl001217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 06:29:15 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 22:29:07 -0800
Message-ID: <88433dd6-6eeb-1874-8a77-cc79582bf79a@quicinc.com>
Date: Mon, 9 Dec 2024 11:59:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_renjiang@quicinc.com>, <quic_vnagar@quicinc.com>,
        <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
 <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-1-fd062b399374@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-1-fd062b399374@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7NQMbPyvrZeRk7TGvKYqmLb9G0OZKd5i
X-Proofpoint-ORIG-GUID: 7NQMbPyvrZeRk7TGvKYqmLb9G0OZKd5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090051



On 11/28/2024 9:51 PM, Bryan O'Donoghue wrote:
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
>     compat = "video-decoder";
> };
> 
> and/or
> 
> enc_nodename {
>     compat = "video-encoder";
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
>  drivers/media/platform/qcom/venus/Kconfig |  1 +
>  drivers/media/platform/qcom/venus/core.c  | 90 +++++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h  |  4 ++
>  3 files changed, 95 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index bfd50e8f34219db8a1de7960d7ea93b20db2982a..bc2e410b29cb415a36540a4f98709eae44f4ec35 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
>  	depends on V4L_MEM2MEM_DRIVERS
>  	depends on VIDEO_DEV && QCOM_SMEM
>  	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	select OF_DYNAMIC if ARCH_QCOM
>  	select QCOM_MDT_LOADER if ARCH_QCOM
>  	select QCOM_SCM
>  	select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4e26b18790537885a77d66c1917a4e7a146eaf57..8a085611443cfda89ae71496e320dfc1f02ade88 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -286,6 +286,89 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
>  	return ret;
>  }
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
> +		return 0;> +
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
>  static int venus_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -365,6 +448,11 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_runtime_disable;
>  
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		if (venus_add_dynamic_nodes(core))
> +			goto err_runtime_disable;
> +	}
> +
>  	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>  	if (ret)
>  		goto err_runtime_disable;
venus_remove_dynamic_nodes should be called in error handling in probe as
well I think.

Thanks,
Dikshita
> @@ -443,6 +531,8 @@ static void venus_remove(struct platform_device *pdev)
>  
>  	venus_firmware_deinit(core);
>  
> +	venus_remove_dynamic_nodes(core);
> +
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 27784fd7082c321222b23ca4b2902a04c49e19ca..306231b4f7d0201175974b4a42574f30d23e08f0 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -90,6 +90,8 @@ struct venus_resources {
>  	u32 cp_nonpixel_start;
>  	u32 cp_nonpixel_size;
>  	const char *fwname;
> +	const char *enc_nodename;
> +	const char *dec_nodename;
>  };
>  
>  enum venus_fmt {
> @@ -171,6 +173,7 @@ struct venus_format {
>   * @root:	debugfs root directory
>   * @venus_ver:	the venus firmware version
>   * @dump_core:	a flag indicating that a core dump is required
> + * @ocs:	OF changeset pointer
>   */
>  struct venus_core {
>  	void __iomem *base;
> @@ -235,6 +238,7 @@ struct venus_core {
>  		u32 rev;
>  	} venus_ver;
>  	unsigned long dump_core;
> +	struct of_changeset *ocs;
>  };
>  
>  struct vdec_controls {
> 

