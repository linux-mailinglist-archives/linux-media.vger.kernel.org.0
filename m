Return-Path: <linux-media+bounces-44968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1104BEE499
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 14:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 927794E4755
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 12:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092FE2E4247;
	Sun, 19 Oct 2025 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4IhH/Qx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AF2877D7
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760876006; cv=none; b=PXMpR4L3Mqw6fN6pMtvMKWMP8MxeAUlh8CNIxYTrM5DJ0rnQwYF8I9bOPhYtaChhxJE1Vg8DOWPqqPYcpeA9RWLQxZN+o3HwDr4zMu/nCd3zyJtZ0h6Yu6tJlOD94iV2y8rzCYdtwJx5VMj4IPLZ1A6PT2jm//11xWRHg80MwE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760876006; c=relaxed/simple;
	bh=HSQA+Pd76pKK16Rnlbrdl2QZ+5IMbABb8mM/skpID+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctVa8LRp8MdsXYhd940Zku4IsZq6PHzg/uIvFGGi/0Qdo97v2OUO3TcWgncnlmLehgYVACSnLUZZbNA9QN6R2PMYvy4qo5m/0b2L4dFhHAGmRpyXTvw6/+vk/zIPEzX8wtB7fBUfDr3XEc6aXQu2tMVF3/ALcc5WI+aOXIdsoxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4IhH/Qx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JBZZD1016388
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 12:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLjMakJS7ssq/syc/5Yvc6UyrE0zE/sWbLAaJ/RVke4=; b=U4IhH/QxRsqwWpIR
	8Y7+FuRQRBqAX19fHyn8fkE93Mji5Wsc6hQ5zd0GnE/TBn9PqtB0IHFejlwbMgMX
	UsfPEIFO2m/CZEvfMTeUOj9FhtkEnaqQZfffhSQrKmf5IhyEZC0kQ8/DBK3SLl1o
	pOH2B5ZUqOBA7xKl2cYnrKYiF0dKMYex8jIGL2WbmMBLeFj1Eg324W9Ksv48B6nI
	TaIpFEyr49Ow4xpM9pzk6gefkEbsBvLrm+vDlh5Blm4wwZW7AwwCBpF5vvSM0wwt
	3zRTVks4lCdOMcrto4/m4QrEUgV7XTLqbdglELQ7ASNv9oOz8pGQZBimaBglsKvI
	tgtjMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469a8t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 12:13:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f3c733d98so1375606085a.0
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 05:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760876003; x=1761480803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLjMakJS7ssq/syc/5Yvc6UyrE0zE/sWbLAaJ/RVke4=;
        b=R5pzYnVuHxMTMPbyAdMGMFrX7RY2cvK5Z2iomtWxUgiBWZY5KPuqS8NvZCzCprnJcM
         A2yGrwzlHVKgaR2LrkY/lpr5Xw64w3qOck0X2HD7Z4+HV/VWbSq3BIzS6FCPidMUm33R
         4gbj04V15Vz366tygDD0/vG9o0fdftnKzksjb3QONg+kZOYktkOGfz0WpooCrQdgrLOL
         zQUaeljNCMcGitVYB4s5VkEqR4XX/cGX385F2KTcbmr2iTJPhDE9aNHYBh7NiSdEenG8
         dS+hg3HAPgKB6sOawnw7W0s7MgOA0Si0UfyODGEuNn2zzV11aDHdqNT/MybI10Y45O0l
         dFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUada7T1kSfXnyBZxKvRZnnn9bHNg2XeS1ASkenUZEoMVQzRoz92IvLZSEF5lfkizv3e4pxBlXXkTtucQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygUNAU1tmTZ98iMHX0FXnZAtqY28jBD5NEcMwEXgLBle4jTn4s
	h+TqCJBm3BZKlUOMuc2/X5AeaB8+aH3BFA8ESd2UxHXl1qrFNqMbPZhxUeTm+OZvjteMEuTwCRF
	lhGPjcq5BUwKWC+z70WBUwdnMBXsy4tJXOURTCdzbfcTwwqFlmY2AwtG3XAZFzkzS2g==
X-Gm-Gg: ASbGncvPU+gbjm5vSi6X0/BvrIX/OJ2lwJFRKYt/zCWR1qr8rSbMoKMxmmT9mYxhuno
	UPiAcTzeteDM2BrlO2y0gD3iagax55Lbb6wq3Wzag1MnICxsvFwdfmwHaUAnj7UinEJGOBNgdpk
	eqFi4HAOaNtvGUHa/trU1+Ud6p022+Q+pl+sgB1Y0Juvi6+8oOYvSxT2+NyKvxgCjktU7HROE4F
	CqagshRh33hoV+cpq9fQijr0JJmH5NJk87o3ncQbsP9Zv0Yd68iBLlPbiutIPSjx6OYqrTa2azh
	KeEw5I3T3Nh9nlgkBJ1LdS1+ADiBgyW76++6jQw6736aYxSVmAUwxKH1pFijUEoOG7dA6vMTrW3
	0PrJIDOB8TQoRGoegrVzV4e3Dl6r/oblYJRPXk6fKyLr/ahYX2YGbRgHungbnyhlNW0BU/8YqUl
	7ZWYvA+Dsxmq8=
X-Received: by 2002:a05:622a:2c2:b0:4e8:a696:386 with SMTP id d75a77b69052e-4e8a6960b70mr83928711cf.12.1760876002496;
        Sun, 19 Oct 2025 05:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIxrvYE1Mmu01UNr8hJKcsKXWXAX8Kw6fsxCn/jB3654Qx/Q1k+3HFFgrbRnEygIt/TWeH6Q==
X-Received: by 2002:a05:622a:2c2:b0:4e8:a696:386 with SMTP id d75a77b69052e-4e8a6960b70mr83928261cf.12.1760876001928;
        Sun, 19 Oct 2025 05:13:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def26992sm1517277e87.103.2025.10.19.05.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:13:19 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:13:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
        saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <k76davhj2ojqrccfdzx5csvyfm2cwz2xgnxxzwcuiy44k7zwyh@bsnw3ny6uydz>
References: <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <58790287-4787-4763-a979-69df60de9263@arm.com>
 <3394e094-ffb5-4503-adde-7c382e3f2f6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3394e094-ffb5-4503-adde-7c382e3f2f6e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AdSGRnBoBKoFRHdNbgS7_-6lBttRz5c0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXyVYdB9Q4tDDm
 ntyX68+UQY5VZOWHJ80Z+xVQ0letcEYmbUW9VHmBS1QuXJJLMBcyJH6IsNIhb9DUingJiMGTzg+
 K+YcIZ0G2r0X847ZpHXyy+Yff6R7Awc32S9qdDSGdDdSEOQ1Ija3stfawO7nr0kZmmj3iJHjsHY
 SnXjsw6vzqE9HLdq3IVTRAYejtNIEr6kDkwTg8V1Dm7UXJ2cTSbto9evtrj/o/V34qkkjGG/1Kl
 /j5ysmU4t03wucIuj/g/PpZ499pUdffxQ0SUa21LWjVCNQbsCOlLXVbXrDHrufsyiWmy6vWFSI9
 O0t5QG18QH8QDbeqq8c8bDiOE1ozcOMPLoYqZXxuHq7a866hrFiy6UISDQgd13x/aXBLY0dY3TT
 QWlALVsJOghA7oDEuyOh1OwvCkfOww==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f4d5e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=tL-A2WhEFdlIpSB3ntkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AdSGRnBoBKoFRHdNbgS7_-6lBttRz5c0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Wed, Oct 15, 2025 at 02:02:10PM +0530, Charan Teja Kalla wrote:
> 
> 
> On 10/14/2025 7:37 PM, Robin Murphy wrote:
> > On 2025-10-13 1:31 pm, Dmitry Baryshkov wrote:
> >> On Mon, Oct 13, 2025 at 12:20:54PM +0100, Robin Murphy wrote:
> >>> On 2025-10-09 7:25 pm, Dmitry Baryshkov wrote:
> >>>> On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
> >>>>> On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
> >>>>>>> On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> >>>>>>>>
> >>>>>>>> On 9/29/2025 3:50 PM, Robin Murphy wrote:
> >>>>>>>>>> USECASE [1]:
> >>>>>>>>>> -----------
> >>>>>>>>>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> >>>>>>>>>> functions) called as pixel and nonpixel blocks, that does
> >>>>>>>>>> decode and
> >>>>>>>>>> encode of the video stream. These sub blocks are
> >>>>>>>>>> __configured__ to
> >>>>>>>>>> generate different stream IDs.
> >>>>>>>>>
> >>>>>>>>> So please clarify why you can't:
> >>>>>>>>>
> >>>>>>>>> a) Describe the sub-blocks as individual child nodes each with
> >>>>>>>>> their own
> >>>>>>>>> distinct "iommus" property
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Thanks Robin for your time. Sorry for late reply as I really
> >>>>>>>> didn't have
> >>>>>>>> concrete answer for this question.
> >>>>>>>>
> >>>>>>>> First let me clarify the word "sub blocks" -- This is just the
> >>>>>>>> logical
> >>>>>>>> separation with no separate address space to really able to
> >>>>>>>> define them
> >>>>>>>> as sub devices. Think of it like a single video IP with 2 dma
> >>>>>>>> engines(used for pixel and non-pixel purpose).
> >>>>>>>>
> >>>>>>>> I should agree that the child-nodes in the device tree is the
> >>>>>>>> easy one
> >>>>>>>> and infact, it is how being used in downstream.
> >>>>>>>>
> >>>>>>>> For upstream -- Since there is no real address space to interact
> >>>>>>>> with
> >>>>>>>> these sub-blocks(or logical blocks), does it really qualify to
> >>>>>>>> define as
> >>>>>>>> child nodes in the device tree? I see there is some push back[1].
> >>>>>>>
> >>>>>>> Who says you need an address space? Child nodes without "reg"
> >>>>>>> properties,
> >>>>>>> referenced by name, compatible or phandle, exist all over the
> >>>>>>> place for all
> >>>>>>> manner of reasons. If there are distinct logical functions with
> >>>>>>> their own
> >>>>>>> distinct hardware properties, then I would say having child nodes to
> >>>>>>> describe and associate those properties with their respective
> >>>>>>> functions is
> >>>>>>> entirely natural and appropriate. The first example that comes to
> >>>>>>> mind of
> >>>>>>> where this is a well-established practice is PMICs - to pick one
> >>>>>>> at random:
> >>>>>>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> >>>>>>
> >>>>>> Logical function, that's correct. And also note, for PMICs that
> >>>>>> practice
> >>>>>> has bitten us back. For PM8008 we switched back to a non-subdevice
> >>>>>> representation.
> >>>>>>
> >>>>>>> For bonus irony, you can't take the other approaches without
> >>>>>>> inherently
> >>>>>>> *introducing* a notional address space in the form of your
> >>>>>>> logical function
> >>>>>>> IDs anyway.
> >>>>>>>
> >>>>>>>>       > or:
> >>>>>>>>>
> >>>>>>>>> b) Use standard "iommu-map" which already supports mapping a
> >>>>>>>>> masked
> >>>>>>>>> input ID to an arbitrary IOMMU specifier
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I think clients is also required to program non-zero smr mask,
> >>>>>>>> where as
> >>>>>>>> iommu-map just maps the id to an IOMMU specifier(sid). Please
> >>>>>>>> LMK if I
> >>>>>>>> am unable to catch your thought here.
> >>>>>>> An IOMMU specifier is whatever the target IOMMU node's #iommu-
> >>>>>>> cells says it
> >>>>>>> is. The fact that Linux's parsing code only works properly for
> >>>>>>> #iommu-cells
> >>>>>>> = 1 is not really a DT binding problem (other than it stemming
> >>>>>>> from a loose
> >>>>>>> assumption stated in the PCI binding's use of the property).
> >>>>>>
> >>>>>> I really don't like the idea of extending the #iommu-cells. The
> >>>>>> ARM SMMU
> >>>>>> has only one cell, which is correct even for our platforms. The fact
> >>>>>> that we need to identify different IOMMU SIDs (and handle them in a
> >>>>>> differnt ways) is internal to the video device (and several other
> >>>>>> devices). There is nothing to be handled on the ARM SMMU side.
> >>>>>
> >>>>> Huh? So if you prefer not to change anything, are you suggesting
> >>>>> this series
> >>>>> doesn't need to exist at all? Now I'm thoroughly confused...
> >>>>
> >>>> Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> >>>> #iommu-cells is the best idea.
> >>>
> >>> What? No, any function ID would be an *input* to a map, not part of the
> >>> output specifier; indeed it should never go anywhere near the IOMMU,
> >>> I don't
> >>> think anyone suggested that.
> >>
> >> It was Bryan, https://lore.kernel.org/linux-arm-
> >> msm/9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org
> > 
> > Ah, I wasn't on that thread. But indeed, as I hopefully explained
> > before, that whole idea is a non-starter anyway due to who the consumers
> > of "iommus" actually are.
> > 
> >>>>> If you want to use SMR masks, then you absolutely need #iommu-cells
> >>>>> = 2,
> >>>>> because that is the SMMU binding for using SMR masks. It would
> >>>>> definitely
> >>>>
> >>>> I'm sorry. Yes, we have #iommu-cells = <2>.
> >>>>
> >>>>> not be OK to have some magic property trying to smuggle
> >>>>> IOMMU-driver-specific data contrary to what the IOMMU node itself
> >>>>> says. As
> >>>>> for iommu-map, I don't see what would be objectionable about
> >>>>> improving the
> >>>>> parsing to respect a real #iommu-cells value rather than hard-
> >>>>> coding an
> >>>>> assumption. Yes, we'd probably need to forbid entries with length > 1
> >>>>> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> >>>>
> >>>> This will break e.g. PCIe on Qualcomm platforms:
> >>>>
> >>>>                           iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> >>>>                                       <0x100 &apps_smmu 0x1401 0x1>;
> >>>>
> >>>>
> >>>> But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
> >>>> <2>. It depends on ARM SMMU ignoring the second cell when it's not
> >>>> present.
> >>>
> >>> Urgh, yes, that's just broken already 🙁
> >>>
> >>> At least they all seem to be a sufficiently consistent pattern that a
> >>> targeted workaround to detect old DTBs looks feasible (I'm thinking, if
> >>> iommu-map size % 4 == 0 and cells n*4 + 3 are all 1 and cells n*4 + 1
> >>> are
> >>> all the same phandle to an IOMMU with #iommu-cells == 2, then parse
> >>> as if
> >>> #iommu-cells == 1)
> >>
> >> How do we handle the case of #iommu-cells = <2>? I.e. what should be the
> >> "fixed" representation of the map above? Should we have usual cells and
> >> one extra "length" just for the sake of it?
> > 
> > It's not really "for the sake of it", it is the defined format of the
> > "iommu-map" binding - IMO it would be far more horrible if each entry
> > did or didn't include a length cell depending on the size of the
> > preceding IOMMU specifier. It's also far from infeasible to have *some*
> > well-defined relationship between a non-singular input ID range and a
> > multi-cell base IOMMU specifier, it just needs more IOMMU-specific
> > interpretation in the consumer than Linux cares to bother with. Thus it
> > is appropriate for the binding to be able to describe that even though
> > Linux as a consumer continues to refuse to support it. The binding does
> > not describe Linux, or the property would be named "linux,iommu-map".
> > 
> >>                 iommu-map = <0x0   &apps_smmu 0x1400 0x0 0x1>,
> >>                             <0x100 &apps_smmu 0x1401 0x0 0x1>;
> >>
> Dmitry,  Wanted to understand if you did consider to include additional
> #iommu-map-cells in the above representation? or it is just based on the
> #iommu-cells?

Just #iommu-cells, as suggested by Robin.

> 
> And this is the same representation for PCI devices as well or it is
> still parsed as if #iommu-cells = 1 just for old dtbs based on the
> workaround by Robin above?
> 
> so, it will be like:
> iommu-map = <rid/func-id phandler sid_base <mask> len>;  and if mask is
> not defined, treat this as if #iommu-cell = 1.

Yes.


-- 
With best wishes
Dmitry

