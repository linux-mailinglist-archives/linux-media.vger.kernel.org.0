Return-Path: <linux-media+bounces-36962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24EAFAF37
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C220B3ABFA9
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8D928B511;
	Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0EGxl8O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756021D5B2
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879231; cv=none; b=qYgfUV/xVi7EV/PfmqYiyKAcSJHShaBXkM/z17pV5YAV70+p47Rw49razwTbxGD11vmhw1xH7yhQk2nYcRXkEF5nU81NrhC8tuR7X/E5k3UtR7KxoLuQd85jnd62hmCL12t+DEK5nrbmlTyuKpj4etKFAfZfzEMK/nD81jH8B/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879231; c=relaxed/simple;
	bh=u/pepq4BlOtHJye8dzjJX8y8BCLsgtulB2ZBsmpIUPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEDHGxMM/7JdP5Tc0iS5/4crJZHFlD4uHmEd1HNR03OcaTT1/Glu9C3powe0sy5V43pUJTkYL9CCdid79aUj58KExxOZ0v+vNd8Qh5umINlS5AhT5aAsqJ+jUAuV2bW4YIE1zoXFmyaSqeKMdBw51iWTt1/BgmOtCaEZpyV0isE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0EGxl8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566MiImf021841
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2M3NRLxqF+ccW20K1HLg5RAl
	uxCezcoEWGabcXTrS4Y=; b=W0EGxl8OlDx/66dFOGPcYOTy+HP863eRChCHK88s
	lqA/lBYvF7tGSO8drLynCVWan8+9IMv6BAFiZPNNyhXFmDWw5tC5tPhGqF1eMAtJ
	kCEkc7senHsc3mn0ccnwgS4ndEPkz/1/OHA7mcGItMHzo1vEtT/b8A1q+cXtk4P5
	LbyKqKFR2pCJDgHtw6GjcAmX4IA9mB+UYk6oxbkj6WVUggPi7nOqEnFdqOsrqmd/
	5npKvpCGnYkbrS+Hkbh4ZUwKI4gEQPT1S92tP+mCXid6mwjJLRzI/pqE/yuPZ7Hq
	Y/OL1h5rSPJtcaBmdUZJUUIDbv2uGzTPyjN1v9uF6TYC4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmkugt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:07:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399065d55so370142485a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879228; x=1752484028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M3NRLxqF+ccW20K1HLg5RAluxCezcoEWGabcXTrS4Y=;
        b=iktaJq1qCvmQF/X2UE8b1Ikn/qZ923CYZkY6TfhguK4e6VMQPTbnJr2K2bEsAufzX7
         Yu0k9tDYnBxDCLUyxidpQJFUCRDI+mRZm3tWuPHXIoMtJTZyDq3cYqKIrTP8t57lMvqQ
         LH8z3G/cXGf8/32F3RJ2BTTZql0sYg+EFcsh1KCaze0nMX0Ux47yZr2RveH+iMWUqsrO
         oYEaHTyELtB2kPR+DpWMi2Z/hFMN4jvaMn0xTzKPErUA2L2D3NDDZ0NRB4OUo8kAxiyA
         UT+4Y/W543EzVMUViVIKfCrlqou8tVCMm3mpL77dES0wAdm4vRk7gdjy3AinZEkHsXJb
         KJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVeoLb0/x7QKEGc6/0ID1unqXKYY2yBP75Yzr1ZEF7qC2/g+zOq4pnZH8suH4bVLN7ztKWMLNfo/VdAGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2xqVXoZBTEUTX65jngChzz4o2hYwrHuAJH9if35zwse9erjz
	wo764AUDP582hsQ3KRec4GhAjlTn1PEJRwH94XkLOaHlYaLqMyj5soYJDAn+l93Z75V44LTJpFc
	XsXeU9KIbGua5MUaOtb96O95ttsku7G66bNhvZLkHieawHN8U1vKcV+0jFyUABlMwuA==
X-Gm-Gg: ASbGncujHtByx9RasAN89XKO46NAvVEqoXt9oEZcIrvv7YPqSfTmRtVTH6IeKny2S6a
	KCLC7h+/OWXXob0KOGXEPs6SP/ic6oVwQLMjO9DY/+EZcxvJMj+g1cmzwzg+Sefd9vYkK1dgOHj
	ADOUI5xxdH9BDrVgb40Shr7tjNKyf6YDdvNPjIDPBdLr9X1ySqdKCW1DhqQfSYX65ezq0e9JMr6
	GztakctlO5Jtvhf/FgjzSrS/7VqW7neFqJedsX0SI/JfzZjt1ualVO0gpcd7gw87uJ+1ad5fe12
	8VEVwfmgmFvqWVH0RgkGPbTyVzlKraT7u8CT9SfTl1mrtd6RcL38kNM=
X-Received: by 2002:a05:620a:2949:b0:7d5:c317:f656 with SMTP id af79cd13be357-7d5efcbee2emr958579585a.18.1751879227851;
        Mon, 07 Jul 2025 02:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6aD5tvb/dCyF6gQiMcQ+/KS1dIVJbshrVTbBQFRpZDKpCPBqDRVXm63NJT/XXUHJchE6ljQ==
X-Received: by 2002:a05:620a:2949:b0:7d5:c317:f656 with SMTP id af79cd13be357-7d5efcbee2emr958575985a.18.1751879227344;
        Mon, 07 Jul 2025 02:07:07 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm9696139f8f.98.2025.07.07.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:07:06 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:06:58 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuOMrjfQBNYAjmF@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686b8e3d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JD67tWt7rTSO11IQpAQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jlLuulLBfe2HLru_zAf8ffm4Y_iAJRYY
X-Proofpoint-ORIG-GUID: jlLuulLBfe2HLru_zAf8ffm4Y_iAJRYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfX8FaelR5cmzYF
 QaLkHlg4C8a0ugk6aP6+hkZ0BjjOtrCFXmODQ1drl/qO9Iw8pxGQLoEOroeQ4IGtJLDHmGvUKxw
 4E/rPRnyd6L40VYNTS4lY/c0IFrMI8kcNOTqqyVUQI/Ow0cj1U9yjV22QYQODLrJK7L5xQN7a1F
 3Z8lQOOc2IbybMsI2KYeJb/XGOt2tdEWsH4S31s0rO2GPQ3ONJfsCQKGx/1XrFv/fm/Sn1m1p07
 rzur3J0/FEfiTdZbfAB7hiBAnoH1AySEGJwWfOuUoEnJf1Pc2rE0MLW3Dhe1KaKXfzJKx/TPM2D
 B90Md073js6E8WFmE37rMRb1vA/25EFQQ1bAcC4aO/jkHElJpR5iZVVJUdibdyJSst9Pc9JQDbi
 LgB/vpWHQ69K/F41hVBUUW8iKZ6Hmeg4SuD2ZjEh9e2+ZyPEt+P8eRHuIHWZGctzQdjaL5eH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070052

On 27/06/25 17:36:43, Vikash Garodia wrote:
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..a9f89b545334
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > +
> > +description:
> > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcm2290-venus
> > +
> > +  power-domains:
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: venus
> > +      - const: vcodec0
> > +      - const: cx
> > +
> > +  clocks:
> > +    maxItems: 6
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +      - const: iface
> > +      - const: bus
> > +      - const: throttle
> > +      - const: vcodec0_core
> > +      - const: vcodec0_bus
> > +
> > +  iommus:
> > +    minItems: 1
> > +    maxItems: 5
> 2 should be good to support non secure usecases. 5 not needed.

ok

> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: video-mem
> > +      - const: cpu-cfg
> > +
> > +  operating-points-v2: true
> > +  opp-table:
> > +    type: object
> > +
> > +required:
> > +  - compatible
> > +  - power-domain-names
> > +  - iommus
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> > +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    venus: video-codec@5a00000 {
> > +        compatible = "qcom,qcm2290-venus";
> > +        reg = <0x5a00000 0xf0000>;
> > +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        power-domains = <&gcc GCC_VENUS_GDSC>,
> > +                        <&gcc GCC_VCODEC0_GDSC>,
> > +                        <&rpmpd QCM2290_VDDCX>;
> > +        power-domain-names = "venus",
> > +                             "vcodec0",
> > +                             "cx";
> > +        operating-points-v2 = <&venus_opp_table>;
> > +
> > +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +                 <&gcc GCC_VIDEO_AHB_CLK>,
> > +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +        clock-names = "core",
> > +                       "iface",
> > +                       "bus",
> > +                       "throttle",
> > +                       "vcodec0_core",
> > +                       "vcodec0_bus";
> > +
> > +        memory-region = <&pil_video_mem>;
> > +        iommus = <&apps_smmu 0x860 0x0>,
> > +                 <&apps_smmu 0x880 0x0>,
> > +                 <&apps_smmu 0x861 0x04>,
> > +                 <&apps_smmu 0x863 0x0>,
> > +                 <&apps_smmu 0x804 0xE0>;
> update this accordingly.
> > +
> > +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +        interconnect-names = "video-mem",
> > +                             "cpu-cfg";
> > +
> > +        venus_opp_table: opp-table {
> > +            compatible = "operating-points-v2";
> > +
> > +            opp-133000000 {
> > +                opp-hz = /bits/ 64 <133000000>;
> > +                required-opps = <&rpmpd_opp_low_svs>;
> > +            };
> This value is incorrect, fix it to 133330000.
> > +            opp-240000000 {
> > +                opp-hz = /bits/ 64 <240000000>;
> > +                required-opps = <&rpmpd_opp_svs>;
> Do you see other corners in the reference catalog as well, not just the
> downstream code ? OR did you limit this as the usecase do not demand higher corner ?

there was an internal AR50_LITE presentation where only these two
claimed to be supported - all of the others were not. so I went for the
most restrictive option (ie, this one).

how do you want me to proceed then? should I just use IPCAT, or downstream?


> 
> Regards,
> Vikash
> > +            };
> > +        };
> > +    };

