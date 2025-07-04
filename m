Return-Path: <linux-media+bounces-36865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2ECAF9927
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EBB63AC95D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 16:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654542D8368;
	Fri,  4 Jul 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhOaiFYx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643DA2E36E4
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647533; cv=none; b=QNopF97RWaeEMr0GeZjCmJva3UwyPH6qNCjTXwJZJX4IbBJvGt5uOlkFb1LT+3+xTumwzLTbfrpyVYlZIn9PywmRmv8FIO+BWLmHK5QoSaKZnAMBi5xbHr06bCMmb58+pveHLIoTzi9gKvVOlArfIJxECgtNz/2NMWk9gJz02Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647533; c=relaxed/simple;
	bh=efxW95d1hJnhDlayhSJSGsI5g4f4Kegd9gwqv/org9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPYwAf1ZAbOr67QZnmeMxHd3qU/tX5RMLWVNZDOupjyym/6X3eqIY0FJ88gfBGCXuWD46bbwejFENSPlTmyJBNwARUbMzRygoVPzvmtwsOTtqAe+uRmJbasQKmnmT41Wv7gUW9VsBcJEsk/F506B0qSiClFkQSDzJ5aEElTgqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhOaiFYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649AeEW017338
	for <linux-media@vger.kernel.org>; Fri, 4 Jul 2025 16:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VAC/S+4VdSYdhbOHm7xI7QR
	qaC0xVlAooyQOl6+PVQ=; b=JhOaiFYxFeZjMHIWhsrc3wziPDCTVFJr9fYZOMt2
	zjYZIvjgxosSwVIMc/81m9F7yiNyI0L14BUi32MtOfLQfJtXBl2HFrj3XT1Iqj1L
	QlSX89LBfKT2OqGt6NE3BsY+IEQVql8lKJIFhcRCIKfagggCcwulIdifrClybNIC
	+OQ6F+BoiTFa4Q6Ay67m7TGaP3GbRO+4uS+J9WIKWmKEDMFvoQYnsEEQ0yk+4Vxo
	7zbWJXXmjeYCn37oHrqqOxVZPMKgxZsbnsr5V9xj7luDpuHSGY6cRpzAF3qxLLwB
	2TMWmghuAG2wDhpXRMiXf0w/mZq0z2X++MwdelnP6QLzgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9vhvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399070cecso177988785a.3
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647530; x=1752252330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAC/S+4VdSYdhbOHm7xI7QRqaC0xVlAooyQOl6+PVQ=;
        b=wQa0UL1edwY+dOGOqBGw8J7bLdg6DuQpKH2KK9WAzVnxE5FjrTQxTwGXPcwaXbxa04
         +G8xE0Jv9iaf+XyXPKki8nZhOTX/MmnxtSztDnY8mbt/XUcpAZiJu8DrcqWQtblThu0a
         EMWGUQdIHvxIlCQ5TM+tyf3w1e0GxfCvp5QLC3zQT1MzPNgRG0iYfYfltEM6axC7AmQ8
         sb9zK2rDUK0u6kKSFYCvUcldxVFsgjwTmb81GjjbDOZxREwOyZOFL6IYEBxgT9ILeoOr
         3H58G+oLU1YNKtMhQ2MBDk94OSszdq/xHQJuB4mGtI603l7n71QtRR5xD8ELPMA1OFGV
         rFEA==
X-Forwarded-Encrypted: i=1; AJvYcCWnpgnybcxxBU7rmj/jEPngMppNMsiOdHWetkR5NfdLPKv2/SWUoJ5IHn2B8NUBrmmzoA6GZlSF8gtK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzejeg59PpNYiykaUKHDWg4Waa9cpFCe1H/U6FYk9X1bZavl5o
	ODZQGIvMmxq6+aLna6DH/pFMiNfawr0KxnldRvQWo7CFncjLKlYxPwDrfMAvnQdkx8wtqxpszyV
	F+jgW9YaSTVCLZ0PyJ28gZSOCFBiJFiv51NPoComRtxZ1tVukHW7m9b7esOga0uyYKg==
X-Gm-Gg: ASbGncv8VA/8oBJ3jlmDIyKXlaE6tbIi0nk+5OjHBmNC+1Fqheda9WHrxO7IB3zrFxp
	lrTGyNLQ9apyZ7V43+uVtUTlX2KAzXb8B0EOkO5jBMuehd9UVDue4g6yNkuFqsi/MTxeqlIQ9Ko
	5PciB8eOpcB9c/7PLIUUoNxNKRSzokysfCHGSYiQgkhsm+Z0gFdIIzpvtEfxi0rBU06PFQOU3gI
	X/kcRTAsV+n0vd0SwrKjwlCMB6tS8YFLqTrbD/hm4rCAEGvXJmEGAyOAUQKvNqdLi7k+XtvoL+z
	Vhz6gRU7xkD8hHWJ95VC6+fUPC7VGkZM+1MNXdMtz+xUZRRJTGj0MQrMxs2Zp56lifnrU//iU9y
	dB9oQvdOhc0ljEmGe+mHwVCycuS4JgL/6vT0=
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351631485a.56.1751647530264;
        Fri, 04 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXVTxyDQ7jF4VUHv80E+WzOGv+qgK+FdBwwPCg/ckJv+F86O0+XNC9EdNDKn9IWqLbhOUFJQ==
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351626985a.56.1751647529802;
        Fri, 04 Jul 2025 09:45:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2843901fa.6.2025.07.04.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:45:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6868052b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=DVKtXGnjxsSMy4abO9MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OrjFkaH0Cq_9-ytGC3pHInqbgXXhQGGO
X-Proofpoint-GUID: OrjFkaH0Cq_9-ytGC3pHInqbgXXhQGGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX3CJtqQo/o21Z
 RiyuwEyKeJqj8l1YFLKY2SN96qZWP+x5rtAZKL9ypGb9zk0/m2EwdDILU+TgQ7auuzkQUoRUccI
 3ebLu7EqMcpLx+9QEp6Yuidx0sKYsbyOrpug7KJFQBXiU1rh9udSF3f9UhDzoerXox3ILYUEGq+
 5+5HFDQjwCcAsVV8ze1nbAbluc2Bu3PSlIWt3CGTwdoYku2C5u5EHFFG6AOCNxMnJirYbooc5/V
 srhLJLz4TG+Mryl7vA3WXPZu1UWdKzqMrrSE7MdiGabnmnBcLrPpZqh/Pbpv2lXlgLZEqc2cvdQ
 ejYK1VQ92lkNPgmBU9pmz63LB3rgVi7MLEklSspVQdaG5qGVWewa7lB5psvT+dNVPxKgq/hZAB7
 H5gpC54w9tEVB79xEjxrga2qTGragRJD37A3KZiAEhFpFwwbRThdWTymbnCktWXExeE1sLfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040126

On Fri, Jul 04, 2025 at 09:23:06AM +0100, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
> > > I still give my RB for the series.
> > > 
> > > To me the only question is should it be applied to sm8550 or to new SoCs
> > > from now on, sa8775p, x1e and derivatives.
> > I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> > and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> > once we do that, we will realize that it also changes the ABI for all
> > SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is
> out, then some API change is needed to allow the driver to stop the kernel
> automatically setting up the IOMMUs, create the new device as a platform
> device not dependent on DT change and have the probe() of the relevant
> drivers setup their own IOMMU extents based on - probably indexes we have in
> the driver configuration parameters.


What about instead:

- keep IOMMU entries as is
- Add iommu-maps, mapping the non-pixel SID
- In future expand iommu-maps, describing the secure contexts?

> 
> ---
> bod

-- 
With best wishes
Dmitry

