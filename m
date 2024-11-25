Return-Path: <linux-media+bounces-21947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1519D7D73
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC82282009
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B342718D65F;
	Mon, 25 Nov 2024 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qa7Aiw3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CB53804;
	Mon, 25 Nov 2024 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524626; cv=none; b=tEbaRNja2p/c3q6mxCNbu+7mkho+A5+OOsz9tu9x/wYtlHSCFw00tR14apogtKcaWFbhkw52jte1uHStOzAWetk5etQuyGB0Jk/LLITuYA6Bx6j2JKvnSFgMBEhW5ZwQP7FfKmOBPKZ9bIJozalGRmmRS+a/tIw4zSW8adTg6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524626; c=relaxed/simple;
	bh=ptUCZp9ZRCQwG4RCBwmRUaSRQ6Vfzun5B5Dr9M23JQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ffvt3NkTDmqLx07scELYqh05++xJJWgvkkhkBPd/W4vj7joiDthpYn6MdlLPB6ZCgFU4B8bPQJijmS+LIYoyzFaNXHs6oxoEV3uvFhtEcEgEB0zgyHNalLSpy1iMVTVtQYxgOooT8PBBXl6Kc33hQ4CRE6qjRkI++WawSE6rcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qa7Aiw3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMEfBn022008;
	Mon, 25 Nov 2024 08:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5I8Y1F/YhrYqg53rWeZtBFZ6rqYh6toRdQ2uX4aU9KM=; b=Qa7Aiw3bsOocwcxo
	U1fv2awcPPeMxLsS82U2vmuWf5AyzUUyne4fDtuwTedll5671wYed2j8MZyLRY9L
	8GWKBe00wwvsRvZBrM8m1zBThuih8x+T3pQ+zUdk4P+eeRlBsBlj3edtEdge1XYv
	2J2Abv9wpnPvlO0q5hG0Ti9DrL1lDZ9SAjE+OLfqvdoiHo+PSTgwjKtz2FeSKnEH
	QnI11mHSlmut/BTbxvZdEVoAgOjuZPbY5CkmCHYR02U4ff3KSmm17y+SaVK/t8fo
	oJivBT/cIKbRNOBDcERHTqNc9nsOCaKTTZreuPRVGL0Aq1Oo/+XIy36SIFCjoFo5
	q+vO1Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cfm254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:50:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP8oIja001843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:50:18 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 00:50:18 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 00:50:18 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/4] arm64: dts: qcom: add venus node for the qcs615
Thread-Topic: [PATCH v3 3/4] arm64: dts: qcom: add venus node for the qcs615
Thread-Index: AQHbPvvRcbs9d31mlE69mV4B8S0jjbLHr2fw
Date: Mon, 25 Nov 2024 08:50:17 +0000
Message-ID: <55124ce8e15740d1a4a55733455ce27c@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-3-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-3-5a376b97a68e@quicinc.com>
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
X-Proofpoint-GUID: a62BKD8Dt3h6LXOVXUJFijqrTOQrkerC
X-Proofpoint-ORIG-GUID: a62BKD8Dt3h6LXOVXUJFijqrTOQrkerC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250074

On Mon 11/25/2024 1:35 PM, Renjiang Han wrote:
> Add venus node into devicetree for the qcs615 video.

Forgot to add Reviewed-by, next version will add Reviewed-by: Bryan O'Donog=
hue <bryan.odonoghue@linaro.org>

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 86 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/q=
com/qcs615.dtsi
> index 06deb5c499fe83f0eb20d7957ca14948de7aab34..18ad4da5ed194458aded42456=
0f45a3a9f3163dc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -394,6 +394,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks =3D <&tcsr_mutex 3>;
>  		};
> +
> +		pil_video_mem: pil-video@93400000 {
> +			reg =3D <0x0 0x93400000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
> =20
>  	soc: soc@0 {
> @@ -530,6 +535,87 @@ gem_noc: interconnect@9680000 {
>  			qcom,bcm-voters =3D <&apps_bcm_voter>;
>  		};
> =20
> +		venus: video-codec@aa00000 {
> +			compatible =3D "qcom,qcs615-venus";
> +			reg =3D <0x0 0xaa00000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names =3D "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			power-domains =3D <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "cx";
> +
> +			operating-points-v2 =3D <&venus_opp_table>;
> +
> +			interconnects =3D <&mmss_noc MASTER_VIDEO_P0 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_VENUS_CFG 0>;
> +			interconnect-names =3D "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus =3D <&apps_smmu 0xe40 0x20>;
> +
> +			memory-region =3D <&pil_video_mem>;
> +
> +			status =3D "disabled";
> +
> +			video-decoder {
> +				compatible =3D "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible =3D "venus-encoder";
> +			};
> +
> +			venus_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz =3D /bits/ 64 <133330000>;
> +					required-opps =3D <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz =3D /bits/ 64 <240000000>;
> +					required-opps =3D <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz =3D /bits/ 64 <300000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz =3D /bits/ 64 <380000000>;
> +					required-opps =3D <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-410000000 {
> +					opp-hz =3D /bits/ 64 <410000000>;
> +					required-opps =3D <&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-460000000 {
> +					opp-hz =3D /bits/ 64 <460000000>;
> +					required-opps =3D <&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		videocc: clock-controller@ab00000 {
>  			compatible =3D "qcom,qcs615-videocc";
>  			reg =3D <0 0xab00000 0 0x10000>;
>=20
> --=20
> 2.34.1

