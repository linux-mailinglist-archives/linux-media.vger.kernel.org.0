Return-Path: <linux-media+bounces-61617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULTZOgUMBmqleQIAu9opvQ
	(envelope-from <linux-media+bounces-61617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:53:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC075458F6
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B839C3013888
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 17:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5598239769E;
	Thu, 14 May 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="uID4L/RT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9CC39022E
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781176; cv=none; b=mzI/fOxUuhy13mlQ9LEDmV8nW+ZULrJ4RqK/HKqbOyZTucx8jkWV7e9Bs6ywr55JVf/DalFQ1MWjogt/h0pKm3DWTyjIDdN80vyVt/g+lucsfETJmVWQjIgTDPUOhW+KtlQqMF2qjCaIt7PArGfPHtKNX74TTTZLBAZnnb73BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781176; c=relaxed/simple;
	bh=6Lsiopp+gOlTgIhuJUtI3u2C7QdWhtAwDrbE0I7bAro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hAFXmx0uEgoDXsDujH/CTM6tS4qYhbapb18FperEtKUscB0hLUAVRM/YNSIHTw4aS0Gvt2UaRCHHDSZRR8uvcOmEt094xcO0N/6NJ2QFPXJdOw+J/bT/xJDGYaq4tFZJ9riDLRniJzJT5x3+3OvYAQto9Gt5/5wOSezLHDJoYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=uID4L/RT; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EFYx831742914
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:52:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=i7CC6BqBBL9skWarpnUsM1vRDVhAGp/lgIIkSrH6DrI=; b=uID4L/RTFdpM
	ym5kuxwAZGXnMvm5RC/hAqjahIGR4X97DZNauwiy3+2qdGeLwon1A2giOFCwt250
	p2DDOFCJbt9Xw927M+aXcmNFZurvTU6m7SIy/PDM/fiVkf7NqG6TpGzja1cpG9MB
	oTwuC4fhNj9UVZMTydsFMZmhDJ/rrspbDs+/u3Ko5yH+4iTRpMG6q0zdA+yDi3Md
	tcjYwnReCHshyKmsj+AJkYVjYTAYGsJnOGhPIjZevNDHjlHO3kIJTYdOvoyyMEyt
	xMAEBJM041u78SHl6dC35/Cnr/q8/tjegsMQIjHnAXNRAxTU9Av7XNoZtpSdIjkC
	VOZpBcrPXw==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e3nvqscva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:52:54 -0700 (PDT)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so5375082f8f.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778781173; x=1779385973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7CC6BqBBL9skWarpnUsM1vRDVhAGp/lgIIkSrH6DrI=;
        b=h1gDUGyZH0VrS0dVJwi/hHZXBFTYJQ7/t5wkahIqzFJCHfKx6ZI+lj8wr6gNglVHX1
         sbtJ/V0XS0F9RUr/X5+lBOyVj5yEPXHKNvFToIHYGh49Z2GjrRJDHLRn/5iq+Ess7FIb
         ucK/N/etaecFY5A5hGRDhEiGezCGzNqyOEgTI7YV9l3GVwjGxXp27EC1q7M24CkDBsGZ
         cSy/p27bxw0SfSH8kEPi+Wx+bmsogVYOroZ3QF4VE3tPgHoZgd05EzU/ynfuDzSVFLUs
         kfxsbM78T3OuFtMOG01V2Agn81+yredSN3f8zNVaUFa5P89RFswAT1SXgonLPu5MdfIF
         FFJA==
X-Forwarded-Encrypted: i=1; AFNElJ8a0pCHZi7cAbMu5CKQeFCzqPPAm2YlW2dZOdme0IxBeumUAQWir3UKpAg2XY0UKaPlfzDVHoBxzDqdqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypX5xJw46kVhgnty7iye6nXQI6QhngpUEiDcS2Y/MUzMgU63qN
	/WLl/M66hgw8zAiWEQ5HJ9zDS/+k+6okZrXrABZfjWfhm1VD92xUGN8ioFEq/DNYRCSwlQI6oBP
	rfYQT1rmu3HSC/jd3GRtXRWFrtRMCcbdeNnt031+G5qdqormAlUJkZVahaThta0GNOkrWpBI=
X-Gm-Gg: Acq92OHc1cxYw956+R5PSuwzOu4y2d5u/gce3rFNNnIIeWd6xydUmnF6wZGrwrLFBrT
	nCjT6LX6Hey53OPQnKQcdnwPC7j9wNcFvZovJz2wV8Jn47VfNMP6cdjUj3ehzZ0PAld8/RGX3gE
	Axo281MqtTlZDsI4TqcHvT/qsL+i5S1RQCSACVZPHahDZ4nzTwBS9s+mGQAO9uZMzscmrRWPLoG
	ykogMXwbNOw/ENPVRzulBLu30jaXErnt5dnirhsLt0FKseceLUnMYM2pxRM513V6v9jtXyYRlq6
	CmPxjTRj8hueU7xVIBMPSM+Ev7wzAIcA7SOkhoQmJmLXmH2xq6eZ4hAQM5rN+CudgPXoMMzyHuS
	C6d3B2tKJ6FOfhjGsHeywINOQhv5SDUroRBx60/WImPofzuDykCC7UX7ABuejwkJCL7g4/lFN2P
	euIy/aoCvGk1E9bee3Umt25rBJ1LNgk6IW39lqTcKFNSx8Ur0FaqujTRxLAJHvNCfFmo2jVJ5Tg
	WF2LC1sgRC5/fyN8PPVXkA=
X-Received: by 2002:a05:6000:2f87:b0:452:c246:ab7a with SMTP id ffacd0b85a97d-45e5c5beb43mr98799f8f.14.1778781172726;
        Thu, 14 May 2026 10:52:52 -0700 (PDT)
X-Received: by 2002:a05:6000:2f87:b0:452:c246:ab7a with SMTP id ffacd0b85a97d-45e5c5beb43mr98748f8f.14.1778781172259;
        Thu, 14 May 2026 10:52:52 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm7910203f8f.37.2026.05.14.10.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 10:52:51 -0700 (PDT)
Message-ID: <c2601b9c-9265-43da-9321-66db57446807@meta.com>
Date: Thu, 14 May 2026 18:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Content-Language: en-GB
To: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
        Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
 <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-5-mattev@meta.com>
 <20260501161915.75525c15@shazbot.org> <afhNeYS174EW7RYp@nvidia.com>
 <20260505104911.GB11063@unreal> <20260505085058.74c34290@shazbot.org>
 <20260506053511.GG11063@unreal>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260506053511.GG11063@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE3OSBTYWx0ZWRfX+bUgK3j+gn+g
 WKwL1DhnB94MzrkND54RsnLjDu1FWpMvoOtrPNV/Hug5DJ8bp5uyym5y1EKJoBODTUdySatFnSL
 jyh6Yienkd0YzeF17SrVxPaYKe7c7VNXljEM8lQCq1wtMpOaBNj0K4/AvUaWZP1jmWoEQoOVzrP
 +/VpIgU1pNxUAPHOqE4X+f+1lP1RUWLbmFhrfiX7cO2YOv97lq6ViCjP3RKiXWt/iex80bAkC/o
 1LIoApXTLl96y4HoNgQKovrwID5gCuC8br8L6r+yxL4EH2Ex/FU4MZEcxvZZAnYX4Cjwt5g00jc
 A+hezrNHiNd9s9O5/9MBSxHDwt6MOg1VSah14VOk287s6khO0rBrH1lr5ZMtD/BhjuR/kZU1zrR
 FhB7Ik5LRChNMXx70R0np9I+oiYyGe+LTxPt1clPanEomGEFdiobIiAlJB16yp250S0XvrmV3gW
 wzdnfdas9fjpxiSmRpA==
X-Proofpoint-GUID: RRY2VlkiDJdPQnEC-UY19u4PZCxx15yr
X-Proofpoint-ORIG-GUID: RRY2VlkiDJdPQnEC-UY19u4PZCxx15yr
X-Authority-Analysis: v=2.4 cv=TfKmcxQh c=1 sm=1 tr=0 ts=6a060bf6 cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VwQbUJbxAAAA:8 a=QhZvmJRm3SQzdzbRGmYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Rspamd-Queue-Id: AEC075458F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61617-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:mid,meta.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Leon, Alex, Jason,

On 06/05/2026 06:35, Leon Romanovsky wrote:
> 
> On Tue, May 05, 2026 at 08:50:58AM -0600, Alex Williamson wrote:
>> On Tue, 5 May 2026 13:49:11 +0300
>> Leon Romanovsky <leon@kernel.org> wrote:
>>
>>> On Mon, May 04, 2026 at 04:40:41AM -0300, Jason Gunthorpe wrote:
>>>> On Fri, May 01, 2026 at 04:19:15PM -0600, Alex Williamson wrote:
>>>>    
>>>>> Exporting dma-bufs from vfio-pci is a feature, but mmap of MMIO BARs is
>>>>> a legacy requirement.  That legacy requirement now depends on
>>>>> PCI_P2PDMA, which depends on 64BIT and ZONE_DEVICE.
>>>>
>>>> That should be split up now, Leon missed it when he added the new
>>>> APIs that didn't require ZONE_DEVICE..
>>>
>>> Sorry, what did I miss here?
>>> VFIO_DMABUF is an optional feature and is enabled only when P2P support is
>>> available. It does not affect legacy systems where P2P cannot be enabled.
>>
>> If we look at the long term view of moving exclusively to cdev/iommufd,
>> where VFIO_DMABUF becomes the mechanism for implementing P2P DMA
>> mappings, VFIO_DMABUF may be optional, but it's highly desirable for
>> legacy compatibility.  There's an argument though that providing P2P
>> compatibility on platforms that support PCI_P2PDMA is probably
>> sufficient.
>>
>> However, in providing mmap of dmabufs as a feature, this series is
>> wiring all mmaps through dmabufs and therefore that dependency becomes
>> fundamental to the use of vfio-pci.  Thus the discussion whether the
>> noted config requirements could be lifted.  Thanks,
> 
> Right, there was no need to remove ZONE_DEVICE when I added my code, and I
> left the task of cleaning it out of is_pci_p2pdma_page() for another day.
> Without ZONE_DEVICE, all pages are treated as non‑P2P.
Just checking I'm following the deps correctly...

If we remove the PCI_P2PDMA dependency on ZONE_DEVICE then (without) 
it's present with P2P hard-disabled (as Leon says).  Already 
`is_pci_p2pdma_page() == false` because folio_is_zone_device() is always 
false in that config.

The only dependency this series adds is for pcim_p2pdma_provider() (and 
support).  We can select PCI_P2PDMA for provider purposes (VFIO!) but if 
!ZONE_DEVICE there's no P2P.

Nothing in PCI_P2PDMA depends on 64BIT and that dependency can be 
removed [1].  (ZONE_DEVICE depends on 64BIT.)

That seems a path to VFIO operating unchanged on 32-bit platforms and 
others without ZONE_DEVICE.

(PCI_P2PDMA currently also depends on NEED_SG_DMA_FLAGS, which seems to 
be unnecessary if !ZONE_DEVICE is preventing P2P pages (no 
sg_dma_mark_bus_address() would happen for example), is that right?)


Then VFIO_PCI depends on a subset of PCI_P2PDMA configuation:

"Diet" PCI_P2PDMA_CORE available even when !ZONE_DEVICE:
  - Compatible with 32-bit platforms; doesn't need to depend on 64BIT
  - Returns a provider, which allows VFIO mmap(), DMABUF mmap().
  - Doesn't allow P2P DMA (eg. via DMABUFs).
  - Doesn't need to select NEED_SG_DMA_FLAGS.

"Classic" PCI_P2PDMA depending on ZONE_DEVICE:
  - Behaves as PCI_P2PDMA does today
  - If ZONE_DEVICE then PCI_P2PDMA enabled, which enables VFIO_PCI_DMABUF

Meaning:

32-bit configs (or 64-bit without ZONE_DEVICE):
  - No P2P anyway
  - VFIO mmap() works
  - VFIO_PCI_DMABUF is disabled (no point enabling DMABUF export since it
    can't be used for its original P2P purpose)

64-bit configs that support ZONE_DEVICE:
  - As today, DMABUF P2P, mmap() of BARs via VFIO or DMABUF


Just added PCI_P2PDMA_CORE and (functionally) ~no code changes are 
needed since disabling P2P just falls out of !ZONE_DEVICE.  But most of 
p2pdma.c does nothing in that config (except for pcim_p2pdma_provider() 
and its support) so benefits from some #ifdef to reduce it.  WDYT about 
a pcip2pdma_core.c containing just the provider management?


Thanks,

Matt

[1]:  The drivers/pci/Kconfig's PCI_P2PDMA states:
   # The need for the scatterlist DMA bus address flag means PCI P2PDMA
   # requires 64bit
I think this isn't quite right as AFAICT the flags are usable on 32b 
too, and actually it's ZONE_DEVICE that requires 64bit.

