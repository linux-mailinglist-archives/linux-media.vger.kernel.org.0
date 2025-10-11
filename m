Return-Path: <linux-media+bounces-44190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86798BCED6F
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 02:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A7903B2513
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 00:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA09A6A8D2;
	Sat, 11 Oct 2025 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBKHJrrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E02BD11
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 00:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760144108; cv=none; b=uxCVLDhyVBjRX3OdyPHAX2kX6kjSqTUarWFrT6bOywz/3XlxbM+8oh/N8HbTSgXO07LtiAMKMExGBwH4tJ+i0D0XTz48TyQzBYuAAt5wGn7ALcGYmGUXVbSyPBnIEPS82R1nAkAWpWSthdra6JxHDIcqTf2DbGWUzTvCeykrNHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760144108; c=relaxed/simple;
	bh=vi5IL7gL2WbF9PAP2+XIfl5Vm1qsFPHUVEzsR7J8UBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX3rnpHBwc/6WaskXVPxQOLmdQ+CiajA8JGVqGrsnS4y2KmhMhXQPYAVQTEkbzbB5mDdotqdCqarN38/l1YgduwcPrB6dE9BPDiFTUD4GI1ZGC3TZLV/Nuz+3E86qDuJICihdSRutanhqtk3vD0STD5mB/KkDDEoIE9zyMXaa+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBKHJrrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFgmGo026054
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 00:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zElZAglfow04KlHk8Ohc4+IvGBRtXWc8AJ3vgbED59o=; b=PBKHJrrS1zktZacW
	tsVoa60FeJKDj4hN1HwyV39ejelQb56msQXKXTI23qEPX+zEiIwtFDOIiJ5ROyO3
	L/ztItePqUTEtzXJj9zeZ6sYnYM1A8gd1tBuVLRvqWDJrwzPUN2HESgSNOz/sdaa
	x8IXByEKLwprfIdUqhRM4A57Qrg0kTdRSb1cbMo9S4yXJ/+cRBt+BF+MAfleDgX6
	zN23leaOXnjNI/fSrl9PcCYHYIdtLB0a6AT6X95JBV3I0vSyPpvr2g0x7tdB0xh3
	fpvH4fpzzgGBOpqBnCDtjC+ymexO1vMhPakM9h/DZgDBjh8jmIJdZq/hdrJgeL31
	yN+ydw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ng2df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 00:55:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8589058c59bso1850341585a.2
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 17:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760144103; x=1760748903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zElZAglfow04KlHk8Ohc4+IvGBRtXWc8AJ3vgbED59o=;
        b=I8YhtvjGwYazeMiCKh8xifaTxtwkR7Zc6DEkkN3Nqom/tlU0o4AF3BKxazi4njCDG1
         lFkYX+Y+QGfe1Zc/aXoONnceSn5dMsL42BV6qYAPtnOyaBNqQ7rfMDhqJZHP+1UFiScI
         oytspJL2k5xG5nlCbgFrm3TTVuMAj1d0vIlUb9uF0jMgkc3xEyRB4JIfFMhctvnYLT7h
         H2EHw9aeHj13JeC3YUlXI+X+z6dDcI5P5N6f7YNs2D7lOirppwtpyIkvDEoEayaCuJTL
         KVDEPOaRz5ISZk3nTiMOwGBXx2odFhXIsjI6CAX28Y5XOBOHIbNpRYt83l1S7QvYwTeH
         ljIg==
X-Forwarded-Encrypted: i=1; AJvYcCVBhavudq31WI2mh5+3U6jrRQhQi/m03H1/wGNYDsNF2VE7E7MXzox0XfYhLVJENa9HFdVxehPYxcZcYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZ0eiOhCziFW6tr2VjzdEQ7Ryg7rgumke2xME7k38W9eDfcwN
	Nws0uANxaT8tbCqQBKo24qYz422YIGrR/Dp3Bebvw/cxOIILMJfUU/wudwl6Xj6EFRFx6rFdAS3
	k3f8E3LK5NoM2p4Y72NysGYZZtbLo8WH04VlWlO4fruFJYjKBXElV4h4Qd7hOiN9qqA==
X-Gm-Gg: ASbGncue80MwaBB7i+mzUGzfYmoSQ1Y7bUd+d/HjerqX27eRciLfP/BTJs0JZr8LMi2
	kqJDwspY2t1lLLY4KQ8ZQzQQlPGreA0McuxWpziQPGV5hVfCzypfiKGPDSilIddG794AQnmNxbt
	yVN04iciXol2K3L7RnimRD7WG2wa5ZPmox0bbIW23XzIoAP4VIDRmXqFOY3OoUlqkGsucWc+xC0
	SNvfgQiKdt2Sir3aCYb/6MMxp5UkAvJ7kDvfcCm2ktJ6Lonek/ozGPp0WgaDUra8oZ9KeoyyH3l
	0Y+Q51UIQn+CCB3sYMR1ZlRbHB9qTba5iiXf5hQcNo5j+D1ahCW/Y7Oh4+F+IfNJHCiO2eSiybe
	LaMiMN2wnfXTETesilFN3P3VwAMq9hwu55pewLqgIZi+2jYVsSOf1
X-Received: by 2002:a05:620a:28cd:b0:85a:8ea3:6bc with SMTP id af79cd13be357-883530825dfmr1952570585a.76.1760144103052;
        Fri, 10 Oct 2025 17:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBu5SGEW5C5gP7CCF4QRIhTixeNmjP2vRuCHeD0uAcIlHgu237/1p80MfhyPqdzhEljr1ATQ==
X-Received: by 2002:a05:620a:28cd:b0:85a:8ea3:6bc with SMTP id af79cd13be357-883530825dfmr1952567585a.76.1760144102348;
        Fri, 10 Oct 2025 17:55:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563ca7sm1374441e87.76.2025.10.10.17.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 17:55:00 -0700 (PDT)
Date: Sat, 11 Oct 2025 03:54:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
        saravanak@google.com, conor+dt@kernel.org, mchehab@kernel.org,
        bod@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <yoqrve424xt54wbuntcrksh5nwzekntwqgbu4rzy6v4ekwzjej@mpopdkmzjrd4>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
 <CAL_Jsq+LPpJxVRUP4b9Gt40t=Wr=2B+697Jv2sjtDqTpqwGezQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+LPpJxVRUP4b9Gt40t=Wr=2B+697Jv2sjtDqTpqwGezQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e9aae8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=E6X_DewmVMaNMEPXfb4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EciF52z8VH_E4b_jRNVK_JgihpFZSal1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/JdsyZPex44p
 aSPflC1xjXZVqHF/IFZH4ZWb7QRemn6oZagrZwd+2xNcU1h/fZ4rOJw8CNOVDaDkGI81+Ujas5k
 4/c8XJD2O7ZJHiGLvkqAHjGILa9uxZ36GkExUoYMkhoB8PUhzO5UJR4BGoCGf3OSWTKi6/k3Yxh
 LamgoWKJTRcc/qmh3d7HQdzTEnt12YSbgBxeTxtElBKCBR8vQ+ox8TqcqMYTcx9JGp19orFN/+T
 0/ZdS4ds7ZN8f0gsMphOim+Fm50qgR9m16bMV9CPP8sgEWWtoQiEyidN73SAAIPVhdXhwnew9ZV
 vh5V+e0rozPYHIDMQ5eEQAKQVzM0o7XDXYIEWqamsi/kjZEmjMsVIqa31Qu7ZJNj+rewMK+l8PP
 9ZYF+HVNJlrEq8+rmlbNsG/5uxhnEg==
X-Proofpoint-GUID: EciF52z8VH_E4b_jRNVK_JgihpFZSal1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Fri, Oct 10, 2025 at 05:30:11PM -0500, Rob Herring wrote:
> On Fri, Oct 10, 2025 at 2:53 PM Charan Teja Kalla
> <charan.kalla@oss.qualcomm.com> wrote:
> > On 10/9/2025 11:55 PM, Dmitry Baryshkov wrote:
> > >>> I really don't like the idea of extending the #iommu-cells. The ARM SMMU
> > >>> has only one cell, which is correct even for our platforms. The fact
> > >>> that we need to identify different IOMMU SIDs (and handle them in a
> > >>> differnt ways) is internal to the video device (and several other
> > >>> devices). There is nothing to be handled on the ARM SMMU side.
> > >> Huh? So if you prefer not to change anything, are you suggesting this series
> > >> doesn't need to exist at all? Now I'm thoroughly confused...
> > > Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> > > #iommu-cells is the best idea.
> > >
> > >> If you want to use SMR masks, then you absolutely need #iommu-cells = 2,
> > >> because that is the SMMU binding for using SMR masks. It would definitely
> > > I'm sorry. Yes, we have #iommu-cells = <2>.
> > >
> > >> not be OK to have some magic property trying to smuggle
> > >> IOMMU-driver-specific data contrary to what the IOMMU node itself says. As
> > >> for iommu-map, I don't see what would be objectionable about improving the
> > >> parsing to respect a real #iommu-cells value rather than hard-coding an
> > >> assumption. Yes, we'd probably need to forbid entries with length > 1
> > >> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> > > This will break e.g. PCIe on Qualcomm platforms:
> > >
> > >                         iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> > >                                     <0x100 &apps_smmu 0x1401 0x1>;
> > >
> > >
> > > But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
> > > <2>. It depends on ARM SMMU ignoring the second cell when it's not
> > > present.
> > >
> > >> relationship between the input ID and the output specifier falls apart when
> > >> the specifier is complex, but that seems simple enough to implement and
> > >> document (even if it's too fiddly to describe in the schema itself), and
> > >> still certainly no worse than having another property that *is* just
> > >> iommu-map with implicit length = 1.
> > >>
> > >> And if you want individual StreamIDs for logical functions to be attachable
> > >> to distinct contexts then those functions absolutely must be visible to the
> > >> IOMMU layer and the SMMU driver as independent devices with their own unique
> > >> properties, which means either they come that way from the DT as of_platform
> > >> devices in the first place, or you implement a full bus_type abstraction
> >
> > I don't want to dilute what Dmitry is saying here, but the below is what
> > i can make out of Robin comments, please CMIW:
> >
> > iommu {
> >         #iommu-cells = <2>;
> > }
> >
> > video {
> >    iommu = <iommu sid1 mask1>, <iommu sid2 mask2>;
> >    #iommu-map-cells = 2; /* does it look weird to define here, even if
> > it is SMMU property? */
> 
> No, not weird. interrupt-map similarly requires #interrupt-cells. So
> it would be just #iommu-cells here.

The major problem is that our DTs already use the currently-defined
single-cell iommu-maps. I'm not sure if it is possible to support
old and new semantics. So #iommu-map-cells (but placed into the IOMMU
device) might be a good way: by default iommu-map parsing code will try
parsing just a SID, but with #iommu-map-cells it will use specified
number of arguments. The only question is what if #iommu-map-cells !=
#iommu-cells.

> 
> >    iommu-map = <0 smmu sid3 mask3>,
> >                <0 smmu sid4 mask4>;
> 
> But you only have 1 cell, not 2 here. The #iommu-cells in this node
> would define the number of cells before 'smmu'. The #iommu-cells in
> the &smmu node is the number of cells after the &smmu phandle.

-- 
With best wishes
Dmitry

