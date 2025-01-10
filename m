Return-Path: <linux-media+bounces-24622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24004A094B9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 16:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1CC3188E190
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2418F211470;
	Fri, 10 Jan 2025 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y9+HzQ0F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1721018F;
	Fri, 10 Jan 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521891; cv=none; b=bACPRQimgg4k0EtWrUyWSc6Jxe4uIu9hkutEb2hXpntICTiDTjd2+7y2/XKEB3U7gEeOvOOVvdmWhIPoy9tFsPM/P8vEREVZc4QvjUir4Pn4IBVrqNy6P8/uu6EWi0pWEtzIXYLK9gKkgemhs5eToVFLoEmbZ6hSs0raWbKLaVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521891; c=relaxed/simple;
	bh=3AWBDR51k8EjmvzZKZZF0lUu83ZkotqIpvqLk14BTTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P+p0cVuVW5TDU+R/4BxCYhZuZaM95f7KDjjee1ydmvQ4rYgZsjaBBtACbmroryKQl2sM33pBD3TwoBd0j/7N2QXO/yTCfPzYbDy68eFxMFOB8ySLBPB+7llN+hC63+SWDLTFBI9HkrFQLADKONFjGtmfH6QpiRxZMHrGg1SARU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y9+HzQ0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABEmlr029611;
	Fri, 10 Jan 2025 15:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWP9D22463TG461zzS/0GqrlDIt8bqUaXD/50HiqKwo=; b=Y9+HzQ0F/cwW/LhQ
	mZ8Bjt7PQTK8dZU7xDCpDQFGtY+6PM6VWXA8zK0p7Sd4ayO174KEmXvV/fK+UDvk
	APr15gqGYf7Qnrf+wFbWQ5mh3HaiL8utunyCIVYVaYbnJOhQHIvfyQaLnHY9w+Ud
	2Ve2Dx1uwwJ/VvfpH5dYBQrhpQSYcKh6MCuEgwKyrkwjpODdlBW5WP4dpQ81F2ak
	eZwPaP2+sD+BF1EQ0ui7V9z30UvGpTBUoX68UlXPbqSaM9A8vWjFpgYFm8HDXNl7
	4GmfWC3Xoxru/pxiQJWNejS4z8McZUE2wiP5gsJT7FghGCpeDSRSOpQICm7wx7f9
	KrVnAA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4432gq0mjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:11:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFBNP8002130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:11:23 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:11:17 -0800
Message-ID: <287d8fb9-8313-480b-b2c7-0b24dd2d82bd@quicinc.com>
Date: Fri, 10 Jan 2025 23:11:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/16] media: qcom: camss: Add sm8550 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>, <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <cc1f4718-2553-4c49-b1c8-6f6f3bbeeb56@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <cc1f4718-2553-4c49-b1c8-6f6f3bbeeb56@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iihgphZTPHTr3VXre_fGV97N8PfQrIBV
X-Proofpoint-ORIG-GUID: iihgphZTPHTr3VXre_fGV97N8PfQrIBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100119

Hi Bryan,

On 1/10/2025 9:50 PM, Bryan O'Donoghue wrote:
> On 08/01/2025 14:37, Depeng Shao wrote:
>> v8:
>> - Add correct version number for each patch - Krzysztof, Hans, Bryan
>> - Correct the copyright in patches [15/16] and [16/16]
>> - Link to v7: https://lore.kernel.org/all/20241225133523.4034820-1- 
>> quic_depengs@quicinc.com/
> Patch #9 doesn't apply to media.git/next
> 

Yes, below patch[1] is merged these days, so my series get conflict. I 
will rebase my series and verify it next Monday.

[1] Revert "media: qcom: camss: Restructure camss_link_entities"

> git remote add media git://linuxtv.org/media.git
> git fetch media
> 
> git checkout -b media-next-25-10-01-camss-8550 media/next
> 
> b4 shazam 20250108143733.2761200-1-quic_depengs@quicinc.com
> Grabbing thread from lore.kernel.org/all/20250108143733.2761200-1- 
> quic_depengs@quicinc.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 17 messages in the thread
> Analyzing 260 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v8 1/16] media: qcom: camss: csiphy-3ph: Fix trivial 
> indentation fault in defines
>    ✓ [PATCH v8 2/16] media: qcom: camss: csiphy-3ph: Remove redundant 
> PHY init sequence control loop
>    ✓ [PATCH v8 3/16] media: qcom: camss: csiphy-3ph: Rename struct
>    ✓ [PATCH v8 4/16] media: qcom: camss: csiphy: Add an init callback to 
> CSI PHY devices
>    ✓ [PATCH v8 5/16] media: qcom: camss: csiphy-3ph: Move CSIPHY 
> variables to data field inside csiphy struct
>    ✓ [PATCH v8 6/16] media: qcom: camss: csiphy-3ph: Use an offset 
> variable to find common control regs
>    ✓ [PATCH v8 7/16] media: qcom: camss: csid: Move common code into 
> csid core
>    ✓ [PATCH v8 8/16] media: qcom: camss: vfe: Move common code into vfe 
> core
>    ✓ [PATCH v8 9/16] media: qcom: camss: Add callback API for RUP update 
> and buf done
>    ✓ [PATCH v8 10/16] media: qcom: camss: Add default case in 
> vfe_src_pad_code
>    ✓ [PATCH v8 11/16] media: qcom: camss: csid: Only add TPG v4l2 ctrl 
> if TPG hardware is available
>    ✓ [PATCH v8 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss 
> binding
>    ✓ [PATCH v8 13/16] media: qcom: camss: Add sm8550 compatible
>    ✓ [PATCH v8 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 
> two-phase MIPI CSI-2 DPHY support
>    ✓ [PATCH v8 15/16] media: qcom: camss: Add CSID 780 support
>    ✓ [PATCH v8 16/16] media: qcom: camss: Add support for VFE 780
>    ---
>    ✓ Signed: DKIM/quicinc.com
> ---
> Total patches: 16
> ---
>   Base: using specified base-commit 
> 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> Applying: media: qcom: camss: csiphy-3ph: Fix trivial indentation fault 
> in defines
> Applying: media: qcom: camss: csiphy-3ph: Remove redundant PHY init 
> sequence control loop
> Applying: media: qcom: camss: csiphy-3ph: Rename struct
> Applying: media: qcom: camss: csiphy: Add an init callback to CSI PHY 
> devices
> Applying: media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data 
> field inside csiphy struct
> Applying: media: qcom: camss: csiphy-3ph: Use an offset variable to find 
> common control regs
> Applying: media: qcom: camss: csid: Move common code into csid core
> Applying: media: qcom: camss: vfe: Move common code into vfe core
> Applying: media: qcom: camss: Add callback API for RUP update and buf done
> Patch failed at 0009 media: qcom: camss: Add callback API for RUP update 
> and buf done
> error: patch failed: drivers/media/platform/qcom/camss/camss.c:2454
> 

Thanks,
Depeng

