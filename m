Return-Path: <linux-media+bounces-37603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31DB03A54
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 11:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39B847AD6B8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 09:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774E823C8D5;
	Mon, 14 Jul 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYbXmRbq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCFC23AB88
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484052; cv=none; b=i1u0+bZP1Id+mklg/f5+sBbe84g5zUqHEUECHBvreQ/322NBeMA6bozgHZ1cLetcDQPcV4uS54RM6o32J8GK1PYja/lN6md5EDcXLrinbx7pHt0N222d81x6VX/tYe6O7KUt9qWVFFLN8O18FCt8qwQa1zVnxF88iE680L1meNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484052; c=relaxed/simple;
	bh=IEo/0ebyLqCtoPIUGho1naveiGhjOQs40pxOBVatadk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuOOPsYMEpB0ZusoFsv5zk31goNRORfWjlfaUXaoBHuhb84LDKiTRSjBJnd8dhbPVdzfJ28Ad6CdBqfTfUZ8dMG8TdCj84eRVFSyO8AeydB2BugrQkCcN2dZgnt0Ly2uF7AKEiUYfljQ6AIzGtTtCOahhyXHaH8AUD5F2KEdulM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYbXmRbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNMUxv028887
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=; b=AYbXmRbq8xd1OCk/
	s+IyeLmGFfeiNNGNQIdNkKND663wReiQq1+hIG8/I5qZeIT8TH+Ck0PfG/m9KDuD
	Aa/RkZCCB8R5Wenu+hwrbLVhltILB5yq7T52m5EIy9X0jTnVDd3gcedmZswLld9T
	C2UCqHn7JusrK1QwKFzv6ShZkNOxoY2SFv6mWrZm6nwqstbrUYt2Iv6fg1mymird
	eNIzgKDJQT8YUjLdpuvzDQaEovjfDe4SyOaQrh+EiSB7er59VYloiV6sIBxYdI6Q
	ouk9hq6OyzhQLgZ/LkeBEfmMPjOdPzk/EmfpVHzQeET4CFt189KXOOH25S5KAW1r
	GMd+vQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu83vn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso15514736d6.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 02:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484049; x=1753088849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=;
        b=BvdApt9Ts9tuWzkw65pv7Qku4SsJFOn/p5Vq8dD/Kw7+gK6U93jat5v7PTGhQS+plH
         L/sveDlTkN/PBENWh2R18LoGbXzXJO7GRX/83/v5a4PbqDyaXmqL6coMe+YqpStw11ar
         smd/M8AOUYV+sVQzxnBhKjs4QFptM+2T5/hF+f/R2GsYmi3ilDgCJa06f61TXYZsCmGh
         tGuBUO/+hcPqX+2Zuc01uPUe57bqQ+F+35aowVahXrjMWbRWPIQU4vPs8sIUBIbUjgmy
         82BErrcF/9uye5C3JMP6YvSc2ii1BUbGGXHL3T/ivHtL9OnaubSwwCTUriygC5PwcGgt
         t0hg==
X-Forwarded-Encrypted: i=1; AJvYcCWqspac9bHkQejLwCJuozJFGZ1REfbRaEKMxOIpfzOe6sYIfSdi4wF6+cNFUBVnwde+79qTSlQn6Ga2Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmXqFzhoDD5MyqX1Izfcu5azk5WOI9rmLkAU4Ib6L/0L1Dl9Y
	jterUSx9lQ7dZD9AqE6e56KnLgZQpqonw2s9s2SLWP8a9r5qLXBR0ri0AWLouL1QeX3bCtonjWT
	/TjZPUJdPhnqp63lx6bIG/j466WMSvhktGHQRaORv3HWp26PlASvjpaSnMNlZWQWZOg==
X-Gm-Gg: ASbGncul6JvIudWwDG95pDtu4cg5DuzDHwAFX8xYFsUt5bVYyJoMovMBtYrn9sDyBou
	MN2rix4yCSnYG7vndlftKewyqsI9e/O/TMZImaOlND6LtOXkn2nI5LemjCyvUiZeNrmWlxRnY3v
	pewQsK7NMt4RTMy/U5YlaubggKRASuV7AyjqJuM3wqHJnjEbku/d6swj+SXgQLI5YwkQn+MalrJ
	NuPCFP7EaiZXaBwn6TZHjF69mh7LhXS4iG/pQ+IzUuOqPWR9Fhvgw2IqhZNZ5MmAdFyOuWHQHfe
	o2OlbHBflAXXkiEH799epjBEuYNvf2G+GDPeE24ag/dKUXVv1K0wFBFjyWmI+fmh1fAS7ycAysv
	oOua7v8up++v/b2ezbOea
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658697885a.3.1752484049206;
        Mon, 14 Jul 2025 02:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZeBIEWBgGO2oIe//VMo3cjAnyraMQetm8FdPub/ATMMOvADVyOJZ09L0sSUjb+pJk+fkycQ==
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658695585a.3.1752484048682;
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm790125166b.139.2025.07.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Message-ID: <7d9d027c-87f8-494b-9101-69c83ff21353@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/15] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1MyBTYWx0ZWRfX3RVbK4rDMjlJ
 H/aj3z3hwtsE3VpQqppx21UZRaonzMYJQAsEkxp/3DsoncVRvD2L1KXVD99d83P77j6Z1BDk9uG
 +CeL9jUwjFbaq7sXqNUFPM5NrsJmXnSpiDBP2/6KEmh9cD/sKnq3u2Qai3FaWXHL5gY0cF9kdCo
 D0r5jo0vlGd6mRL8gkdms9WgMSmiNhUvj9uXJePgXE6zKr+tEcv88L2jOKaYRzG7TB5eqxnWzaG
 8QLdzcKcM7zGmsPv39pgBSdQPOTJphNSzUIlPo4IebFw2Jrx9jPtRbnmHtwxhIrlb53/Tj/CZ4+
 hg9sIfiSKCZPbhrgP/BkApAJz3PmgDwLHj88hVuOIqLrJ3DqMl6nvziPGwuZaFnuXodZjISZVwL
 vGxBg7v+Zzdv/IJQ3kRxbI3UCOPfTy4uQq/1TL0nprpEZ8CN8a8krQeZwEJ0m78U7oyXNCcC
X-Proofpoint-ORIG-GUID: kQAuALh2RjsRVt-TMxt-NpSmP0xrmHMw
X-Proofpoint-GUID: kQAuALh2RjsRVt-TMxt-NpSmP0xrmHMw
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6874c8d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8FxmNogKXzv6K0n2ekAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=925 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140053

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index db87b9b5be63d4fabf5ced20b23080a1a49b1207..08268f60c305cd69baf937fced6d37f2ea788b62 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -960,6 +960,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;

vdd-l5-supply = <&vreg_bob1>;
vdd-l6-supply = <&vreg_s4c_1p8>;

> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

"vreg_"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

