Return-Path: <linux-media+bounces-30358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B507BA906DF
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 16:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177F6188C3C8
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AD21DDC1A;
	Wed, 16 Apr 2025 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsPIgFGz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B525336D
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814795; cv=none; b=AjccA6Kq5knch54sXAvtS1HuxmvfWqN3m1wADzo0su8KBm+KaZcmee4iWoTJ3mOzZuwxZBFfR3P6TAJCYW4vPLXRH4ZkCV++YU1TkmGrrTbUxKPQEalRtinUDnx00xIJ8W5HciNWoe/cSQoYNBlW9WG9p+m2VAFo7JvvXtm86JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814795; c=relaxed/simple;
	bh=+SqyWiYgiFVRcrv3hFQViet85UCefWVjmCaHmgVV+Co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVqXE5PyTOd6itflCR5GIGXPlGAt1UtIV9o7XPHhwg5rSOsaKgTGFST+vvbz7tViAjjbSNQjUn6fZcH64ezx5jDwupyg1OpkemFJd7/3dgr+rS7r3wRrnvlBhM4rR34FOZoc/OEc81JYLOuLJau4rUz9GVT3jfjISVkva2BZYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsPIgFGz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mIpg000424
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KA4TV5mKsL2y0RL5Gn3GhHH/7I7jDODOCh7jGAM9fWA=; b=TsPIgFGzCK2LdB+0
	uNNoHOrxXr+Nq+R0Bq7kF0L9pVop/7JzZmSI94l/hhPsEOaskbVIGufxoW2zlMCA
	E0k1KS/JlcuzkxVLn7PTuMrD5Omw6PR9y4MXgLkC5GyorrlZ3uVELgRjkZPO3NkA
	GP7dUELIfCKm99lf12SrZB+/iBLi0rvBZBG8ucBwDXF/1QhRmagOpAVYiuwIaKx7
	tU7aTkVdoWBoYI7rzjqDL4VvMeem0m0LHnF5B9MB4LSqh58noAktvm4XiI98RgSQ
	nGGjgaZTIS7LXtUC44JTg2c368rKHY4+4IaZHZvrfkx+rOYyt+aSJj0AE29GdNQE
	wV2/ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vm00c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:46:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso178899685a.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 07:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814792; x=1745419592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KA4TV5mKsL2y0RL5Gn3GhHH/7I7jDODOCh7jGAM9fWA=;
        b=D3m2rO5yNKTsN2hCDJTNBckEu+xFvMilpHq9Bs1i8Ej3Mo98O/WTyJtAKlxuGoA3uI
         KtYFCuccdbx8mhzBt+bddW/PARuLrwObA24T4X8gT7bPyeEN7BXRVotvw12of3X0I8+O
         KG3/FbP3JY9DVIrJZ+vwtGCTAOekTAmezO02lndq/sIRaV0N4IXiTqCfPUKg8gUSWNDX
         BlMICgVqLzX15JLNHIANEwY7X4b+MKrdmo779lEv2P1xPOAYHNNcVTRcC09iytlhlIuE
         TtrzV2hZ6hBGLS19jx50pKMeiNsl/yqz9RvOgallsf7KB+o91RC9YYb8/cSScUN0alTp
         Rs0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrx/g6CTNJBGnZSUkEd7x4TnzpcgQksOEN738FJYnqqXmANgImF0KnKrREzDiWAZ1+w5CYEpCBmKmFag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Bx/8/3FYH3lJ2MmE6riF66iww8Jt43WZR8o+UbANhOGf24kg
	8BlnLYodztDbO7l9U1vQNs51bkOjrbLSaUffB90hKOQD7UcGVb8JfbDl/oDMzYFCIcbw8GzqiEV
	I1vI8tzLSRjkHswFtTAOIhbLOiTVVtKBaFgj+vmGGtDofWo0X9bUFSyHCBLPLYw==
X-Gm-Gg: ASbGncvS7mX7sWYqvfgBID5vcba/delDoXbVQjtzr1MMkiw19eT17qJDJSWEwlI3umd
	hQHr8MTsG9dOm+EfIKsb8m9jsTfs2Dxv6S83s3EC3PASVOZCp87Yozos4SVEfXSYcjcEy3WKPPC
	EC9lrmesSUbD1cXXrVlnICoAlQYKeltN1MAVkdja1I1cRZGpgtmqvf9u1wITdp+hdLTTwTnaJF3
	EhMzM+i6BNBmHU3hPUs9Ku6k6SdwO/m7XkKJr448lExa9unyCiT+PyenKXJeoxq1LQy2Q2mejI3
	3LrKIittaa+drB875xBBgS05oC/DBNdiwi92WU/m0IJaE9o1hPWwQbq7jesBje7SeTg=
X-Received: by 2002:a05:620a:f11:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c91d0432c7mr3067185a.10.1744814792039;
        Wed, 16 Apr 2025 07:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG59ukWC3MyfycyjIAvWr+JUl6W0NbfjImB2+ZjakY/8PQ2cNO/ibVV7aEWoEpjqX246S5jbw==
X-Received: by 2002:a05:620a:f11:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c91d0432c7mr3064585a.10.1744814791519;
        Wed, 16 Apr 2025 07:46:31 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdf4684sm141728366b.68.2025.04.16.07.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:46:30 -0700 (PDT)
Message-ID: <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:46:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CAIo56MxH3392LPn9hZ0wVgdLWrS686G
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ffc2c9 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CAIo56MxH3392LPn9hZ0wVgdLWrS686G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160121

On 4/16/25 2:09 PM, Loic Poulain wrote:
> Add node for the QCM2290 camera subsystem.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594..4b81e721e50c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
>  			#iommu-cells = <2>;
>  		};
>  
> +		camss: camss@5c52000 {

@5c6e000
(first reg entry)

> +			compatible = "qcom,qcm2290-camss";
> +
> +			reg = <0 0x5c6e000 0 0x1000>,
> +			      <0 0x5c75000 0 0x1000>,
> +			      <0 0x5c52000 0 0x1000>,
> +			      <0 0x5c53000 0 0x1000>,
> +			      <0 0x5c6f000 0 0x4000>,
> +			      <0 0x5c76000 0 0x4000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "vfe0",
> +				    "vfe1";

we also have a pair of TPGs at 0x5c6[68]000 - I think it would be good to
describe them from the get-go

> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;

the two TPGs would have IRQs 309 and 310

[...]

> +			interconnects = <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ALWAYS_TAG>,

This one should get a RPM_ACTIVE_TAG instead, on both endpoints

Konrad

