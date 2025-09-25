Return-Path: <linux-media+bounces-43136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E8B9E297
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B70D94E2936
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5CC27AC59;
	Thu, 25 Sep 2025 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HX01tzQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927B2797BD
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790807; cv=none; b=aSJI0Ici2u59Y3gbq/kP1JXaC3ZEoqH1dQC3NnZF4Mebjja1ttA9jFSMpp5KoO7TW8CAw7tkBMB6n2S1YiUfTXN8b9PFhQa6vswpn4wL6GqlVEAkpxFwpn9EvcnqxaKFvwrkc1NVeidQvzVOydUlZpizZvZoU9CADfjj1X4NRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790807; c=relaxed/simple;
	bh=xBVWxRrKQUXvM0i9+aAurwMoSPvugsmmUwI8wwwCFAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOmxICx/ZMit++d00ZOVHscYss6B67BlFyc76kS3/L7fnD9K4IdBAXB99XQGwypbq4CGwkmSGEj7XcMQQfmPiUZW0GfeEUVq6kYVh9Zzg8TM3qxU2DyWIOsXHPUKhGMcxa1YYs80/95hK1pj9ziXqu5hqoevhmrvFvfURDjyZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HX01tzQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0uu7r018200
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NanOuqfcVHSh1yGypDKoQ9iNS3HSzo+7sV5Au+ABCI=; b=HX01tzQgkeMYqdqp
	dQUzgmBAN2BoftCTKUKZLEx0Y6uKQKKjwp2QlH8dDOp3b0dRT6a+mmDUkJTQbsjw
	XolYAKOSURgSvRV1yhvVS5Y8F8D0HRfsJnFYn6gNyIbzZEa6rfyTdgdADr91cUTt
	2opAUH16e2/eiJl79PmB2h3tHhPm7L0+1tF4FzYiiDoQ6DsF6YC7A7h0VkzqR5BB
	/t6xiDGV91Znu1cGfgagFtJsTd0dRq8Ef7VyqdLkykcn0EmF7i6Ve4c7rMNALagz
	MKuAmYy+5/fPpWOvSYoSmkMLXtEvMt2f111X+qSRNSTI+nVjDdkgSfHDxndHpX3Y
	RiHVCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbe7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:00:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d8c35f814eso1455251cf.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790803; x=1759395603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NanOuqfcVHSh1yGypDKoQ9iNS3HSzo+7sV5Au+ABCI=;
        b=pIgycJXCjTLxfN8ihC1rzlUdHv7wU+YSF1pl9nArSpoNqaXfeetN5neIBNOsJJbNNP
         c9K1RZ1Oj5Kg45ZR1ei89NC/G/1wIWKXRKox7Q703AxhLaFBy/EDITjuzzMJKhQ0kb+c
         oL51DNlxuFDLoOk/7blWGTzlhEO5chMIWlJcpCO69rA66kUX/U66A9zKHNYUbfUA93ys
         oSfToFIn0BhlGYBQiZUicJr9EwDdDtO6hmve7zghoMA80Z/cKZdxb3qFLEIzlvVYysKM
         JAlqH4IgzmCwZFgklInMHfbp7u0bM8h5ZhTLwfmPFXuI+b5t5YCy9nSpYQFxLI7CLV1d
         1meA==
X-Forwarded-Encrypted: i=1; AJvYcCXA+eMleBBHSMPOgkE8UGezGDCReTkgJWeVFdLko4RGaM6Yfan35CJpLbhdqWtRabotySWE4IgfnvHxHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4/To5KIC1DCrvqn36RxIHvqJOW3eH7fwJyVRsvkVid+hucJ4
	CoHAULKj/7ZedIJ76ZkQxuTF6UsoLkVSFfVB3U5Iz0f58W+mx2fx80uy85qLc46VbbkzHe2DGGx
	IyAxwpRIvb6ygSfdTuhfdejDWhvsaMTrSKaatJm8rCv8PCWtRDzGlXkczQmrKvMsB+g==
X-Gm-Gg: ASbGnct7jve49X1F2u5Lfv1W094LFBrGB/qUV/yfOOhqfZrijJ5wr6xMxZGPr3VsXWX
	/rydY4cpWcBCf9VesQU74OtD+Pz8fqOO4D/k24OWyKOzu+zNcK+WLD0Am73PVXP5pgWy2chLYaz
	3Y7uBpf7ziq82xwfghAifTzd/89vM5UKnYSxycjxxdrp6M/QU4+FUF0RNYJrYkJYErB/lClLSv8
	NcYbS77H7HZi+lH0l7iuaBZgRr9Dur+QkYVqW+cZWcotseZivSUcPZKRudZSw6tQ+v8JFsKDMbu
	2gz04yZD4lyTuLFE9hnJoqHX4aCeis+9mf0MoYdLqJOq0xO1rhu0qrL8qvm4RNBSpuHaphYxWaD
	3Ttf6L+vF3sL/0BLnoptrZA==
X-Received: by 2002:a05:622a:1905:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4da47c0cf8emr26077001cf.3.1758790803523;
        Thu, 25 Sep 2025 02:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIDMuVkqRV8Z/VXyflZmrCENWFMJw2jxob4qmvTixZ0jpMmD0v+KXFqVOY7vWuj/loeIisxg==
X-Received: by 2002:a05:622a:1905:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4da47c0cf8emr26076651cf.3.1758790802838;
        Thu, 25 Sep 2025 02:00:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d014csm123421966b.19.2025.09.25.02.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:00:02 -0700 (PDT)
Message-ID: <888e0d4a-ee44-4b09-8dba-2e0b282c205c@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
 <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C9KHre9DAwfqsEKqdS3G0Wuzwkk6Le0A
X-Proofpoint-ORIG-GUID: C9KHre9DAwfqsEKqdS3G0Wuzwkk6Le0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9EG4MeKfvxVB
 gJtK8aEoePcZqXcDRuBRbcrk7BWuOupqF6EyNgRrcU0dXjOBhp8CiMoU0UK+DHkLNNxljRa3dZH
 cHNitik8wj+iWjPxZMNSYAh5ghrKYFXYqchQzOJlEUt8rNwtxhCps3pr+Lddqr0wuGrYNPGjJcd
 xTHtd3UgjEFGN9u+VcU2iAW1TJM0NQgdhN2CYvR04gznCwylGy3wOOuryGVIYuIGTfrhq29/Jll
 I++SSwWgjpMpZMq2CvENk8oIpDlxq4XtL2CF1opLiZrX/0Hqv1vp7DGNcf4JZQjSj4nf/nf2fHv
 H92Ky6Yqs8bbVyLMrPzHcHW2Px1IGhgyIGG9hMNfSZNTFXmtKt0WupFoXnW/Aqm4+HPHdX+9xbV
 vrkhT6sS
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d50494 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w5tCh-kKjUeJ5JU2OSEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 9:57 AM, Vikash Garodia wrote:
> 
> On 9/25/2025 8:36 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>> compared to previous generation, iris3x, it has,
>>> - separate power domains for stream and pixel processing hardware blocks
>>>   (bse and vpp).
>>> - additional power domain for apv codec.
>>> - power domains for individual pipes (VPPx).
>>> - different clocks and reset lines.
>>>
>>> There are variants of this hardware, where only a single VPP pipe would
>>> be functional (VPP0), and APV may not be present. In such case, the
>>> hardware can be enabled without those 2 related power doamins, and
>>> corresponding clocks. This explains the min entries for power domains
>>> and clocks.
>>> Iommus include all the different stream-ids which can be possibly
>>> generated by vpu4 video hardware in both secure and non secure
>>> execution mode.
>>>
>>> This patch depends on following patches
>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>
>> This doesn't belong to the commit message. But you also can drop this
>> dependency alltogether. Could you please do it?
> 
> Sure, i see below works good w.r.t schema and dtb checker. Please review and
> confirm.

lgtm, you can also drop the interconnect header (i think you don't
need any rpmhpd additions so it can stay - potayto/potahto)

Konrad

> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> index f3528d514fe2..537e8d627a72 100644
> --- a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> @@ -106,9 +106,7 @@ unevaluatedProperties: false
> 
> examples:
>    - |
> -    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
> 
> @@ -136,10 +134,10 @@ examples:
> 
>        operating-points-v2 = <&iris_opp_table>;
> 
> -      clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +      clocks = <&gcc_video_axi0_clk>,
> <&video_cc_mvs0c_clk>,
> <&video_cc_mvs0_clk>,
> -               <&gcc GCC_VIDEO_AXI1_CLK>,
> +               <&gcc_video_axi1_clk>,
> <&video_cc_mvs0c_freerun_clk>,
> <&video_cc_mvs0_freerun_clk>,
> <&video_cc_mvs0b_clk>,
> @@ -157,17 +155,15 @@ examples:
>                      "vcodec_vpp1",
>                      "vcodec_apv";
> 
> -      interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> -                       &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> -                      <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> -                       &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +      interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                      <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
>        interconnect-names = "cpu-cfg",
>                             "video-mem";
> 
>        memory-region = <&video_mem>;
> 
> -      resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> -               <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +      resets = <&gcc_video_axi0_clk_ares>,
> +               <&gcc_video_axi1_clk_ares>,
> 
> Regards,
> Vikash
> 

