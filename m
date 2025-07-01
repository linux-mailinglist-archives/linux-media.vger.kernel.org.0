Return-Path: <linux-media+bounces-36403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4BAEF5A1
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E04A1BC5DD3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD018270EC3;
	Tue,  1 Jul 2025 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpO+o37z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11926FA58
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367180; cv=none; b=VB7btX+bV8zOSvrjho24XsyyZfDQUEDS0sQbrCwrXF2CORDM4OD82+o6eC7VvbnplnkIgseenCRwgBKPlK0gDCGT/rFzTfrga7SfEO9UDdTre0I0jg25wHNnLgJBjAWxLZA/ekmONdWf6q2GYdxCrBBIwQN6y/ThufStDgQIINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367180; c=relaxed/simple;
	bh=kR+ZkS9e9E9ecNCnSafkiQB90cSgCsUd8H0SkECdtdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z/AmxrFWqhQWlF4ms+M1MtuJzVveK9Igi0U0/VXE7LNdasCH0sjiDmnUJ2I/rLqNi1G/HIk1zF1RK1LD+zos0aaEuGPF9bwuxoDxzLTnuSQNegjiK0+b+OL2nDtj+xxyWYAPulgQNmd54mD0ZDOamKWWu0HrPUToPxxf5QNjXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpO+o37z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AUMH3001184
	for <linux-media@vger.kernel.org>; Tue, 1 Jul 2025 10:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxbRybMavykaO3hOyS4gFxOqBrYNmHEunWQ2+lzoQ0E=; b=kpO+o37ziGhx1lEN
	mP41qeGktyBF4IN4ceoOB+k7fMbgsFM+m560HEnRYfXI7hmRzA30Qy1NEfXwgRFu
	kTasNqI1WbpXhNGg54e9yP3kj/nnbyx3wbdsraD/DboBVdBTsw2DHuoOODMmMciZ
	s/98+J55ThxB/NPQfiUzImrOnZOdXmbxc4a1nc5WLKGq6O3GB5K6kJ4pRdPev+xg
	oseFMBnqGHMilSsBiowEdXkiH/xHiOsNDzFUDj7f540+g540vk8ELJsFUJQHz2wT
	w5lMMrKp7FuGyLar2RFXspy2VFB8B93Ne8MMpH75+pwbHPClyNd+e3onRHmt4V6c
	1Uu9Vg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm8h4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 10:52:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43924a1bcso8398031cf.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 03:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367176; x=1751971976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxbRybMavykaO3hOyS4gFxOqBrYNmHEunWQ2+lzoQ0E=;
        b=w/RMr6WPwub38BvMgznBPBLnQ1wVgeas2XgkCcd31huFRSSymHk7jvF0Rs0OJ9xv3M
         Lem4VvVYalkgEzf3dN/2gi+K9A47uf6+2/dWfFdhMBN0lW4mT5k7aznxOuHGgV0DKWDj
         wWLKieeccAhijqpi9r66vnbbn74Qopft/GLyHiRL05YQprtTzbNARBWYU24lKPWpPCz8
         pubqYOLYmmTDHpGxTTNmw1xbDMJnLwvEMa893p84LSvAmTrLE7XIomxOwtWbpVLq1uLs
         ETJc8Q9Bz/iXFMSdwD6GG0ox6GpjZjenIuaG9qPuFCB6/gwPcq4r6QprXcCjJwVW14TQ
         YuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzSTVyw9A594kVnodpftomxhUPYcCcSq3qd4WpU9xreTOkDX0UCB9SREvAi+iVAxgr1dU0j1e+usMEqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaw0umi2kB1OYZX+0/wz43ZT3oD3xxdmq0r7IdV+cibrNWMeet
	0nlR0tk3TAzrn/rCm6aQK8rqRUAIUi0eBcA3aaVhL0Phj9vn/U8AZHiBK6X47MaiaziiXlYQiiP
	0Ou7IEd6UD7s9/LilkF1kkRRtTyrvr5QPNHt96FHK3b/c7rY0J+4PIhu88HErfLArww==
X-Gm-Gg: ASbGncufPoZLc6F9G1wFl6PmNBE6gHl6RKQAjvAolCmgNIq6oUK1u38qLdi0A1QhInm
	i7d/nBkWzkslQvcrCRN0OfrEwL7RIxFhjYDhcdVenULQXK79D429C3x0FoEv5XSp961TZ353W/B
	QhNActqsrFkh7ShXV1bswEVk8F2K3FKHBzsEtiIDJTDg6NoJjwhSAGudMOPrP/a4D18NtzcnidP
	E1x2Y0OCJO8dGscFQpZpcwppTKGvbupnxyCpFluR0XW3W2QcxMEO3/IghCJfnSLdTpVUlm+H+3U
	x727CVoPy44sqGCcMwoHlqltgstsVeTfFw7tb0SQCu/vjyfPQMIYyCUQ/8bcTyIWhc5BAA6kBwC
	8vIejyA7n
X-Received: by 2002:ac8:5f88:0:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a82fa6dc8fmr15414331cf.5.1751367175884;
        Tue, 01 Jul 2025 03:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwuhymIujTpbLs+Uj+WN+K42bm42dkWUnlK1+8TUnmYd2rxY2XjyypP9SJRtzMLocaOTr6Nw==
X-Received: by 2002:ac8:5f88:0:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a82fa6dc8fmr15414201cf.5.1751367175428;
        Tue, 01 Jul 2025 03:52:55 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c832165b2sm7335176a12.77.2025.07.01.03.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:52:54 -0700 (PDT)
Message-ID: <b1567c91-9e0c-4519-b575-c365405494cf@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:52:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <20250630225944.320755-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630225944.320755-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6863be08 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=yHq2CAHK8kHy-pw9ZNkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: prxOFkmQA8zgG_CJrGcAI1Lmpy-KJzUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NSBTYWx0ZWRfX/Z3y2bLBm3tQ
 ys474mAuXWA91xpTqTzDuQ3hzzS2TXUVQvQH56mDknVw+/QDMOcoH6YsyeSVaDJ4TgqFwNYqvkQ
 z9GSFYKggmKjsSVZRB1unM3FbEJjuc9fQKMKKkuWm4l0TgOH5e8dAFGw1WjHU03pJQg9y9huf/d
 pVI7jJ6YLI+IErn2qTJV21PglHh5Phn88MpOLUxaj4amxWMorftZsk3OFQ2YUo5RGb7FU8SPmYS
 ywdfktLG/8OCCoYtSWIbcGiG5+jFR4rUwa3CXsoWoRBPn/G6/2KMVVrN8O4LiozcQWsSRG5hArm
 VSq8QlE+5x858XhAizUsT8N1iAv0OrUH4fUF8SCONO/mWqjBKbDV7U3xyVA3MH/+3iOa7j7T5kU
 szA9ttAxeJ+dErcJHETdpxJPcZRIIoWqqp7JvuTcEGvIl1bGCNa0Ed+GS16RCUzZRBXN55UI
X-Proofpoint-GUID: prxOFkmQA8zgG_CJrGcAI1Lmpy-KJzUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010065



On 01-Jul-25 00:59, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a. It is connected to
> CSIPHY1 and CCI I2C1, and uses MCLK2. Add support for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index d01422844fbf..0af6a440ecbc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
>  		regulator-min-microvolt = <1050000>;
>  		regulator-max-microvolt = <1050000>;
>  	};
> +
> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_front_ldo_pin>;

property-n
property-names

please

[...]

> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	status = "okay";

Please consistently add a newline before 'status'

[...]

> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		clock-names = "mclk";
> +
> +		clock-frequency = <19200000>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;

This and the above rate are in a bit of a disagreement..

[...]

> +	cam_mclk_default: cam-default-state {
> +		mclk2-pins {

You can drop this extra level of {} and put the properties
directly under cam-default-state

Konrad

