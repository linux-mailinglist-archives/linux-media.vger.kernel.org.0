Return-Path: <linux-media+bounces-63410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id czutD6MIH2qgdwAAu9opvQ
	(envelope-from <linux-media+bounces-63410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDA630552
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:45:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=meta.com header.s=s2048-2025-q2 header.b=brcsqM3s;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63410-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63410-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=meta.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2FCC3100F14
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 16:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C115D36F917;
	Tue,  2 Jun 2026 16:37:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BAE36F42B
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 16:37:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418266; cv=none; b=oS/xh935vW2QvVw5Bg5i6P4kayy/QuEHWRRXBgmrOh2/jbmtFKqIt4PAkzKVJifDntK73jfu59oeCGAJZkj7StoIvBfyy5jJ1ub66f4E7qYeRubL/X7pnw41xpu5pzoup7g7cSWNlF5Z5aHNKZ9WNT9ndDHOu/iZid1cfh/dStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418266; c=relaxed/simple;
	bh=7vp0n373eyF0PjpADUT3nE0wXuD9SVKd43llGLqPS4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nez0fflbUfm1fQxCs1xG3xSaUexfJDIqLby0emSchzntm+5zg+COakC2ltpRIybLWsCpjhyVcBDsJFSc09REYRc8NqG9O7OG/8Ztumq1iMGXC39e0fwVxIGGqJvRxYWTiWxxSF1rs1Yg3ZIE78fj81PsELnBoLnHqMV7x2lQRXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=brcsqM3s; arc=none smtp.client-ip=67.231.145.42
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652ES6Fv1601610
	for <linux-media@vger.kernel.org>; Tue, 2 Jun 2026 09:37:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=JaI89Wggv+m77fH63fQe+3epu7CJNe/5q/9Y6SRKmH0=; b=brcsqM3sFqRv
	6NFORFPsKgFa9mENs8X1TFSHUuTUAfm/cI0B8hjI4apfh/X1RyhAsKe5wuc3kCMA
	Dje7w0722dwJ1/QzS9RXo5f0OYbIZ62nSfv9c9Bbv/IirIF1QKEBMMUfKMLi3E/h
	gxkUIZlZTEfpb56to9EDjrg+hnGkLd0hTn5L5Vym3EOSZs6SVAR2MW9RP09USsh/
	6RE8/pKKV6Y6PeREA7kw8kJmO/ak7IZYNY6ctOR/pvkpwYA6ymNVLJHxvzGWwe8i
	kkF9UWVWEWbcsdvF9fh4i3XlB09MbiWejOC2Osr6/ocglJlk7yR3wJZRuF2DYz/P
	1QEIutWKVg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ej0yb0y2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 09:37:43 -0700 (PDT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13709ab38a8so12392288c88.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 09:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418263; x=1781023063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaI89Wggv+m77fH63fQe+3epu7CJNe/5q/9Y6SRKmH0=;
        b=cT/J6HeU0BJ8WS22AIF8Pzf2/6Zyv5FNuW+/3LC+nW1lqsENwODrq0Z2HiCX9SS6Nv
         0WJPJl5XdhSB1Z9K2EQnZezQN0NzBeRLYBKek0Ca6Agot0DO69opYmiBX8ABMqm7HgYa
         JheP0/S+4moWphVDnLbS9J7x0FcBDAXcZkRC4msunIwgnLs0S5aQ6qPO1iih0qyHXQsZ
         blrzyCvM3FC+bKnAwsM9NxQ1RZHPy0lOK5bEsK2UlyvrchpArl3B5xpboi3eQOH2G9J+
         IUXJIU0s4MyqNJrrqZd0wap4RNS7wgZJznRyggEh9Du7HKsBjKclYkbsnlfXfTA3lfW6
         OZTw==
X-Forwarded-Encrypted: i=1; AFNElJ98j5V8Ca1vyNw4RokKUZCYhDgTMcySfgGHCZW8P2Hp0/5R/Lmc11jI3nYenSbnKR3wiH4YXFkL5eSQvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwneCxHtjezja4ZFapzaGPuT+rFSgdK8Sid3h5vCcgABrVukbwc
	pDlpoJ5gVpMiihh0MaHLKlYJqjyhaAXlfQeLChreZQBFZzpsVlJqNqwfr1qAqvchCHNFmrN7vDR
	RUk94sxTjMopt6d5G0y4rJuGqp+Ze45VXL2buysjBLVW+2Wlkp5JgBQn5JFfevFo=
X-Gm-Gg: Acq92OE9ixnR42S5W8paBj5UjqUkGdjpK0TPwXTQImBVuFSidyxHN1MlPXqHjJMf2HE
	LzmleknzMEfkNBQzsIYUadamRT2yfzs9ON8gNtoqXun15y3Ieb3D+mffODFGwvYd+cgJbtxDm9n
	jYxnsgba+Di7a+Lb5X8iH0MOWOQc+uIwGqWtuaXw3RgBM9dicL0ba8i53AXuWe0zJn7/xwv9snX
	v2nuOjO+EexYq3ZwMZL/Nqqrmf5nV1X61BR6WzG6J3a/5inpX4375sSJC2lhjjIJuTAG/RNwNtj
	B98WnjtZ+8lexgp64pLki3r5uojxoVlQY1jU/7InGqpAcgSsRgcnstKshHjbBmNF9Ly4eoSPQEt
	nZxE0SjjePTubvxSW2703t9SO5qeA0MRENmPxC6eV
X-Received: by 2002:a05:7022:1a84:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137d423bfe1mr6867355c88.17.1780418262987;
        Tue, 02 Jun 2026 09:37:42 -0700 (PDT)
X-Received: by 2002:a05:7022:1a84:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137d423bfe1mr6867319c88.17.1780418262207;
        Tue, 02 Jun 2026 09:37:42 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5489d17sm159385c88.1.2026.06.02.09.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 09:37:41 -0700 (PDT)
Message-ID: <71936818-dc94-47bc-9f17-59005553dd73@meta.com>
Date: Tue, 2 Jun 2026 17:37:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
        Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>,
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
        kvm@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260527102319.100128-1-mattev@meta.com>
 <20260527102319.100128-3-mattev@meta.com>
 <20260527163837.02be1e7c@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260527163837.02be1e7c@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AureGu9P c=1 sm=1 tr=0 ts=6a1f06d7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22 a=VabnemYjAAAA:8
 a=W66DtvnrEJvMCsljMtwA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX6t1DCb6xJdLG
 l8P6armVp8yUOQHdTK9HuLoRMygsQSCtsm7TJ7VEHWh4+G10zqkt6dV8G8Svj/2cgtyA/y46LFV
 2qs1dFhT8LAJRTlDg1OFZODidVaqNnVPa8qmKETjQV+F1fh8KY/5SC+zSTNJ7TEJ56oApirUQhS
 Dr2BcxG7pj7eV1e/Zl4WdwDtXvL9jg2ZTf6bXz+lGId4oQsA/9Q95m0Mbb+8PxNFlgPJ//ibt60
 OOvSfCaHv2Cx8bcWgjIvMzI85Zsv/R3z+sHF2ouryR0b2jv5uiyzYCUACNkw6BMjv0zbkWxRms5
 N9nMHnt+U064PIw6FyN6fcGrD8HyEoYezxAUncQI0nUCMfoIvEhTHMYrkQEUzxVP+/4GAQGfYSc
 2JgPHyYcgSDMzSs9S8ALXUqJsdm+t0ropeQX6uS2sMS2vq8KWIy4oyuw1LJaSoPEoCTjCrBYENs
 IQUv3tVnL4w8+3w0lng==
X-Proofpoint-ORIG-GUID: KupWoPQNjU5NZAJJY60US-cMUtOfmyUo
X-Proofpoint-GUID: KupWoPQNjU5NZAJJY60US-cMUtOfmyUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63410-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:mid,meta.com:dkim,meta.com:from_mime,meta.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ADDA630552

Hi Alex,

On 27/05/2026 23:38, Alex Williamson wrote:
> 
> On Wed, 27 May 2026 03:23:05 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
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
>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 142 ++++++++++++++++++++++++++---
>>   drivers/vfio/pci/vfio_pci_priv.h   |  20 ++++
>>   2 files changed, 149 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index c16f460c01d6..0d132c4ca95f 100644
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
>> @@ -106,6 +93,135 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>>   	.release = vfio_pci_dma_buf_release,
>>   };
>>   
>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
> 
> This private dmabuf object pointer is named priv pretty consistently
> throughout the rest of the file.

Right you are, fixed.

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
>> +	 *
>> +	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
>> +	 * a VFIO BAR mmap, which is created from the start of the
>> +	 * offset region.  It should be zero, or equal vm_pgoff.
>> +	 */
>> +
>> +	const unsigned long pagesize = PAGE_SIZE << order;
>> +	unsigned long vma_off = ((vma->vm_pgoff - vpdmabuf->vma_pgoff_adjust) <<
>> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
>> +	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
>> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
>> +	unsigned long page_buf_offset;
>> +	unsigned long range_buf_offset = 0;
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
>> +	if (vpdmabuf->vma_pgoff_adjust != 0 &&
>> +	    vpdmabuf->vma_pgoff_adjust != (vma->vm_pgoff &
>> +					   (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT))) {
>> +		WARN(1, "Unexpected vma_pgoff_adjust 0x%lx (vm_pgoff 0x%lx)\n",
>> +		     vpdmabuf->vma_pgoff_adjust, vma->vm_pgoff);
>> +		return -EFAULT;
>> +	}
> 
> This appears to be user trigger'able, by causing a vma to be split, and
> also unnecessary as it seems the math works out correctly for the split
> case.

Good spot, fixed.  I added a VMA split case to the [RFC] 
vfio_dmabuf_mmap_test, thanks for spotting this.

>> +
>> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
>> +					vma_off, &page_buf_offset)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
>> +		unsigned long page_buf_offset_end;
>> +		size_t range_len = vpdmabuf->phys_vec[i].len;
>> +		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
>> +
>> +		if (unlikely(check_add_overflow(page_buf_offset, pagesize,
>> +						&page_buf_offset_end)))
>> +			return -EFAULT;
> 
> Why is this inside the loop, the args are invariant of anything
> modified in the loop.  Thanks,

Right; I slipped up when renaming/refactoring the additions, that 
definitely goes above.  Fixed!


Thanks,


Matt


> 
> Alex
> 
>> +		/*
>> +		 * If the current range starts after the page's span,
>> +		 * this and any future range won't match.  Bail early.
>> +		 */
>> +		if (page_buf_offset_end <= range_buf_offset)
>> +			break;
>> +
>> +		if (page_buf_offset >= range_buf_offset &&
>> +		    page_buf_offset_end <= range_buf_offset + range_len) {
>> +			/*
>> +			 * The faulting page is wholly contained
>> +			 * within the span represented by the range.
>> +			 * Validate PFN alignment for the order:
>> +			 */
>> +			unsigned long pfn = (range_start + page_buf_offset -
>> +					     range_buf_offset) / PAGE_SIZE;
>> +
>> +			if (IS_ALIGNED(pfn, 1 << order)) {
>> +				*out_pfn = pfn;
>> +				return 0;
>> +			}
>> +			/* Retry with smaller order */
>> +			return -EAGAIN;
>> +		}
>> +		range_buf_offset += range_len;
>> +	}
>> +
>> +	/*
>> +	 * A hugepage straddling a range boundary will fail to match a
>> +	 * range, but the address will (eventually) match when retried
>> +	 * with a smaller page.
>> +	 */
>> +	if (order > 0)
>> +		return -EAGAIN;
>> +
>> +	/*
>> +	 * If we get here, the address fell outside of the span
>> +	 * represented by the (concatenated) ranges.  Setup of a
>> +	 * mapping must ensure that the VMA is <= the total size of
>> +	 * the ranges, so this should never happen.  But, if it does,
>> +	 * force SIGBUS for the access and warn.
>> +	 */
>> +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
>> +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
>> +		  vpdmabuf->nr_ranges, vpdmabuf->size);
>> +
>> +	return -EFAULT;
>> +}
>> +
>>   /*
>>    * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>>    * It allows the two co-operating drivers to exchange the physical address of
>> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
>> index fca9d0dfac90..c8f6f959056a 100644
>> --- a/drivers/vfio/pci/vfio_pci_priv.h
>> +++ b/drivers/vfio/pci/vfio_pci_priv.h
>> @@ -23,6 +23,20 @@ struct vfio_pci_ioeventfd {
>>   	bool			test_mem;
>>   };
>>   
>> +struct vfio_pci_dma_buf {
>> +	struct dma_buf *dmabuf;
>> +	struct vfio_pci_core_device *vdev;
>> +	struct list_head dmabufs_elm;
>> +	size_t size;
>> +	struct phys_vec *phys_vec;
>> +	struct p2pdma_provider *provider;
>> +	u32 nr_ranges;
>> +	struct kref kref;
>> +	struct completion comp;
>> +	unsigned long vma_pgoff_adjust;
>> +	u8 revoked : 1;
>> +};
>> +
>>   bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
>>   void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
>>   
>> @@ -114,6 +128,12 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>>   	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>>   }
>>   
>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>> +			      struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      unsigned int order,
>> +			      unsigned long *out_pfn);
>> +
>>   #ifdef CONFIG_VFIO_PCI_DMABUF
>>   int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   				  struct vfio_device_feature_dma_buf __user *arg,
> 


