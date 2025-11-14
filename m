Return-Path: <linux-media+bounces-47085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE2C5D448
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B159435C664
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E2931196A;
	Fri, 14 Nov 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q8JdOIlG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B01313295
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125617; cv=none; b=HuQe+vEX8Z1/E/RxmKLMfFh+9lKiMBh7ZKVReF71TAWcTsSF7EpGQMY+rk/il4sTPyplf2/0VUjDK/ps7XKHG/J3weINf3EmkEg2Cl8764ZMMm7Uc9WxQhmg/kEOT5pLfgBS7RVZrHJCtZfa0xyxchvShAKUIUS4cmLEwWrB2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125617; c=relaxed/simple;
	bh=U30gWwAFBsNEZmxDPBTWg1VA0Q6ekWATqu/KWSk7AoE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=q32oXAOGpZhAoDQTxwny6JswB3W99eeD/LWG7XH4TCC3IBydRSzcZaWhALybifDrmBMHOLr6lDAwMbcnjYy4Zb5YqbhubtgHBt2ytzNXw1jEl5oOqx/VCP7Fgxq84G3ccQy6niYa83aj3J/TjOMxoLGKesko1br19Y+zY65LJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q8JdOIlG; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b736f48ba11so90342166b.0
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763125612; x=1763730412; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFlFVp68C1Bl22T0DXVcRcXo+oBu0i4nDk6iL5q9r/s=;
        b=Q8JdOIlGGBD1IkXjgtLe5bYWoU3HFssjuy7sJOYTQ0AVP0G3nYbX2hXaMuothzMaU1
         ooNeXiIP7XDzfOcJZsE+HMYTo7xFHzWIhNEvbPW6t1vU3/NHRyxi/PcaU3EXPo1yRa7o
         gQ07F2u6lbBYMxT39eu0HlDC6+lUI6Q+T66EoIoNYpLNDviD/ftBVRRSdl5N054AIYQf
         UO3DcY0cCfpWUVwpOjb3jMB4NoX72WjFKu77QM2o0sO+0uaRI50HbIMtQHFnHCB+HT2P
         NHjIM5pTU3tDxnqUqyB76MHVSd+LP41tuevUQFGli2okuirIO231P8mBdrXLAhZr07Ex
         3G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125612; x=1763730412;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFlFVp68C1Bl22T0DXVcRcXo+oBu0i4nDk6iL5q9r/s=;
        b=tLZNj5crskp5qf7aJaDPdqW3/PrSNi4bjvrGlR4n9jK5oQqHM/nd5r2/vBwxnuNpaL
         X5OAyYbd9olwuAcn18y4cdaM96BMHLgwaA+FgAEhnW5NkkDzNZEHL+YfIGwtfgzrV8r1
         nxu+a10ccwENrPB/82lKXOpAQXcyA4CVqcQI9eEKMuH/dFsCPbpuTZvrHwpu9HqKYUPA
         cGrR15P0EM3rYo6piSAboSlwqaLYgA3R1G4owcdN7r+Pv8bbU+oW8H8RqUZ8Mp9a42iV
         Olo0J7Md6VKhvbjUH68db/tUSSQ3p9i9LR9D90KqMg6Y0AkAUe4YYL0YaaoZSsI9M4XI
         hvTA==
X-Forwarded-Encrypted: i=1; AJvYcCWcu8Dbq0fQ5fyALGvxsPRbhIIw5REBV7iI2EdB9FusK3eZW4sRA+GReXmxcCRtmMisBrl2VM6Z4bYfVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEQqniDWc4sQAnLV71438kOubT8SDTGsfFtvGbvvQSzbgM2J1
	7KMjZX+2VFobeMTAvszJwMHC8QR/Tj0UDeQ8/e5Y/ZUvQ/d858GOchH+M3XdS/Ruf0w=
X-Gm-Gg: ASbGnctg0Z6qV5FnYByVaS8uMIZf6rUtBKBhhaHMVHSUemGit1nKCwLd8h3eJoGlxai
	hFTGhvbQn42IhYCvSfZqModnRgNgbsLxTeEy17DjpfEPDFKJSAMsm/ejt0tqvGQdW7Q+kZRxUT9
	mY0o/oe2DUpm9A2zKTI3vU0HJwZbAlowr81zqb8lcV1xQqtVcih3psBMfnsUN5iv7Q9PYhfidFr
	OvBLGd23sPwQo/2rUO5H8ZTTEu65oN+rrB/36hcC9NOEbJItT74Cv7LjfW8ijCQrxi7QXx23Ega
	+kFamkG98NBClKQLpzgEXMU9L3qZqGc/O5r1mWC1W+QGIXWfhhKobjA2Lslyvfaop2T1zsE/PP5
	ceg6tRXnVYsma3LwxSaYnAKGmrN2Hlw4xeFRqgX7Mszml7eBTFnz8Aw7sXCh4ImzzYdKYaKGDF2
	bBfKSfA1VAx01balRbJhh0A0fJWB/pT2Q034Pwrtcr0y8J+GiXGJ1OwdYOQUyLGGfuvn7IU/a9v
	rJUclgDcaey
X-Google-Smtp-Source: AGHT+IEh2NFr1KybwXLKbTEo02cRgnqybmLKMeCfk6Zi6ooKLjugj9KSuN02CQuj+HAZ8zCcI5xacg==
X-Received: by 2002:a17:906:fe4d:b0:b72:7e7c:e848 with SMTP id a640c23a62f3a-b7348570744mr750353166b.17.1763125612274;
        Fri, 14 Nov 2025 05:06:52 -0800 (PST)
Received: from localhost (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81331sm387170666b.9.2025.11.14.05.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:06:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 14:06:51 +0100
Message-Id: <DE8FV81S45S5.CH6K1QAX940D@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
In-Reply-To: <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>

Hi Vladimir,

On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
> Hi Luca.
>
> On 11/14/25 13:15, Luca Weiss wrote:
>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++=
++++++++
>>   1 file changed, 349 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>> new file mode 100644
>> index 000000000000..d812b5b50c05
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>> @@ -0,0 +1,349 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm6350-camss
>> +
>> +  reg:
>> +    maxItems: 12
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite
>> +
>> +  clocks:
>> +    maxItems: 30
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cam_ahb_clk
>> +      - const: cam_axi
>> +      - const: soc_ahb
>> +      - const: camnoc_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: slow_ahb_src
>> +      - const: vfe0_axi
>> +      - const: vfe0
>> +      - const: vfe0_cphy_rx
>> +      - const: vfe0_csid
>> +      - const: vfe1_axi
>> +      - const: vfe1
>> +      - const: vfe1_cphy_rx
>> +      - const: vfe1_csid
>> +      - const: vfe2_axi
>> +      - const: vfe2
>> +      - const: vfe2_cphy_rx
>> +      - const: vfe2_csid
>> +      - const: vfe_lite
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>
> The sorting order of this list does not follow the sorting order accepted
> in the past.

What file should I best reference?

>
> I'm very sorry for the vagueness, but I can not pronounce the accepted
> sorting order name, because it triggers people.
>
>> +
>> +  interrupts:
>> +    maxItems: 12
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite
>> +
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +      - const: sf_mnoc
>> +      - const: sf_icp_mnoc
>
> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
> IP to produce raw images, and one day you may use them somewhere else.

Ack, will give it a try.

>
>> +
>> +  iommus:
>> +    maxItems: 4
>> +
>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: IFE2 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distribut=
ed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>
> Note that the list of items and the list of the item descriptions do not
> correspond to each other. Titan Top GDSC shall be at the end.

In the v1 the comment was that top can now be put on top (because a
limitation in the driver was fixed). But yes, forgot to modify
power-domains description. Will fix.

>
>> +
>> +  vdd-csiphy-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdd-csiphy-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to a PHY.
>> +
>
> Please reference to the schematics or SoC TRM, does SM6350 SoC
> have different pads to get supplies to different CSIPHYx IPs?
>
> If so, then please provide hardware properties to get a proper
> correspondence between supplies and CSIPHYx, and make all these
> properties optional.

I shared the names in replies to v1.

* VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
    (not referenced in downstream kernel, connected to vreg_s5a in
    schematics, which is MX)
* VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
    With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
* VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
    With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    patternProperties:
>> +      "^port@[0-3]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +
>> +        description:
>> +          Input port for receiving CSI data from a CSIPHY.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdd-csiphy-0p9-supply
>> +  - vdd-csiphy-1p25-supply
>
> When a change to add CSIPHYx specific supplies is done, please remove
> *-supply properties from the list of the requred ones.

Is this pending some other change that will be posted? Or what do you mean?

>
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
>> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    soc {
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +
>> +        isp@acb3000 {
>> +            compatible =3D "qcom,sm6350-camss";
>> +
>> +            reg =3D <0x0 0x0acb3000 0x0 0x1000>,
>> +                  <0x0 0x0acba000 0x0 0x1000>,
>> +                  <0x0 0x0acc1000 0x0 0x1000>,
>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>> +                  <0x0 0x0ac65000 0x0 0x1000>,
>> +                  <0x0 0x0ac66000 0x0 0x1000>,
>> +                  <0x0 0x0ac67000 0x0 0x1000>,
>> +                  <0x0 0x0ac68000 0x0 0x1000>,
>> +                  <0x0 0x0acaf000 0x0 0x4000>,
>> +                  <0x0 0x0acb6000 0x0 0x4000>,
>> +                  <0x0 0x0acbd000 0x0 0x4000>,
>> +                  <0x0 0x0acc4000 0x0 0x4000>;
>> +            reg-names =3D "csid0",
>> +                        "csid1",
>> +                        "csid2",
>> +                        "csid_lite",
>> +                        "csiphy0",
>> +                        "csiphy1",
>> +                        "csiphy2",
>> +                        "csiphy3",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe2",
>> +                        "vfe_lite";
>> +
>> +            clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
>
> I believe this clock is critical, and it is set so in the SM6350 GCC driv=
er,
> therefore it should not be added here.

True, gcc_camera_ahb_clk has CLK_IS_CRITICAL in gcc-sm6350.c

>
> Multiple CAMCC drivers define some of the clocks as "critical" and always
> enabled, a misconfiguration in this area may cause the reported warning.

Will try to remove it then.

>
>> +                     <&gcc GCC_CAMERA_AXI_CLK>,
>> +                     <&camcc CAMCC_SOC_AHB_CLK>,
>> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
>> +                     <&camcc CAMCC_CORE_AHB_CLK>,
>> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
>> +                     <&camcc CAMCC_CSIPHY0_CLK>,
>> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY1_CLK>,
>> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY2_CLK>,
>> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY3_CLK>,
>> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
>> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
>> +            clock-names =3D "cam_ahb_clk",
>> +                          "cam_axi",
>> +                          "soc_ahb",
>> +                          "camnoc_axi",
>> +                          "core_ahb",
>> +                          "cpas_ahb",
>> +                          "csiphy0",
>> +                          "csiphy0_timer",
>> +                          "csiphy1",
>> +                          "csiphy1_timer",
>> +                          "csiphy2",
>> +                          "csiphy2_timer",
>> +                          "csiphy3",
>> +                          "csiphy3_timer",
>> +                          "slow_ahb_src",
>> +                          "vfe0_axi",
>> +                          "vfe0",
>> +                          "vfe0_cphy_rx",
>> +                          "vfe0_csid",
>> +                          "vfe1_axi",
>> +                          "vfe1",
>> +                          "vfe1_cphy_rx",
>> +                          "vfe1_csid",
>> +                          "vfe2_axi",
>> +                          "vfe2",
>> +                          "vfe2_cphy_rx",
>> +                          "vfe2_csid",
>> +                          "vfe_lite",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid";
>> +
>> +            interrupts =3D <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
>
> Interrupt types shall be IRQ_TYPE_EDGE_RISING.

Ack

>
>> +            interrupt-names =3D "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "csiphy3",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite";
>> +
>> +            interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_AC=
TIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_=
ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_AL=
WAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_AL=
WAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>,
>> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_A=
LWAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>;
>> +            interconnect-names =3D "ahb",
>> +                                 "hf_mnoc",
>> +                                 "sf_mnoc",
>> +                                 "sf_icp_mnoc";
>> +
>> +            iommus =3D <&apps_smmu 0x820 0xc0>,
>> +                     <&apps_smmu 0x840 0x0>,
>> +                     <&apps_smmu 0x860 0xc0>,
>> +                     <&apps_smmu 0x880 0x0>;
>> +
>> +            power-domains =3D <&camcc TITAN_TOP_GDSC>
>
> It should be the last one in the list, if the settled practice is followe=
d.

See above.

>
>> +                            <&camcc IFE_0_GDSC>,
>> +                            <&camcc IFE_1_GDSC>,
>> +                            <&camcc IFE_2_GDSC>;
>> +            power-domain-names =3D "top",
>> +                                 "ife0",
>> +                                 "ife1",
>> +                                 "ife2";
>> +
>> +            vdd-csiphy-0p9-supply =3D <&vreg_l18a>;
>> +            vdd-csiphy-1p25-supply =3D <&vreg_l22a>;
>> +
>> +            ports {
>> +                #address-cells =3D <1>;
>> +                #size-cells =3D <0>;
>> +
>> +                port@0 {
>> +                    reg =3D <0>;
>> +                    csiphy0_ep: endpoint {
>
> An empty line before a child node is always needed.

Ack

>
>> +                        data-lanes =3D <0 1 2 3>;
>> +                        bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                        remote-endpoint =3D <&sensor_ep>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>=20


