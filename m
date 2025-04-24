Return-Path: <linux-media+bounces-30933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C675A9AAD6
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9865A04AA
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73A922A4C5;
	Thu, 24 Apr 2025 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmIPMZhB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81211F8670
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491555; cv=none; b=hOQyzP0mQ9SFlXtPBGBFGLoHSrcpAlARTCT7HFoKOhgSosKWR6z6lZFmzXqFrbPPJXN7or/4c/AUYfEr9U/bFaB784YemW6JirH/wYyw4Ld3Kp0fqplALeRD3kLTXOnsyZZwmWBc/M8ejO+Hw7zGRgtRIYwTaRtDFBIACdNplqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491555; c=relaxed/simple;
	bh=PGXPJri6Cw6siaeSinOaARRSx2I/HYewhIvfzmeUnSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oji88wKRWmDat+e6xxGPRU0VqMWU/L9wvkj1vr0jsXzXqVvLdNoWxbGXX2tOmxKBZtWDE/0WyLXUtxxTcgMrkD534ilQXIgdPcFTxY5hJEAsJFwFcfozysgWTQe9VdwWzUUDPq3Li3yEFH4dpQPlf09UgI62oqKzqvJd11qRj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmIPMZhB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAeGCo013221
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YTvMgSnUIIGLk/Fpg/tiBLoR
	7OymWdRd8yJc8ktCLRg=; b=pmIPMZhBX/VI7UiQN2DS72PS85z5qkr8rP6iNalN
	HPEncBXMwLR9N86aNrbsSrZr2OHdWNhWQk/JDFcATDtqSKn28URKTfVM9KhpcfhR
	rWJNwa5C3/WG2IC8UOHxomfZD8TlW3DZjbfaFp4R8exsTRJHHAhNh9Ol9KVL1wJR
	ZDzf2ib8ztXLTB1Fn7IJHYeomWd9vVPXGask/yhk14+Q9i1yH/Q1T8igdSAxVU7H
	GD/8+ktSIUQPM71Vs70tmx0jifeuaLLW06GUGuwOnTlm8DdvKGr8gtRAPkqleWfz
	OHMBI39GNYqtgjfuj37+wlcpj9hzbdKtVVzAT4GOkmNO7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d8vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:45:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f184b916so19352206d6.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 03:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491537; x=1746096337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTvMgSnUIIGLk/Fpg/tiBLoR7OymWdRd8yJc8ktCLRg=;
        b=Ze/8jbDCtVYItBIJsPEj//J8EjfjgoD28MD5y2Eh1cXErPJzz2qFhoIoO+bZxaVUec
         9/672Qyf6uV3ssZAecgPbf/F9PFZUJ5BLfugf4wdSvNqrisKm9TwbV8APhST39d0lSLr
         UnovIEd5Hh8IdhY2amncbpY3d5gKWNSjs41aIpHQ5znLfoy4QsHcE0GUBWUJIFWxVkst
         Se7hE9U6phatwCBP/+IpfAKC6Dk0kVtvCNV6H3l1FHCjD1t7NJDK96tc3Dsx+Y7nTCeQ
         O5tDg88Dye3qe8Kr3ZNJNKZO5BAxXc9qM+lQ+klLVFjOxK2vpU1uJf1t6lqT4r5jRMkQ
         eaeg==
X-Forwarded-Encrypted: i=1; AJvYcCUJnzrWHtcEwa41dRKLE7oUC+HRVVb7FUTnXa3w5v5O/ZEljY7LtCva/l2CFLE2n3eHmw+muRUe6rMVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5oGhOPjKSl51JS72n/6fKO1ffsCzmYruGLts+sUgtTh8UiNf
	yKvB+xNTHnf9GuE/FggXlSjHh+vPERzyoJByYYOKT+am9bSRIKIdeWgPSgb2C6vI2jk2k7TqizH
	lmi9BdLB2aFhD9LsGK+YsuFbjNiShHv4buWJCiZWspwcqnuVm6U78sl2HdI91SQ==
X-Gm-Gg: ASbGncs7/xfjD9eigob8KHjlPaokJG8FGq+y3tsM3Qsu8BwoTJ8g3schR+1PQUsiHkx
	pquKpl/JI6HhRX7zWNNdJjP2k3t6lOnc/b6C42p5kIfnNPcsQ5/XfJY5u0ObkLuOmAt66PIyt1L
	EoTejDfhFNJkF+FAE7nl4YA7EZQEusWvd+sYZWEhwMcMKKg3JNKq0IlNwZ3Xx+/fRilE0zE0ViM
	3csYx4rKJVuAdq94hMoQmwsR3AGr5mi+QN9t/JwldLYZC2683uoVajyQq8+tpAlSPs6tOJHUn3p
	SuzC2smCOigsq5gDEAgmefA9P6GrIwwE2mOB9TEMPYWjI5BE2diLFKhhR7pqNzpmtTYbF2yEZqc
	=
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34154176d6.22.1745491537217;
        Thu, 24 Apr 2025 03:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW9ALRiFj0PWw6i0JiIe2IjPxWzjJGDX1PP0wKX7qV2MJPeYhrJs/Xxya61v7OTQE/lz454g==
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34153766d6.22.1745491536843;
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bc48sm189292e87.88.2025.04.24.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:45:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
X-Proofpoint-GUID: WmVcqnlzSBt5ij_bEMxxPMhDOooYL794
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MiBTYWx0ZWRfX68NAqBhpOR93 aQRLSyTQSh9reepmsa9O6cxsq2xy+0CHKwuU2ODHQ8utcBJuOTVfZVVHeufekcizk8ej1fyb8Ne VlpRVA+MA6/FL2JyOkY6NBndh+tra3REdt9Xup1DsPvoF9jFz4B5ztI50QlIQjoxrpJwJ+wbnzE
 bQCl7hYOXqzK7PiOpdL8cH43HEmrwSGh2xqemNO8L0p272dyKwenNb2DlMrKJ4j5t5FTxsukGFF BmQZ/ci6lrqjAUnODtj8Nmzo7Vzaafcv3AE/jph23ZNrLvptCivySTgWvwNPPMs7YLQXM+IUGCu j0HXDsE9VehzD1Ca57OG3wx3NtfI8iivXy0Ic171Eq36MnhsHpp1gfjP6a1eu9uff6TkLr9dNBp
 gfUZMEeUVNdNJF/kW8Chw8/DNfq0XCEm9aTWaWW3omsMIK+e6Eb0MnMwsEvMCa0tvrqH6nVY
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a1660 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=w3QZEHyxT3hpLgro1OoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WmVcqnlzSBt5ij_bEMxxPMhDOooYL794
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=986 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240072

On Thu, Apr 24, 2025 at 11:17:13AM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> > On 24/04/2025 11:34, Bryan O'Donoghue wrote:
> > > On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
> > > > > +  vdd-csiphy-0p8-supply:
> > > > Same comment as other series on the lists - this is wrong name. There
> > > > are no pins named like this and all existing bindings use different name.
> > > 
> > > The existing bindings are unfortunately not granular enough.
> > > 
> > > I'll post s series to capture pin-names per the SoC pinout shortly.
> > How are the pins/supplies actually called?
> > 
> > Best regards,
> > Krzysztof
> 
> I don't think strictly algning to pin-names is what we want.
> 
> Here are the input pins
> 
> VDD_A_CSI_0_1_1P2
> VDD_A_CSI_2_4_1P2
> VDD_A_CSI_0_1_0P9
> VDD_A_CSI_2_4_0P9
> 
> I think the right way to represent this
> 
> yaml:
> csiphy0-1p2-supply
> csiphy1-1p2-supply
> csiphy2-1p2-supply
> csiphy3-1p2-supply
> 
> dts:
> 
> vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
> vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;
> 
> etc
> 
> vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;
> 
> because that captures the fact we could have separate lines for each phy,
> names it generically and then leaves it up to the dts implementation to
> represent what actually happened on the PCB.
> 
> That would also work for qcm2290 and sm8650.
> 
> https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/
> 
> So for sm8650 instead of
> 
> +  vdda-csi01-0p9-supply:
> +
> +  vdda-csi24-0p9-supply:
> +
> +  vdda-csi35-0p9-supply:
> +
> +  vdda-csi01-1p2-supply:
> +
> +  vdda-csi24-1p2-supply:
> +
> +  vdda-csi35-1p2-supply:
> 
> you would have
> 
> +  vdda-csiphy0-0p9-supply:
> +
> +  vdda-csiphy1-0p9-supply:
> 
> +  vdda-csiphy0-1p2-supply:
> +
> +  vdda-csiphy1-1p2-supply:
> 
> Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> the power-domains used by these PHYs.

This won't be consistent with other cases where we have a shared power
pin. For example, for PMICs we provide supply names which match pin
names rather than one-supply-per-LDO.

-- 
With best wishes
Dmitry

