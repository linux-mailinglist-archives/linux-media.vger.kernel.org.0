Return-Path: <linux-media+bounces-30181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93876A8846F
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E27CF3BC89B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E80D27B510;
	Mon, 14 Apr 2025 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpRsMp1v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB7247281
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638297; cv=none; b=fpwptGMRokNPByQxmPedpMLoHXmrOxCMa4tKKt76IZ323T2cZSRNt6nFY8v5LBZsZ556IMNlD8s6M3Ca9364MxM9WAaPbVFebRKWhsCpur0YWPVtMgC4Y2vT1YoWs0IPr0Tg7p1YIEsa6iCBWSmQiJ3k1ke478ETRq5QYx3eekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638297; c=relaxed/simple;
	bh=oMxfmg52YvUwwyoTMwpAjNp7TiVHpTjomzMZyD1fhqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaDtDFPj2Fku837OzCzDHjDfle3+zQ3ntSIEhlOIxoC2Sk1BGW8UD7EaCtIF9GZJYSCd7ubk5g6p2SQIJFPE/90nPUDSt1ImrT+ykGnrilpC/CsjLxKnmz67YSC+2XI2vieSqePIbR9Fb12DdsRRnSZyXPEWcKdHEMyHwzKxHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpRsMp1v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99tT0029074
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGyhxlay54IRFzuBkra/A/yq80IVczLJEIsYnlPDjgA=; b=GpRsMp1vvSyRCbYZ
	8AUyply8bOhmTnKkUYgtKyT2XoW9oAi0r4k8KzwbNLM76Ne2pqPvlFToQJbSK+2w
	ivukfjTndJnP7Lf/7b84SxpvudvmV1Nrj4xly1MTelzyGLynBrdJYZo1aRhBmnMy
	mxV2iefMqzk8a8pGm4ijPEAjBKyp3Er8/NgltMA9sDVx90u55iOwD1dOwnCrZxlI
	sL5ICCR0DPbyANCPn2AX9v5gzP95ytEg94UvRMhPRpTa5S1AltW5j5z1yxOJo1PZ
	CsMk3NbYbek1Mv6DzfhJEduYM3DX9HdvvRj59zgvDk/UkHxdM6iMY/2pK9qdYBwZ
	PSlhfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14s14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:44:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece59c3108so9788896d6.2
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 06:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638294; x=1745243094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGyhxlay54IRFzuBkra/A/yq80IVczLJEIsYnlPDjgA=;
        b=rx6fngKYgcZexJLiN0cadHYl8DrmhsIU+gu8EWEKY709RFlW9zuphcy81SCZHgLnOr
         0zzUITGz5oi2AZXWjVQxItMZMYZzIn5QArcXI/ZmaTL2sgP8AWPaQ3VFl8jhmJ5RkSxG
         mPRMgTZUc3aqzEzReSMvP6r1N17c93SAARvN1zdM94dXEPxbHL4OQZF9rdy4gR2t5Pkc
         O+z1vGT66vtmTmrUmYEbjrMoX+R4EkejFAKtgyI2m66xQ6RcnmjjgEx80M/JU6TpQJcc
         6ajnruFjoNQdekC3XOJbw/Zr5rl1aXgp9q8lBDWjuseuzcz3yEZjwJ1t616O0Itkn1Vb
         CUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcIwZd5wQsojv6U+1orc8PfY2Qvfxr+uSVynGbsJmBOEIhY73DnqYaaIhOfoWBliVDqJhxvnRkKIMeAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvA43ERKI1wKZRISBM6FkmamHNmnyO1rzd823e5RQbutStF9i
	JWHsu/vKyTm9A0EowPb7Xig4xV+qiD7as4bxVSKYxByNRGvr0YzNmjz/wv0IGWlg+YlmwpZ496a
	bEHNjGP+x4crpuV5+dvrQNI/+BlohbpFe9PI9g2o/5SFcVSp+Z6xYRPeQv8rnfQ==
X-Gm-Gg: ASbGnctXo7qAdwx8WHTb4i0KWyl7yMJbyWH+BZW4opWMTqZOViC9LjVxVv9+iGMFn5v
	2M9UGDy42bErAwikFnyCISIxT+GfUMpTDqcoyZgOigrF5Zc7bZvM1YxT7JJ5cJGaiBz7bB6kqSQ
	X/uWNhVyhfvUUKi7Bx78l7kyAygBI1uKqMgLRy0UxYdMHhSjszb6Y76heGAcLTahycLx7ig8efT
	Mh/XBa0ctpW9TmoBXjsm0m0cbqTCW9X/ybPidW4rvry9RGHy9BR6BgIZxk4pRNDTRz8dahj2oHn
	8tYR6EqU4qMtyCEZw7lxlCtC56g1oPxFfVTqSIp6nm3QF8nOhf9B5qxbPWl9Ul7Qag==
X-Received: by 2002:a05:6214:19e5:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f23f15d812mr61942666d6.8.1744638293959;
        Mon, 14 Apr 2025 06:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZVo5rWcpGuTu3YsE5z95sRrLd11UcEgqrLzSlXM3gKn6ONHCheTTQxg6qNFAYdN3dceNSIA==
X-Received: by 2002:a05:6214:19e5:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f23f15d812mr61942526d6.8.1744638293402;
        Mon, 14 Apr 2025 06:44:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd205sm928040066b.141.2025.04.14.06.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:44:52 -0700 (PDT)
Message-ID: <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:44:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd1156 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KVm0XDNadgfEQVUGQ2gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZDtzIPaCSMzPbhFP7qL1JTcJ0QAuxwe3
X-Proofpoint-ORIG-GUID: ZDtzIPaCSMzPbhFP7qL1JTcJ0QAuxwe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140099

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d1300..83640fef05d2 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: isp@ac7a000 {
> +			compatible = "qcom,sa8775p-camss";
> +
> +			reg = <0x0 0xac7a000 0x0 0x0f01>,
> +			      <0x0 0xac7c000 0x0 0x0f01>,
> +			      <0x0 0xac84000 0x0 0x0f01>,
> +			      <0x0 0xac88000 0x0 0x0f01>,
> +			      <0x0 0xac8c000 0x0 0x0f01>,
> +			      <0x0 0xac90000 0x0 0x0f01>,
> +			      <0x0 0xac94000 0x0 0x0f01>,
These I think should begin 0x1000 earlier and as a result be 0x1000

longer
I also believe this is an off-by-one.. there's nothing past a certain
register in there, but 0xf00 is what I believe makes more sense here

[...]

> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc   GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc   GCC_CAMERA_SF_AXI_CLK>,

Please don't forcefully align these

[...]

> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

The last one should probably be always-on, given we're doing all
voting on the APPS RSC as of right now

otherwise looks reasonable

Konrad

