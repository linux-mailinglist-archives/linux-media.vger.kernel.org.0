Return-Path: <linux-media+bounces-40399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803AB2DC0F
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6D4A052FC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217932EE615;
	Wed, 20 Aug 2025 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6L2P4UK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9682E8889
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691455; cv=none; b=kvS0yfdwGhJzhsbmT5cp8Yk+ClZJ+iw7ht/jUBvLFoXIPEd3W+NlABwrtmcRZQbeCZ+7dTaLl4KRbYO33av7Bnm4eEyXkHNIS9B6fiu5d+kT9pIFYTkumfwXN4VUSjQZRIMQr5bdKlday14KP0mEXakAk20jNUBotQrRIMxfuXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691455; c=relaxed/simple;
	bh=JQc5NwLCcqUcgmyVSsmSEXhdpF0NJy1xSY9nuzP+3xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBoxJDvxQK94usS2vnKGA3fz/BVm31091k+Ig6txkad7YKPqsEAEnoSuDHzTsTLV6uK2/tlZZjqzQ8O5+9UlS/ES6h6tJJ5q2UOfN2ILXrnnY0KGmNg0VE2dKCKPDJasWDOqPGS/0aDSxwGZD3B8q3MdEIFaypucOOqSC3u0jHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6L2P4UK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9tJX3025306
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sWIyS1ANCk71ZKYKAl+j3w7E
	oc9ui0qaPQRCGlJ0g+w=; b=O6L2P4UKujJRQJbI7F4KprrTl6CQ+7+yg5/4nhJM
	GIQbwOqEXsvo6DhBNyDhEemyNyffGBn1xR778K11b8ukmXhpCivBk/RyNm1vWSen
	iqwOGBDG8Hgo9LZOW/x9HnDMWlO4FSwcJdVw46bH0B3Lu1VNUmp4h1y/AnUVUrVR
	Bp7ncF21bhPxqxthXnMjDRVY+8JsVxI2ALChTEyo33zhZ5Cy1dTS0EkoUIYQSqNS
	tquhbwYUCQW2r1NqV0hizH4Pd1b/eBn8uvcP41MhlIPyKlL5iUdTW6rKQ4TJqiAq
	MZKesF/BksXkflK3wYeWy0MNVaA64MWoSxStdxVKa8H2+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9mv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:04:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24456ebed7bso10772465ad.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691452; x=1756296252;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWIyS1ANCk71ZKYKAl+j3w7Eoc9ui0qaPQRCGlJ0g+w=;
        b=QrOsAEn0x3CNCO2d/Nw6IpJf0ikHJSuxsGRfdopPAiju/6D2iUk2iY6Wf9oraGL5CQ
         lc9xiH18vQNzU5jq+mudyXGVF2wdMM2FyufVSzGVRpZaJTLka4ZKnwTmulhD95ahzwiQ
         pU4yO26r3u/aB0ra45Nn4FrCFcQjPud46u6MYm/L5xips9qF0gNAgc8zes93yBknlrXH
         owE5qfPDOdd5pM099fsZNqrDnue7hZCGlFEcer7KCuE9dJnLjhuc81acJk1MYlIaBhKd
         jveCPeJuZv818LAPvapcTRxXAAuTZeRer2mlXGuO127aWKB/11n165QE+IdWUh0ESipi
         NibQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFnLD6YrfRyIyl/O+e0+GLFQWRFAh8y5dPypzRGHlKBG4FoXKdW8ohLHpDc1RrvgN4XbrYqXNY4Si1Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZP75hnhpQgnYQQUjkqZqIReYPSXYCSAniIvO8cIPd2r/YVxPt
	Vu+KX7rwsj4Y2eOYofbyg9exsNcGGeBuedTUHa3uqXUsEmM1Nuyqn45QS0WshAIFy/mfybNJw2r
	Vk3srEe/8Y17bhZMT+EAe8gsWkjxVIDjW7X1g9PBPt0ADYobIq/lxMJ0dpaV9tFGiKQ==
X-Gm-Gg: ASbGncvvKo5Oi7tR7GNx45pGUbnkxE4BPGpGNyVqNkd8vFugjkDMjpxqhS+rdhD5j5p
	9hOzqydxAmQj8rx0ATy1rbRRIsdW606a9C2hpND0w4C+XIrW6e6zVO00gE4HpNyvQwZFolM4L8m
	F7ONuF5V2t4mu2T0Kz8uKf5G8bgepW1R+nSv3y+4FQ7bnCnUmg0iIpQCshA7wmUuXebjTdjoJ1W
	RVk2UOuUB6JOuUfYX4KrYmHvmt31A0d2YPQ0hzIf3qBHtIW8qRqlqttJL+4AKwxyxlHT4NkKxHX
	uQASkPWllhDqJTTxZ7o6cARW/jjZYFrYX5aDnVwhEbyMlsUeNJgQhHlSDBXAMrdL6w8=
X-Received: by 2002:a17:902:cf12:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245ee1170b0mr41644025ad.15.1755691451904;
        Wed, 20 Aug 2025 05:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMUvumKvyToyANrJplMcGPNukZwx4CtjZElts6CZa1sETjyRTsPkuQ5WbmGN4OVH7LD7S4Ow==
X-Received: by 2002:a17:902:cf12:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245ee1170b0mr41638225ad.15.1755691446450;
        Wed, 20 Aug 2025 05:04:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed379e92sm25257835ad.65.2025.08.20.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:04:06 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:33:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20250820120359.dsdbm5txyrsdbedy@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-11-mukesh.ojha@oss.qualcomm.com>
 <aKWJ-c6B5Pvjw_jx@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKWJ-c6B5Pvjw_jx@linaro.org>
X-Proofpoint-ORIG-GUID: 20bODlWQaxRP3KEWIom4qAYh76FQ34o9
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a5b9bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6vJVrOM7mFHQH3jvjVQA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 20bODlWQaxRP3KEWIom4qAYh76FQ34o9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+u/L88IwcrHf
 qtarHtH29ImJJkN5122X7GCgi4tAErXSUyevziPX8typPhEcsRCunfQPRcD4WXGwez0VucYH7Uj
 HIyhFLPNJ7V95fDsjlV6jEjjXG0XuZK5BBj/I/5AuN9Rwi/DElLohA+ulSVVthqnMWIIuDovzEr
 p676OYcACjtdhpCRhVr3KHf+UaYqh+auWGbMPnK/sJwS7mYRye7KDqsas+r9qVveRpoUj6wFoON
 7n2mCIV7f7xBr3Cbzopvj7TwPWNq7qAdLtwFpU2DzCga2yGGPj2SwKDoBIEBSJ49JzC+CHfTInH
 SVTWxYSyBHhaoFKpTbSg7gZYmCmJX7UWXYLpu8dfyL52mxMgL/NROD910+tM8jPVthc/KyNbS6x
 Al5grqlJK1PlhPaxMRlT2e8ap+daqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 10:40:25AM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 10:24:45PM +0530, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is
> > required to enable memory protection for both remoteproc metadata and
> > its memory regions.
> > 
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which is the default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 63 +++++++++++++++++++++++++++---
> >  1 file changed, 57 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 1e0f09bf1ef2..180528bcd57c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > [...]
> > @@ -424,7 +459,8 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >  	if (!rproc->has_iommu)
> >  		return ret;
> >  
> > -	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);
> > +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, NULL, 0,
> > +					 &output_rt, &output_rt_size);
> 
> Unrelated formatting change, should be in previous commit.

Ack, will fix.

> 
> >  	if (ret) {
> >  		dev_err(pas->dev, "error %d getting resource_table\n", ret);
> >  		return ret;
> > @@ -726,6 +762,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >  
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> 
> I think you need a dt-bindings change for this? You had one in v1, but
> dropped it entirely for some reason.

I missed to mentioned it in changelog.

As I said in another patch, I intended to send it separately however,
will send it along with this series in the next version.

> 
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> > +						 "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		of_node_put(args.np);
> > +	} else {
> > +		rproc->has_iommu = false;
> > +	}
> > +
> >  	rproc->auto_boot = desc->auto_boot;
> >  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> >  
> > @@ -800,6 +850,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  	if (!pas->dtb_pas_ctx)
> >  		goto remove_ssr_sysmon;
> >  
> > +	pas->pas_ctx->has_iommu = pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
> 
> Nitpick: I think this would look cleaner if you separate it into two
> lines (only one assignment on each line).
> 

Sure.

Thanks for the review.

> Thanks,
> Stephan

-- 
-Mukesh Ojha

