Return-Path: <linux-media+bounces-36966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA9AFAF64
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DD3F7ABA24
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B191628D85F;
	Mon,  7 Jul 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swleq3Ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB235949
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879758; cv=none; b=o55A1sV9l7S6GlVrSF+KljOXWqkUiI4rYnqxwr7RGP0ukuq1cF8cd/APJixj0pviOj8BznCV/9WyEV9LKtAPWUKMpE+KStvO0u2n2zuzjE5B+QlHuQwj1corBDBOsHFvOoFlvQinAQKnx5lsAfiiqs+ukKeIXdoQJ08w0Bp5oHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879758; c=relaxed/simple;
	bh=1xedEVDzsSxxbrLYD+QB7jvQWEPveVoc0Amb9x1OZm4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmMNnfQ6AbRuGt0/rM8yJ4MMhXf2tZMoyuJ1Cdy63YSxPeL5d53KNTBWISVWAK/bSviy0yvALjOTkObdUv3AxB3mYt6WDvgcbviNIh/Ih1nPuGFmB3EvVINu2UsDdA+A2qZ79+pLwT+Rlc1Kf7dEoWJUsREDucs8DlNOQ9/8zWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swleq3Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56790S1h015964
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EaUOc8gZnCaiHfxMVU/rdhzj
	ZBI8Ckok1Y/QujtjMx8=; b=Swleq3IcdpUXqWzYole/NGaH1CtisoWQwetpdhsX
	dIfw6VYNhJEYSN7CRc9ABwpPZHfAaEbtz6+MgIcjTIaJkIuDWkOJeGYTrTM9Zx2D
	D+t0UADw6/+NFSVebUP8zRVcyT4hI6jYxHK3ghUKmSXKqxhU87OyTBxnOMOhyGU9
	KoHR4CEKxmq4Ofu1aRTBHwvF6G6SfLOFViHfgV4Xaknqq0YPTro+mSSi0KX72Sen
	hn3XnI6gihWOK6rMxIEtgHxjkus9hB1IxyTDvR4Ww8PmP01kgXKaa7awga67v0in
	6mfv2Pp7NlH66i5k86SGzQnkTgBCcTELjsABVJdwG3xlZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0w3hdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:15:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44d773e23so737462485a.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879754; x=1752484554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaUOc8gZnCaiHfxMVU/rdhzjZBI8Ckok1Y/QujtjMx8=;
        b=mLuKbZtdGhoAc0m0ZyLhFO8gAPaS5CQvd6YiVB1eS98YfeeOOwy//Q0V9XKDnIQN85
         jQ9JXwrF8722XXgenrCZGCbXt5xwBQG/BghjS59qRHHMtB+6nnaHZF6sLJoDel9ITNyY
         Ux9tdU54jy3KBOi1b2tenjyy8Z2VUod/oZ7kXqZ8yZnaSTIxK8BYqW68sulXEBXopXPl
         6jocz7LkfkdZsnuYpGGpa2uMvoie6JEvv7IHyKoDy/A4lMyTLjv2GoA12PijgQ7IAFEz
         LS8LxsEjMqLPBjKDmQlHXEcV/5ciBYyp/kROVSRN9pLmA/R0LznUyrjt9tfdU7CrMfxB
         Ay3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFw2KLSyBc3b7Ob3W/+2OCtTjh9OjBuxM1RlHlAKf4OxlYRUmXFSLSsU5rv6Ngvxj5fv1WHxRjeHkfcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdt5e7OHiCVJwyLJiEHPBObwybOoePUyAiPSxd2I51r/OcmuR
	9Iknk3Vz8GFD2uTi8XRFifRLrL7mfcc8XOEyHdPKZHVKM8j8Z/0pCUp7oKw/A37Oi/dI5Z1TpCn
	R/Y/ok75BTOHJfXjiJuL8SHDOelxrJBBNGnh3IL7YP15U40+IHhNYztL8vcTLxdhWNPoOd0qlaA
	==
X-Gm-Gg: ASbGnctoOUsUCJ6gNoFSdbGNBtQpnLk7Xdy1wLBATrPZXhL7jbejei8kXyxnQN2ps5m
	zd41i8bgB6fOolDsOFSVUnqRwok5z/l0d1DwBuFyDDLrLDHkHoPKaFhaAQECHnVSVxIhLak8o7s
	oUi6oLEf7Rq11d4MtDWOtsHj1C17vJJi9SoJ0h8Zyg7LSx+7cMChU3bPcIswSGCPz5Otwa8CD6s
	TmpUyfu768AT3luSvyLkrFvifFmMx338HfCXyh8n7x/p6kZEXL90dYqkX3T4VJ6KY+XpxL3w5Xr
	5vjNCckONmaB6gbKkIt51M2xyaSzWf5DPVCkKKxunWXB7EYb33KAK34=
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1550595785a.39.1751879754065;
        Mon, 07 Jul 2025 02:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVADocE7bXOXurJZ6dv/hL0nI9aX9Csz55eF2TfSxS1UBR2Q2notThFEzW/XQxmcaZfbwOTg==
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1550592085a.39.1751879753422;
        Mon, 07 Jul 2025 02:15:53 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm136453855e9.21.2025.07.07.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:15:52 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:15:51 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aGuQR194iqu0Qs97@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
 <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
 <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
 <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
 <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CMPsnsWmm2adPkkfQ1975X7x4RfAdjh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfX9wdvS2lQ0+/y
 8DxkC1mizaPCD7NjGgxXjvjoi2MGd7ea5q1unk/VETjT2uo8RxE23Cjw0crrg06FlS6CU9Kp0hR
 GF9YORVXW+H/Ce8dRUDxybZoEEc/5nFVPhG5PQNLwsJffJEjeIzeoKDltMbQzLZI9Po0rkIWr6B
 FqotTGHUOxZC1Zf58NXyr4+TwfTU1+o/C0/7ZEX0TB3ztb/E9vDYJ9c8CLnd6RLVaiizgMM2Y/5
 jOskUFo0ncAyleEPz1nWm3rP8fTlkVdM1ci5rExTal+nLN1UDJSJtGiAfsv6tZ+dMNetDaZGBVM
 WcxeYZm4V8f4lExh5D3sx65S/677nBV5ss/066xyzgi7doKGUrLRMzXvMfDjC2MXQt2yESDMWRA
 8ThMz2wllzgQc3t1DUFOf75eRcZFqiT3+jy355oJwqFP9XRt1vR4qFTa+MnAw/G3twSFtRFa
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686b904b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g0UWXt2G9gbouz_zptwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CMPsnsWmm2adPkkfQ1975X7x4RfAdjh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070052

On 27/06/25 17:27:04, Konrad Dybcio wrote:
> On 6/27/25 5:23 PM, Vikash Garodia wrote:
> > 
> > On 6/27/2025 8:50 PM, Konrad Dybcio wrote:
> >> On 6/27/25 5:12 PM, Vikash Garodia wrote:
> >>>
> >>> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> >>>> On 27/06/25 20:28:29, Vikash Garodia wrote:
> >>>>>
> >>>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> >>>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>>>>>>
> >>>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>>>>>>
> >>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>>>>>>  1 file changed, 57 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>>>>>>  			#iommu-cells = <2>;
> >>>>>>>>  		};
> >>>>>>>>  
> >>>>>>>> +		venus: video-codec@5a00000 {
> >>>>>>>> +			compatible = "qcom,qcm2290-venus";
> >>>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>>>> +
> >>>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>>>>>>> +					<&rpmpd QCM2290_VDDCX>;
> >>>>>>>> +			power-domain-names = "venus",
> >>>>>>>> +					     "vcodec0",
> >>>>>>>> +					     "cx";
> >>>>>>>> +			operating-points-v2 = <&venus_opp_table>;
> >>>>>>>> +
> >>>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>>>>>>> +			clock-names = "core",
> >>>>>>>> +				      "iface",
> >>>>>>>> +				      "bus",
> >>>>>>>> +				      "throttle",
> >>>>>>>> +				      "vcodec0_core",
> >>>>>>>> +				      "vcodec0_bus";
> >>>>>>>> +
> >>>>>>>> +			memory-region = <&pil_video_mem>;
> >>>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x880 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x861 0x04>,
> >>>>>>>> +				 <&apps_smmu 0x863 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x804 0xe0>;
> >>>>>>> keep only the non secure ones.
> >>>>>>
> >>>>>> ok
> >>>>>>
> >>>>>>>> +
> >>>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>>>>>>> +			interconnect-names = "video-mem",
> >>>>>>>> +					     "cpu-cfg";
> >>>>>>>> +
> >>>>>>>> +			status = "okay";
> >>>>>>>> +
> >>>>>>>> +			venus_opp_table: opp-table {
> >>>>>>>> +				compatible = "operating-points-v2";
> >>>>>>>> +
> >>>>>>>> +				opp-133000000 {
> >>>>>>>> +					opp-hz = /bits/ 64 <133000000>;
> >>>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>>>>>>> +				};
> >>>>>>> Fix the corner freq value
> >>>>>>
> >>>>>> can you add some reference please?
> >>>>>>
> >>>>>> I took this data from an internal document - not sure why the downstream
> >>>>>> driver supports different values or where those were taken from (AFAIK
> >>>>>> they are not supported)
> >>>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> >>>>
> >>>> I took them from actual documents (which might or might not be obsolete,
> >>>> hard to say but they were the latest version and as such, they
> >>>> contradict the downstream dtsi).
> >>>>
> >>>> So I'd rather not use downstream - could you point me to the reference
> >>>> you used please - I wonder if the fix is required downstream instead of here?
> >>>
> >>> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> >>> is the src for different venus clocks.
> >>
> >> This is not a good source in general, GCC often has more rates defined
> >> than the consumer is supposed to finally run at (because they were deemed
> >> power-inefficient or similar, you can pretty much set any rate you want
> >> on the clocks fwiw)
> > Count wise, i agree. Value-wise, afaik, corners should match OR are you saying
> > client scaling request for 133.0 MHz is ok when src is generating 133.33 MHz ?
> 
> I *think* we're running a closest-match in there.. but I'd love to
> have the clock and consumer drivers agree on the rate exactly
> (which in this case would be 133333333 - and the clock plan in
> our docs agrees)
>

ok, will use this instead

> Konrad

