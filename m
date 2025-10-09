Return-Path: <linux-media+bounces-44093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D17BCBC940B
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BD0480A9B
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 13:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FF52E8B79;
	Thu,  9 Oct 2025 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bB8emnIR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E152E8881
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015987; cv=none; b=WD/k99CNXPvU8QN9Nvkb0beV3GLkEXQua9tx26qHjpSwdXEHhdAcjp9mzSr2ThVYYUaVd1cNN6Cb05hnzqXI6utJfYfwWiQ5BZMs4wmPADdFrbuSUVgfd+1KxfiFh2J6au181eJuRhteVnEtyrBY4LB+SnQGHHGqn0Vhofi8jco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015987; c=relaxed/simple;
	bh=6od1fV6rVbTTlriYWkrdTnoQlj1t0m28wf/FQK3dZoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXBq5dcA87OxlBrX2LNpvucQULZ53glgf5vsig22FKi/kVfP4z6lgnIgK9haRkkJ36SFCuZ0TIrD3dZMcCTqU7dTVYaSd2uGwS8YmIgcykrCDttfvJ77zJBkQ4KBGZ8L39A2weau/J+msfdYO1eb705hQb8bYfizA0hAZ0+YDrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bB8emnIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998VCQI032107
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vv0TlFWg4LZf6pn5FCrrZNgZ
	oi+P6lXJOgo5f8lPaQA=; b=bB8emnIRbj4PeCz4vFHAoC1oZZqt5GqAhiLEGsJF
	WUgvM9gutwLAjNNJpOvjqJchc1LxccVolCUZUL22/o1HoTvci7mmeBVhNlinykpU
	HUViStE4h/18kA3mh1RanAReXIuIcqmVhIzaKikUomluW1KiB1O/OWnPNQfJadQ+
	6AMaBp9zfplitt+sVpUiiDVkMoKGQJByF+kH6tyC1Q5PleCpkdFSpWIpKicrOyXL
	AWaa23RyB1tpVrjD5s5twwiUQnqc4MCRyPzX2O9YcWhINp+A2T+taVOWcYgEJhQO
	+I1+asJcDpE85a11AO+oZugLbVl47sL4FAepX5ctkS1pBw==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0rufr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 13:19:45 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42955823202so37630995ab.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 06:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015984; x=1760620784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv0TlFWg4LZf6pn5FCrrZNgZoi+P6lXJOgo5f8lPaQA=;
        b=ri2wOKGycE56fra/bcSO1rKs0CwlXofTd9jxCaQw6//32fDHX4ZFgSZyB4TnjzuFMi
         WtBfWtijJ5l7je//E4d2uukn4oKDpHdKTnxvnEijt1R8Z9AqbfF//621Jq0vJmfCoKvb
         r8PHYfMOMQvdoDNPRtvY/qR6KfaiXyZ0Qk6rhrV1VGfNFu8xfMpz9vzYbDcjil2wpRYW
         xZFGpeKcp9sD5Bcy12P6NRecpg34XsxXlHFg+efv+WmTTf2sTmGanMyiSUZMnY4e9p+c
         iMYuZ1D6ZSQ0GsKAYwxgSSbe7E6eLV02rXdkFaXcLaaTZ7pPc1GR42Uao6yWDmch4HxV
         xlbw==
X-Forwarded-Encrypted: i=1; AJvYcCXtaxeth7MdG6KjhH2f8a/PmipG6eJv1NnOzDrhI0IpJcDhqCawoCXymNMwvWpOhjOrqLFiPVFWoJOoAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31RqT8NZ1i7sB5CThUy35opMDNzDdhceXucLJCSvHvPCX7aas
	vP4UMq4mRDq0Rn/6uKJx07rDfr/dvQKeSP7XcdIhB79+SqnVh5drjSToDM3Szn5ZjUbrMHHDI4I
	s3mHTIq/m/EN8t7TUYEXKPr20YeqTp8U9nlPYiiqJ+HsMIONPuZMgJwszWMh8z3ypMQ==
X-Gm-Gg: ASbGnctWvHBR73CyrPWa/O44j1lKmho2kE+0lLIS3zlW0G5YMd7/8NK3PAKpSu4d8oh
	upA8Ss4mI6fi6nsGAm4g9GEU3z7rZbIKaTUDLZurcK/wd5n4KgG7YO7FLlGKXNL5BaxyJAKgkJI
	uPbju36HlZ94tDCaIiGOpy5nRuJk1xlU6kldFJU19veuNMHjXutc86qHYc08lSHZkE2uKQ4Ogyr
	TjeogOAUaC1FUAvieDqtRnUXvHYnULAkfNYUH3z6GH9wVAMc1RShY6wG9cBAcRT0MKcnv362NfW
	ED2hWC/DadKwSwXAuFuU7chr/w6QcLLO8AmGru40dDNr81yoiawZ0ruyrJFtdZvVzYUvwbp4DJm
	GAr0+2tDU54NOjswQh/fpQh27bA==
X-Received: by 2002:a05:6e02:2489:b0:42f:9649:56b4 with SMTP id e9e14a558f8ab-42f96495934mr6334455ab.13.1760015982043;
        Thu, 09 Oct 2025 06:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuLd6doij9uX9eFOZ4a0b3LPpTi2x2bpfbnZ3V6dXKn1WmTOSuYPaxXIOlXui8pryaHKbNrQ==
X-Received: by 2002:a05:6e02:2489:b0:42f:9649:56b4 with SMTP id e9e14a558f8ab-42f96495934mr6334115ab.13.1760015981514;
        Thu, 09 Oct 2025 06:19:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm1038524e87.90.2025.10.09.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:19:40 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:19:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        robh@kernel.org, mchehab@kernel.org, bod@kernel.org,
        krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7b671 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=K8VDcWk0KpU4SPYsRVAA:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-GUID: PlR5LrT9AS10YuJVZ8N82h7xQUg3KDzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX0vqEv7wGTHX1
 bTfAGU6wYEGm5hdY5tAx8wP94UbGou0YpSQPXAxlF1lsp4aSMhPsmwo4Wi72/sd2aujRZN2Rno/
 5hXwC84PFWtWwVaZJbdO5eoNxniu5ArKRsnvDcULFicq1Hpy+YfOpsuFk/s2p8gExwHn8VywV9o
 5PfXJUqbXpvM7r2otrr877p2y7AkqK6PhqqlZyNAjo/+QTEYExA7Ki1SzLeStq6qNC8zY48qSBy
 WrpOKVVg0GhCXBzBU95U8rYVki+CoSLAq3Bl/Mh1lKcKysC27juEKKfJBdK8a18+GUNQm63t6hy
 hW+GyJzHyTokUMIvR88gXy/OYEUTlMw7/HI0YP+ibvrE9E5iWS4gvim2fHbjSYn9YaK6nhpm9zF
 9Qmll9U9vzbHEEsVtVK95DyI0FknYg==
X-Proofpoint-ORIG-GUID: PlR5LrT9AS10YuJVZ8N82h7xQUg3KDzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
> On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> > 
> > On 9/29/2025 3:50 PM, Robin Murphy wrote:
> > > > USECASE [1]:
> > > > -----------
> > > > Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> > > > functions) called as pixel and nonpixel blocks, that does decode and
> > > > encode of the video stream. These sub blocks are __configured__ to
> > > > generate different stream IDs.
> > > 
> > > So please clarify why you can't:
> > > 
> > > a) Describe the sub-blocks as individual child nodes each with their own
> > > distinct "iommus" property
> > > 
> > 
> > Thanks Robin for your time. Sorry for late reply as I really didn't have
> > concrete answer for this question.
> > 
> > First let me clarify the word "sub blocks" -- This is just the logical
> > separation with no separate address space to really able to define them
> > as sub devices. Think of it like a single video IP with 2 dma
> > engines(used for pixel and non-pixel purpose).
> > 
> > I should agree that the child-nodes in the device tree is the easy one
> > and infact, it is how being used in downstream.
> > 
> > For upstream -- Since there is no real address space to interact with
> > these sub-blocks(or logical blocks), does it really qualify to define as
> > child nodes in the device tree? I see there is some push back[1].
> 
> Who says you need an address space? Child nodes without "reg" properties,
> referenced by name, compatible or phandle, exist all over the place for all
> manner of reasons. If there are distinct logical functions with their own
> distinct hardware properties, then I would say having child nodes to
> describe and associate those properties with their respective functions is
> entirely natural and appropriate. The first example that comes to mind of
> where this is a well-established practice is PMICs - to pick one at random:
> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

Logical function, that's correct. And also note, for PMICs that practice
has bitten us back. For PM8008 we switched back to a non-subdevice
representation.

> For bonus irony, you can't take the other approaches without inherently
> *introducing* a notional address space in the form of your logical function
> IDs anyway.
> 
> >    > or:
> > > 
> > > b) Use standard "iommu-map" which already supports mapping a masked
> > > input ID to an arbitrary IOMMU specifier
> > > 
> > 
> > I think clients is also required to program non-zero smr mask, where as
> > iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
> > am unable to catch your thought here.
> An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
> is. The fact that Linux's parsing code only works properly for #iommu-cells
> = 1 is not really a DT binding problem (other than it stemming from a loose
> assumption stated in the PCI binding's use of the property).

I really don't like the idea of extending the #iommu-cells. The ARM SMMU
has only one cell, which is correct even for our platforms. The fact
that we need to identify different IOMMU SIDs (and handle them in a
differnt ways) is internal to the video device (and several other
devices). There is nothing to be handled on the ARM SMMU side.

> 
> However, I still lean toward the first approach, as this definitely seems
> like it wants to be one overall device with a level of internal hierarchy,
> rather than a full-blown bus abstraction.

-- 
With best wishes
Dmitry

