Return-Path: <linux-media+bounces-45299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DDBFD9A2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D19383AF735
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B55F2BDC29;
	Wed, 22 Oct 2025 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyuqzZcl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3629CB4C
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154161; cv=none; b=dpHehd1yNOkYS/3V8zPRO5/w7QbPbF63mCUZeZrF2xrB5DWgNo9dWW2sREdThVEeboAoiykZlisqkoRLZQiEbXliHeftVHosB217mxBtpWDxpQkKHU8oCv9M69d5DGhze8XlBxkb+X7Cf0AMx0a5A2cdkXEZuOcs/983UFhN4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154161; c=relaxed/simple;
	bh=dyHSc0Hkf9JlF3396d47TnH/fkxgN2mhFcVau1LyB5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4KYqJ0yIkvQj2GWSe6x+rI2i64oMMWZWeE3aV1FAel/qQyyPg78KzywH7P/S4gLZKKVG1Oo1oGnNKpI5jRi9Acac/d6Lj3aRQijtOVoqjfqdBSUAqQoV7uXAySuGnmfScGRWOO56cNN2zAlX3NX4wjK14nXEM2bh0iAOwTPtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyuqzZcl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9mmS5002519
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eyyrDYcjKGK47utngRF8H7m2HMSV90kJe50AtFvZfng=; b=nyuqzZclj/rzhlYp
	9CDYcsBf0gkB/79RfOhqhHwmoXl+sK4NKr6tPNnat7sLjhml+nCLYxVhgyaCtFu8
	HoV4sSioPH7UHAlaVUfRS6LFExuGVgKXHyM6isdv8S8kH9PpESGN+fan4RDNjnx0
	onYJKqd1OYHC8aGkV12DbP7dFqRxKPLI4eFTCY0LjzRm1KXCxbpt8ZVZyg0KcyA+
	I0WFYwKEVR9CQB0nEQdT7U5s1wzNfdWKyF4lz9Guakoe5c151DpJTa0Vyn4vBc3Q
	pOTDgo82yNVHXxuKwrZVf2pK1XRMco5RSMc4UgWO0O0fLP4UohT6LVktWK3JISvB
	XotrHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wb5ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:29:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87dfd456d01so2347236d6.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 10:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154157; x=1761758957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyyrDYcjKGK47utngRF8H7m2HMSV90kJe50AtFvZfng=;
        b=WJsyf2P+oBmQAzW4ViuxS7WdFKgbPJ9a5fOYFFHg4RGsY+07aJwRP7k3tEaKI/Omi1
         H5/GtzCg5ZMxvh5YFpU1RrTozHGuCU5I4m5zc4qrvdH//BGc/F0K+9SGrq4L0aS2ht7A
         /+BY1oh66DxbufSOFbZwmXDmHAe3C67QbZwp+fMSmbzNHaXE1oxhQdTChsXJtsb533OD
         sSwnFQekhPZnh23cz5FrMB6EBiybTTJkhnyJnlc55h2xnEA+LhUoALUzzRJQrQ5yieO7
         +UuZ0ly2KZk4BCzdZpj+JPIYCrujMznYhTQ3JXGZ9TgTnHs6JyBu/dSGRzA2LdyUX1qt
         KC0A==
X-Forwarded-Encrypted: i=1; AJvYcCVNbXhdC/k0H4AbMZLYTbLi6AOjeaIucJlVXkY9oGcKBuUn8RfOUTza15CsZZetNJF0VWiXQ9hVAA82aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/o7uosv+zN4TsapprdwLMByXotFSPN2opt6sdZokiAXE0WZu
	iL5MpovHo6P4YqdLu0WOIOXJN7dQF3PvVLsA3/n6NSSkR2LvRPy3rafgudSxZ4FrrOgoSSCle1R
	27voD4+g5f/LwqKPC1nACQjceE2dvkcZTDUwHgIB5WL3iOzNk1HRYYBPzFbTJmoR1LQ==
X-Gm-Gg: ASbGnctR/zZutdSImI7C1h7KsSv1RrUVzHpGvHeksHVtQ4RbnqRfde0fmoT6jVKPiUT
	c/C1WUxA7RMFTAhCXqtzTjxuCTc3nI25WQC2jVSgRPn0P096s9ACjLF6TrRBaPkxlL040P2JFsu
	O3+K3KVa+5QrTgZnUaUIkFWbtCSuJS7eLFfMH7dpzKi98y7Xve6MVr/5Wh8ErZJ40pS5uWXMAfV
	oOJearTGRPZvdqTlnNX2Q3r/ykyHaFfWyDwX35Zob9DOq2fIPQ+XQrAQGnyLZsBOFaYJ2zT9epC
	FaNIQ+CTjJqMjpotpgYA9cN0Fi0dZsyMakgEcrqiOnSOjef31OSokqnNG/vxScMfGYtcm2XH4S1
	adolqsypbFzRTbmmszcRNEvg79kQSHq7hqxu185S+COsfYC2WQZPW0cI4
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr66600441cf.7.1761154157188;
        Wed, 22 Oct 2025 10:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJw8MHnQwZbTuwNgN0otjEnj4HLV0d9qerQIspFAPXfhpawKwe+bMV3LTIHDxza9e5f9p0Ig==
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr66600041cf.7.1761154156496;
        Wed, 22 Oct 2025 10:29:16 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm1382273266b.9.2025.10.22.10.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:29:16 -0700 (PDT)
Message-ID: <c1d09672-e8a4-473a-88dd-fc91e81aea52@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
 <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U4nN4htw18GBDk3TkJp_heqQQ7T5EJ1I
X-Proofpoint-GUID: U4nN4htw18GBDk3TkJp_heqQQ7T5EJ1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXwnnkxxZWttF4
 nxXCeDFNNDxVF0ylsV1r9RxdwuMQPA53hbvfWLj/gLDbAg0BIj6idJH90WpTrMHIjQofydgZ0S5
 wRO8G7S3vm1K/zH9ZS8KMeoPh17mfqS3ceLLC7I0wpzXTR3cmxVW5feK7N++nYvqC8+9ucOEpfx
 JAFbLdXnwUtYkQYLS0U/Asr0F5NrEjgKk2hlSdvG3gNlc1S1IjHH3lrqXHbRhod70R8yPE7n7Nz
 6QXKv97hJ6JtwpOpEzu4fq94QHIty/eSGycC+APqpvQL/HIzviKgBminB7+1aWiorHg0ljzRIU1
 HoJ0sppau4dPzCCDXpn8zVM1zdvbTr6np62e5BrS0SjsbyzTGiqGoUVv8EY0cmHoxBjHB2KsYYm
 JqlWFx6hlS01mRcN9xfREqtmbP+BVw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9146e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=AbxdTx203xjBR5gTc4sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/9/25 2:23 PM, Griffin Kroah-Hartman wrote:
> Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
> back camera sensor.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -616,6 +616,13 @@ &cci0 {
>  };
>  
>  &cci0_i2c0 {
> +	camera_imx800_ak7377: actuator@c {
> +		compatible = "asahi-kasei,ak7377";
> +		reg = <0x0c>;
> +		vdd-supply = <&vreg_l7p>;
> +		vio-supply = <&vreg_l7p>;

The dt-bindings suggest vdd is 2.8 V and vio is 1.8 V (at least
on AK7375, although this isn't stated explicitly..)

L7P on FP5 is 2.7 V (default) - 3.0 V (which you should probably
tighten to the actual operating value), please double-check this

Konrad

