Return-Path: <linux-media+bounces-48981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FACC74FA
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35EF93081D75
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DEB343D9D;
	Wed, 17 Dec 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffRi2XaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlORJSy5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7691342524
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970063; cv=none; b=CuM530nFND7XaegdPq/wb0YtfInlxDSe+2WF0v3GbR4xMcSIFDYnn/T8CBtvhGZ7M3IkY3Duhn4WUQHwwX4bZf6ptdRAK28fQJsK7euhq1A+zVCVtRXk3UTMW+63nPaAKxKayUOSr55cFn6sAhI5Fg1r1l3Rk4Chfk4d6pBOwxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970063; c=relaxed/simple;
	bh=jJNrBqLbcXCuD9NuvkheDISIm9Smr08Oac6cB/MwqTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQzuJDUq3vVrvFGLeHfx1LExPBjg774tM1AkrHlfF+8+uQYphMH2v2zIGOn1hICTpThO/Fj3nRG/I6V4HOUz1QjiFdFJ9QtqMNgohYN5rLg29Cgihvk/TxqDZm/Hnqw9SIhWrnkfZmIIQZYe+4TeP0uBM0J4ZGffOkfN53WxG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffRi2XaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlORJSy5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9w5gx870098
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=; b=ffRi2XaIRw8BBlt4
	kpTvKijZyFt/98jMhsetvourVTv3g1+TVe/QmJ6Ws1TN6rA5+ixb4vbDDmTRC7Bo
	2XNogXULDSsI7ys0rGKhaOClD8Tt+W68rnd8aAKDQbodxDVBbB4Z7orI5zrX7hZ4
	P/RgAoTfdE//tRoGA0qSVrgek+F/CiyrstYkcfWvZgsAYguDCI4AGul4I2UZocXe
	3w6/MtStSHGBoZat/IlfamlAbJev1LrA2WD8BaJCIGKe5aZ9ymWQYK2atC+LuuMY
	EiANncygTC6m+nNwCX1lelQBsrTUO97wQUifNdM+T+YtUsB5HK3uZrGcvJnyILip
	cAqPUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1t6pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:14:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so20031291cf.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 03:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765970059; x=1766574859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=MlORJSy5cjdCUMA3Dwed21Ti2nSt8u/Tu2nvXjZ1eCycS1+A1QNbKBr4YSk9T9uxdA
         k8QL0Bl/1UIQ8rvOHYLwMsp9INaVYudJtbWJ8QHh3jaFxxtkxoldF5m/tit43pMCRM2D
         HurIxEBOROTt0B7FWt2OprauFFxuz/1DwLoqdbQ9k9j07HCNZk3bXdTDZFS1CgG/cRSk
         6NmB2TAOfcf2nS8b6ucZ57vTdDMskUXC36NnWPwq8fpdiOLhmcDkiBLLBjrk6V9gbvC5
         xW3ccz3aGAM2QxKBBcBLnP/gyqN0AXoDefeSjWDgJ3x48/gwfR+F5xju6vFKHcTvZ6Bv
         TeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970059; x=1766574859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=cgx2zbSIViLRfsmhIYl8kfXFPcEiySDthRYNsgomJzvVNzVORnUeuU6Wn1Gefnsrsr
         Wovu0A9Ei7kaQphSFlt6K8AHuHpItXalCJlXUvo60QM48xYzTsbfTUTw2+0bsSCXWI4S
         URkhXSd4WhFe0nBHl9GEaMnTiEygMfoN8yGXSImJ6cIl18xA5BJuSWUmBgVhnPiJdIjh
         5ckqp1HOD9gpNaop8jNymlZhe6LeCPY/0FVmXyNOK0WSqdnxdXcb+g6qwPy/xVOrYPjc
         7U21KRCik1BSvUPOoR4frgaX1GlVCemZyWOjOPEKoQAj9KT9G5nfQtBy/RYrUCpK0s0O
         kEfw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcitYxDl2t44Fo5CEaP1kY1+rK4woTdno4LWAkZ5KE1RUgFcop5SgeIUfKiYG0Qh4wTeZzgNcqfYuAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygkLmBObZx31rq3ysrVUf2jj803nJVZA4yFm5sc5ZX6PJ/2Jmc
	U7UtAwvfYiTd1a8OTY8OKCYG6bVvfu05i0tGcjDNfQsF1E8Y0ypSJm2ZDXBdxxAwDjwB+x+J5uy
	ET6zycvda9JIIfF2QATurLAmtmSIv5RaT7JwBlCjvZPucg68xPVlx70YJKwzKx5Bujw==
X-Gm-Gg: AY/fxX7IafxSlxbTpqgH4cYmrV8CVqtqmPQlVJJ0HL/yTBX6+UK8FTgnfnV1LtImxyB
	JimEBSdVTePXrgpi72xIig6hGJ4sjoCEHsMJ8Zbry1GWWCLbxnDxjIi/G1xFGcUyykgA/24OS27
	ykysKDzvQmL6OkczzMr045ZpG2upAJKeAzK33xU68jAxl1g3y7aDwKNehpFuzC7UW35q2v9jMr0
	iPpi0coA0QtEIVJFRFNf+sP1UcF/fIe5yceW/Rc7xIJkwMKVke4DW7NG9qvDicHiUwllbn02Zf2
	KsTJz3RqhaeiSs+2uTLcAJUgsH2XUU7Ni8W1J0krYN4IkO2cZlZml7ahlIXZWTn/ZOm4axaZ1W6
	DqL3zbj/T8QZKFGws1zdXyjIAdz/dY8fFJIs954Z9NgM1pw7F4LApi1y1+n9xNG4tnQ==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735301cf.4.1765970058719;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeeL3HZVOPvmf0IAL/4i2bYNx5YCSyo2xx9Dhjqf+zLDmXE2sc9O+agiSgDUlgq4sfjkUdtw==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735081cf.4.1765970058316;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29beb7sm1932015866b.11.2025.12.17.03.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:14:17 -0800 (PST)
Message-ID: <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX0zoSQmQoDmrD
 lOIOLGTdh3FSHwPiFW7Hy9TsgTeB5Q0gPZHiPwiKn2kXH8dM3GZwhi6SJ/LapiMfeLZoacsuXw6
 kJV7p5R3a8KiAKQZvBvzKRx4UcCgdSyVHTAqPisd0luGq1uldCaoAHudERyw7lQBTx2QIMU1uKQ
 DA+ZqHu1b1qNYXxP4nQxYXU1q5TUPT3dPVRjWpeWbindzbNcy3/HU1RnZb+rKTAmsVVsLdCKXSp
 rgVV79MZCCoDJetP1jH9hVFpUMfBZua2RzRvgAiab/JSz168siR94ZFzYFwS+94pWvDPipDu1x6
 LiPTD/o7j/jdfDd4yStgMMc+6cR0fb8LYWhm06FNPsYBpi7C0zvgIG2c61wy1+J44t12lYW3pAs
 9BLxHpw5ceMMrJy6c2hagBgV3bDHuw==
X-Proofpoint-ORIG-GUID: rPkHPHpYhqzGq6SZmPs5bW0IU2hXnS5L
X-Proofpoint-GUID: rPkHPHpYhqzGq6SZmPs5bW0IU2hXnS5L
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942908b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xHf7uapYn66AqgDo174A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

>  &tlmm {
> +	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +		pins = "gpio73";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

All other entries in this scope are sorted wrt the pin index..
Please take care of that and add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +
> +	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +		pins = "gpio74";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +		pins = "gpio75";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";

