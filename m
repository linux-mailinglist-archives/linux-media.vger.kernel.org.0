Return-Path: <linux-media+bounces-34905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B91ADB0AB
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52D207A8185
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3EF292B41;
	Mon, 16 Jun 2025 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLAFIxgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5980827CCC4
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078381; cv=none; b=NzcKS+GX77qL7NTYeFEXyhzYGz8wAKSdozY6iyhIrcNyeVmEp9AVOZlDjeeFIOTB47386w36K8fGbIeifHL9l/L2FA5522W0fQX6Y1xKvHsKSIDCiCyc7x2Ydq7wwWnq19wHfTzwaSfSGLaosZhk4137lFlAKXt99dLwH4bmxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078381; c=relaxed/simple;
	bh=xDo/CFd9O80cjbXr3irb8h8miFyh3mpLQ44oVF5ZXVw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFu0Zf0ffHf1TeXq7TNqJsPyScYjsJvrS5fvMs8raPCdVsfbKQIJhzd95CxfGpU0u/X6g9vfIDKcUO2a3pPVexJ5qcSzupyRlpqwYHLBnrk8WB56HyVy51UNuoEzYSI2Iqe/Re9g62G3Af4ne98JL0Ywrq/Ryed0/8c1dpPCf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLAFIxgM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9jKZb023689
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3KaQaSQSjoPXPxix0wFVI/K7
	2pUStJJyIYhcrvQzs8U=; b=dLAFIxgMECezCzCS9OY0D5uNzeiMkztyFQR/SAeb
	7IPY6AJG5N7oUpmMDS9TmSnnUIYXDUxBE2/hpkoHDMlSHyDoOHErAcJFOSUXi417
	JZ2eLoo+eYyI7i9ffDBB9Y17arBk3aQVT0WkHZ5BQFiD+UU0TLmILfErROT5dabJ
	rbFudxOTUNy2IgNFcHDAcLCS95YtImAjwRiQrvdCUbU820lULhOpWRSePM43FBnZ
	8+g/JlGxu6zEPd9Vpf/yxjlqLxd/7hNzDDUWALnegko5g5Q21dWZKsbKg4bF2mzn
	zSYmQgm8xx7iz4FH3xkqgggTNQiJnbD0Vd/ge7dcO8njvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5k44j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso57960466d6.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078378; x=1750683178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KaQaSQSjoPXPxix0wFVI/K72pUStJJyIYhcrvQzs8U=;
        b=k58j4HkLpvtvzIOTautLvTV4uuyL9g4NBcHaNApmhTw7AHpIHRMscBj79sbudF8aHW
         hkocWlVze9w0xWuZPQSE7NNZvIf8S0i2m7O9vwihoYUlyoCDDJo4p0BkY8XfrHzjReha
         +Mj9tDRu+zpvFkcWqV4N0dNwyML5pOsoLdZ4AprknY47jIkZ6tbuA/Y+uJU1+3OAfRT3
         78CLoNNifhx+U7pPCRnfGWVNczk88pE9DvXAL+govgVmNHxjout6YcFo/z++0yNsqIYc
         uCjXMEvYb1UJSQZSEaaKWrd0auu8YBTf8s1ga2Mw79Y10hGh5q26thJRn5tPySMBj/LH
         7AMA==
X-Forwarded-Encrypted: i=1; AJvYcCUALhTpNDZTC+RgwIKrGPTFPBzrppjFLZumC6w20TCi+ergyUK/U68wiqxbhDrbRjiLVon8dtqgni6RUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzbSWSfEznO+QTbPGC+uMsCfWmIkCRXk7juax2Tsmqt48NqJg
	oVBa6ziJQJ2ASMQ55BIjE6y26PVwU8iej+sVWu366vB8lwmbA0r8iMlQ4k8ahojjzVCdQh1oGzo
	WzT36WXuR+JCZV58ajF2WKRp9xBLyRtfC13qo24IEhObaMfg0FDVz9vHaIOxdnsOVZQ==
X-Gm-Gg: ASbGncsQQsbbYQU8ZJpThuot1TtYToRH9ftF16RYmYB1CLFH8QNCM+P7VKLPuiAHqQT
	3U8QFC5laBnFAdjr/rY4MyX9eORLKtv9DKYKNYnUOSTP73OS3QoRSysU43HhWZab9I66w6FVsED
	d6Z6uemSH3d91zNNz/U7HrwXgL6KkKs4QeK1vjumoiMYKXQAy3LIkmUy55ldFUwFP5FlZJ3qR3C
	o4j1gwIUmbeqMm/Rs7t+akZQDV2iTQvJXytM0/VrKqR2GsBc2vNRdgkUOjD7J1viyKTUZGccwX7
	aQfjFX85rH6GwcmMQTEhHd2fB2gWMT8DaGB6AKYug7QYD/S9nVTwtKxJag==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128592206d6.16.1750078377865;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+OFLF4t7/ZWk0HbQ5uqeqFokxTATjRvaApyd+ckaiuS8GwJZ2WNkfZTT+6OXd0WtcCQEi5w==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128591716d6.16.1750078377401;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532f2ca228sm145532895e9.13.2025.06.16.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:52:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:52:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFATp3zoSgkrj3YX@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
X-Proofpoint-GUID: Ncj3Ry8v_CremDFgZ3BX_mmW1kHskfBL
X-Proofpoint-ORIG-GUID: Ncj3Ry8v_CremDFgZ3BX_mmW1kHskfBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MCBTYWx0ZWRfX/ydTqYx/kJ57
 xjskp+3HElebiAcewtVIpvYsVrjLbrftG0WChryi0wHB6hgMCHYl22kr1eOhyOVamj7mlRQkEg0
 dj6eDbHBRSIaw/4/B7+YWu4EyAj+33OWArsFV9JleOvKwyT/Woc3KNqCw6J/kwZf/sO0vftIi2K
 eGmsPIZuDuZpQTBXh1/kfgwyBYJdnVxK5galwd/QaXbvEtr8x87FKUZc4JVOLDGmIX+PZGz+ZAk
 hGGHum7HkWhGAAThWxL/kNr8A2QxWXGZTlleirkPjahVS7lRA7ToF3vxUYq2wyaGTfbpWHgfpQA
 6C/NokQ17SKtOSc+4IiPsz30zx2DfYDEgCTxBIK1VZETXpoh50yHlUaP0lUKlsdDjA+9DoErX8f
 HX/M3wBgeYcwbMoX1J5Nap2nNzgHaeaCsNze9PeRjUe2iS9xD/JYkj34H44g9arrMzT0ggs3
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685013ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DAQgPmeqjGmo1aN9fEMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160080

On 16/06/25 10:20:57, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:03, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..ffa72f1e27f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > @@ -0,0 +1,153 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

ack

> 
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
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    minItems: 2
> 
> Why is this flexible? Either you have two or three. Not mixed.

please check 5b380f242f360256c96e96adabeb7ce9ec784306

