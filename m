Return-Path: <linux-media+bounces-37726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C522B05141
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 546BF3A71A3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 05:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D5E2D3233;
	Tue, 15 Jul 2025 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ccV91U/t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C45258CC0;
	Tue, 15 Jul 2025 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558693; cv=none; b=GnB/KBRGfwDzfHbsdq3Qbozbu3xc1fhZEvTMuJpg+uLQri5jVDK2T7YjwZaX8MR9+lhlARegaj9djerpsTz1F85mTYDB6GDGHmkk2VmZUn4QpVgDKbLqdAAwoyw+pYAbwir/0UzSv994j0CzgBXEtMoYgON4fB8QYxlWb9BNFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558693; c=relaxed/simple;
	bh=falSRLpQDOdXIqG02LhaWdV61GCK0GNBBgPwHuhvl5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=stWWWiKHPbbyDArrJT1FYhuG7IaMCXq0LRRV61w0Sm8vcEP2DD4qoLZA2nfMG8EbC4uqdex2EsRhnU/wNlsj+M+sYXYJDeLon8Dq6rbW0OLhJXbCsU9uxr146tJ8aXSB0tIh+YFKHs5hLQ1VEq06qDF4XABu3ymW2tdcBBN137U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ccV91U/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRVZs029629;
	Tue, 15 Jul 2025 05:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVo2RzYOhDV0Nd7ABqgSd4/bOQDNhyAs3b8HeUxPvgY=; b=ccV91U/tCBpgdj4z
	XIf6rgVg4FlqqZSdXonANBuKR8ZmKPNPxfy0iWchCm9wABK1xQ/Vjikph+kxfzKw
	aYTVxejDf1bO/H+oi9HtVjffuozIAzqKDJFSWcaJgA0jwia3JkO7SwRrH1WukjG5
	PiASot6lgGiwyCgujsXav8IWOXi7tQmKu8ylVs9aW1ZLP2hi9n8dVLz3EnA6G5ow
	kfYJjgfbAdoyWTR+W1D+iQqASUsmQJdYwVKX3LU8F5ke/zmmWWw9w3rWUvXfAgNP
	TSRT6IVTnxzXOVFCJyUARf5N+ovFSgdpLdHMzwlBQSDpbPGFf79FAYgKC7JfuMYn
	md1aQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq1r57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:51:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F5pNnN032580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:51:23 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 14 Jul
 2025 22:51:20 -0700
Message-ID: <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
Date: Tue, 15 Jul 2025 11:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1MCBTYWx0ZWRfX9kyFWD8pDKW8
 fHyWAGt0ZC5xrC3OrBlyig9uDWRR+hvV+hYiAMcmKuwUMqTXAR4okwNladRZ06apLdn8dxc+hSR
 /M0o4MkmAmBuDKa83RxEk15asZW5dCcd9Pf5Wk51TFxD3FibmefuXhdnauYOvYMrXZzjUbzA7Hl
 12yAXkwwrCQT1qgN0p/x3qg8TV2DRDLIen5KmA5WqqViYTo9zV1zno0GWTq4NCOm1iVF+FpoD3v
 TeWXu/DHNaOCl954esoqRQRWeAtf73gP1dzGdD27rZ7/qfJIbU/oZwFJJLhXUQUAYUqS+v46nfr
 vcCiaaN4OV7aUBxWuKCtUi1zmsgwXDD5d0aG83FT0uQ0lO3UynsIK5Jgmrd3T20QB9S8uFM4bA+
 eZf0AADiYxW3h5Vmelit1pJHVGcQqvz3r+XFUdYa0mT93llg2kuBZegzWd8JuOMyhQ+oOB8V
X-Proofpoint-ORIG-GUID: GJRRmbE1kjMOSi07iOVDJJBUINty5vyQ
X-Proofpoint-GUID: GJRRmbE1kjMOSi07iOVDJJBUINty5vyQ
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=6875ec5c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=xOd6jRPJAAAA:8 a=I5YsldFMB7HoMmESBRgA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150050


On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
> in pull requests like [1]), so he is de facto the maintainer responsible
> for the code.  Reflect this actual state my changing his entry from
> reviewer to maintainer and moving the entry to alphabetical position by
> first name.

NAK.

The roles and responsibilities are well agreed by media maintainer(Hans), with
Bryan part of that discussion, w.r.t code contributions to iris and sending
patches to media tree. The only reason Bryan post the patches is that Hans wants
single PR for patches across Qualcomm media drivers (Camss/Videoss)

Hi Hans,

Incase you would like to split sending PRs, as the contributions for Venus/Iris
would be significantly higher, let us know, we can pick that up separately.

Regards,
Vikash
> 
> [1] https://lore.kernel.org/linux-media/20250630121704.260831-1-bod@kernel.org/T/#u
> 
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40831ae42296..f56e40d9b3c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20678,10 +20678,10 @@ F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>  
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> +M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>  M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>  R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> @@ -20750,9 +20750,9 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
>  F:	drivers/usb/typec/tcpm/qcom/
>  
>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
> +M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>  M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> -R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained

