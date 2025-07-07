Return-Path: <linux-media+bounces-36963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C2AFAF3D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D82169B0D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700FF28C842;
	Mon,  7 Jul 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjulOvaN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D783265CAB
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879379; cv=none; b=KQPzox/8oSdV7O/LCVslP8juynn5c7i3GHCtVyjniKRFrUjf19BPgdnDjOv1tvOHNNRUk43JuaJoTaT7pMmUcUKV6UlBnivr6KWBNMfiDyIfFXFBOCYFYAPMiQQcjlu/xCV+A155EL5mn7oraTpmNg1bK/hZkTYdgeUHt7k0Ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879379; c=relaxed/simple;
	bh=peFKZhFwedKK68dIFIi4REQ/qFa/6M/SrX4nzwboeGs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m03O/CfoNgX8KaXkKAg4A+Add+6n8XA0cAe7hMtpDxQ8jPc9k6VkhTlBVHR91ooXEyCzwJz8AffcBVv6AhbiovdkozDvnSYU47qdmWxd98qJ/FoKqg+TS4qDYlSSW1CzdZ1j5QX/nXTQQPM6Cvtossr1BkOSobKkxaeSHqMv60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjulOvaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566N0j0J007834
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VeHPkLQlAJtFoDvPLLCaGfKY
	61RilrGEq+YmYIpz8WQ=; b=KjulOvaNTNDb76cComAJ5M8Hwz+y49/Vt/Y+5bGE
	uW9kg+NHEzRYFUhg2cBUpwCMjzrN9nLcMQnxVuvki9fgncllv3TNufZsxOoL1V0M
	GivYPOK8qQ3L41JPSVj+9BEQJd9kvA+LtodIVkbo5MX938g40+HTJ15QPwic8ONJ
	nJcAlERhsIReY8sYI3XFQAh2IEL6ANPkMRJjZ65bfUP2wT5/0q3+W2JkO4hbPXNH
	WWPHF4aeirQ2H6EFO3dFohpte6nolFy2QeGbktq7sHAA0M/TOxI4XsYb2BVpzczH
	C7j0icpUUdAOV3bzfNpyXq1ByAALs8EjXjClIJQ8yh3R2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkbmja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so418915985a.2
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879376; x=1752484176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeHPkLQlAJtFoDvPLLCaGfKY61RilrGEq+YmYIpz8WQ=;
        b=pVTlTshRR0yCd1gOeGgQHalJFjY08TR5RfxrTUhifv12WXi/hMSRDgUFaEoBnV/ATl
         d5L67GgylHkhJhbbv8DC/8H9uCpq/l9I7RPB4PwgPL2IKdX/kPP11hfgg7PprJK7B9WD
         cPTRc+Hq+/0XjwvsRKAF7CrtKkHpJm5RNGkVwfFnhRK2Dzhn+TZSQOK63i0NoLJnmYL9
         yRUl2FGCwkgc9sy/plQlOvIgKEngtjCvdoN14e+HrRn3sX48wCrCqor1AB7tTF9aq7gC
         Kada4pD5/eYTpocjjPU14rIbXyOid4oPc4j5qLbg9vCjFwm0clCrSvK/D+UkzDxsDlwy
         DAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwW6YnQ2sEai1FjJUtANX3uD3CPCvP4Q1aQutR/7+0esbqOlqeVFfbeyXjiIM0z6heh28QWScmmqCDpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxKkjQ0eyZg26s+cfkNFazjouVcJ1iWxV5b92l0DlduGNwX7x
	VBM/XcsoTXStqgiXpYEeqb6ExuKueSK2MAbwjXeZ6iAITsrezbLIgWvqGv4x2EBIpTFSRtmybSR
	RK2JOUCc3Q2ySMyKkBZgIqTQjY9z1htFEyJYXMTh18L2Wj+1qWFGpOCKbKxanahy0Gg==
X-Gm-Gg: ASbGnctJ5qUN0zsEsYTSLKbmsR+y5t0iYYbjg9jkyqrnJq9bwbXEOw8SOBEbZ4JJe7R
	mLK1DFGEiq5VhQOXhGNCKmD9HnCcSZmJn+Hc2h2CYPc+nbuP+2jPB1/XO8TlXQw5nrxp3VGmJZY
	WdBo4p5jIj56Z42zYEQz07i/CFE5Jm8x7rwojYopIpOwA6ARHEKO01ZEZHJ96x2fdn0bWFQDoYg
	klh78LnnA99eSQswpgvCZZQIpaEF/OUSa6rBMOJCAbCDraozsPPwqX0vX/voB36ZpQnr4X/qsl5
	fO+046/oH6YE1n0Bcd++dt8cLLrQBceb/HLDBXzStE5KFvlRH4FjnDk=
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992951385a.10.1751879375861;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkFAscEaQYMChKaP818khtKeWZorHRhJFez5DUN7e7xcaSYzI61t7Vo/NC+j8GjNSpIQbQbA==
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992948085a.10.1751879375228;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a755sm9625686f8f.78.2025.07.07.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:09:34 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:09:33 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aGuOzdCu5UmKDF94@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
X-Proofpoint-ORIG-GUID: --BOJp1GJdSahUPP2KmHgsl6wWeeAnak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfXxiSSYuUKziE/
 nmA2j75MacmipyCPilIBK3YQY3FXvxpoA812at3+9j/2ZrwHLHK/7H9uVwwgdkdP2wpRJRoBZRZ
 capxC844Ka74t2NTy627ZfwFvxYUOTc1ZT9R6CeILRnFt1EBkMfqHIK3TuLRCIfclJ3XyeV0wxh
 Y+PtdFzQwY3lH+a94S12Fs/cLzyDFHxkWndJDSvV+JPIU4Zzd8HLcMNmJx6quVy9RfLgQD3z2qD
 BBwZCBHwEbZRq3Uzu0da7Efg6RQ/H1e811J0d45gRg7sysGf/4mLhXCgHGpXd5aK4zUBWH4/nsX
 8g1dGxBN+WHfhKecyA5Igo9wq+7sCXcguUe+IdzTJLhjtQgfDw248T+2GBCJ+mp6TKWNrPU2ALj
 DDXwOfAncjrIcVB1qdHvZvtIrIo2bXOatCQfQ4imdffN30wjNbGSWiahU16P4dMemmLUWpjW
X-Proofpoint-GUID: --BOJp1GJdSahUPP2KmHgsl6wWeeAnak
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b8ed1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JosbUmaTz5S-ISoLy78A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070052

On 27/06/25 18:46:10, Dikshita Agarwal wrote:
> 
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Video encoding support is not exposed until the relevant hardware
> > capabilities are enabled.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 736ef53d988d..f1f211ca1ce2 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
> >  	.enc_nodename = "video-encoder",
> >  };
> >  
> > +static const struct freq_tbl qcm2290_freq_table[] = {
> > +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> > +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> > +};
> > +
> fix this corner.

ok, will wait for Vikash to confirm the other ones.

> > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> > +};
> > +
> what is the reference for this?
> > +static const struct venus_resources qcm2290_res = {
> > +	.freq_tbl = qcm2290_freq_table,
> > +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> > +	.bw_tbl_dec = qcm2290_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> > +	.clks = { "core", "iface", "bus", "throttle" },
> > +	.clks_num = 4,
> > +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> > +	.vcodec_clks_num = 2,
> > +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> > +	.vcodec_pmdomains_num = 2,
> > +	.opp_pmdomain = (const char *[]) { "cx" },
> > +	.vcodec_num = 1,
> > +	.hfi_version = HFI_VERSION_6XX_LITE,
> s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

um right, going to rewrite this whole bit and get rid of
6XX_LITE/4XX_LITE (will post 4XX with a lite option instead, which is
closer to the intended abstraction - even though the 6XX/4XX
abstractions are kind of dubious...)

> 
> Thanks,
> Dikshita
> > +	.vpu_version = VPU_VERSION_AR50_LITE,
> > +	.max_load = 352800,
> > +	.num_vpp_pipes = 1,
> > +	.vmem_id = VIDC_RESOURCE_NONE,
> > +	.vmem_size = 0,
> > +	.vmem_addr = 0,
> > +	.cp_start = 0,
> > +	.cp_size = 0x70800000,
> > +	.cp_nonpixel_start = 0x1000000,
> > +	.cp_nonpixel_size = 0x24800000,
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/venus-6.0/venus.mbn",
> > +	.dec_nodename = "video-decoder",
> > +};
> > +
> >  static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> >  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> > @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> >  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> >  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> > +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, venus_dt_match);

