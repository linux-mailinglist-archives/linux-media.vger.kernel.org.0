Return-Path: <linux-media+bounces-32955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF3ABE488
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 22:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1294C77F7
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 20:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B06288C22;
	Tue, 20 May 2025 20:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp7YlTW4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF236286407
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771918; cv=none; b=ogViBB7ehPRMNkV7UF8exxwk6p7Rcg+5fXimvcYmYzlZOM1BY2wfsN1u7u5fehxDhZZQqPtO6OHPLwgUfz1HNoh6+jo+fq2H3X0bcB0LUpuVhEsUcxVm8Au0cP3BJiTfRhl7q+aOuurxJi5MFrMltsJyOg6v10hgFmrcoirqYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771918; c=relaxed/simple;
	bh=lf5r2wM+gWSyxkofv+4fH4wCygy/kakxH7guIFLmfd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMKd7hswqGmEo7qVB+f4HI+H4SAY+NgJ4IysKvfjgTvt/tZylpssNhlCXKAbXlvS31Ch3nv4glN1mKaDsTOWMXgRLHFwRgmOtdwF3+8C+t9x1e1BGzXrkQTkUVkccz72b/ccO42SOq0K13/oyqdEcKGGIT10Dbq9aNxfRIhrxjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp7YlTW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdlah024639
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 20:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=; b=jp7YlTW450nG0WeQ
	486jxcu18YFc8o9HTFsecUO7ZLeqgFE2z/uTbIBQdFyePrXRO8CchSNMa3W6uTRz
	Ej5yOfr/1zkR+8m17bXYLkH0icu1FoBmJUwq9eHsy7XlLkLMYVtr+V7XNHH3n8eh
	nGWoQbGSn9VxA4Zx9FFmK6uEiHJoCncCJt6XhUSH167Pft80xdZdHSqceOwft8S+
	Q/EBiU+T/5qE3CBhwBMtdVpEcAmG2JCgmxgGAgxfVY0SvTLAsoTxOy/OS4jkOrNp
	MrGf4M5edF6Vv9t5EtNszLs4HE4Dn+oAJzr/WGxaJ+LFP/UOFExDkM4N2viDZWUD
	OCcD6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30h3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 20:11:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c552802e9fso151152985a.0
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 13:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771914; x=1748376714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=;
        b=nTwuy/BRuN+O/1LKFqFlRRfCJrbJwD5bM8O2x0gcUIjXyIAwKrWZ7dso0eC5ElHeck
         AhYp3TpSsC3YxDhsSZmak4xdtaED3SP7FYob2fJ10Hk+x96Yu1yWQCPrzanMxYOlttN6
         DXfNZA/aR5hEzZn1/WYbNrvnNf/dh9Htm/TrAiKW/L9T07Im5KLhXSXMFO/8RR0JVD+o
         eiZrB3c6rgeQGGb8ozPk/vgsjPQkdNSwinSWTnImlzTbVOk4ltVcyVfy4LtrlidyvLd0
         musv99Cm5Oni0YWBIamKtSwmZMFQLRI8H72GLNRHPu9zA4Z0CaU+rZAaZAKtKodoYfJG
         USWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV29W+lSbxYGA4InaIkcEJdsWmn5v6NmCC8SKkX2HvK8BRHm6mPM00rz8L1QM7F0wJRhlBajVolOmvBpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkWDrrneEejhHWsLOUN1vynZm7UosJZZ0PgpZ0RuFHsll6Eu0
	YIpk7ibBC1Ri2icaXZ1le95LqMlf/L7y/VOXwYNyA/3Jepr94GXwU1tZ8uyZuykP3ODNmuaZigL
	ZxfLZwWVCUicZvMEwp2g9J4Sy2k4XRkJpIsOfM+jd3hCwKWR0vFPKAkQ7QcsgETKoZw==
X-Gm-Gg: ASbGncuSkspfsrJEd18kxsF91NmH0eRs2kyuRp/i81kyMbyLMsczQ7rpGHqt9QlIiPu
	vsuGf3kmwbs4EDz5tOyKag1F4Aef0tD/ZW73ajDcSEZV9c2m2zev52Nq5oZ9RPyzbsE+T8CGQpM
	lSduWSm+B/EiRzD1N/oM7r05tvmOX7INoCtVB4oBYMPuFswqd3u3+VcxuLVbrESiGfCMuhI3Oxe
	arG5T6t2mHRZ4si6X8NvHUnITPBZJydcKP54tJXP8d+nQFsNvvIxrR0fkkQIRyRJ8bfHmSaNNsQ
	A26ZJfi6VQwMsmfcdj+MyiPhUktSjnrOpKuN2qtVpnyXb2E6BiEuH9f7fIAG+dBG2Q==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189380385a.3.1747771913938;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzuWFlHh0j0Gw6RSmsJ2bBhmR0N482udldB75GhgJ0zvzi5X83XCYG+N2BLCT3Z7jVlI4Aw==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189378885a.3.1747771913432;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm791783566b.149.2025.05.20.13.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:11:52 -0700 (PDT)
Message-ID: <121568c3-a6b2-4772-8c28-7453aa0ef3b3@oss.qualcomm.com>
Date: Tue, 20 May 2025 22:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8c2OT5SK4sH140ZNN3TwFxW5byjrlaV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfXwRPPxt000J0+
 v+Uf2YmNDiUDCNdQP+wYcMJj/IuoCkLllBwSNnyOvATQLT9ggP6T2bIfuYxbBpaaACTmiKcXhFL
 AUrXk5AqDFdvBZqigtbHvPX6QWDpuy6ToG4uLUVaT/nUO+Ca/En8TZJ/3A8obd3GOYHu4oI1cSW
 ANylyJ0URQ3hClSBm97hWSumSv8lnCJJHUZiWf8duu/Ltfw896YhfX4XxWIAw+L1NuAFL1dFrlx
 ASuFgvtmLs/r7ps+5uH4J2DwVlrsTsh5HIiAGo7p5ZicEq23Zglt+/JhaGxPggxJlTLktlDJeF6
 SiUWtaB9VlgQoWnyq2+6HvRaPHDwWoRkDc/jd8v1LphvzMUmtPINf27Ujy4aCNblX+LLADRuDwq
 1YhDQlmUpRh1s0pCq39FBXdjR/U9uogQ4r5xuJ4ightkFE7yTHX+CZ+8e4G4NzyrhZDU9oIu
X-Proofpoint-GUID: 8c2OT5SK4sH140ZNN3TwFxW5byjrlaV9
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682ce20b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=bmytIewYy0Yx7_8Z9RYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=842 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200162

On 5/20/25 8:39 PM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

[...]

> +			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csiphy0",
> +					  "csiphy1",
> +					  "csid0",
> +					  "csid1",
> +					  "csid2",

docs don't mention the interrupt of csid0, but this soc is very old so
something might have gotten lost..

[...]

> +		cci: cci@1b0c000 {
> +			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

please move these two above status

> +			reg = <0x01b0c000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_CLK>,
> +				 <&gcc GCC_CAMSS_AHB_CLK>;

camss_ahb should be unnecessary, maybe ispif_ahb too

Konrad

