Return-Path: <linux-media+bounces-43949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296ABC43E3
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77E094E6040
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61F02F5339;
	Wed,  8 Oct 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6+AV9lp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26432EBBB7
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917896; cv=none; b=aqoziFHRsCHnbTlEH8YL7WifkvjMp9q6vkIEYz6tu8eA+my1GCui224YeGiEsH1Q181U/c7wNbNBzyBBO61wdaPM9CBDkGgFrbGpOWGC9Dil4QQMdmWS0CtuuY3aegiYarpNDiDffKM01powBGVR1r68VKGUSfI3y2biPmQgh6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917896; c=relaxed/simple;
	bh=4XxJdtsTqZl/7D7l/ZNAwdjtgFJn9LSjtG/b7mIZlYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqezrKaLVy3bQv+5OFe2l3bkiEP5rv6p4jxHwkHmDHwzt0GCst0sY/dQQ+9zgEUPa23fXAk5uyWZjnfHilQOnyEqhc3FVjhSI2b6FORlrTBpgLkcX34yr4Qi20y6ve+X3bvYguWFAPu2gjurqmrvZyDNBQckbvTwJVYftX51lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6+AV9lp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890P61014215
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 10:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=; b=M6+AV9lpMWbOcqt3
	qjpBnBgUt3+kUBPMRX550vY10O0aukIcpELdeQNvPcMa6hu50DPTf6IVHpBmJcT+
	GjnR3323XooBNylzLniaaikE0uzTgqKXZJYmevNo24pVhmoEJrbyUsli/NkbczSR
	Xzn5kzt1kG4fSfjzDVAnAThFTeglYuxKcW/VL2WLEqPuqpl08r4Hs5wZBjSumx6u
	5QFIFiIKtxFGTUhkBuVyPR8XTJ3l4+cRl2mKBAh0aKzT2Dj0MXGhYea3iTmmk5G/
	HQa+kOgIOc5lzvqmAZTewkS8xuMIOWJMbg3cPgnzBNwDfU7238zfeiyxshzx5/R9
	wD72qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0nsfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 10:04:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85d43cd080eso227741985a.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 03:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917893; x=1760522693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=;
        b=HYwmLFpLwwUM3oqI6PpQ5Ujfgw8cuz4MtV2C4tx/IU61jmfKmGE6m4UWiyObHIGITP
         ESHAY8+g7L3QlKjPedVlC7wZJsjdmQFCGvhFa+F9r9IZWvsu7aViqABfFgBoC9SHZx0L
         seOetr7HlAB4BpkO9HpxzIVFY+M6/Cb5zIp4NnOtzZNpgBNmHO/FQ01aZdIpKnI9ezxY
         /ShZmHwW36FEsky7HIZGBpgZ3VfCggcBbp5U30P7EKUKsd3baN4vpXQpbTx5zmKhEL8T
         SerKgfwrjvvfFi2a7uq5zbqr8p177urOYTWg2Yr5KdTyVnaR/vayVqfSS24P0pXh3kn5
         5Qkw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rbuFZHVWhucVHvK8cQR4vApvGHUVkWw+PRR5L41rqxnHQfe5OolIqIE1/eDXZgL4Wozk+sEtxp0J+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCXcArGCYkr6EeMIUmzwgCeFOaPWc0mGf0JiyaPgzl8cOTJX0
	cvTsIGsDDzlVejx1AUwMZhbduYLRDtN/nM1uWU3Yr4nF9tt7Pyco13xNB5cPIGX0ID7ArvM6hzH
	9HZncYmpKGntFlRV9ruFtNnl7y2HibEqntZpL6bbCuj3MPJRFWNzPs4heG56uAIMQpw==
X-Gm-Gg: ASbGncvfWW28FWb1xYvArv9HVSJrKwzxUDQaSaTOj0h2SaCip0AhuM3uBzjSFiDcvBF
	8Zp/8HSTelOWFl2cpHzl3n6TXWAI2yLP/7JZr3ViMF2UTsDxNDhH2VXsLnjoi7pDWoYpLvwqcbc
	5xYQgei4uNvBHjUtDtGx1+ji8fKdqHqr3wnvmw05g1iaZM52pxu/R5J2qCvzTrn6e1KEk8KM5ag
	c1a3Ax3WgOr9tyQic7SN9qJJ7V9eQ7QUZdbqFMMJiAsUoYPDeHY/P3RAHsGHtvPdRkhMlzRhmYF
	VdMxCOt3oSiknZQDZLfs4OmvUakZlwOiVkULGONq9Wv95oEX8kec7jVfH86i6JXPHibHtDbcI17
	rHQmyCHCUZJiq5Gb66Yga75rzm0E=
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267584785a.2.1759917892498;
        Wed, 08 Oct 2025 03:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsrYk53kHAbHUIZarAeviZCZN3o96KECTh+dhZAtSwTLjkr+Lu3URbxUm9serLVoPCrHnkiw==
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267579585a.2.1759917891846;
        Wed, 08 Oct 2025 03:04:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b0c7sm1688116366b.57.2025.10.08.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:04:50 -0700 (PDT)
Message-ID: <1afcbf5c-f32a-4115-b2ed-583a10758045@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HCSRjQs96VH2NUl3fVxFkKV4d0iIw87m
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e63745 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=prks0494CB43s1mVRQUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HCSRjQs96VH2NUl3fVxFkKV4d0iIw87m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX5LOn5UtSZngV
 4C09D+QRF8Av9gRY7E5eMPdUVPPcf/Rfz1mVDt6B7fjQsByD3kH1JHpIGuIYHEpDPJQkY0vyj2r
 Q8GslL/V+FrzlO2EBf1rnNi08kj2aRcdB3YZL94othTuW/LvEQD2sJNy2Em7B2wd+kKzv45/WEG
 YJfIH+uNvwehaknOqemmUmEoMufNgl1FQkASxLyIzIVN0Y7M0EGQPlE2DXFbY+xqLc+myc+fAVV
 0gSVvuO36gIBzWoqpOlkPLYXNZxpXxXKagoCyGvodb8g/qy+Y8aPZ6QHcKDOa+lnm/oteqTAwCY
 Cc7KAfOBP37+MfXYK8o04QFL6vqZ7X82aMMqlwsZAgQoOIVXQiT3+kOV1W+lsO9rKLvQ3tJGESc
 B5xeOVPEBYvmT+Fk3YJjfFEdyswNlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/9/25 1:42 PM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add support for three Camera Control Interface (CCI) controllers
> on the Qualcomm QCS8300 SoC. Configure clocks, power domains,
> pinctrl states and two I2C buses (i2c0, i2c1) with 1 MHz frequency.
> Nodes are added in a disabled state by default.
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 309 ++++++++++++++++++++++++++
>  1 file changed, 309 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index a248e269d72d..a69719e291ea 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4681,6 +4681,123 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,

Does CCI really require all three of these clocks? AXI turned out
not to be necessary on at least some platforms

Konrad

