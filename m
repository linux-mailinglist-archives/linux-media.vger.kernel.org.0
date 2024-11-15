Return-Path: <linux-media+bounces-21446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D99CD623
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 05:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8E41F22666
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 04:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEBA16FF37;
	Fri, 15 Nov 2024 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pfa/Uhfz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C98156F5D;
	Fri, 15 Nov 2024 04:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643653; cv=none; b=TCtfZ86u4d26c05JYM3XmS7GPMqfiffKyiyUkUxeOu5vn77pF31xuw4Nhz8gHM6/govCTCev4IXgLbG4KP5s55nvivaBGvHAUE1lj2xphQSiRNPFnajZaFX4WJ9Ce2lmj6Rsd8crpydz6mUyk4PGTrvyNkPoZRTsQ8jBk6ta9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643653; c=relaxed/simple;
	bh=VlpnF5w/lzklQc+xQBMc5RwW6AlJD1YzDnz+KO0JhjI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WTMUo9wxbPF3S6QCsclq7z706fNg/0K3rV0FRjNcWFwME3g4/OLnhe0aMg4PWkRSpWMTKc1VdrSnJ5JCcOK+rcamO3NRc9C3NoIOK+kPCiIZ2tb0OCIkf0p3Ov4ORi7aI5+36LyhW+qPecZVZl3LfmnELh5w7WHcIl5bBoYE5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pfa/Uhfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHvj2013426;
	Fri, 15 Nov 2024 04:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0wel8IXt17KIvMnouSfiKV7Ct/b9qe+Vww6RzLViHZ8=; b=pfa/UhfzoS5wjSN/
	NqH5467LLM7sJ2g+ROpBRFvi9Gx9xGN5izUY6RtJIxi1IsEx+R2vSTU/g3+Nj3Ap
	XLWp4EQ+paidKEaRorcjTm4tyuyPRhDM717aFDJ+2mOiZJx4+zb/5DvMqLPrp4pK
	KroNeXY48q4suJNYfugZnaHbBXU7dcO/RsDwJnXJf5bJVlMuA9YvPHC7IUljKqMo
	tWeywKvfiqyTrfly1+J4zgNmdU4ME51zvq3f+W0brLDvqnosN2FgIVhA0rf9GLXM
	z9C9CFJz/Ss+Og4q5YW2dttakSRiE95sKkTjoOw0ZO2+Zw5/th2mWXuH7F25jMR5
	TT+AVw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w7ekmy3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 04:07:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF47PUk027108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 04:07:25 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 20:07:24 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85]) by
 nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85%11]) with mapi id
 15.02.1544.009; Thu, 14 Nov 2024 20:07:24 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Thread-Topic: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Thread-Index: AQHbNPjc6u9OdCowaE+nFUoyTjgZx7K18TyAgAHJJQA=
Date: Fri, 15 Nov 2024 04:07:24 +0000
Message-ID: <cc571cefb8794b1ca02d39e4b4f7cd9c@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
 <20241113163857.GA436180-robh@kernel.org>
In-Reply-To: <20241113163857.GA436180-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mKTBM6xxCrGrH1GMFW_iqqg9ZZy_WHIr
X-Proofpoint-GUID: mKTBM6xxCrGrH1GMFW_iqqg9ZZy_WHIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150032

On Thu 11/14/2024 12:39 AM, Rob Herring  wrote:
> On Tue, Nov 12, 2024 at 05:17:57PM +0530, Renjiang Han wrote:
> > Add support for Qualcomm video acceleration hardware used for video=20
> > stream decoding and encoding on QCOM QCS615.
> >=20
> > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
> > ---
> >  .../bindings/media/qcom,qcs615-venus.yaml          | 181 +++++++++++++=
++++++++
> >  1 file changed, 181 insertions(+)
> >=20
> > diff --git=20
> > a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml=20
> > b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
> > new file mode 100644
> > index=20
> > 0000000000000000000000000000000000000000..a807f4c7e94c635ef1662971b687
> > db9bdce1b74a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
> > @@ -0,0 +1,181 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcs615-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCS615 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com> >
> > +  - Vikash Garodia <quic_vgarodia@quicinc.com> >
> > +
> > +description: |

> Don't need '|' if no formatting.

> > +  The Venus IP is a video encode and decode accelerator present  on=20
> > + Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcs615-venus
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    minItems: 2
> > +    items:
> > +      - const: venus
> > +      - const: vcodec0
> > +      - const: cx
> > +
> > +  clocks:
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +      - const: iface
> > +      - const: bus
> > +      - const: vcodec0_core
> > +      - const: vcodec0_bus
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  memory-region:
> > +    maxItems: 1
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

> blank line

> > +  opp-table:
> > +    type: object
> > +
> > +  video-decoder:
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: venus-decoder
> > +
> > +    required:
> > +      - compatible
> > +
> > +    additionalProperties: false

> Put this before 'properties' for indented cases.

Do you mean let me put 'additionalProperties' before 'properties'? like thi=
s?

  video-decoder:
    type: object

    additionalProperties: false

    properties:
      compatible:
        const: venus-decoder

> > +
> > +  video-encoder:
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: venus-encoder
> > +
> > +    required:
> > +      - compatible
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - power-domain-names
> > +  - iommus
> > +  - video-decoder
> > +  - video-encoder
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h> >
> > +    #include <dt-bindings/clock/qcom,qcs615-videocc.h> >
> > +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h> >
> > +    #include <dt-bindings/power/qcom,rpmhpd.h> >
> > +
> > +    venus: video-codec@aa00000 {
> > +        compatible =3D "qcom,qcs615-venus";
> > +        reg =3D <0xaa00000 0x100000> >;
> > +        interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH> >;
> > +
> > +        clocks =3D <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK> >,
> > +                 <&videocc VIDEO_CC_VENUS_AHB_CLK> >,
> > +                 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK> >,
> > +                 <&videocc VIDEO_CC_VCODEC0_CORE_CLK> >,
> > +                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK> >;
> > +        clock-names =3D "core",
> > +                      "iface",
> > +                      "bus",
> > +                      "vcodec0_core",
> > +                      "vcodec0_bus";
> > +
> > +        power-domains =3D <&videocc VENUS_GDSC> >,
> > +                        <&videocc VCODEC0_GDSC> >,
> > +                        <&rpmhpd RPMHPD_CX> >;
> > +        power-domain-names =3D "venus",
> > +                             "vcodec0",
> > +                             "cx";
> > +
> > +        operating-points-v2 =3D <&venus_opp_table> >;
> > +
> > +        interconnects =3D <&mmss_noc MASTER_VIDEO_P0 0
> > +                         &mc_virt SLAVE_EBI1 0> >,
> > +                        <&gem_noc MASTER_APPSS_PROC 0
> > +                         &config_noc SLAVE_VENUS_CFG 0> >;
> > +        interconnect-names =3D "video-mem",
> > +                             "cpu-cfg";
> > +
> > +        iommus =3D <&apps_smmu 0xe40 0x20> >;
> > +
> > +        memory-region =3D <&pil_video_mem> >;
> > +
> > +        video-decoder {
> > +            compatible =3D "venus-decoder";
> > +        };
> > +
> > +        video-encoder {
> > +            compatible =3D "venus-encoder";
> > +        };
> > +
> > +        venus_opp_table: opp-table {
> > +            compatible =3D "operating-points-v2";
> > +
> > +            opp-133330000 {
> > +                opp-hz =3D /bits/ 64 <133330000> >;
> > +                required-opps =3D <&rpmhpd_opp_low_svs> >;
> > +            };
> > +
> > +            opp-240000000 {
> > +                opp-hz =3D /bits/ 64 <240000000> >;
> > +                required-opps =3D <&rpmhpd_opp_svs> >;
> > +            };
> > +
> > +            opp-300000000 {
> > +                opp-hz =3D /bits/ 64 <300000000> >;
> > +                required-opps =3D <&rpmhpd_opp_svs_l1> >;
> > +            };
> > +
> > +            opp-380000000 {
> > +                opp-hz =3D /bits/ 64 <380000000> >;
> > +                required-opps =3D <&rpmhpd_opp_nom> >;
> > +            };
> > +
> > +            opp-410000000 {
> > +                opp-hz =3D /bits/ 64 <410000000> >;
> > +                required-opps =3D <&rpmhpd_opp_turbo> >;
> > +            };
> > +
> > +            opp-460000000 {
> > +                opp-hz =3D /bits/ 64 <460000000> >;
> > +                required-opps =3D <&rpmhpd_opp_turbo_l1> >;
> > +            };
> > +        };
> > +    };
> >=20
> > --
> > 2.34.1
> >

