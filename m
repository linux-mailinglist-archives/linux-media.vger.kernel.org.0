Return-Path: <linux-media+bounces-36968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A9AFAFA4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CE518925E2
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3D228E59C;
	Mon,  7 Jul 2025 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1Vghicb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF428A71E
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880411; cv=none; b=QW4TWRQug/KUdiJnueTntmd8Olyw0019Y2iSkoXxreRiThLu1FEDJ9B5BkrzmrP6iq4X+Yd9LhZnMAF/kGzj2YTjoi7VWMCBzyvJ4KZUolrcMyVESbuLl8twLZR8GBjFEAK0uedowUeEcVYuQSutZhH4peoZUwvuvwXidjjAhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880411; c=relaxed/simple;
	bh=lpUWLfPohvcG8KFzHIdM95cA9JBZMwDUXeS0oz5m354=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9T+i5SLXuHN8GiEjvpUMhP1vP51N+cHPFdE/Dlb9IYoRIWpnlPIm2E/e3pMJaDMxGQrJ+5Jaupr/b/jUaGA9g4NcDHQp4PT+/eG93no5BWOXst7T5GFIpwEH3ifyCZOv21p40k5KikDjnU7C0VUkcGNhFF1DQW0sL+dn4/ueXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1Vghicb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676omCn013069
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ACLvMD04WA0YF7cGMMn3ZsR
	RQXO56tBP9XFn+27tp8=; b=Q1VghicbjP9qRm0DXRuA7PXr87THvDT/nF4u+p4M
	/UPJTIYR+NCX3qzLuSM/w8rb7XkwCeEf7O01y0tTcQ7Ee9vBKzk8zM+EDVrbiAd9
	GFEvfpiGuZ1+fdnjqcxFaQAQpktA1DjZS2TGvpzom4ucRgW7XWv+/xeTOFKdvN5X
	RPDU6c/sQ18cp7/xB6R22oEH96Px1gTbaSdQbTov/CX+HQnY8i56nu0G64W7yeMi
	eZTRvEUh5F/O7/QFT8SvH3inuEMgufwv8W4r1+dK5UJkva7xwGTZYPzays2Mi+a8
	WgKAk6rNNGl+4e9VwaaLnlcEIDVmrKwF7ieF9jM8qNDfxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0h8pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:26:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d44a260e45so504292585a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880408; x=1752485208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ACLvMD04WA0YF7cGMMn3ZsRRQXO56tBP9XFn+27tp8=;
        b=DHVUV63eeI94MTW0pDiQdmUc6TFp4fnZ2fsnMGPJQK7rX4uS8yheFii2jXIVC6nc8o
         4x5+Rjzb7NUxK/tw3BtNwWz/3+22YRo/9cz83BQrF9i5FqtYduuf+Mk939xJrbsrqjjs
         chbczKbr30hr4oTz4Q7kTqCUx7XGVQtoizLh3ZTNCwgpGEDpVRKMFOzSkYBkbr+1nfEN
         SOe4GIgO5L0IZQd9nUCePq6IO+9sQK8gSoB5Fi6gkzzd0EgH+FQDcx0ImkjwJi0JlM0Q
         2zC1fqi3hS3vqIN6ggNFKUfNK67Q0SGtp1Z+Pi4plwRqpbBREjEGXrzKZSbo47zduy8Z
         ZbYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGjpsQ14hWoqL5DUeB5A289lgCY/2c/A/Y05U+s224y7h8bZN3xBXLcdu0fRg8WiZb2S2m33L2dR6dHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybPP6y6F1APn77vSZKxnLo5Q/xkUhp9zH2qndlPDvwLlRZeKFz
	385DcloC+b3Z+902ebfQ+0GJEFaVkyrqonYzb+y+eYdGrBFCL9Ug7G0qr1MQ8ysopcMFr6XkPq8
	TkR6okbpG206FP4Grp6S8F7ZyRMzKV/kit8HmevGXJdZg6oKlq5e1sFh2FZyUP5n3CA==
X-Gm-Gg: ASbGncuYHL9LX5fk/9HGlziOk6nnBnr/U7A8/uiouYDoogOr9eaX6lr4u3pYRDq1DIK
	Fz0SxoQhz4zWO30JHyzLV94XfCuk+Zoii2uoXQr6E6+55fIMPRHk3Q8fD8+zROGB34fiuCZkgc1
	ueQgLo1bjs6DJsW/LTV9iUUul/G+/qOH0DfyZMllN0ZoJdptl7IinDzFMRenOn0C93FkrRvWX7V
	4/UCGf9zGiISR2Q1DNOFjc57hKJCMILqb0RPdaMWGfgcskrkImEPDM6LfcL3LFY4ytmPbYfhVGE
	Gd6y1IGF5YUPB1yU7hCh7o3O0a9B+nvIeyzPyat6fx81LWiQkRlPuJ4=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653791385a.23.1751880407880;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0cECjx1Uf+mlAgg/C5n1fBtG/LFQsvoOn0p8/ucLcry1XeXAF3J+XDAJNT9x0GNMUSikEyQ==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653787185a.23.1751880407184;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8e6sm108891495e9.6.2025.07.07.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:26:46 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:26:45 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuS1X+RfX38krpf@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuOMrjfQBNYAjmF@trex>
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686b92d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=DKyoZqHPbrAdFQiOrREA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NCBTYWx0ZWRfXzlK8UAh6oBDo
 wD90OYPdePQfL+ri8Ocuqp4NxKdi3S1Bc1rpsRI9shHH4PTZK7ejLAXRcacGqF0gQDT5MIT+UcH
 dJHFqwkTkRQxGzVHoRgcwq3n7WZo9jJtfzwAFFiL2HyG0VMnVOoxraq+S8+kghPdIyus3q2og3j
 WBCNmcx6EkbkxYajcn5El3Vpfqng7Vs27bMrg9o9nkhXNW6xoJCIuZ6LfpuG4H9rp64e8cD0idO
 A21Ur13RsP7RluxzR5xYLdOSL+LuDQ2OyWXzCrJbedafya1pVQ9UYI3PjPkCXLq8g0GLjdPN4CP
 kw2svYfqoTJxi2tcEiaP0AFKRx3tr0YbCeGRqZ/rcoBGGbS9QqYdBve3i1dBR1WnubNUvkjwpZO
 tGp6VTLvS0lrDb+PbbAzKVaJg0p2lvB2pVJ4eWq+hgyEvHPYdjMQJUmff/lu7wsQqS1PutPQ
X-Proofpoint-GUID: -eAYP8HcB9HK-7a-_OK6Iv7PIkn_OITN
X-Proofpoint-ORIG-GUID: -eAYP8HcB9HK-7a-_OK6Iv7PIkn_OITN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070054

On 07/07/25 11:06:58, Jorge Ramirez wrote:
> On 27/06/25 17:36:43, Vikash Garodia wrote:
> > 
> > On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > > Add a schema for the venus video encoder/decoder on the qcm2290.
> > > 
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> > >  1 file changed, 127 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > new file mode 100644
> > > index 000000000000..a9f89b545334
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -0,0 +1,127 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > > +
> > > +maintainers:
> > > +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > > +
> > > +description:
> > > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > > +  on Qualcomm platforms
> > > +
> > > +allOf:
> > > +  - $ref: qcom,venus-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcm2290-venus
> > > +
> > > +  power-domains:
> > > +    maxItems: 3
> > > +
> > > +  power-domain-names:
> > > +    items:
> > > +      - const: venus
> > > +      - const: vcodec0
> > > +      - const: cx
> > > +
> > > +  clocks:
> > > +    maxItems: 6
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: iface
> > > +      - const: bus
> > > +      - const: throttle
> > > +      - const: vcodec0_core
> > > +      - const: vcodec0_bus
> > > +
> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 5
> > 2 should be good to support non secure usecases. 5 not needed.
> 
> ok

isnt it better to just leave 5 here - thinking of the future support for
secure buffers - and just update the dts?

> 
> > > +
> > > +  interconnects:
> > > +    maxItems: 2
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: video-mem
> > > +      - const: cpu-cfg
> > > +
> > > +  operating-points-v2: true
> > > +  opp-table:
> > > +    type: object
> > > +
> > > +required:
> > > +  - compatible
> > > +  - power-domain-names
> > > +  - iommus
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> > > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > > +
> > > +    venus: video-codec@5a00000 {
> > > +        compatible = "qcom,qcm2290-venus";
> > > +        reg = <0x5a00000 0xf0000>;
> > > +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +        power-domains = <&gcc GCC_VENUS_GDSC>,
> > > +                        <&gcc GCC_VCODEC0_GDSC>,
> > > +                        <&rpmpd QCM2290_VDDCX>;
> > > +        power-domain-names = "venus",
> > > +                             "vcodec0",
> > > +                             "cx";
> > > +        operating-points-v2 = <&venus_opp_table>;
> > > +
> > > +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > > +                 <&gcc GCC_VIDEO_AHB_CLK>,
> > > +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > > +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > > +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > > +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> > > +        clock-names = "core",
> > > +                       "iface",
> > > +                       "bus",
> > > +                       "throttle",
> > > +                       "vcodec0_core",
> > > +                       "vcodec0_bus";
> > > +
> > > +        memory-region = <&pil_video_mem>;
> > > +        iommus = <&apps_smmu 0x860 0x0>,
> > > +                 <&apps_smmu 0x880 0x0>,
> > > +                 <&apps_smmu 0x861 0x04>,
> > > +                 <&apps_smmu 0x863 0x0>,
> > > +                 <&apps_smmu 0x804 0xE0>;
> > update this accordingly.
> > > +
> > > +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > > +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > > +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > > +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > > +        interconnect-names = "video-mem",
> > > +                             "cpu-cfg";
> > > +
> > > +        venus_opp_table: opp-table {
> > > +            compatible = "operating-points-v2";
> > > +
> > > +            opp-133000000 {
> > > +                opp-hz = /bits/ 64 <133000000>;
> > > +                required-opps = <&rpmpd_opp_low_svs>;
> > > +            };
> > This value is incorrect, fix it to 133330000.
> > > +            opp-240000000 {
> > > +                opp-hz = /bits/ 64 <240000000>;
> > > +                required-opps = <&rpmpd_opp_svs>;
> > Do you see other corners in the reference catalog as well, not just the
> > downstream code ? OR did you limit this as the usecase do not demand higher corner ?
> 
> there was an internal AR50_LITE presentation where only these two
> claimed to be supported - all of the others were not. so I went for the
> most restrictive option (ie, this one).
> 
> how do you want me to proceed then? should I just use IPCAT, or downstream?
> 
> 
> > 
> > Regards,
> > Vikash
> > > +            };
> > > +        };
> > > +    };

