Return-Path: <linux-media+bounces-37942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F2DB08509
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1C3D7AD9EC
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1C2217654;
	Thu, 17 Jul 2025 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCUv51YP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9A72635
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734125; cv=none; b=Qri6x8CF6ASlTf8SLlft8ZKhR5H0Nl9TqhguFIPMIj4FiE7WSAArqV/3Bnw0gFFZvlasbiYauw8X6gTJOE0Lj+wgKH5qIPMnOCdCzHGEpyyA+StPawq3ho2Q9Y9/FVejyPP8v9+uY7pCA34HmsqoQhFiuH+yqxjg/OA7X2IkhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734125; c=relaxed/simple;
	bh=KjICUAJasYp4RXSlrO0vtBThRCHLsjR26Ma8Vw9RWEA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0XowvL7kV3WkR0cL5pob5ekP+8ujXsdoQpL5tNCGupJo95GS2In6ZxHBVUfwfoDCHj+lS2xbonNtNfzn+dSm2BZLSGd8M0H8i8GLUFsr+TGK3pGaNQriipFXIBePZGL5fNKLU6wJBy0MrxcCWgfLfcivrMTZWwGplZM/teNaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCUv51YP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H467pl003009
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0zBK/fau7TlkP2P+DHYdkjt7
	NeDff+KJMEQay4LiEy0=; b=dCUv51YPQwsH2Qy3xpeWXBqMdofTqyMZixSRoE6O
	yuGcglz6Z9K+Vv6UsH4mA7mUwplVI3uWdWrS4uf64e8ma/SkF568ZetQFIY0yXGl
	lGCAukoGfUDQ1VGbT7vvUFXnc2dV4bfeM38cY7xvvfA9zTYMF55QtDNwdMgiRIzq
	kdLUbyGpCk0mwXMK1A1CvBhLoSIjDm6AlKqhiekw+Qm4GqqSjlbpWY3RHltRFtWy
	F3xOrUDqIuIRLyFMOHXiZg3r61J7FZYveIcipxNWaFbX7y595JfvxeX4ebcUSeti
	/6fxha4MCbpeEc87RiF8zwV2fGm5ykWDzVvw/lTQFcSV1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsukraun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:35:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab758aaaf3so25017281cf.2
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 23:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734121; x=1753338921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zBK/fau7TlkP2P+DHYdkjt7NeDff+KJMEQay4LiEy0=;
        b=se4rid//6FKxV6HhQfS7N/AieZpEqZkZF378OLtP9DAhPQEyxkhSImoTI9KRD87ZLg
         +muqj9VpjbNdAL1CYXT+txyRAntukF6qwZUhSzlJEiuE9koyPzsac1cxhJTqMOrUnM0y
         10rzXHJC75sciK83Zt53usmSlE82L07NoTI7A4rwvU/wc3HK9K6jXJUM3UprRbIwDCjk
         Ww0DyQMZJeIfyDfg6YKXiPEbEj42lIQJQ7VUEKrWnI8HzD0ZRKBdupfzAQ2/Ddh5sCYA
         eG3QvlOlMLHd39KxewakFXKp1w2D8NTaqK01y3MdnuC/uWSjKzt+mUCYux0xb4LpPpi+
         RluQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZQmG/SIjgsGZ3vD73a2K5pH7NksbE03AZ4lBtbuIDqqlFJxkxw21j8maZvdGOqP9o2vhvZEyAxrqcmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylEgomxueXdnOCzB/yLdk2cUnT53zYEHsQo4WsX6K8QfYlgGT7
	EeyVtOP/5zMc048pxoioQc6fcVQKq36agn70DBHAopsHxj06mEvRu6/afQp5Fn+HhmTWY6zX5CU
	xZM0w4fMfkHLpdowh+J2OKRqmy9ifW5Gztj6fFf4P8lPbH69CPTUEpekufQaSJbFXUQ==
X-Gm-Gg: ASbGncunj3OM10Thgmo3k3Zu4wL0PIxjlrwZcFM/w32Jc1VaxX5NlTt9V8iAGAq4XL6
	EDlgS/Kx74Z8q1XbB8V3nTW/Fp3C6E1gmxonVwQYydrmkgR+Ztk9IrUPN/JZ5b79HcEWyPBidpp
	oNg6mNrRwuxZ6ZQGK7yJ8ZLdobkFUNStBQlUXUJ6hdzGrpLwoLxq7UN7lay12mGq/t9BAYH6+MW
	wFA3iU4P2hqowKK/du7Qm2pgfSWRmtl13ZImGUTBEkRUsUCFILSAUHpeuUodlArOInPcmLsDSjH
	jVNqV47isDfh5lmgOup/itFu3sSuAwyx7tPpSctkH7AHpvik0AeW9VfyyjVYJ2ph5v9msR5FiGo
	=
X-Received: by 2002:a05:622a:114b:b0:4ab:5f8f:54b with SMTP id d75a77b69052e-4ab90c8f5d0mr122788001cf.39.1752734120941;
        Wed, 16 Jul 2025 23:35:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFETV8IAJ+vrQysbC2BJC79rSdua9fnjVrcKuLw5TGyOFj1bU6JvZgRf5k2DClHu4Oix5WHA==
X-Received: by 2002:a05:622a:114b:b0:4ab:5f8f:54b with SMTP id d75a77b69052e-4ab90c8f5d0mr122787581cf.39.1752734120335;
        Wed, 16 Jul 2025 23:35:20 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f9d599sm12077435e9.33.2025.07.16.23.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:35:19 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 08:35:18 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aHiZpnFhhR5O0h97@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
X-Proofpoint-ORIG-GUID: bVg54LHjbxkf23tzTTgG6SagIOPXV-o6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfXzB6P7CWFSMJZ
 HBSHC4vgXD4CQr6FJQhmHA9AdYXHey27rw7FGegJaApZYVb7sTYYfvu/2dXQ5ehM4DK2Lo+nIb9
 xQ8uNV5qlESU2+daOYeD8W8dDjVKpsu55Lab0BPLokPEuDCEsAbrSn3NR3xT2uIz55yuCh1bm7F
 skhEP2URJfHnYgxG4EeoVqnvOsocYY5KW1w7AHGKlZzrQKrIGX+qqQ8hiTc+JSwGEZJrqYnzC9D
 6LdIAXCwaqmATH/UtZFeb58WufsdrIzWvmAK/UAPGdJy0YNM6oeSvXzILOubJo7fclkHg2MG+zt
 udxBdDhvBdmC//N0zwIukX1jrS3SFitS6PV3f5brdH6OQs3o3+SdqBXkUG5Fj5muCIaXl+DLv3S
 d4iCW5DrCdCKftXHI34NOgOwskUeZ/YDIrarzAmNIXvW9DsqvdL6xSUabv6lm8pfTsSIWcdX
X-Proofpoint-GUID: bVg54LHjbxkf23tzTTgG6SagIOPXV-o6
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=687899aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=dNlq0QKA0UXHzezakPIA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> >   1 file changed, 127 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..0371f8dd91a3
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
> 
> Shouldn't you be on this list ? If you upstream a file I think you should
> list yourself as responsible for its glory or its mess.

happy to do it. The MAINTAINER's file covered all the files named
schemas/media/*venus* so my understanding was that I shouldn't.

if you/Vikash/Dikshita could confirm I will do on v8. thanks!.

> 
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
> 
> I'm confused to see this is still here
> 
> https://lore.kernel.org/linux-media/zk5cmielm4urfm22yszmjmwvi4mqvdsfthlonq6mij7rkijcsp@7evb3ejxuaj7/

um, I didnt see this review comment - sorry about it Dmitry, I wished I
had. Right, there are 5 SIDs.

> 
> I think Dima is right, what's the problem with declaring maxItems: 5
> here ?

none. will fix.

> 
> 
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
> 
> Alphabetise includes for preference.

um this was auto-generated by the build tool. I'll fix.

> 
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
> > +                 <&apps_smmu 0x804 0xe0>;
> 
> You're listing five iommus.
> 
> I understand there's some disagreement about whether or not to list all of
> the potential use-cases but, TBH I don't think those are good arguments.
> 
> Unless there's some technical prohibition I can't think of listing all five
> maxItems:5 .. let's just do that.

since the device tree should describe hardware and not policy, and the
driver seems to be able to ignore the unused SIDs I think this is the
right thing to do.

once secure buffer support is enabled, I think migration to a child node
model will be needed but AFAIK (please let me know if I am wrong!), this
approach will maintain future compatibility.

This sort of thing is where we are heading to:

video-codec@5a00000 {
    compatible = "qcom,qcm2290-venus";
    reg = <0x0 0x5a00000 0x0 0xf0000>;
    iommus = <&apps_smmu 0x860 0x0>, <&apps_smmu 0x880 0x0>;

    secure-buffers {
        iommus = <&apps_smmu 0x861 0x04>,
                 <&apps_smmu 0x863 0x0>,
                 <&apps_smmu 0x804 0xe0>;
        memory-region = <&pil_video_mem>;
    };
};

> 
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
> > +            opp-133333333 {
> > +                opp-hz = /bits/ 64 <133333333>;
> > +                required-opps = <&rpmpd_opp_low_svs>;
> > +            };
> > +            opp-240000000 {
> > +                opp-hz = /bits/ 64 <240000000>;
> > +                required-opps = <&rpmpd_opp_svs>;
> > +            };
> > +        };
> > +    };
> ---
> bod

