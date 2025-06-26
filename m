Return-Path: <linux-media+bounces-36015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2317BAEA077
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F015616C4A7
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650E82E92A2;
	Thu, 26 Jun 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+uWMRyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E91E25E3
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947929; cv=none; b=YnIInGRb7D+npD4Ojp+Fw1Pb9B5QzMZ4b/MRQstxhZxI1ub9Aqlan9nstmLFHKDSYpN7BVQuZLtcgC/kHg81X2W2iVxWquFhXkhna1/CCP275TbCer+lXnRsSy7T2zB9H9Ms4375DcmA3rjUFhFMC3uqlZ1sNyKcBuGyooHjlXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947929; c=relaxed/simple;
	bh=UaAjEJBTuFQqZOwclYKXHCLOJefKqZur7hye3tXnyW0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTJ3DEMayfRUvDAs4knOJLB2/wijkskS5gEC26h3p4vSODx7JhWLLkXflyDJkj/w0lLoSmf+7sTSqz6oAGR2rguiC+CFAQ7cr+DeCsLNCqRq3mX+vkgi4q2ESO5YweDc6kP2Zm2HP+okB/ObDJl6BQoc7Dym540MzRerZk25JKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+uWMRyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9HnTm002535
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NBKieE2jXv5JohaadTIjJU9
	wkNY5qr2lfsmoE12q7s=; b=J+uWMRyjsA7wHWdAlfudB9l69MqS0eF4jc0mq/ud
	0kZOxn8JJVOzMYcGn/e2OoFmj0XSJ+t9z//UAG8dnNeo/KZKLIn1KrIMatLfohvZ
	wGl4oTyIIvEtpOiyFUx6EFxJKlN5G53LC7AdJalwYkwPXeDb45t/twfAEQHEoEv3
	K1ao8oaE2+IaU9USMe8f3HFgbZYaOTTYToI0AYRi9wl4XEU9SaNVkLusOzYd/ud+
	Pep4MYbUNr2ZILQiCKgBsSmBKsTRQshiZ6yzXKfyT3PgsNQUfi4DRahQHPjVhXO/
	Zlx9HLT55mpvG3D6s3yhn0e+DUzFAiR9RnCAEF7ZUS/lqQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmwbde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:25:22 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df3b71b987so9499345ab.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947921; x=1751552721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NBKieE2jXv5JohaadTIjJU9wkNY5qr2lfsmoE12q7s=;
        b=MLsbXDAc4BDlpCG5dkOlJ2cDpNF4nxW5xUiPaFr9lYTkXCQ5hzi7wVkcgAsvNq5nfz
         kyKdy0zkH6AxL3zbssPRj1Y2413sfNUHH8yAosNmJ5MyC+KuSqhLSAGwVD9UyFdKd4Gf
         IJO42ICz8KgGcyKp8cZJsprO/8jJ4N2L7T4E92icw7FuAZDRpQVwaDs8ebp4+Tjzyzxf
         dM/84YsCUBTNt/tiRwKzC1dfeNSjzNmNvX7SKTvtROb4zJpboNAQiZ+i9mEeVJQ9GSgJ
         BZTc7H8+h1ZyeQ04YwU5UFjQ/6fjupR/U94n0MMZk8YB1C0PUlB5GlDuLr9WfGez+X55
         gc6A==
X-Forwarded-Encrypted: i=1; AJvYcCUfhX/vkjANTRR8yPH69Tr6LCw+0q0l6igyBqzK6ouFYGYKgLe5LpCdBRAvShuZdgYRQrLP27POSp6h0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXsaQQosYRPyncdhcAvlBErQhHtyMiyys4XVaOs67HwEPNcQ2
	JJykvh8QtxZsLZ/nHtNO7jiwFvaOwYExjm/pznTiP3XnaWMS6dqCdlLdd8SJ2LEYl4ijePtGedd
	5PEmXFlPaT9MYyDpFceZVPEJp9NbjAzMBO48luX+9a7qATrpzSiK4mCFYMc63SVGUpg==
X-Gm-Gg: ASbGnctbHGAYYcKhNZqBFvk9hPo88yFiyBUs/iQT4qBWpg5n/IKWDDLTqiDNxPT4BV6
	56fJqqmQfCxWvpP/3uhMIHGZjY3F+YhYOcGunzkMbjLeoLVAFs0ASfIQ/RT1m4sN/poZZLvBGuG
	nc+pGPzbg7/xaKEMvY6Hy+iHLXx+sUNv7eBPE7bpqwxtbbKZhDsPIYDeyHrwxs98VLbfwoyM/FD
	Evb6zAK104ozZn0jdZ0h5gBqoyNVkAwLY2IIznrBV/wChUF3ZKnvc+0+pwvMGMh6eNaHJdjNXbR
	CfhOU2ln3N8RGkmZmXhGtwK18NvxxC1JoavTQg+ICBg0ZjcGhMVAh/HlAg==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85594945ab.10.1750947921289;
        Thu, 26 Jun 2025 07:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZwru9H4uMdVnuVCyUrwh8fkSlplx9chY9TYexo5hJ7asNWlDuOKdQ+3PCVawhe4C+yxM1EA==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85594565ab.10.1750947920954;
        Thu, 26 Jun 2025 07:25:20 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a407b63sm21209855e9.34.2025.06.26.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:25:19 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 16:25:18 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF1YTmxF0pAVDFYe@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
X-Proofpoint-GUID: OTxZrRaa0k-CF0UtjXfJcOlO6kNYnw9y
X-Proofpoint-ORIG-GUID: OTxZrRaa0k-CF0UtjXfJcOlO6kNYnw9y
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685d5852 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=eotat5ZnXjsHnA-9JakA:9
 a=CjuIK1q_8ugA:10 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMiBTYWx0ZWRfXyPLadL8lwghi
 1bWSc5aRHDJQMCjv12m0SfOn7VXl57UFpFdivmFobkAgzjEJxzPXxPwJKwBXvOGNHvIw57pQvA7
 HOzsDoCtytN8kcadLd0PDphdLnFY0awkkx3NwjHF1GMcHxw3EUoLVn4S/O3Ecme02+sI2Wdw0t5
 nTJyH5M/0IYzSntQPHPQgyd0asNLH/FIHCgHxLQbQQ8cvEXsSjOZGzNpl9kekq/ixSDqBzM7/XT
 IJpypraSJGsE73BwwhXrqhW3GtAvyvKLIjBlcna/3PpbAZ1r4GoqYTV+NRyUIBwbsumcD8ZJB6z
 GXtNTjpam3YIeK3RYBi7fW/KlWTNEVOr+TWyh/RBEMLH4xf1gAzDsff4VncfL/ciHEVOtgoQ2UD
 eQSH83FC/3MI7JX9O42caccSjmR4w0OmdEFDFz49/xScjYT+H76B8guwgFTKn1CmCAvLNM1/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=718 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260122

On 26/06/25 16:05:00, Krzysztof Kozlowski wrote:
> On 26/06/2025 15:59, Jorge Ramirez-Ortiz wrote:
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +			interconnect-names = "video-mem",
> > +					     "cpu-cfg";
> > +
> > +			status = "okay";
> 
> Drop, unless you override existing node, but then this should follow
> standard override-label/phandle syntax.
>

yep



