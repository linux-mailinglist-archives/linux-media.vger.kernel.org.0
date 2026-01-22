Return-Path: <linux-media+bounces-51352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I0OLyE3cmmadwAAu9opvQ
	(envelope-from <linux-media+bounces-51352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 15:41:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17786680AB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 15:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5823460B389
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 13:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E8B329373;
	Thu, 22 Jan 2026 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw47YnyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKK1otCL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E5322DAF
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089502; cv=none; b=cbudC5Sdli92K07fHsKdf1/8mpCtkATmaItXxtJJFDfWEigMILigkIwcLz7oaTYiggxdpFGtyB3gLAcD31tr389Daukiys3wID4Wra3rZz+/C/cOtXeXM3VyQHdrjOXOLlqY0WYJQoU8eTMBAd3ifrmx0eQOU3gsV/PVlnGs+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089502; c=relaxed/simple;
	bh=zvCB63LFnEjdtIx6luOoekU8E/I0ECmc0pzAnnziwXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhHVtAsC6si9YjU/AjN1/Mbq+Czt2+aODWdX/sSJuHd9V+31i4KpqrfpF2COm4kdGthLVVwlARTtvWsm4JZG8PjWMOxdq6dqmIbLFKNypykQ/+3k40kr4p8fm1GQaLE3vVlkPYTaUwbESL4WBNMWM1MiO5cTLITX+wNzfh/M9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw47YnyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKK1otCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7NJur484192
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 13:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=; b=dw47YnyJtrDeJCM5
	wJYJ54TRymRwHwwKJneOJjUCyGQF9JLqOGdsQpImL93qHBZyvkqlUPDhPelYJ38s
	tbxGXr5uRXFVurgQRv2doRWiIMpZIqGI/xpILS9N7kBMyoFnHcANuS/ZuN/GMJBA
	1b1kyc/CycwTZ8q2rKyat7HXK2ebm7xYkIutV7/7UtTZs2OPGz61XZj48PbITt1W
	wEc2uFvBSVorZW9d/RROIUZ/3cVyB4VncWVCqsxm0MiqfThK4nVzdn3c8LDhmXez
	s7AXqXTcGET4VdKqSe9Z2l91enRGMQ7EDr3HpTzEponiD9dyNg7xfYx1NW7XDVWm
	V71cUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj2mws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 13:44:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b137e066so31578185a.2
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769089498; x=1769694298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=GKK1otCLaaLaz4OCFytQ7tM+vIisq4x7MexhXzkdrsENx3Z2+XDxqM0K0v+ClJ+gRR
         2XKgOIV+B9QnE0RBglD08z/gjdO6d3dJNxeh++cuOmSYvpyPvj2Wgfb+AExSzD8pYYOn
         nR/QZLYfrduUO9OMSN6B7db6ZQR5jxkOvizYVj04yWOE6uCLBA6U7UYRXQTv8s+uvpgf
         fH7AiFJEqGaP4k81arVO4pcOrxqQ0umUTqZlle/Lg8fmZIX0tzAL1S0oCgIyfI1kTpR8
         dd/YrcX3VBE+GKpuQrOz868SLIo5rcOAaxhZPB0n0cs4Y0P+CwR2JdsqFwK0wfq4DhzZ
         woQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089498; x=1769694298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=ZLuRe4oKQUtcGErJgmcd/qy2QOWePwg+cvRqnwtluAYpeMUeRsZs75v3IHCtZvu7tk
         50CLQxrjsqqXH7VcPnwCmtGEN68EcR9yPZW7ajkUNGbsjb8aBBZYxPfzgKB1QzMYxIGH
         wfu9H+VB1evYtzvjl74XbqRtipIYTutTru63Y8B3mP7+mDlFiB+t00oQGA2ZLmwHwIgu
         U5ARTOfbB7sm0zxxxFTiJDZ6tDe0RFiHWRjyToGuP0dSQnPwDFFtvM4ZuE2tVGOksFFa
         rJ+hXYPc5I5yzM967PfpTACeWmHrwiw/Gt98fFBi7eIpFko0EZjkxs1nwjEHbSWsBQOe
         Xb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWNu+srxB7KDTPp+We3axKkyLZ1dLLUSo5Yqc3l1IouSNauIxJUV5KQ5zHwvDdP9p9gjRPFHJiq/fPpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjrKp0o76VaKRoc8zFhQfTiQuPhmkdH1i7GBL0rz0G5qm8nB3
	M1BGKwerEE2VOxSJjNKeiFvYVFIHDRWxyIvNZeEYVuGXlpBhpQDFOvJ8OpPF4Q4yUeatQr+erKh
	dM5Zz4yBkpfQ7LrhaqgA2KTxqvYAmmbh02cHAq8Z0O3oBWkGXzk2EoTz4lTvAOvHdTg==
X-Gm-Gg: AZuq6aJS02A9He6XMJ8p2aQNoq5LrsyaZbwdz3zbrlj9liOlFYOQZsnMlu+MnfCMpZl
	Eh39eZWX6PrwgpiGgL3zgTI+uJHCRHtMBQXM2RLZCR/mJn1e6Eye3MT0emFo2vahW942gkQwkbz
	W3KpcNuTV3lVJqg62mn1muwGWkdInlpnEy4zLrSYz+Bw1PxmLHGrpioD3RGp6FvbLMpz7Nm5C5H
	YV7rRbb7fjCmk3S+txDp7UnFP4hS2MGvD2tA+p+BXk74X87emA4jG0tK1lPGVQ+U1w8svYyuvtY
	XWNMlO9PddjaQNS5NegHGszrSYilV7v90bv2ClA08TXU6cuPddN3+Cl87j26RAx1dy0DJ7MGBYT
	b2pjvekI8CwCTt304kEey1sowCo5/bpe9XRHx9Rx9uPTCk1Vbu2Tc6SujSS567nx6PRU=
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200108085a.5.1769089497720;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200106085a.5.1769089497144;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65831de21e0sm1129568a12.28.2026.01.22.05.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:44:56 -0800 (PST)
Message-ID: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697229da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fwfv46HyQb7ozjPenEcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMyBTYWx0ZWRfXwMR+90f7UhOT
 YoNRVVbdnIHoaStiEyCNWGO7HDLdnleXz6GLcnapQ/Uo+QFnaoFNjR9Nc69nJEG75t6+QFmJxRr
 STkrzS4HWIBZ/Nv1IcbiW2+qw726xmT3XJL1qrIYEBlScXnGIvOPEDj3BKxj/Luem26pocnWzBC
 OkcQs56ArOrgYY8fl3BiMJKEw8U6z6hJcOgC8YUTsOTzJWgC5ISSZj2ZX6BoGTth831fwe/mEGf
 5YNY0EVUpu+sDcwEzBnFMk2yVdikcG2cTed4pPfl/hdyK05XoD0tjPEGC5Qiw8uToUDlsLI2RIe
 eOljsqzbGJJy0GR5aLero0tNySIKviKiykvTr5+vx/SIL8deIiJJe+fC2QyjlymNph2vjoj2jP2
 aCnIEZiUYBp4USKShJA6GIrFrNf1apn2WkFspy4LjzV1ux8jF4RBWZpdccGcFbo5lah+9hFREFX
 a9tSJ2e0JuYPXN/frJA==
X-Proofpoint-ORIG-GUID: xXgppSfAGVRmSvVz8TIYqG4PkYku3hyC
X-Proofpoint-GUID: xXgppSfAGVRmSvVz8TIYqG4PkYku3hyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51352-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,1a:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17786680AB
X-Rspamd-Action: no action

On 1/22/26 11:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;

Let's define the pin settings for the reset pin too, otherwise lgtm

Konrad

> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

