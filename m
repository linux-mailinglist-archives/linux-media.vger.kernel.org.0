Return-Path: <linux-media+bounces-21929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C239D7C5F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1844161705
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F06A188734;
	Mon, 25 Nov 2024 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KP7KxDk9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD209149E00;
	Mon, 25 Nov 2024 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521993; cv=none; b=TDXgTsmrZhQMlctDYTqCkgQcXI5CwTYHLBr6x1qSJccHpl9zyqMsNQek/ciHJ5U8W7+Qy6r/lznCz4aT4RicrP5gYl2NvUKOBHZ5lGRViczxenNTwkB6qycVrFfcIMBCXffu3uKeDwezbL0qfaFYKvgFP7D1YTdJRDsuYqEyPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521993; c=relaxed/simple;
	bh=VDmBHQw+1inSAmkEdS1dzrXyMAXxsml2uhZew3IM5jk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z8m/vfiIvoEKMRQz/bOngDCyPPhcGrwgwcA+LP6QZ+aXUAQ7Pg2saDI2unPzIPwhHDvU7FepZqP/k0L2IfoddIWl0MZc5WztbS4C/VpV4dWqCHn/xx5fw/fXuL7N8W8IHRcYrj+Byg5u3BQfwUN5Gvy1RFr3DvO2bYg39ro1MkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KP7KxDk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP7VmVf010664;
	Mon, 25 Nov 2024 08:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PA7ap52fxusih88B1d6kk7JuuHnNkXCa/1+M5ouLd5I=; b=KP7KxDk9mbhaLYkx
	siF5JLSjny6H51tDsKbuZ3uNjaGctec4w4rYoF5Y7ELLnvUga5umTll1rBf9CMts
	npgc1fzIiLy+B0H21jjmGStopoHQaAEctdbbpE5TiEJ4KZtsLKjYZIQfiLgeDcM9
	WSdRZM7Zf6yZIijG8cuMQZ/hIrnWo+BQigk7U7LhGXnWwOhnXULVUedFCwSzlFlO
	Gxvyj/L8PeJhwLRlCl9Pb1L3U7kitDuPiFjQTFTUw49NS2ewEilolcFBRdH0xZHC
	E3NKvhd7lAop4bTWwsFP/V9BGzQ37F0iB2Lo8YDWJnunXLHQ854FZCqwru7fqrU1
	j5EDcA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx702ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:06:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP86Qht018326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:06:26 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 00:06:25 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 00:06:25 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mauro Carvalho
 Chehab" <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Thread-Topic: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Thread-Index: AQHbPvvNBcmhQ7jCvUeLTdcFK605vrLIEToA//99IeA=
Date: Mon, 25 Nov 2024 08:06:25 +0000
Message-ID: <558dd362d6564cd58bfcf53c12d91f0a@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <173251666879.249116.13599300666564865920.robh@kernel.org>
In-Reply-To: <173251666879.249116.13599300666564865920.robh@kernel.org>
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
X-Proofpoint-GUID: _8qZVuD2uytzZFl4Xy-e4JaRIBYkkk29
X-Proofpoint-ORIG-GUID: _8qZVuD2uytzZFl4Xy-e4JaRIBYkkk29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250069

On Monday, November 25, 2024 2:38 PM, Rob Herring (Arm) wrote:
> On Mon, 25 Nov 2024 11:04:49 +0530, Renjiang Han wrote:
> > Add support for Qualcomm video acceleration hardware used for video=20
> > stream decoding and encoding on QCOM QCS615.
> >
> > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > ---
> >  .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++=
++++++++
> >  1 file changed, 182 insertions(+)
> >

> My bot found errors running 'make dt_binding_check' on your patch:

> yamllint warnings/errors:

> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,qcs615-venus.example.dts:25:=
18: fatal error: dt-bindings/clock/qcom,qcs615-videocc.h: No such file or d=
irectory
>    25 |         #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/binding=
s/media/qcom,qcs615-venus.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_bin=
ding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2

Thanks for your reply. "dt-bindings/clock/qcom,qcs615-videocc.h" has been a=
dded in https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0=
-7d3b2d235fdf@quicinc.com/.

> doc reference errors (make refcheckdocs):

> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202411=
25-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com

> The base for the series is generally the latest rc1. A different dependen=
cy should be noted in *this* patch.

> If you already ran 'make dt_binding_check' and didn't see the above error=
(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

> pip3 install dtschema --upgrade

> Please check and re-submit after running the above command yourself. Note=
 that DT_SCHEMA_FILES can be set to your schema file to speed up checking y=
our schema. However, it must be unset to test all  examples with your schem=
a.

