Return-Path: <linux-media+bounces-60621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N3FDPJQ+2mSZQMAu9opvQ
	(envelope-from <linux-media+bounces-60621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:32:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A64DC3D9
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22CE3304653E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867AB481644;
	Wed,  6 May 2026 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3omOw4Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwM9jMWi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AFB480DE2
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076957; cv=none; b=E7P8fIAm/SMBYXrJmF9LcXQzV13PnYvM+lVcDC3OqysZ50KrGV+ov14uu9x8VVjSjh5Gb9Z8/rC88mIrCCcG2T3krR0az8sVKmtTL+fezwak+lpMY0GJJ70OyE4/gh+PlJd5kGfM9CgKQ6clAfQXI71XCj0wkmtUXcQ6lZq3EUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076957; c=relaxed/simple;
	bh=77fJr5LiA/sxupPT8D6D6Tg2q69Ndutr+ng2W7NYQUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0BCYkt9UnRHEQ5hdMeGLVlSkLxY24m5MVwNdxzXuCDPuMPtGEEL8jvi9oEGhVirKBjj1HNfIqx6TU97c7Cwb6UyiO8m25J4XfAR5KafIidCEvdj/2Bgyt+fTuzD2dnJtdMWkwHyK8F0nzGPGY7qpybEHwqrW5fKnnpi9wcGj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3omOw4Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwM9jMWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5P3X3036600
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 14:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meGD3Bi0QGO28p7xtSgOSjUMqCXzjYkDyPriOZRTKRg=; b=a3omOw4QdhsyYJGa
	si+XT6kwzHEmJtWJ34j54LJFoLnFRPyBE+tH1EZz99YBZmqTXh2F6vrHR5mWyTD/
	Z+u/xy8szUADasJXV0Bi4KCPXCbEKAlG8/XjLhWVUPvfE6EvNDojpLpzNl7YodAE
	fwHhjNyGBCZSVvxEnbJc29PaBaw5S+GqT4VZbLft5AcIEHZyurd3wJZMvvQaOStB
	QF6jCgJHilepC2m/jhVYYBNkNADsupACM1pn4ovl2rKt5FeO/oOWSvX8NbHne2Ov
	P7PfBXaYnsea66A7joZnbdFzc7Hlv5oc+8jr5+aegWfQ2TC0WiuiKq9OsM0QH2Jd
	6A14rQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf0g9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 14:15:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so893751a91.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778076953; x=1778681753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meGD3Bi0QGO28p7xtSgOSjUMqCXzjYkDyPriOZRTKRg=;
        b=JwM9jMWi4hja4vvChls6LEpONAUWomJY7EmUeytJoSE+7TjlU8OZ9slh4BeShp0KAc
         QrBvm2JkBfPAQh+FgAJmXvd1ns8QSc84xPsWaJK71+QH5CmJQcis7iaPbZeSvFYsZ60D
         bR3BVAIIRcfMaFVfiYlMZyyM98HtLbL44PKxpnsXAFinVLPGH/DyeyUsUQwJRto1UknZ
         Aqcn+UcpLY832MdHALhRwqch9xqDJlKTWJsh26Ak4wGanEuPFXyXGMpoDiQvnvEYJOPO
         WWEez2VF2GaddErUhe+dz3Thx+yRpvCp5kkO6zatykauL5yAHHDBGlwAWS9hQdN19eqP
         /2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076953; x=1778681753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meGD3Bi0QGO28p7xtSgOSjUMqCXzjYkDyPriOZRTKRg=;
        b=OnjAhZZ9JBeiSvo4kapeYqASlbQiholRfQtzOVoHpZPbRRXC95KzsK1r+Z/edu+YRq
         04BaQW2BX+PuDwrOkyc8bW1CIqtBGChKK8lmrSqnDqegk84t1ktWUXMZT0npPpHShC5T
         F6Lmu+GoQ1+fmBbSDSggNt66WWpxkPLq5gVZgTd2b3SbvGiJ1/o8a5Gqm94O1qaUEnZB
         EKiatruAFoUnMXU6AcgSDH9KN0lcDkTr2/iIPXy0iG9lG2LQrT3KtwUBBOxnPkkJ94bG
         +Eprm/78Hreq3ofB1WwwWWlZX3FlOxrlI3UrLLPRk1hvZ2LYjPJ2xpemIhOL35UoxXb8
         OhbA==
X-Gm-Message-State: AOJu0Yza6jsrEcyf5Bcah7LFK/rcwvJdcr+kSvS9kAhg16FFLabIVIme
	lpPvpMtwUB95yldePZMoTvrRq9roW8hI0pg6sC30zuuwATiSXUo6k9ydvZ8B/pK+Lk7f0YTFPB4
	QuJGyZ9bBCkWljt3FKKWv7n1aVcOainZQdmn+Mj1UpZXCOstx2ZskKwltNF6fc2a9Zg==
X-Gm-Gg: AeBDieuQzNEZGbqwEsE2f4ymN1V+6YnM9Kmp/6J+6rKn1s7b38Y7aBdts8GcsCug+WS
	u6KDaSg/HCLjn89dT9B3pwkEm2cqG2Gxd43LJc65GxnoDt99j/jHs0oZVhRXtD2mrqaXHJkfW6N
	vK07PWQfSBk003ZMMu6raAztk3ohbzezsGLnjRWRxY0BbncfqCKM+BLfEEMlpnO21fdMAscRu4v
	H5qC89TJNzs51xs3uMBFCsJes3nysZA/4ITZBwWTLw3ECr9kDatxKMPwyD38T0gvNSeM5U8FUJX
	8PWELlGhFy2QLDeFhHw9TxHfOKjZdDKl+HQaA1qEs1esLEz7ccHgbN+/Vbfdg4bs0a+zTkfVNlW
	9kb2UgXhq63smi6BBzRjCgtQIiBFSNuuSHNmvA1YKzwybw4Iug2mhq15gcG/Rsg4k
X-Received: by 2002:a17:90b:1b48:b0:364:721e:42d3 with SMTP id 98e67ed59e1d1-365a96ec81cmr2744682a91.4.1778076953036;
        Wed, 06 May 2026 07:15:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1b48:b0:364:721e:42d3 with SMTP id 98e67ed59e1d1-365a96ec81cmr2744637a91.4.1778076952422;
        Wed, 06 May 2026 07:15:52 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b08d6c5csm1710667a91.1.2026.05.06.07.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:15:51 -0700 (PDT)
Message-ID: <6092c78d-b21a-4eb1-815a-87a530781705@oss.qualcomm.com>
Date: Wed, 6 May 2026 19:45:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] media: iris: Add iris vpu bus support
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-4-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-4-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MCBTYWx0ZWRfX5Qk9T8xhuIqt
 DNY9vRwtT0iPfmmqJSmkMJWkQgt3SQkVQi6frnwf8pj4UGbm9ftldilolAILJeuP2l5Tc1WLFY/
 BhNH/B3IOXWEDZo5U8ArU0uNWPWMeEvuXGfhFyNr0Rh4i9H3ozOgm2Ij4ng+P5CemYg0awNhJmf
 pCCgatLFruQ8Xmk9SOyWOlCURzMiISP3xlIMPwEXoVA+SqPbovpRvJn7VP9zYQZzsYm2PE/0zM4
 jjuXiPkzcFrBPPLthAppHUPVmiWzO7qcmeVT2yAhUBJpbkG6yzMQRzdks4iyFOOxxBw5skupMP/
 xAonHsLWgM7qMLXXnrVb1eBQLUmLSkawZobs5aT4W2FeWgjhiffIOxqeH0wAEknoY6E9dn0NuJ/
 /iY2O78j9MKqJMxT+6KbzNSU7mad5MjIMuwaDUZNJESY4hDNvXXt/j9/7ZN8L4CsV5mKoRAzDIW
 HmmFSQr305PJEM9jiog==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb4d1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=B53-pikVkeDfK7DE9NMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IQziUC98LE98iaWfgyKzIqBhzSAxl77R
X-Proofpoint-ORIG-GUID: IQziUC98LE98iaWfgyKzIqBhzSAxl77R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060140
X-Rspamd-Queue-Id: BF1A64DC3D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60621-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> assosiated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile       |  4 ++
>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
>   include/linux/iris_vpu_bus.h                    | 25 +++++++++
>   3 files changed, 98 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..6f4052b98491 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>   endif
>   
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +
> +ifdef CONFIG_VIDEO_QCOM_IRIS
> +obj-y += iris_vpu_bus.o
> +endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..15ba4d9c563e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid = dev_get_drvdata(dev);
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static void release_iris_vpu_bus_device(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release = release_iris_vpu_bus_device;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = parent_device;
> +	dev->coherent_dma_mask = dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", name);
> +	dev_set_drvdata(dev, (void *)iommu_fid);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}
> +EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&iris_vpu_bus_type);
> +	if (ret) {
> +		pr_err("iris-vpu-bus registration failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..750e878e489f
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_IRIS_VPU_BUS_H
> +#define _LINUX_IRIS_VPU_BUS_H
> +
> +#include <linux/device.h>
> +
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +extern const struct bus_type iris_vpu_bus_type;
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid);
> +#else
> +static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
> +							const char *name, u64 dma_mask,
> +							const u32 *iommu_fid)
> +{
> +	return NULL;

change this to return ERR_PTR(-ENODEV);

> +}
> +#endif
> +
> +#endif /* _LINUX_IRIS_VPU_BUS_H */
> 


