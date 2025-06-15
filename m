Return-Path: <linux-media+bounces-34816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4DADA19D
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 13:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D803B2B6C
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 11:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0822D265291;
	Sun, 15 Jun 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBLKidKM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE651FF1C8
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749986346; cv=none; b=B39uvQQlZi/OMhSljlKJL1MJihl31spx+ElgeveoeG3v1yyJBeCKszJqRQDUyPvdclOgDVsYQpcZdjJ1g4EWvqrBm2DiKLDknM+ql/5emsAibcKwxuMHDB3x2yKdE5qaLs9g35GZTgfkFzW2/tITWNwLZfBisTslVf+6lhw71wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749986346; c=relaxed/simple;
	bh=gF1GA3PNMrglaz1x7lSK9qHYhHlMi5EIMwx9rYePviQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxLIZX+skDOE5XH90mdhLgXEpNtGsEMAyYuAp1yI5FZZgWi+KDpUXr/4eDeY8Itjd+jQOiBniYPZm+d5e1YVL+yV8XZEuelCtPTDRJ7DHKLLmxSfQC1YtyHM+IuqQJOPQKv/v+rUdM6AcU7QPm8EeNubDKriPnfyu2siFhN0+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBLKidKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F8dBqG001159
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 11:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nE42jDeZV4kQLeDasg3to65Y
	wacqdxTZYGetgGfNDoc=; b=NBLKidKM5EH5ybsjyd8wi0yty8kooDEv+8xTbz+h
	/7gXYgtHBXbwK4+3tgys6rVEB9QIrCQzLyFYP9gFR3dZxBpdLUZWtLv/14WJgJ53
	8LecHek7U3W73nvA1eExXMKGnkRzMneUkDjQy4/Oh1w0JF1+rXOJ3Vuv/y0xmD45
	y6j/pcp6H5y+wcmJgXTtyc+5BTmACOq9Af5tObOpVY0FJvd3H59fBb5PJey+HDRh
	M68rCUcSB7flweGX0OckX24qqANHJoKCiM7Ec1tP5zMq/5j8IbgUEZjoFbqp2ClE
	Pyk+YJoPZPQOozpvHJsHwLZ2nWUYWNTq2Y3HD3Dj+Wrc0g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcssmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 11:19:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb520a74c8so6959206d6.1
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 04:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749986342; x=1750591142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE42jDeZV4kQLeDasg3to65YwacqdxTZYGetgGfNDoc=;
        b=vFf35EmJprNOsp+T8bJSsCC3Jsh/5RtpuvLJgtZsCCaNN75vSYoDhakRbcC6Z/aLSB
         qfjVeLxaS6Zd8OOQFohYSI1qc3KnDzTQ2V/0gW6gbzG0dIOcm26M8Q1bmpHrgmWw4ioh
         b1UBq75Cuhi4q7d22fPPWkgrRLCbZjUEsoIiHWm2A2FFMvvmWCF26g3TLNLjnzEEy1z1
         xdrAM+axxw814hz+yKQCdwH13iOk4c0hpj/M8a2wVNtUV/vVtBW440daeM/C7G9Y/Tzh
         Wdi+SJNhgKSZjbsEdFb/HaHr7jJFg6p3KUhPOQeojWlbWcWSGYcVmPVi+isxkCcH1X5Q
         adrw==
X-Forwarded-Encrypted: i=1; AJvYcCXg/sIlCpFUmEuersLJeryo+swgu/tpTYSgdnFHjfIoY4JSXIHBQ2nr19t+yaGN7rjCSOWPwlV6f+OZFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFWABusNiKmPaFKnDLNX6vYHptkXbhARidhkv6TVP/fO+BVf7q
	bjYlid2j1pcnjYL3hCgxCqOo4VIcrtSYMr/8maNSEH7oFOKgx3nee1hj6SlTpSRxnixIPXtV2zZ
	8GkvhUaQuaGMPZIuvUctsAWpnIn6LlOS74zckQrEjjfy3/tf686+YPi+imF71E3BAgw==
X-Gm-Gg: ASbGncsirrmOInJZCg35NIj7wi0Rxj+cxFQLwtzzCpm9LEyfM3s/4Gg5qQ3kGmHLII3
	VhLzBL+qGByvHYsconaNsfDo/8+KDGcXbSS2mHTwfVy4XZupyh1a5zmSZLj+z6TLvHYsU720e/7
	q3M7YWM4wK08SxV64IFZOB0e6FNOoKc0QFJyiUOH3G8Pc46VP+6mysG54gIsS5FuSUsx/TeiC1n
	wKZnBpT2nFcXtrvd7/Blv4TLro6rg+Iz2UKqnAT00nBqZyRYUMgS9QiVxTSbgj5QsH7WaPSBosv
	N+u+Agw5Vkuh2TeULCXYXbHS0QUlvclb17lCKadnkj+qzOv35ORWlIcJJg==
X-Received: by 2002:a05:6214:2422:b0:6fa:b980:8b01 with SMTP id 6a1803df08f44-6fb47737e2emr85660016d6.11.1749986342432;
        Sun, 15 Jun 2025 04:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtylU7MqmyhywN0wcxPac2FQB0KQyiAg+GFW2kr4hd3+fpGkWFId0S6/5eMvN1QXsfwA913g==
X-Received: by 2002:a05:6214:2422:b0:6fa:b980:8b01 with SMTP id 6a1803df08f44-6fb47737e2emr85659736d6.11.1749986342023;
        Sun, 15 Jun 2025 04:19:02 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm109836335e9.1.2025.06.15.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 04:19:01 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sun, 15 Jun 2025 13:18:55 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aE6sHw22MSH5EyYK@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
 <81a65ea6-2f46-4d11-9a3f-50664da78eea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a65ea6-2f46-4d11-9a3f-50664da78eea@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA4NCBTYWx0ZWRfXyKGRp44OUFz9
 x/6PrPOBh95Ve7MJCxf6jN1OEQwDlih2NcHdpKyblIc+/zKQbNUMFARiZOg9Wsvkp9Dinzpu3kO
 faqjdyMnQ5Eb6vPqZ3PaiL/7cEto1o/mgiVDCF3KMzlviAYSMo1bZHyFJz2dT/EOgpMNQrzYCWX
 UGGGEl/ymhqX69t7QQDogpcXeZhZJy+YwOLIgYe3oGGjWbopRddQVe2mHM+bUGqpK8pQYkL7rni
 aP/meIfLKn+rOnAdzC60n+zfkvK2gTTVl22CEEdkJ5yz0br/cgZJxFpRNZWCYfBQKiNuSYwmElf
 k5wUnyu1b85sjyCQw8vterjFwGerL1My7JY6cFTsmH6RgeR/UOZCbF7gz8rNzkwpl73su8Atdtg
 u/OaqAQWrwYso5vEtsajJihevDbn5inkuOgYKssNnRX00Qja7pr8k4C401y5IE636TRFZPZI
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684eac27 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Llyb1ICWO3Llu68erG4A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: GOmXAPHy-voz61fXY8kX4thFvY3_xROe
X-Proofpoint-GUID: GOmXAPHy-voz61fXY8kX4thFvY3_xROe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150084

On 13/06/25 15:06:23, Bryan O'Donoghue wrote:
> On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f49ac1c1f8a3..af2c1f66fe07 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
> >   			#iommu-cells = <2>;
> >   		};
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xff000>;
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus", "vcodec0", "cx";
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
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
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> > +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> > +			interconnect-names = "video-mem", "cpu-cfg";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +				opp-133000000 {
> > +					opp-hz = /bits/ 64 <133000000>;
> > +					required-opps = <&rpmpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmpd_opp_svs>;
> > +				};
> > +			};
> > +
> > +			video-decoder {
> > +				compatible = "venus-decoder";
> > +			};
> > +
> > +			video-encoder {
> > +				compatible = "venus-encoder";
> > +			};
> 
> These should be dropped in favour of static config in the driver.
>
OK

> > +		};
> > +
> >   		mdss: display-subsystem@5e00000 {
> >   			compatible = "qcom,qcm2290-mdss";
> >   			reg = <0x0 0x05e00000 0x0 0x1000>;
> 
> ---
> bod

