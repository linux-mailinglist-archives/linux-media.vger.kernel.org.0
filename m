Return-Path: <linux-media+bounces-36965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8DAFAF60
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263B31AA36E1
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0486E28C5B3;
	Mon,  7 Jul 2025 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRn+Zj9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE219DFAB
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879733; cv=none; b=Y+7bB+2+Hq55XcUz/NCeZHVcHJianacYdbLfaZb1Y6sYvreXoYMjypRaOAuGNeH8DOOJwlHY+Cidmk+T5qZTmeoLOy9PPZuSA++KPIZ0CaFjgYrtKcSNhAvE57nXnY12PrCMsNDwy1b6d4hi+IO39kaR/gJvSXzChU+VZkec9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879733; c=relaxed/simple;
	bh=tjjCvBxWbRxuzfcmwgt2e14BCgemhZ17sHNnbJDoRqo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpbceOR2qKN/k9Uw2578n1zIOsh4/Aw634fr9nclKV8MQgoqB3KRQNhKWBgDoA2ancv9kmj+4jkWSLEfa2Os3boNcGcael2TgwoqjPJOhxGLTU93eTya/+fHUrc/PU9AWOab6/SyfT43UiGdE9UOCHBh/4ClTYr8RBbkb0siLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRn+Zj9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Me283013543
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngeouwKDCRN8FHS2Ov3SiLW7
	xuB2mIEuudvyrN1Stik=; b=gRn+Zj9bPJLipbfniCQ+2soZ1LekeEo3ru9DrdYp
	xpO1dZyRSt0kAkQoVyunkLhcb1W44MwZYyNrgEprB/4jKQa2CZ0LQqB6yR+X8xk8
	H7LZJKC+nBNzUK4hBGAX6ISwXfkZ0xGgev0DosLyJuyHUSmwxA0ea7tCdc+dog61
	yN0cHDZMaLf2oe0dsToMESJRStQKHAxMAGlj3NiTE4vf4fOYHgyPV2OviBI5gvcB
	xznn3wii1j8WznOX3hNVJSpoKnR+YSk5JUVlGsE2laiPYbFS+kzVakERlaIbQeby
	ZFNbhdF6Ksb7HVCqH7a7whGOGzfogP9IWEFZY4kIXnqENQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkbd8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:15:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso865843485a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879713; x=1752484513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngeouwKDCRN8FHS2Ov3SiLW7xuB2mIEuudvyrN1Stik=;
        b=ZtJfKT0+ygqiBICwTQP42mJKsGl0HeOti5LzcNsR4tVrXHD/bwFEjhnzVE270HvnQ5
         9wvsxxiFtG1zI8/iX0Kk0lzqJz5xUHLScdozlkKIiozpUxnXmd5hIFmj7Uad0HUla7Gs
         s5/99XKCBTnYXiSYBQqvzfbpdVaaQaQUVwLHK2lOlMjpRwRgcXgoQZjnJBQpV9YgHd7i
         3dG6J52SZwlIXqTsNE3k+tmUaWrQMU0hw1hA6FCBkNarxQa9hGeO0SXhhtzpN2Q2V1iC
         iZDAYyoXq7xIYUNFvIyIagjoGLtcmu1ayhGYjm5Z4+0awP3zDeitXQB0qrqrHF6LSEJ6
         xgjg==
X-Forwarded-Encrypted: i=1; AJvYcCWta16uIXVV6k5ATrUeaRo+YcD+3Gpnbhx3rRP9mXQoTkXImaSrGZT33UmCydW9oG+ZIxZpfJm9RcnRYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tygzBM26eadNnfIicwHaD/azxg4EuOXIExuMuDMNK4Ilx7Yn
	0DyHq3zbcd1XLNiYMtZFfS+StMAtW4PHJrH6bCdkiB8whc2GBpcY2HlyXt433F4V3oLpfCUva/S
	STdfyDPASMUTGNskzVD/Y4fIpH5bKn6q8A5i98kOT4IRt913TlevmfOtSsfnv6vzlYs2wJH7M7A
	==
X-Gm-Gg: ASbGncvS9fYwfLOIp2RkdaN/1gJHSUStk598Vn0r6Eec8TWwt6xGGD5Psa+qF8Njux4
	6VvBXLMIjQTenYPX0idqTm/jkm9shYUu/pge/6OKzSsqqQ9+tLPRRhB5dWFS2khH+Lzkg7jWCIN
	RkOCnw71ZRMCel8aH2cjuDJLkxLAUhFkTdOMRD565TQkndQwj1WdLZCV78MGRvCcZ49BZ8BBf2D
	nqPh4ZzSrDS9gqd0VkaumNLnUGO8drvcS/f40pX6yrAAzwFMICm92MQFhj2tx7CuL/1g7I4t11f
	z3nqbZFcNfoEjJXfR7OiqjKFDDhBDRTHRcy2vHM6KIFOHkYv+osy+yM=
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925298785a.38.1751879713271;
        Mon, 07 Jul 2025 02:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpbSVqCx6tFJzqSoaUTECC1w7GfStZZinCZQdif7BWXOwJSsYmKAa+1rKlwK+D1nlqL0TnFg==
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925296085a.38.1751879712780;
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3e2bsm97448195e9.0.2025.07.07.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:15:10 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aGuQHk4tpPl8kAsz@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
 <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfXwSeMzVXbs3W9
 vJNBbFYZiAa7IrGUF/bKMo9p+IBeiuIm9Adxe+hrVa+DKvbsmzTV4/bj8y2tjlFIC+hxM3PvXLP
 rKKsC6VBLvfPQt+SfD4/IeoO5RvIz+kgpYi+zY2j77bi8vcVQWHUxxi17fGgUU1L4QXS6DltEfj
 dFYf+qcF3+SpsghzJwxLelPPMhx9Ig61iDOGctBLVBeBSQHxqBu7GlQphcx3GdxiIMUvQ7kmFqQ
 GuUMnri+Sp5TKI3octmDs+qMswaIVGgBixOD+IPSCL8c6jXWotNyb6n763KXBq5/vzK7f7YmdOQ
 npsR6SkrrM6t7WIgeYHuhYx38W2kRqnYPkeGHbqPJs8f9LHvG1g1JjPSlIsv1qN3amcRqSxmgoq
 gKX82AumpDDJxYnu+tKB9DDyLPyzDm/pGerNIfJy2u+RkLeg3R3/VrMyHKPI4OFXNEZXqVDE
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686b9032 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VQ7V1meLN1WFzF7lOz0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CftYUGuFS4YB3lMURuv8LsDz_MqArfCK
X-Proofpoint-GUID: CftYUGuFS4YB3lMURuv8LsDz_MqArfCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070053

On 27/06/25 20:42:45, Vikash Garodia wrote:
> 
> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> > On 27/06/25 20:28:29, Vikash Garodia wrote:
> >>
> >> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> >>> On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>>>
> >>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>>>
> >>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>>>  1 file changed, 57 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>>>  			#iommu-cells = <2>;
> >>>>>  		};
> >>>>>  
> >>>>> +		venus: video-codec@5a00000 {
> >>>>> +			compatible = "qcom,qcm2290-venus";
> >>>>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +
> >>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>>>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>>>> +					<&rpmpd QCM2290_VDDCX>;
> >>>>> +			power-domain-names = "venus",
> >>>>> +					     "vcodec0",
> >>>>> +					     "cx";
> >>>>> +			operating-points-v2 = <&venus_opp_table>;
> >>>>> +
> >>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>>>> +			clock-names = "core",
> >>>>> +				      "iface",
> >>>>> +				      "bus",
> >>>>> +				      "throttle",
> >>>>> +				      "vcodec0_core",
> >>>>> +				      "vcodec0_bus";
> >>>>> +
> >>>>> +			memory-region = <&pil_video_mem>;
> >>>>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>>>> +				 <&apps_smmu 0x880 0x0>,
> >>>>> +				 <&apps_smmu 0x861 0x04>,
> >>>>> +				 <&apps_smmu 0x863 0x0>,
> >>>>> +				 <&apps_smmu 0x804 0xe0>;
> >>>> keep only the non secure ones.
> >>>
> >>> ok
> >>>
> >>>>> +
> >>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>>>> +			interconnect-names = "video-mem",
> >>>>> +					     "cpu-cfg";
> >>>>> +
> >>>>> +			status = "okay";
> >>>>> +
> >>>>> +			venus_opp_table: opp-table {
> >>>>> +				compatible = "operating-points-v2";
> >>>>> +
> >>>>> +				opp-133000000 {
> >>>>> +					opp-hz = /bits/ 64 <133000000>;
> >>>>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>>>> +				};
> >>>> Fix the corner freq value
> >>>
> >>> can you add some reference please?
> >>>
> >>> I took this data from an internal document - not sure why the downstream
> >>> driver supports different values or where those were taken from (AFAIK
> >>> they are not supported)
> >> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> > 
> > I took them from actual documents (which might or might not be obsolete,
> > hard to say but they were the latest version and as such, they
> > contradict the downstream dtsi).
> > 
> > So I'd rather not use downstream - could you point me to the reference
> > you used please - I wonder if the fix is required downstream instead of here?
> 
> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> is the src for different venus clocks.

sure, but the question remains, how do I know these are correct when the
documentation I have claims the opposite?

AFAIK downstream could be wrong, no?

> 
> > 
> >> Again, good reference for such cases would IP catalogues and if not, gcc driver
> >> in this case which have structures defining different corners for
> >> video.
> > 
> > The PM document for this chip only confirms two values - the other 4 ones
> > claim they are not supported on 50_LT
> > 
> > but we can discuss offline.
> > 
> >>>
> >>>
> >>>>
> >>>> Regards,
> >>>> Vikash
> >>>>> +
> >>>>> +				opp-240000000 {
> >>>>> +					opp-hz = /bits/ 64 <240000000>;
> >>>>> +					required-opps = <&rpmpd_opp_svs>;
> >>>>> +				};
> >>>>> +			};
> >>>>> +		};
> >>>>> +
> >>>>>  		mdss: display-subsystem@5e00000 {
> >>>>>  			compatible = "qcom,qcm2290-mdss";
> >>>>>  			reg = <0x0 0x05e00000 0x0 0x1000>;

