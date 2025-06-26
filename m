Return-Path: <linux-media+bounces-35952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18753AE9CCE
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E67C5A7937
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88588BA53;
	Thu, 26 Jun 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSZj1CDr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECC79CF
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938583; cv=none; b=KOh4cqvmOlgkYi14/9tgx1xUN2QGFzCTolfdG2xePYe/nkCJVKBOGP1frpiUrttdVqCFnZvsuj2XmFFGiFthZCdTXFH/ztuqrQdc5y6Obs78m3x9Na6OKx0fOBExxvvUsDpj6cAIF83lzI5je8zcDk+N0aPSbGuCDLUo6UQ1tyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938583; c=relaxed/simple;
	bh=9Ulf7o72U8DcrYow+1z4SBJCw3hIkvgPS6ofzKA4wPs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMqRZJmnoqr35UNAosnoTnzSqvfc1IwYP8orA7b0yn2EGSEqgJQZqykafaqFKiuF9CdR741XReW1pRW8iufYn4i2+c8qlA3P/orJq8BYcwTg1hpOV/LrgeZ+RZZ2OnOYYrLwfjR4pYTyrWx/7z5wgFBiSCcq7fK8jNz35Llx86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSZj1CDr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Dn2v019207
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBwtiHKIyvgYyIKMG2QKXSaH
	zLS1UsXkLrpjRQkC6aU=; b=HSZj1CDrgaiRKXmxTbBm88pkg3ZX4/CYj5DlrNPO
	RjpSDGXrPIrIvxw3z86xR0cLOpZaU1Dak7mEy/CxUnxGrEzOEW+M4Pdncgd7VTjk
	ULF+66puebVsltx5Errzugvcim+J211SuoTGGGXWvoGQ3tq3PEHK84afxJFj4scE
	bXdunVWZnZYktx80HQxI8v/Ue1ZyceGPp4OO1DfTycjMjMZb3OK1F2JtQY4QJE3e
	loZsUiCXaKV+Gfp+PMPBV7QVdk8IBRSAFpspimllajI8o0dtfaLrxt9Yo+0gvgqN
	H6F7fugrdS3RwVHqMtbb5TlmCMGFNT7UDa2Yjh9gKNtTvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26dfr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so154865885a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 04:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938579; x=1751543379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwtiHKIyvgYyIKMG2QKXSaHzLS1UsXkLrpjRQkC6aU=;
        b=k0FzBaM9VHprPbOkR3U2k+LoNA0OruGO2gECryynlgftLIoLOwfkK+EI85yq3GiDul
         FDyXF2CQG5NhXIUZnwfw8JHRJLSOpv4JS6MFiJcJ1A26HF68TFY/60+xhC9Xky5Xotu5
         IMmrCJGUuuE5uGc5K30aAcfc/eZhEksaMUJGnglljBv4Tl0XNtLTRg8/NRTMOgAEKtDe
         Jg5kCTi5RLJVP0a8vyIwesNz/MjKg/LpLFZ+AV62C1+11k4SCiM2tknNxbE7R++YsbNb
         GsiwkJX3TipqBt6tbbOAdlGvzIlAG+RpmxU5Vos5E/h/bwQ9Hi/PyZ9MWr4LGX81GTq8
         y4LA==
X-Forwarded-Encrypted: i=1; AJvYcCWTYiuCv0LI2/pLJImFPCiDwbxhwA4jrqI+s8mA4v6yjF14o4Mbi/SHI2wsht14VcY4YfcncDGSVgUrUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmpaBee4qquMzt4i/evT6xoW4oHHSJ7j1DUY/ou79rKK1AgUV
	3jYrSBr8kWA/TonIrRNzzA1+w2Bt1knXYTopEOEanje51yFoc46AlM9k/kYf3XQpcR1QbFhsAWh
	MtYxd+tYe4Xb7dQBX9drtlld0myoGE+Y1sHdfCGui1/worDNDQaX6V7vAgAiElfSaYg==
X-Gm-Gg: ASbGncsHscaxFEoAqd60Apuc0F/aSMBSSW7i0afa/3ZZw4pGwXRgm/3aSKE3O50RhJj
	p5rXFKhTEbuPtkalirUAcnn2UrHiR68+ab7Ah1l7XRolsuajxMOV+DIBNBieHEuDaQBLZOBFsTN
	dpaZjnLUOw5ez34VViTz954fvjsH1DExrVpwlETh0YiHWw8GboP2ve/7BcqsCCZnzXV0rCrnXUA
	5ueed7ILGsjdwMcx9n0iNoDxs9ctRr2p3PAyxRcAbHNqyrz8whyc37XZunGwBH6TWlhp7WMsweG
	gOmkYQbvkq2JC1cRx9yfL7AKP+2HRY7qeSf2Z09mqGoOPf5SKzy4QersRQ==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880326785a.50.1750938579250;
        Thu, 26 Jun 2025 04:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEZLJex3QT9MiFpQxhLoKdZ4j1Cu8HP2gRnN7PwYTuwEzqabvzfKKTsfgs0N8lf/Fd99BcDg==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880323485a.50.1750938578872;
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm47428985e9.6.2025.06.26.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 13:49:36 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF0z0NiuL+Cg38kC@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
 <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5OSBTYWx0ZWRfXyyxOLOstd/gR
 0TkaXRcT4VDMwY196tJq2Z8dFMFh6+MA9mHj/IZK9zYFz/eLnI1/Ti9F9BnNITqq0/W55ZV8Gn1
 qZBQbLPfhYh2goNzzIVAnAjR0P7Y7v2k97Ys/7WKv2djTeC+A+t++kdHh8seECqzH+LZWZ2qenF
 AWKQfdSrJKGvbTRfhkxJ93V6USJT43LYN57vY31XE6xH/fyrHBQsQbc/eRjxpQxa2H89dw3xsbr
 SI/eQ/biuKwW7FSbZFzXTpCu90V3N8jrS5zElzoH3O8t0/00xeJDpshBxdyUfinFlw/RUNm+EQH
 vaj4+KSTYeI+xNyNTHmwrxWdDq86TItDtibuXw1SwF3sf/0Wl4bTVBazTVIRtZVgoOQ+qBiCcCN
 EVJ6vu8lS8ZbbFFxisPwhMYp9hwH08KnjyEuMaRGUV6l+opi5Gr3GIDSoO6luYX3zrG+dGl4
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d33d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Llyb1ICWO3Llu68erG4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zZgrRRo_qr7v-aOUuge4o7lwN8oSBazm
X-Proofpoint-ORIG-GUID: zZgrRRo_qr7v-aOUuge4o7lwN8oSBazm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260099

On 23/06/25 13:16:30, Konrad Dybcio wrote:
> On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xff000>;
> 
> the size seems to be 0xf0000 instead

you are right

> 
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus", "vcodec0", "cx";
> 
> one per line, please, also below

ok

> 
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> 
> On other platforms, this clock is consumed by videocc
> 
> > +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +			clock-names = "core", "iface", "bus", "throttle",
> > +				      "vcodec0_core", "vcodec0_bus";
> > +
> > +			memory-region = <&pil_video_mem>;
> > +			iommus = <&apps_smmu 0x860 0x0>,
> > +				 <&apps_smmu 0x880 0x0>,
> > +				 <&apps_smmu 0x861 0x04>,
> > +				 <&apps_smmu 0x863 0x0>,
> > +				 <&apps_smmu 0x804 0xE0>;
> 
> lowercase hex is preferred

yep

> 
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> 
> for this path: RPM_ALWAYS_TAG> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> 
> for this one: RPM_ACTIVE_TAG
>

ok

> > +			interconnect-names = "video-mem", "cpu-cfg";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +				opp-133000000 {
> 
> please add a newline before the subnode

ok

> 
> Konrad

