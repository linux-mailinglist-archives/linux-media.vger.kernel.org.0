Return-Path: <linux-media+bounces-28348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1DA64CB1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C7F3ABA69
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E0A2376F5;
	Mon, 17 Mar 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr9eaoL2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7451519B4
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211073; cv=none; b=i7WRzLUuE8bVr8tx0c/kmNf5NrdJ4RYvW/ZwT8mcIO3hdl49gzvFZc6osss2am9Y9S3eBq4rP+R0e68e/RzJLefku4SXvXZh1XYKr7/UAwmgfCNLN1qKcPek2bx4kjlMo78aH2mypYyw0nXvxj2R9XX6za3KDjrMJSpjKI+9ysI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211073; c=relaxed/simple;
	bh=ERBkrBW1jXuLcvdKfLSnqEM6VUWt7tHIo7Mc9TxQWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpQ09pGX2mcx83GPmT+pZ2Zv5QxDQBTsf6eTvRlhgYnemXDGnscEJO0lgemhttIUCufRONXemQy5zoumhqKoBDrTNKwVMiqYLmpLhf7+tCHPWmBVSOLDwBVJ7Be7UFpSHy/NOUC5dWkBj3nCoDweYsQ7NbpjuUS6vcXOGtt+RKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr9eaoL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAmBJ6026106
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yxyQZODdXLkSP4pKmGvOhty0
	JHw7brHWE7Qvit2mgQ8=; b=cr9eaoL2JZ2LV2+RNEY6lxhf3RgxDQE7If1mWlce
	pbuHq5Qi0y2jqduPuQ639ji4N2vShG0+S7OcjBuKy1VOregTrudDo0/hxGCmjUrb
	ZfQCp84Vg6+U8it08YkWT8DK2PN9ugbS2GFh3g5lcQtT5jWchN0GZLlwbx+68MXL
	kS+GLBlQ0bHoHNNybJj0yaCYwda7ssZ91jtgfD1F9hl/zWGH99Isr8MhEkaRKc6b
	fywrUUpdFGpfcKtn0MTcMmFbYeFxj/YR8ydz4neZMbPVfqqfDy7W+8pSCwYl3ckr
	PGd3HPSAZ8APC1dfjYkmzI+yJqNmTywvemTl4eCS8Z0qqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7vgbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:31:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c09f73873fso743850485a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 04:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211068; x=1742815868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxyQZODdXLkSP4pKmGvOhty0JHw7brHWE7Qvit2mgQ8=;
        b=VyW0tkoxIkj7tFi0kmOc6kfelDrQPj02v73s0ZctJcmY0dD6QYUTjGIO8rHEue6TcC
         ak2g5ktWVBSItN1wLDk7jV0hDK6H0O8riF63hGBS5gZpX1CZPrYRWJzKc5w1kIVoqlk9
         pr6OkVE6bgWpnHZO8YlIjx+dRqC4rl5Jsg2wbPRffuLh888R28FU6kscDaX+gT8iLC4M
         bs2PFkq2o1zuGVq7k88lSKveEMm1pcTkdrH9cvsKC2ZjZTE9XabUZPfvWLpBGXKml7IN
         e5Eu+tFHw0seItLTlBaKAUCecMpToZZVvya/kf+xhQAXrkuCxl3QEJLFoZGx9leUt2rk
         YXow==
X-Forwarded-Encrypted: i=1; AJvYcCVb/boVGj7Q683U10hxj5JQMQlyhINtUYL7ag3CtlvcYV+V8ZZxTtrjQK8u8qQtJtusWHr3wbA9NUdcyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYtlDyo+m+2Y312gXOlNuq4DXk40Iehair0Gougl1dZFpUhze
	YMJl3TBzDFQgg4Z1kr0w/DTXoM1Ox2qy8CiypepxHeh8hGiIgc3tjBNLzh3lHNucGkuwfG6hEbd
	BkGc6ZDVy0Ee/XJp4954pZJ92EuX786MjIcFpoYSGv7wW1rPjn3SfffQ1qdpNaQ==
X-Gm-Gg: ASbGncsP3hJ0By8kYCoK4pEap23MZDtN3L8YoAYp2e8/uKRnTS4IjUsWTegEGytW53W
	QrlXStc08c8mzL9Fg6Z58n61jFhB9ACPtDB0mEUOZ/ShduxH3bGzQIXsFRrZZcJ2QRF4ISHbkBG
	jTKWBhnLCzctbgyV/DpJv0MRGtuwz5Of2C1ei4ZtlFL1UMRH9dHGAUEuMVNlJid+FHjRt4qSMVh
	lnpKBBMkNV3CU2jC56G2Z5z2juEc3wZVyIUMUUm0juEUTdb+b1yp9W/hAaTu+6UmPxDe6H1qYp7
	mftJdhrcgG4t5tOSgquudjTXK9FJjeCI9UYRaJUh3QuPe6JK1ZC/ZoGqDa3rqdiMppjCJrCLFYd
	xNV4=
X-Received: by 2002:a05:620a:2402:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c57c8fd7a8mr1408212785a.38.1742211068518;
        Mon, 17 Mar 2025 04:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyzB4PA4i/ZI1x7x2UAZWqGYU5b/+Y54NT9qN4ljiJY5IlVc9vIREnL/Bl6tJpjNqwt0qkSQ==
X-Received: by 2002:a05:620a:2402:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c57c8fd7a8mr1408210185a.38.1742211068190;
        Mon, 17 Mar 2025 04:31:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da280sm15695621fa.89.2025.03.17.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:31:06 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:31:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Message-ID: <awgq7zqeqkp2iwyk7vbn3mugsaq723bisxzhaswmzpt3iyc5rw@2vsarnkjdrjr>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
X-Proofpoint-GUID: peZfShM38CI-3ZDCHqbI5-7lKmV2jXy8
X-Proofpoint-ORIG-GUID: peZfShM38CI-3ZDCHqbI5-7lKmV2jXy8
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d807fd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=vjPId6sXUSytdOGuP0cA:9 a=a5fHTQWifTJYonsY:21 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170084

On Tue, Mar 11, 2025 at 05:33:55PM +0530, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sa8775p-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +			memory-region = <&pil_video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x0880 0x0400>,
> +				 <&apps_smmu 0x0887 0x0400>;
> +			dma-coherent;

I think almost missed it:

	status = "disabled";

Don't enable the device by default, there is a chance of the firmware
being not present.

-- 
With best wishes
Dmitry

