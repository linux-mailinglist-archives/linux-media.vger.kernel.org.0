Return-Path: <linux-media+bounces-21948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F193A9D7D9A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46CC1615A0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A570E18E743;
	Mon, 25 Nov 2024 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k0XTXjzR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE8D18CC10;
	Mon, 25 Nov 2024 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524842; cv=none; b=U06JSntyL+Fg02HycyrHHk58IaravV7OxQ+lg1LuC9g1OLP4pOda+8jIssTZX1cMu73CiL9m9koyP2fW09m7m4R5+cNlNM/inR8Yuvjzq/XCW8BX2pYSCy8+g4VzUZ7Cjv97Os9OSs0gCjVXvcmrtXs/1kethsS82ko7lpg7VKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524842; c=relaxed/simple;
	bh=BCV4AveJjg8QX8QhDw+qZ+GbxdKGPdVP88bpa14K6e0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hj6+qZ8RsyNfgRJExnGcmiekHSq3sMCl5PDQIwefIxoEPIAbneMKHoYjO+qPU8og0QyEhLv+yFokObV5jxOazKxdPEDGUFigKQr33VX6a1PJFAUF/HVD5w+AADeFGIJokc3F4dElty4COtYwozhq+UzU6mziqs2tVS0ZXSIZS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k0XTXjzR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMPXpt020204;
	Mon, 25 Nov 2024 08:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR0tN4rFPEvXMFzUpAzdtjSrIeMbVM3qXFcE36MnH5A=; b=k0XTXjzRHf3GEHl2
	PwDthGXbCp/OhIyr2W55Jlmg8BsWCn13CbUhu3DlTEUC6IfXPgk1UHr0AsdPemmU
	UVHcTopKgS3b5u/Py9J+zB+Rfx+UaqE7yoqltB5ZwM0f0nPVQYXdbkx0789b5uc/
	F1bVTvfLuLc22RerMQH7XqWtmJmOByA64CTBBzHX7WyyXnswS8Uy7Tbw7X/6ZOkX
	zFHnwSlCp+zbaojmiHaGUTrBqHVBZMqdNgnTF8ini48EPR7286/CKC7lIZkwtXrk
	Tp5+JvcOBaMgNmpjKv/erlvp8Sl73uQQQ+FJlgsrfqQ7bBb8Sd07OQr8AXoyw1b5
	pFgcQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jbvq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:53:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP8rtT6008366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:53:55 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 00:53:55 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 00:53:55 -0800
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
Subject: RE: [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Thread-Topic: [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Thread-Index: AQHbPvvTGBiH8S4HD0Ogz0mOX+H4YLLHsEtA
Date: Mon, 25 Nov 2024 08:53:55 +0000
Message-ID: <e26f3ce2cd6242fb95e421992ee4f333@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-4-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-4-5a376b97a68e@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SSOTqc11rUhQ83FtuOdAa29OEIY0eouk
X-Proofpoint-GUID: SSOTqc11rUhQ83FtuOdAa29OEIY0eouk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250075

On Monday, November 25, 2024 1:35 PM, Renjiang Han wrote:
> Enable the venus node so that the video codec will start working.

Forgot to add Reviewed-by, next version will add Reviewed-by: Bryan O'Donog=
hue <bryan.odonoghue@linaro.org>

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/d=
ts/qcom/qcs615-ride.dts
> index 4ef969a6af150933c72a7a83374a5a2657eebc1b..4a7bfffb7b86b21c412b16426=
019c9063368ca19 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -217,6 +217,10 @@ &uart0 {
>  	status =3D "okay";
>  };
=20
> +&venus {
> +	status =3D "okay";
> +};
> +
>  &watchdog {
>  	clocks =3D <&sleep_clk>;
>  };

> --=20
> 2.34.1

