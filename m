Return-Path: <linux-media+bounces-60834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE5ZFIe0/GmOSwAAu9opvQ
	(envelope-from <linux-media+bounces-60834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:49:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D144EB5C5
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 031A83018D46
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC1C3BED55;
	Thu,  7 May 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="TBT8+x/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F53FD14A
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168924; cv=none; b=Mv9gcZzv5M9bWHV02CIZMTA942EJ9O9GzJillmi1FFiG6An0jD5YLZImwIzM8NsPIo7Q3cFoYO5m7fwFcZ94nf1GbCn8vjvm+NLYmeShCUC9rKSTSsn2wZ6H2lffrdPZg3GTb6NSNpHDLa7cHZJpfGT4gp7SoggYYFeBHB26WvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168924; c=relaxed/simple;
	bh=GcwBPowN4P6RoMaDk1tUv4KKhhKSQTt60LOhJgxFpC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsWzSyTcLR75xuM+w/kPim38dg76qysRiYVr/zwCA5p/nz7v+bnX4AoomX8FRVLWl4zTf6inRzOmyqM+6nPUJCZitne/YyH+sVjPfO9PHWUb7oCdMwSzMEwWaDpNUOVuhVrg07M2nerK6IoAnMrvrGO3SHxDxp/QbReAH//BoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=TBT8+x/D; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6472nTD23680530
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 08:48:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=7ee0kKFk8CI3AWhXFM+kSfgli3u7LAWrP2aGxa36TIM=; b=TBT8+x/DyOnF
	/jQZcsP6J8KkrIiBxC1vYorXjlDpI2msIlIRN7YnrzQ7S97+CNmrwLuLnmCG39U6
	5WGItgxSXzSKsyUK5/JeGZHK3OSCo85kwy0yA/LYWhmAGPFxnmnfU922K3jm8nIT
	D6kZnU/Jc26lv9Pyx2qJeaEuyB19C8fGbHTaxmaWGRZrReTC5Bn+8kanDEjaxT8e
	olHoml38lvu+IzEADYEmLTw8bRp7+VgZp8YJuALcWXTrcq6+ZooeGRS9oF4bA1Wg
	pcN0TocQODFgyyMk36wtNUKOTOErT/R6G4ig4mssnIp5xVNowY0gRwIekSsw70xe
	6Mknw6Euhw==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by m0001303.ppops.net (PPS) with ESMTPS id 4dwcxa13k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:48:42 -0700 (PDT)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44d79da8cf7so890473f8f.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168921; x=1778773721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ee0kKFk8CI3AWhXFM+kSfgli3u7LAWrP2aGxa36TIM=;
        b=VfRh+OleEaNG8e+i4MNP5joQtv4H0cdmMsdJhQTNuF5MQa2o5NUepn8BNhML3ZFwTW
         rhuzGW34TpgBiWwnYcK8fMtN5aUjMk9xO99wDGzWhuRAsDhNEllWTeOh92rdbQHMXu8R
         NVd2Vx3ANuNjitP4S4B8WUOBsjuC+dYgErTVVYCdy/FmNSLL26v9Sxq+Sx4mP/hlVQcT
         /IjRowcrcOc+do3ma3nNP/EzsfFZnBIsKhLT/fwkVg1rQabVzocW+/pH/j86aKjkk3Op
         UquoeQkKdVkIasktmCRWc1YSpoD4Gm/r7e/QUsy9+0mBtx1eioUJtGEG72r5kBN94Yk/
         RYyA==
X-Forwarded-Encrypted: i=1; AFNElJ9Q7kuu9lFvvljWjfi4pK2ax+8T64pAc1sSQ7ydZs1slQQCWN2h9CRYPshhgbpV7lUpjv1IDrX8+e8Isw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMBFskGGMYomv/mpTQiXGY+OUK31ruMZ3qRzWKYjO1t+T8A1LG
	VIyGxgBwAyp6zHyq+YwnVJ586dCVTFQQw1LYgSYB5OZRS57rc7c/xtIgjjlLb25fIQqjyY7hohK
	od1MKOT9j7nt4h04xJ6zBKq2rM+kRpozDH/x6sD5auhqMPJQoOENTeIZKlHPA7H4=
X-Gm-Gg: AeBDies5EGFv7cFJEgUA3A1Sg+9pJwKdvCI6OM39y1bAOKRqQN+/ZCze9fOTAhYVRvr
	WBAKB+kr3nmfIZWbDCKULKrkgyC3hK3foIkYU86AKyqDvIfinsjpL9nJ/UKuPkEysUe+s3u0Qwh
	RjYRjI/HgbHCdkWS+WB6+ue/Cq/CfIKj+1/zV51jdkAUo+kfqMhPezQakda/EOsk9P88oY+L28n
	T0bj6mrcrCaFfaEGgZMdZN3twG5Kio91krRU9M13QcC0yZAVdj+tiMLac2NxNHSAIjZkWCCzoCp
	AdlWg0okT7/6RuBSBTJ3RCKI8KPSuwqy7hrJUblm8t77LHcxXVI5hXKesHo6v5RCgIF17ZNA32c
	dd67ruxsQuDHKJBeAhwv0BMGwBvcZHiaSz0ck4JawtXkYfICOgy5DRofDJj+1pndTtrh5vHgRQw
	eb+vmlKFRQSFFOai46LasanV4mY7kle0ZCVB2rfJpG1djqmkphRi8AR3fEVvqPs2dTKiiucukRB
	aGBaoOzKg1RWzxp3eR67Z+vyKiK1w==
X-Received: by 2002:a5d:5f48:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4515b056b4dmr13924650f8f.9.1778168920722;
        Thu, 07 May 2026 08:48:40 -0700 (PDT)
X-Received: by 2002:a5d:5f48:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4515b056b4dmr13924574f8f.9.1778168920112;
        Thu, 07 May 2026 08:48:40 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f2203csm21318765f8f.37.2026.05.07.08.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:48:39 -0700 (PDT)
Message-ID: <c746c3a7-37df-49a6-9000-a3b67ae206ab@meta.com>
Date: Thu, 7 May 2026 16:48:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Alex Mastro <amastro@fb.com>,
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
 <20260416131815.2729131-3-mattev@meta.com>
 <20260424181510.GF3444440@nvidia.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260424181510.GF3444440@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b2zw7iqBt5JZy-H_qhoMXmh2UFACaRMO
X-Proofpoint-GUID: b2zw7iqBt5JZy-H_qhoMXmh2UFACaRMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1OCBTYWx0ZWRfX5DPBz6aMFuxs
 gvA4L5RvaTnLYLvVEqjVHk9ps69nj0UXgI9qJ5+ZqG+aFT5rHygD15XFFQnh7Nbe+hyGs4TIVSb
 pGLHBg/n1W8/Yimqr6D8ZmpqjUt+gs1FoRoBz3SlPH28udErq6AcNzv2889fFYu/dk5Ymh4gMLx
 Wjw0TO8SVDniT6WCPXV4oWjh10CIN59NvImmuPnLBY5Karo8xCHGfgqUD89t9RPjznqeCdFESyf
 8yvptNFJHtD4gF53c9U7FZZgsqAXCxr9nK3Zblcx7d8dl65HRq1ejBXGNsgbDTNd9yi4blsPw9M
 rrUsq0KSejJU7MB7vXOTHB8iLL6wgjCPVUbGW1MNKyIUBYTdbXZVeTttalWoF0i1p4XoYIDXZ2o
 JufdVlLAJSDBPS7HPjkY62zkatjQfb/n3uYBLq2atZXdMW8QU2oyleSf5hIbU3SN25YzXTjJBOb
 8ZC0EmqVy5joPkhG9CA==
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=69fcb45a cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8 a=PVx_5XRel0ZW2V4eVl8A:9
 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: E2D144EB5C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-60834-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Jason,

On 24/04/2026 19:15, Jason Gunthorpe wrote:
> 
> On Thu, Apr 16, 2026 at 06:17:45AM -0700, Matt Evans wrote:
>> Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
>> find a PFN.
>>
>> This supports multi-range DMABUFs, which typically would be used to
>> represent scattered spans but might even represent overlapping or
>> aliasing spans of PFNs.
>>
>> Because this is intended to be used in vfio_pci_core.c, we also need
>> to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 124 ++++++++++++++++++++++++++---
>>   drivers/vfio/pci/vfio_pci_priv.h   |  19 +++++
>>   2 files changed, 130 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 04478b7415a0..8b6bae56bbf2 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -9,19 +9,6 @@
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> -struct vfio_pci_dma_buf {
>> -	struct dma_buf *dmabuf;
>> -	struct vfio_pci_core_device *vdev;
>> -	struct list_head dmabufs_elm;
>> -	size_t size;
>> -	struct phys_vec *phys_vec;
>> -	struct p2pdma_provider *provider;
>> -	u32 nr_ranges;
>> -	struct kref kref;
>> -	struct completion comp;
>> -	u8 revoked : 1;
>> -};
>> -
>>   static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>   				   struct dma_buf_attachment *attachment)
>>   {
>> @@ -106,6 +93,117 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>>   	.release = vfio_pci_dma_buf_release,
>>   };
>>   
>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>> +			      struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      unsigned int order,
>> +			      unsigned long *out_pfn)
>> +{
>> +	/*
>> +	 * Given a VMA (start, end, pgoffs) and a fault address,
>> +	 * search the corresponding DMABUF's phys_vec[] to find the
>> +	 * range representing the address's offset into the VMA, and
>> +	 * its PFN.
>> +	 *
>> +	 * The phys_vec[] ranges represent contiguous spans of VAs
>> +	 * upwards from the buffer offset 0; the actual PFNs might be
>> +	 * in any order, overlap/alias, etc.  Calculate an offset of
>> +	 * the desired page given VMA start/pgoff and address, then
>> +	 * search upwards from 0 to find which span contains it.
>> +	 *
>> +	 * On success, a valid PFN for a page sized by 'order' is
>> +	 * returned into out_pfn.
>> +	 *
>> +	 * Failure occurs if:
>> +	 * - The page would cross the edge of the VMA
>> +	 * - The page isn't entirely contained within a range
>> +	 * - We find a range, but the final PFN isn't aligned to the
>> +	 *   requested order.
>> +	 *
>> +	 * (Upon failure, the caller is expected to try again with a
>> +	 * smaller order; the tests above will always succeed for
>> +	 * order=0 as the limit case.)
>> +	 *
>> +	 * It's suboptimal if DMABUFs are created with neigbouring
>> +	 * ranges that are physically contiguous, since hugepages
>> +	 * can't straddle range boundaries.  (The construction of the
>> +	 * ranges vector should merge such ranges.)
>> +	 */
>> +
>> +	const unsigned long pagesize = PAGE_SIZE << order;
>> +	unsigned long rounded_page_addr = address & ~(pagesize - 1);
> 
> ALIGN_DOWN(address, pagesize);

Oops, right, fixed.

>> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
>> +	unsigned long buf_page_offset;
>> +	unsigned long buf_offset = 0;
>> +	unsigned int i;
>> +
>> +	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
>> +		if (order > 0)
>> +			return -EAGAIN;
>> +
>> +		/* A fault address outside of the VMA is absurd. */
>> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
>> +		     address, vma->vm_start, vma->vm_end);
>> +		return -EFAULT;
>> +	}
>> +
>> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
>> +					vma->vm_pgoff << PAGE_SHIFT, &buf_page_offset)))
>> +		return -EFAULT;
> 
>> +
>> +	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
>> +		size_t range_len = vpdmabuf->phys_vec[i].len;
>> +		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
>> +
>> +		/*
>> +		 * If the current range starts after the page's span,
>> +		 * this and any future range won't match.  Bail early.
>> +		 */
>> +		if (buf_page_offset + pagesize <= buf_offset)
>> +			break;
> 
> No overflow check on this +? If we are worried order is so large that
> the first needs a check then this would too..

In the earlier check it's not order being large but the vm_pgoff, but 
yes an overflow check wouldn't hurt here.  Added.

I've found (my) choice of variable names here awkward, and have renamed 
them to make it a bit clearer as to what's the page being searched for 
and what's the range, etc.

>> +
>> +		if (buf_page_offset >= buf_offset &&
>> +		    buf_page_offset + pagesize <= buf_offset + range_len) {
> 
>> +			/*
>> +			 * The faulting page is wholly contained
>> +			 * within the span represented by the range.
>> +			 * Validate PFN alignment for the order:
>> +			 */
>> +			unsigned long pfn = (range_start >> PAGE_SHIFT) +
>> +				((buf_page_offset - buf_offset) >> PAGE_SHIFT);
> 
> (range_start + (buf_page_offset - buf_offset)) / PAGE_SIZE;

WFM, done.

Thank you,

Matt


