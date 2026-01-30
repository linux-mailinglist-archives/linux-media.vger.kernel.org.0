Return-Path: <linux-media+bounces-51844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAr9KMutfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:10:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E5BAE3F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 620B1302D0B9
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7616230F95F;
	Fri, 30 Jan 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYK5XYgD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUqtafnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642C2D7395
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778608; cv=none; b=FzWqjJc33Mq/CmYa0F0hEPzh4ZhtLRy4jY7J5l5sPwDQiEr+4okJut1f/WjICcQO3weqGTFousX0M+toqnVWeaduUjjZ+zknCWsNtdQKXXrUP2S9HtRJDliaJZlCPRFfI1V2UR3vtG132aDak2xXZjz2uRem007xvlwr+OWS7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778608; c=relaxed/simple;
	bh=ue2pgGEPVVqzliJDap+usjW5cxaDJgNFBSSXKcQYC4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSZFiDKHWIr1bmmMyp6+RwXLaC7YzOGh5QLx57t8vn4e02CpUIH9zoEyFGLBflKNAgazgAez2XkaXZ8nGKJqaS5gy2/9f6iGYvpP5PO8mIrPVuw5ak5OdoZb/NRal4J2OM4jE2KRyiZWXCWybEoO/uBcUxBKdfSL3XIxaBMJvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYK5XYgD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUqtafnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAlcXg2992837
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rl+xUCphXEtVtqu6vckflZwGiaWvY7jjVvtcp3DZnHA=; b=IYK5XYgD2Qy8X2Ww
	aHLu/+oN+7OraHLq7I5xSXPtgrQm/w+IU9T2DsH/bA3eQAmrPXgYClMAZCK89xPL
	/qIt/6xb1ilkrHRhKUH4UwZmsassa9y2gJtkJdmSobe81cYIYp9lemhg8cKbvIWf
	lbqQa3OiTnwDja2CLc0/LPHP+qAp9ZMEWCzlxApFpqx/Al/EEc6bCMjNwHiTTx/S
	jJA8GZeys/am0EBwkS0Mgb0lubbVPP+m2brkGfTW0xtcC2A3uxFyeBHXud49gYF9
	lWY7z0Eox9haSdx5mP9gqljQW39Y5PzNVPlvPWag4PIhxeROWPbD+IB5EchvbLG5
	hXJYpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jvbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:10:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a8c465c1so19704745ad.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769778605; x=1770383405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rl+xUCphXEtVtqu6vckflZwGiaWvY7jjVvtcp3DZnHA=;
        b=fUqtafnZrJ7HejN5RdfxTXusiELxLwvIwIGCsHSZnj7nD8kQmRFZtupi7KgxuU8LwW
         bA4Bx+qFkhGRJ8AXJ/OWzugOzih1VbLf4tYnLHqFhHZ3H9MyAqVefv4dW/1muo5sLZ8Y
         146fV47IYgsB1DM/C1hXZnziuL3gvyVdOj8tqKzcCvbxEfwRXEVSc0isxTfg/YgmvxjV
         Dr1/Ki1mxHspdYaSPCsbjeR3s/WDLoth/zzvpfUQ9fyDyU6wCaaoNVwJj6o63bXbSt/U
         GKiUANs/nokA9uEhU1aY5iFUVx/2ezD1xQiSz+AINfWmEGpJ0zDkJnQSVv0L1BYZbCJI
         FvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769778605; x=1770383405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl+xUCphXEtVtqu6vckflZwGiaWvY7jjVvtcp3DZnHA=;
        b=QQmrHDBjPOuny+rC7ar/qdvtz1daMm+3HhG5LURK46Ce0HPVFWCBf0BIovJF2+7qHl
         KQU5eQp41R1mUQzxpc/K1IUBwoHooa79f6KGlOekFdluDn/D0MqjX2Tf4X8VJdYibXVo
         wK4bWCVBvn36ed1HOM13dWfRkDwKXITDtszf/d1Oivr2J/H/OM23yl+HqHMK9J3ZO9vv
         MtiVerIIRQyfBmqCLcRbxDX42ioGGtJemEh75BmusIy5Yvm59oOtUX4mWpw82+uX+O0D
         kKmy4WUDC3Q6QaFIOtex7RJXlpJGbEjC1SWX/LKIlkHeK2JMTaL7rUpf0LpuKugIK8ay
         9oZQ==
X-Gm-Message-State: AOJu0YxUon0wz6bHtaJFwwgXiXv+2km2G1dzriT/kOXbUawwXrh7JkrG
	5uCRCKMwXq7tHNyCg9KTJ24jAH0Wwldlr69uWFu90WoxWfxxe4t6mSIIEPWUSBmZRwcsZOYeakD
	ha+M0dLHIpreECd+W2cp/HtoI46HP+YD5TVxnzAEP919er2bmwsBSRaEkxk1KINFupg==
X-Gm-Gg: AZuq6aK4Kk3SBwJgKyIsFPfw4c5IT0PCDC//JtLAZGzzQL7/wPSZsyH3SGpyp2vAaHq
	ZdYp070tTbLutoqqGE53kghb7uMBLKGM0e+G0kjLkdP2mpAiZ8O/LSOEDraLemki6j7sdRrD9cR
	NfMUOOzFTkzeULGzc6SNvFbPKhMp6oYbFjSvmiZX4e5KMAjJ48Zj744Bi8w3mYHP8ca/MSUiNKQ
	JeehglTLPG5nzkgJxaumbU+tQUoKRsa3tcGdTS8KVUyDyRTTiJ1XS6mLCTbT6agKHNjlL2DptRn
	BnBLflOCw8fkBZV47tMRF/+gyu7xs9Zj5/cVeGpBfvB1ml1FWHXcw2zmD6/RSaL3+px7rGWhAXN
	w8sA+mGJrwNB9k0y/Pk00wN2eZyP+Z9tkR6xVNoI=
X-Received: by 2002:a17:902:cf43:b0:298:639b:a64f with SMTP id d9443c01a7336-2a8d96cb2a4mr28296455ad.6.1769778604634;
        Fri, 30 Jan 2026 05:10:04 -0800 (PST)
X-Received: by 2002:a17:902:cf43:b0:298:639b:a64f with SMTP id d9443c01a7336-2a8d96cb2a4mr28296085ad.6.1769778604007;
        Fri, 30 Jan 2026 05:10:04 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e5fb0sm77507525ad.91.2026.01.30.05.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:10:03 -0800 (PST)
Message-ID: <de31dd12-e9e6-f1da-c0d4-498affbb3e59@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:39:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: Add Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zCQh2-TpwuPmvO4aIYx4pBSkUPbyBSZN
X-Proofpoint-GUID: zCQh2-TpwuPmvO4aIYx4pBSkUPbyBSZN
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697cadad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=etHSnHyIjY8EvxFTglAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwNyBTYWx0ZWRfX62NqYO4H7ZFN
 POBLpyDo2tkS6skUcD5LV6CZkzN0Df17R/IG7Ga4kurqtiJ8z2q3jAqSaiSz4hbwFMr5ckcuhqC
 W5Y1JXOi1j3M/fhb/XKzXziEZnADicd5Klue+dfXAA1hhfC4ZrGIpQ3BVtsWr3dcsYfcNanBbtM
 6XSPe+QsDjPw2/acqWi/HYJUqtHXPkrhAlt7Yw0SHcyGm2B708aWjtI1Bv0u6VMjl8vlulB7gMH
 Ox1Z5m38kfaonuB3soU7CTXfLwr1fFv/YSCayRYr6LGsuYorZnG3XA2flOKrn7DjNhmlbSAGDUp
 BZohNyduSux4cVzTKNOG9ApzSFlc+h71qVWM0kGmV+UPlMVn7mDIx/XAcd9L2CHPFOtooA2Tfkm
 wGTogqtYh3xY3mdwxxNSjEQf5FAtfiQg3e4T66BKLI6Em3nU1AQzY5K3gCaLBNkO48ExHi5i2oU
 0ucVZ7QY9Oxxc3R4Dyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51844-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[86c00000:email,85b00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[5.42.239.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C3E5BAE3F
X-Rspamd-Action: no action



On 1/25/2026 9:03 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add the required nodes to enable Venus on sc8280xp.
> 
> [ bod: added interconnect tags ]
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [ johan: use sm8350 videocc defines ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped video encoder/decoder declarations ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 89 ++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 41c57e7dc433..66a65ae50f00 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -10,7 +10,9 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,sm8350-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8280xp.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -691,6 +693,11 @@ reserved-region@85b00000 {
>  			no-map;
>  		};
>  
> +		pil_video_mem: pil_video_region@86700000 {
> +			reg = <0 0x86700000 0 0x500000>;
> +			no-map;
> +		};
> +
>  		pil_adsp_mem: adsp-region@86c00000 {
>  			reg = <0 0x86c00000 0 0x2000000>;
>  			no-map;
> @@ -4181,6 +4188,88 @@ usb_1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		venus: video-codec@aa00000 {

Pls name this as iris instead of venus.

> +			compatible = "qcom,sc8280xp-venus";
> +			reg = <0 0x0aa00000 0 0x100000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +			power-domains = <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC8280XP_MX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "core";

should be names as 'bus'

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			operating-points-v2 = <&venus_opp_table>;

s/venus_opp_table/iris_opp_table

> +			iommus = <&apps_smmu 0x2e00 0x400>;
> +			memory-region = <&pil_video_mem>;
> +
> +			status = "disabled";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";

Thanks,
Dikshita

