Return-Path: <linux-media+bounces-60961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOPRBDM5/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:27:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A041A4FB195
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50CCC30469AD
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6973E95A4;
	Fri,  8 May 2026 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tpg9h12O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEKCwq5z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FA2D8795
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268454; cv=none; b=St+HUJkdiyTVcY+iyS1FDyU0gWBBE08uh1YUOdG4B91zML8nN/lJYkYswXmsBTbHHdX/9LoBMmZgzc8c05ni8jbWbmEDg2IBVC2i9jYhVNdnxHdVaKr1q6NuFaYAKNJJiLnKgm7oGHaaLcczfWqKub/QLyfNGUipN9pY+AMhO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268454; c=relaxed/simple;
	bh=vLFJYlz472BIEbCJJrK+f2v/oLfa/ZS2Gxm8V04XxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efNHuMiA8brXN52Vgs/yUfSHU5BMe0+fOMkLkHJ+l7ACtdQqIaP51XvdONOwrhRmyj4Fb1YQMC1TfU+KjgdDTXnRmX2IECfOKXxPdCKvMlKX5XfsS4JHWDg7oLzO2Z65v0f1ZN//X0yidGkKahUsbuNt4BdumIgVDaLSb7OHwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tpg9h12O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEKCwq5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4GuZ1093734
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yY55dO2IMk/92g6rGd8QRogQ
	Oy5+UeRlbKNLCfs3a9k=; b=Tpg9h12Ox8yR+fzY8akuJaF9alimLJl+7606HI/b
	iclAu58skbnVvjdJT2knGf0tvHSBvYJixU6Nix23LLkzkeGyKzY/XKHOD9nRwELk
	GPAO+D61c/jtFcG73tcbjTN3Fy9a9QWO8u2MVwr02/9Tw5RMw8y4DmaT/uCm88jS
	NHXUDm2HwxFM6zkueKz1y1aQuaSCR4kURy2dJ8P0Tbq2wjQNU7EDWMA+2NRC8A3R
	Uh+rlUnob0M2Tdm0RTHGPJ9dlqRjxXTzv88B1Jj1u5amDegGQubRvUCOYMYea/Cl
	13IZHeOgqERGxqGdOHgxe7Cz7u9Mb5FOHSlabzbp8qD0ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d0q5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:27:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e2592ea3bso23307281cf.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268452; x=1778873252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=bEKCwq5zL/UG9SXbAivmcvd6t8UxrKXsm1ZDc+DUwsfdIhtIWZa7aYbEcURENaoe/p
         6bx+6KZuGB4Ai2vCR74P2vrMhWuqeyB09gAspZOlnnABIVXG8WyELkU28T94TbvnpOwu
         dVqDVLWMKNC2/R9Yi/3NGjDF1QgZGWp6o5DnKVgiHGLy/TRJnCs7eJfWVNFHFRlWjrOK
         +uFN8I7yshQ9dwkksonvrQqScIIblOZ2eDBqzjp5spLDgLvjKExSghIvVsuFe/gPuY3+
         idFKO5MmaTL+CspDgCjNwqVuvdoZPyzMSX8LwcSxf0KgvdWXO2TfZcPgrz+V1Aq5XW6/
         cJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268452; x=1778873252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=Ua5UEYEvcEhRo+reDW5mGOKgAnIsUvE6xns8rnPrFPaKRjK29rZJ+d93reFcu97n30
         I2eva1uhnw1GDK+rSCC7Cx9NGUDAPfrz5agGVi1YIMkEKWOirOQQVlMNjT8p0GdRmsHI
         /XBRmBBLK+ylUlJjmxu6FrG/Ulk6iNriD2VPnTJ1RugqE5fIj+pFEi285tMOH+wnZX8B
         p9oX+gSgO3wB557VcpzkaKZYpNdKP3siv/ygdpZj93GmWnkd5wTGA9nQ45kYmFiqK5yu
         eRw2q1YyaicI4ZS1zuQjWTcxtHlzJc1f1ukb1LwovrCh8LjCoFK10/e+YyBsCd0p6FJ1
         lFUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fc9JSufWbjw9MPvPWBVU5aH+tC1fGAChpczOKMVx6eVtTi6LYnQjIh7cN4kq1eT4UFoPAiIPzOG10aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNiA57gs95BnYeifmuYq9AjkNacKGT32ccyzDSNlyfYht1BR8v
	hNN8Uw1/Mu4DGLhrKytbB+fgOhtMAsuUeqgWUhg+btxz3Epcr+ES7nFFROINCG7j69a+aIaBugp
	7JQXgY0mGUbreSt/WwAo3ZbDiBoX06AYzh76R726xUWS46uajsitKdDUjiKe2c+Z3Rw==
X-Gm-Gg: AeBDieuKYKBy+xUFpGd7xglqOgKOyN2W+hGMwvlh01Ibw7GVDbvps9ZPLmYclHsHf3e
	fTzirIx6M1+Uq4ZMzSMLVhNRNWtawfU6Z618JtRVj0+LULfZm4rO+uiW4Rc9Qrbe0pj5UB7I0MF
	/hGB6Xud2Vw0UVXizmJB+8O59qBn81FIcNG0ZajpjvDyv5NDGZqJlgy8wm8Z6v9Yxg7JY/h+lia
	NfiZcVQQQA+qR6fD588Fumg0kLG3M+lN9gIzTLY/sadRuftZkwnz3No/LIaKgrMVxqsQPa6S35C
	gZ+OQyaLjVy2d1drHwVpEJXdVe9T90HdYATuCb8Kycmgtdmh5ShlCt2WyC1ZM6bNfwUpSiTsn+2
	kH8N1vKft9laAfQ3tRYO3yVWAD7brYX1mXy8GZ7nAVVoHcjaAHvSAruHC9wisFG/9L5/cvMVEZs
	qRFHPISNo8YdnwDpIANDECiSQyZzypyWTdB2E=
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185973281cf.25.1778268451626;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185972601cf.25.1778268451066;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660ebsm756622e87.64.2026.05.08.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:27:28 -0700 (PDT)
Date: Fri, 8 May 2026 22:27:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX10MKncLEnmm9
 nVqDXoQqxw+pDTpnc/UBnTWCu8pdDuWyoYTMdeOUfoRClX49WgxT2JKM95qDcRFb2flX7QR5r9B
 1Sxc3xbfWd/fH18G3xyJJGVMIjWyZ/k6BNBADQ++uCeDFctq8rigKYZaO1vhzz6Ku5+j2EfoCIe
 Wvv6gJ0vIQDGnNAsYvrQjk0Zz6biOHp1qdNqipY1mV67JUy1hUSroTvpuA5SFfSWfl8Y8G8iysj
 05rTMjXrWIJao+C0H7Ehb4MuBoWVsGUiiUjCDFwUL3Jh9QpmY2kPN617C4c3RBrNp+W2eyJKARD
 SVNmod5NDsBcIjLDzqBB/3bxi+gwOwUBLSe0gzSvrdbcNRiL33fGHoHmwykvIXKxIS+hcwFWtEK
 MS7dmGa+Ihf+0JJ3RcvSCh9dSXqZiguYhdH2ctOy3eIbKD29xagCQ6uV2NI7mFA69C2HqV9sgyd
 8xjoq1Y8u97+SjUsHBA==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe3924 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mqQgVc0qi76843LXJscA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ZEax98XcptYT_1hPq0CxoSBy4soJhuEn
X-Proofpoint-GUID: ZEax98XcptYT_1hPq0CxoSBy4soJhuEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193
X-Rspamd-Queue-Id: A041A4FB195
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60961-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",

I first wrote the comment regarding resets. But the clocks seem to have
the same pattern. It's not just "iface1" clock. It's the clock for one
of the cores. And there is another clock for another core. Please make
that nicely named.

> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",
> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx",
> +					     "vcodec1";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",

The names of the resets suggest that there is single "common" reset and
then one reset per each core.

> +				      "core",
> +				      "vcodec0_core",
> +				      "bus2",
> +				      "vcodec1_core";

Are there two codecs? Or are there two cores? Your naming suggests the
former case.

> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-655000000 {
> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,glymur-mdss";
>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

