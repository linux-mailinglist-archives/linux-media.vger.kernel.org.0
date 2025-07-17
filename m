Return-Path: <linux-media+bounces-38001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA46B08CFA
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE141C25A54
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8182C15A4;
	Thu, 17 Jul 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aakGKykH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523329A303
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755614; cv=none; b=XXxW/647jIuP6O97wjcXK1e3vQu8chtqjBIDazjLhUzIGRuioiK5o9fNYArQzhoiTAu7u+CxZLGe7P5J1x2W27BvjjrWHd9/fOXDLTh3VznRNRzdZF4lM0vuC/YXdfUUi5OQBGBCt0g8NgPK26jyvgegMfyUxhITnzcEriWDXkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755614; c=relaxed/simple;
	bh=Gmv7dVIb97BTPREuQrN3CXUNJACJV+uXItbUTKNKsu4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyq01Bp18wAvS7tq+3qDToYX9bAE13wHaavQ5GchqBpZxzJOgfOdzLBX3E8ITIWxkjrvyI0FyU3xG1XlO1cWM3kacxSgx3Q5QNlQjJL4q+9onjWnWMBt9Gj3RdsI4lEIR/XST7bGe1lIPjMOMb4CUHINp/uSXjstzmJSbZHmvZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aakGKykH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5aOkR021593
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vnoT4/xPZqftSBkokhP4srTZ
	A+sUjdarw39SzAh6b7s=; b=aakGKykHaHKn9V/Czx7qvSHd3+orXpNVX/fgipXe
	dQgtYAT+KUdTadL4MgG/9nsAJF70C/o+adVbLjKzDnpBLZuEaimSK1Xhkfxvm/Jc
	2Q5ZoiK4OHfjjslfrlwOVrLK+TSOBQT06sJ/PjumZKJCLIKon/dKrHUoaRl1B3hn
	gFsve7pKv8zr/Ul+L6EbAh/CdzVrxuj+1+6vSbGiPWpAYH3mA59ObVGxiRmxV3xl
	o8Df6QOIIL03ZQVBF0cpVXcDZbxUoojOppgJZVAB1FFsumNYrx2tMWNsBsLa92mn
	fGHuXqrK/E6IvjGdVV2itMH5RH6JYFmFOu5QLbfvMoC9rA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8ffru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e338e627f1so257840185a.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755610; x=1753360410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnoT4/xPZqftSBkokhP4srTZA+sUjdarw39SzAh6b7s=;
        b=lJBj+H0JyLxzThsFuAmeTymDuf53XfdQBoSd/64D+KfRyKedYAmmPWHGVzOXunruk9
         mZw3TjKCKz4JLbLAmv8YNzeoGaZIwsr8WvCbeMmXJ98BKiNpnAQMmlQr4g5IKRdiXTG3
         9dnmv/RKtxHQsFIh2XYFh7ZAT+xnNYudBgVLYIa0zDu7T3rl2eFiW/QZZLrm18PcrVIv
         wl2hQXVR9IPSIzhMFTS0MhtfEQ3Kpqas4bmxqgRrBo/Jf+81Y6Q1pdnqJIG9uBHHRAHM
         634OiGrYVVeCQvVjiWj2wgMispRJEarM2GWKELU5sw30YVcJKikU22sJxhOPgUS+dPMy
         hWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNnZod0SHO1+4b+vbJtvH8ihvCowi+oXCK4n5IC3HdNsvn/t1Ref9o3T/d77ZvErd6kHNTy0WrbT2Mmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QhW2w+F1+s3xIHbgsxLvgZ9ufwsuyKR3zKjJYV2rzNW6l1G/
	bDeoJpn43OYTbcs69yFhy8sgYk3mPFEwUVIbEBpfnX8HlxG0yc66AFu3CtTvZwEj9aPbYXMY9+d
	PKj1p0BTpU02y4lEau5KeM3a7Ra64jGQoYyzC+Wdj8cCRAuBJT6YenL1f6giedl6UZw==
X-Gm-Gg: ASbGncvQBkYY7Lyycq5lAVTTYini7K86y9Z2RSdd5NL99T61bdRfyf0ypB3mKYr9g6g
	OgkQxkILgupvbOtW3yXdqVihpV9dL2Rsxlo4OlYyR9JHPWs4t+yNvigzCs4A28FlYxHwrPdkYI8
	VG/iMygXwikviBfUxfb8ACGbcSb+s16gjd4LcTMw2PXENQ7oWotE4HumiDswudDPfg3bEUx7meS
	3DwWWl+N2tzLwzVQSGKTNu9xpTdf+wIi5llebEqtntTEoX/mh9GRy0U+f+CXPvAHG2Bsb/Msnm1
	kh612+/54dfwr6CceB52cJauWYVkcgBhoKUIDFglb5BlZCFiiKMPlQV8iGcosEc9P3WHbzslDBU
	=
X-Received: by 2002:a05:620a:26aa:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7e342a628f3mr1054709085a.10.1752755610508;
        Thu, 17 Jul 2025 05:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSnIBcZM6ZddE0sOAybyV9BkM2sMD+GB/jEshb6aB2JUCIRPwvnx1f3dg+qsl9snP6iSbjmw==
X-Received: by 2002:a05:620a:26aa:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7e342a628f3mr1054702985a.10.1752755610041;
        Thu, 17 Jul 2025 05:33:30 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634fab0f3sm21467895e9.35.2025.07.17.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:33:29 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 14:33:28 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Message-ID: <aHjtmOlL8bp6lRze@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
 <00be65fd-2a25-4b6d-8fb8-7a40f8ca846c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00be65fd-2a25-4b6d-8fb8-7a40f8ca846c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMCBTYWx0ZWRfXzh4H35W+0Fol
 tN/i9H2c3EE0fvewm1j1LE9Hl8fKyLFBbUUK4OxHbLGJ8qAbh2BF9v1937mu5dtD7V67fqkhvWF
 UdRpSx2hyghhUX1AKw56cjxzDJitVe+qb0rXoVRygzq8PWVNCTJWHrJsDOKj/+F8M+xuLulctqu
 IBcZeAMBLDH1uJEI4xLkKdEXGO4jmX29J62IaGDSVHrOdB5NQ9NVWmgMsK3RTKncuCVmKhwOtWh
 oaZGDoKlp90jeTHWESQuSY/0unslBKKudZm1FQV4PGVqBzqVWUZX8teJDV6hmNYDpzWKOmYtGyF
 +6FfThQkFzGUdrzcFpNDmUCP99g35Gn/0YQeD7vliGaChKINoABpLdGY2d2Wgn44RHrxrvZ1ka1
 DeRIB4wFajDjMshVecYkoxxdufGJt/F1QzFe3LF02v15SRJnqnt2rOLPYedGhOmXyeLpgBtQ
X-Proofpoint-ORIG-GUID: r6eWRWEOxs6033PgMQ5ZxGOX-s5iVAok
X-Proofpoint-GUID: r6eWRWEOxs6033PgMQ5ZxGOX-s5iVAok
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878ed9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pzCxKkVfxTIgAx5FXkwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=882 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170110

On 17/07/25 10:45:52, Bryan O'Donoghue wrote:
> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > Enable Venus on the QRB2210 RB1 development board.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > index b2e0fc5501c1..8ccc217d2a80 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -711,3 +711,7 @@ &wifi {
> >   &xo_board {
> >   	clock-frequency = <38400000>;
> >   };
> > +
> > +&venus {
> > +	status = "okay";
> > +};
> 
> 
> goes here

sorry, didnt know

> 
> &venus {
> 	status = "okay";
> };
> 
> &wifi {
>         vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>         vdd-1.8-xo-supply = <&pm4125_l13>;
>         vdd-1.3-rfa-supply = <&pm4125_l10>;
>         vdd-3.3-ch0-supply = <&pm4125_l22>;
>         qcom,calibration-variant = "Thundercomm_RB1";
>         firmware-name = "qcm2290";
>         status = "okay";
> };
> 
> &xo_board {
>         clock-frequency = <38400000>;
> };
> 
> ---
> bod

