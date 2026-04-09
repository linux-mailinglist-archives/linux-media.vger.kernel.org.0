Return-Path: <linux-media+bounces-58303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGJmNHJA12npLwgAu9opvQ
	(envelope-from <linux-media+bounces-58303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2953C669C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D420A302263C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385FD3064A9;
	Thu,  9 Apr 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqp4ZaJF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5KMEUdu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FED307AF4
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775714403; cv=none; b=u+t7spTqpi3ZbhvYlg25S52bSQ4Mnoox2PDFXe+Z/eX6obNCbaIB2bCMKJcpIDJ9iizh806n8pAwZoWpmbxTztshnpz1j5qBsgQCEWRotHW/Qt0863Iwd5hZ02MBN3dCtVU9qkebb/08ZXqq2nHU9HoEFyPU4RoZjdZDr0VHhnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775714403; c=relaxed/simple;
	bh=TeKtP1yzcdqHSm8bYl3L49aEEfB80akZ1D+/9j2g5WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQdx5I+mcFGMVMte/5irRzJ2WF4Qu+i9KBghRGSUZVgFO4NhwNdFyAfQ03sUBR5r3HNiMQAk08QTJEsya4MUAT7NhNORfzi5B3J3tUpM4ubaYVcbR1HujcIvziobHxM34WMW/9zJ28Vb47nUoMmZyxZ/X4FdiJul2O7DnPvx0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqp4ZaJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5KMEUdu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CUMT1727558
	for <linux-media@vger.kernel.org>; Thu, 9 Apr 2026 06:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7rGEUf7FdQ+jVzulDMjMiw8+lzQ1/zu6mbpjv295J4=; b=Bqp4ZaJFTZBXZMdA
	xqCzX97STPcevwu72wnZnUL+/psWeIGNf/JAzF4irunS2/4sOE7oHeQSWL/B3wD8
	hssfMgxrJOsrxYh1w26anup8CNw7Ia0zLYy6F6411zAC38kxP6AVe7NkiYcGIdc1
	FppkhWQlxZMysawASAtfBzhMH/xdWwYd+nUTH/tiiXSIIciKg2EMJ6mfQEE7cmjJ
	ZdyIfNON1YAw5X6Q741L38qFE+kdlMeOfQOOTryqU9+FopcFZqrvRL9ch8vpdwFK
	te0QQOEzrZMaV2C6NsGeddm6rtG3tl/mLGwpaVhKyGIebOcdx3jRlNLr5ShanbG/
	/CIlJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrsss3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 06:00:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso774414a12.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775714400; x=1776319200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7rGEUf7FdQ+jVzulDMjMiw8+lzQ1/zu6mbpjv295J4=;
        b=J5KMEUduBEqn5+/8xN60d2Ka8ErW4AY1y3Yiyd+6I94fm8mfCVLouj6vHV+s4nUpC1
         +B9ZCyyeSlofprvaZHYFtv5tYX0t3QB75stLb3EGw6TeJfHO2QQd/AyALpGPY30Pfgmj
         ZqANUrVIQMV6YdOVF8E25IR/0TCKH4xAxlL24iSIh/GiEd/2rGblo9MGocXTzbuvta++
         RmPKRMQmtnn7iyFk/9Uh7yYQ8XlrWzhW3g2/q/ZkXcHctQEsTVQDBFu4+TOT8rjU9qKK
         q9QStTQeldH4f2U0gEKGv5ShJ01wXbtqfn7RVQxdGevJnMBqbPDxSbiSRKlH7/TkTDFX
         oCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775714400; x=1776319200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7rGEUf7FdQ+jVzulDMjMiw8+lzQ1/zu6mbpjv295J4=;
        b=Tlj4e6O3nAj+T6/ZTMme2voDY0cAHpjms84oEdEJvIWb/FuSr5cGAjyXH1MSL5AQn5
         UxWd+HAoWhzsvuv2AqZ/bRFtcYPMXDbJemeNpHEpmbkUAgJuaKxIm6mZml+8lSNYhW7Y
         kf74PbpFsoc7rt70Vhzd4btrdRMcLcZHGUQGjif1stMz0bGD6E5OOObkhBlpZMSN+inW
         oz43omzd0Je3H2M9gf0rKqPvXm6FTStpmJ2Tbh6EJOzrrzPQn3B+sNKcMwjz9zyl/G0x
         91K+9IbO2Qliopm2fF5ff4gwtLP7rCKJiBkzBuZu1W/Jv1UlVwzCT9cFQWCo+g/FD/7c
         8wwA==
X-Forwarded-Encrypted: i=1; AJvYcCVdmcZlID+oxq0YyUJ4+ERWTHSkbcrH8XmOpLM9kLuq0m+zXrXvFvdQbaKA//pWw0ze9pJ2wU4ZqDnmMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZqS6qRsO0VLFNmTlh6PtFUgjOvqCu84UlqI+zmSSQpPz1AGS
	+aT1jI5Tk21TmiWGurqGnTHN9YhPpRuIuxiUBtcqO6Gn6Drh8NjN9/37Az0y2ULZ3i7g8dvk81p
	97mN5ps+whGQGhq82q+dmKNnJuy+iSXMbIMVMbNCP/GeDbGH/VVCQj7DYo4fTkC+SkQ==
X-Gm-Gg: AeBDietFVhMQwBxbcuhFTWG2PC0ICJ3JMzzl2mtnXywle93wC5qy4rMzZiPjnvdPo2e
	+tkuSrwTPdQ5UBG4261Mx6EZGxYFSSyvwzOnY0pJr7+TjsNSyGZ7AxthQv0Yi9YWXtWCl4A9a/0
	K8S+jLDVS9MC9+8Vs+4qyA0wSl8U+GGJh8teMPpjqdCPqc2PqcGZRilFC6TKVtM6WdP0XSS2Bqw
	zsMXYVn/Am98bA9HS6JtMMcg5gRWgm2/7oHKT7wmrL8TqZRl9aFv/NPa0P/rrooxQguW7Wzdc68
	0jnhAq0tWFPwWwiSycFwMka/SjB3AndrdzwUFKeB5qLKXjf349s/RGqZGOyrax3WztIRwusD9dN
	uOklg93gmhoZBxWLGN/PjDndXOG5Drr1E/+t/kHy3eZMQ2dcKUrYR
X-Received: by 2002:a05:6a00:1a8f:b0:82c:9897:70d9 with SMTP id d2e1a72fcca58-82dd8afc99cmr2540705b3a.38.1775714400090;
        Wed, 08 Apr 2026 23:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8f:b0:82c:9897:70d9 with SMTP id d2e1a72fcca58-82dd8afc99cmr2540685b3a.38.1775714399622;
        Wed, 08 Apr 2026 22:59:59 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm28876905b3a.53.2026.04.08.22.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:59:59 -0700 (PDT)
Message-ID: <aaa93349-dfc0-7dcd-5182-73c8bde9d475@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 11:29:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Content-Language: en-US
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
 <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1MSBTYWx0ZWRfX7lxv6xf7ShMq
 VR9QcV1aH1mVwAcdJeXOxVp0FcOCeFn7X63HVnfxfQZiUFCgjo01cIGFqzCwPiCZzeJaycaGmzh
 GjHLD8F+LVrdtonZ9ygRWer2OWRNzR6vaczF58+CrP0Iu+3TOTYAHoZh5d3nZ//kbpHZN8BTzbh
 iGDQ0MUt8n/MSzKUiKwyYS2hoBLwrfjYKaVhghNAHFLbwxdrLweykHmafj896L1vjHfLPJrzBjI
 WmXFKsNhcULcvbmelG1+un1gzfaLlTMXUQOWqBVWkRJsE58faT0nhM9WyiSQy/W6njX6KtjAfLa
 argQuDiCPWkpATWSh344kbjMWxHcNF9A1HQHGIMxDpittLB4OkbaXTIsulvqS9ttM/Tqmsm0DAD
 eIcrIbQxdBXd8YSwXmO42RQ7mObt9ADrl6+wNpdfvVIMZg0FMm80+NDccvScj58mAgL4Ukmawxf
 p2mI9oJ5uC043mdF8EA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d74061 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/ZU3Ovutwf0He1FzxNd9ng==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cPBJnOxHEKv7ehhu7hMA:9 a=54MLzQr2lWRCTzmv:21 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: NYDX_nsFiH1VgwDukfWKl0AiRUzoSFxB
X-Proofpoint-ORIG-GUID: NYDX_nsFiH1VgwDukfWKl0AiRUzoSFxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58303-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F2953C669C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 3:49 PM, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..07aa398c9695 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
>  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> +#include <dt-bindings/clock/qcom,milos-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1517,6 +1518,90 @@ usb_1_dwc3_hs: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,milos-iris";
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx",
> +					     "mx";
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names = "bus",
> +				      "core";
> +
> +			iommus = <&apps_smmu 0x1960 0>,
> +				 <&apps_smmu 0x1967 0>;
> +
> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only enable on
> +			 * boards where the proper signed firmware is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;

s/rpmhpd_opp_low_svs/rpmhpd_opp_svs

> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;

s/rpmhpd_opp_svs_l1/rpmhpd_opp_svs

> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +		

					<&rpmhpd_opp_nom>;
s/rpmhpd_opp_nom/rpmhpd_opp_svs_l1

> +				};
> +
> +				opp-552000000 {
> +					opp-hz = /bits/ 64 <552000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;

s/rpmhpd_opp_turbo/rpmhpd_opp_nom

Thanks,
Dikshita
> +				};

> +			};
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,milos-videocc";
>  			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> 

