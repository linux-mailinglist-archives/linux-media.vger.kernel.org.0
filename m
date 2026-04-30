Return-Path: <linux-media+bounces-60102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OWxHeWI82mS4wEAu9opvQ
	(envelope-from <linux-media+bounces-60102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:52:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17AD4A6094
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 522163057C73
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 16:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AA6364E85;
	Thu, 30 Apr 2026 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="VmzmDuLo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEB3446A7
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567678; cv=none; b=Yy09Y7xh3hy+zmdQUMD4WWLR1tGEANY1+W/bG8Kk5/sK8zL+ymMkRHirzzHXKrruzQvEFhBsLAcncTxflGFEozuqSnpZ0Mw3cTRFkIoRpH60KniTZ5xaLah5i7RisCDR/dBTpBHEDanofRwQtGQJV6xzjEDEyDdvqOYtWhfR6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567678; c=relaxed/simple;
	bh=cSGNZ8wgbO7X87rwVZjWUPh3PFb7JnuVVs+4c9CzkS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SicY7uwk3xhN6pL09WcGhrTedQ5gb7j5kEE5Lz08cNSEGNmJ4mVojFNMjmlf9ux7MG/tQ/N910g2eXXuNm/YgjmBU43Xr44ypJuB0GnRmUSabRGj/oiEr/sF2e00hpgeFHwcFDRsfhxHdgrWeyxNnz8xEy7aEHec4b1ksoAmoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=VmzmDuLo; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDAkD23597327
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 09:47:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=CXvj6rmLtU+yqG7K5nb8uAhPCFMrTB1Lg0tTO/8UY38=; b=VmzmDuLofwCN
	XcDBoa+sLJlHhfy6vjpvEjX9zOHYSohipMJKuWABb0/tFAgCYvUKYRmq1VYJYrm+
	YyffbepmXjCagGPySLIrmaJ5SWJEIM+OBHitW/S1gBzRFsRT6oc2SxOGzvzDzjUw
	92vNwrtouQ3cYeinUfudEAWZWLyl6zwoda8rflkF4cjAWAFZesr61T3Px2BTqwDf
	hF6OXYCAbJd2TYHTf+LHNX+8OiYQxHtTHKnZa33UUllCmQi1/95LKvMZ1J2xd6Ve
	2O6g8ywmcBylHs0F9CFe3Ys6hZVRNSwGu5ttT4tnlutyOtT7x9qVVAEtvsvTkoVC
	pXi+P7srPw==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4drrx63bdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 09:47:55 -0700 (PDT)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488e097a270so7303655e9.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 09:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567674; x=1778172474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXvj6rmLtU+yqG7K5nb8uAhPCFMrTB1Lg0tTO/8UY38=;
        b=UNQib9xF7Rl87bkOOJydoUmaiMx/hbpPb0gTcgqzL6wc/LL+ARBYoxCtwIPmle+RVC
         XovaAxBCBn5UMGLDKIiOUxU9Ll/6UKFuhuBJzFgqQyegmp+RRUj0eURTznWIaq3LH+3c
         Go60E62YA+UJfO+JIkQsa3s3XOB2qyQecuRD3VLTujQYtJk68HWWbKcG2rbtRmvTWWu+
         zEMhRcL9C++l5eUT6ynRYq89Dg8tW9hRB2uhfGWji2x63VymY2uUXnJx3i9gl3AN7Jhz
         hHIqF2hRZ+icCDK6V3LdfPyN4rFzmPKNsjkazDHbmTNiZ9t72QnBZII9sM8YgLQeUoqz
         4/8g==
X-Forwarded-Encrypted: i=1; AFNElJ89jmgX76hvDnrHk0k2f6T0JhBmrcndtawrDtmCEErC7XIG3SLN8U5abEKNzM+IY6DxkXy0OC1VMzjVnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgI+iIPjUL9bDwdPcpKFxMDhbEHiZu9A1ZBe3RPeRc4uqJyQeg
	vXKurRqyzT0cxMTblfb6py/Ut1RO6rswKsMwXkCa18lF8ng3hnnrTLANg4lN3ho/WTMUaTeZBaf
	ui/QOHYh7bod0dIuSdJyAlbL1qK1MShvop6FncTn34c7PNxanRzFaHDEaj4UPIOk=
X-Gm-Gg: AeBDieskYn9JWD0NFXY4VA2a3WdLr2tGRtw6tvSEU+uz2UUy/Ggnzt19iVbLwaqtsH/
	Y9vApHp8wrtQ5GLtr0WMs9KTv/Me2Zl2W7DrKxQJMUvDBLFCAkhK222OmD/TvU0MgyDyXjvffbj
	2IbP6qoMiQLvDTUkLaVMSxiJUL63xP0srUzMqHqU1WQYSYsoKq8Q2wYFr3elyLsW/aW5syBCjwF
	kJo/s7NUsDscD/QrAvPs+Uilf6JespdN5lFi+FNh5Uu7Vs+GKRnf3GSm7Ktm2hIEmdi/6R3gZzz
	AcMKxZlTm1fXkwLAO8T3MiuMB87b3W9mzhRdDop8DF0lBb/Dfp6zsUYb1Bq7R4TkInJoiD3iBo4
	od3fldnyCj0mzdjw/tvf2znep/QRseqsyyLA0LMeF4DfvQBoBRlTYnX7Ukd8GagWwrgfKHfBaas
	NT
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr65498655e9.8.1777567673933;
        Thu, 30 Apr 2026 09:47:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr65498015e9.8.1777567673394;
        Thu, 30 Apr 2026 09:47:53 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:10fb:be93:502f:b7be? ([2620:10d:c092:500::4:5cf3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c82f2sm75353315e9.11.2026.04.30.09.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:47:52 -0700 (PDT)
Message-ID: <c598a21e-ee50-42d9-98dc-2959e84ace50@meta.com>
Date: Thu, 30 Apr 2026 17:47:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
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
 <20260416131815.2729131-4-mattev@meta.com>
 <20260424182426.GG3444440@nvidia.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260424182426.GG3444440@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE3MiBTYWx0ZWRfXz0C/plRNtyL0
 izBhN13o8kxvNL23N2KuJPA4bd8z8IFrfSZPe5tvtDE8p0/v9zX4oB+4dG8oTWCZ9UzvXfNlhPG
 gMZO+vb/uDYkLbXDDW+vX2tnQaVJ4jz/EBX5MIUdPsj6rBXKzffkyt60NHlDfkcLqm4LY+4aiKR
 L4aZqVMIWS20Knt+S/MVVu0GVteb1zm1IzIDe6teTI3GKNDar8FWppCTh6I0BkyNENtJ1xFIgH/
 yM3UwLY9bUkTvH5VP5R81giQlKSO9eo7RcqmGlxNICl/EhD8o6ILGaYi/CHltFVmX1Hupq8aFF3
 tWmV7yTmmY7sKga3bECjn5k6Y238Tz17EwEO7bEhR9ySpcPWYiJDEUFDHUK9H4UR5XlJeKV1Lie
 1wWFOoxWhsHz8xbJZESlgeXcPKrNGYwrVCl8qfOzXqnlTTeiguNosLXHyBCB2XRo9rPtFVvKkoW
 CLOY3QlBxsDqnn01mWg==
X-Proofpoint-GUID: 6PnL4fU0VHIRvCrmU7fi9Evsu7KXpbeD
X-Proofpoint-ORIG-GUID: 6PnL4fU0VHIRvCrmU7fi9Evsu7KXpbeD
X-Authority-Analysis: v=2.4 cv=ZZUt8MVA c=1 sm=1 tr=0 ts=69f387bb cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=Dv35txUGz5gI0hTa:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22 a=nxdftAbHouV8PAc5HfQA:9
 a=QEXdDO2ut3YA:10 a=cZgK7WzY9ta9U-6s7oqD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Rspamd-Queue-Id: E17AD4A6094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-60102-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:dkim,meta.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Jason,

On 24/04/2026 19:24, Jason Gunthorpe wrote:
> 
> On Thu, Apr 16, 2026 at 06:17:46AM -0700, Matt Evans wrote:
>> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>> +				   struct vm_area_struct *vma,
>> +				   u64 phys_start, u64 req_len,
>> +				   unsigned int res_index)
>> +{
>> +	struct vfio_pci_dma_buf *priv;
>> +	const unsigned int nr_ranges = 1;
>> +	int ret;
>> +
>> +	priv = kzalloc_obj(*priv);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
>> +	if (!priv->phys_vec) {
>> +		ret = -ENOMEM;
>> +		goto err_free_priv;
>> +	}
>> +
>> +	/*
>> +	 * The mmap() request's vma->vm_offs might be non-zero, but
>> +	 * the DMABUF is created from _offset zero_ of the BAR.  The
>> +	 * portion between zero and the vm_offs is inaccessible
>> +	 * through this VMA, but this approach keeps the
>> +	 * /proc/<pid>/maps offset somewhat consistent with the
>> +	 * pre-DMABUF code.  Size includes the offset portion.
> 
> I'm not sure I understand this comment?
> 
> For the old path vm_pgoff for byte 0 of the bar starts at some large
> offset
> 
> For the new path vm_pgoff for byte 0 of the first range starts at 0

Glad you asked.  :)

This is trying to achieve keeping /proc/<pid>/maps (or similar) somewhat
as informative as pre-DMABUF BAR mmap, in terms of keeping the VMA
vm_offs column useful.  Before this patch, say you mmap() two slices A
and B of the same BAR:

  struct vfio_region_info bar_region;

  vm_a = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0);
  vm_b = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0x4000);

...you'd see something like this in /proc/blah/maps:

fffff4000000-fffff4001000 rw-s 10000000000 00:07 148     /dev/vfio/devices/vfio0
fffff5000000-fffff5001000 rw-s 10000004000 00:07 148     /dev/vfio/devices/vfio0

It's nice being able to tell the actual BAR offset (within the
VFIO_PCI_OFFSET_MASK, i.e I _don't_ mean the synthetic region index
offset).

For vm_b, if we create the DMABUF to begin from the start of the
actually-mapped slice

   phys = pci_resource_start(pdev, index) + (vma->vm_pgoff << PAGE_SHIFT)

then the VMA's vm_offs would need to be thunked back down to 0 (since
the fault handler then treats vm_b + 0 as the first byte of the DMABUF).
That works/adds up, but then the vm_offs of both VMAs A & B both have
offset 0, and it's harder to differentiate in /proc/blah/maps.

An example from the later patch "vfio/pci: Provide a user-facing name
for BAR mappings" naming is:

ffffb8070000-ffffbc040000 rw-s 00030000 00:0b 5         /dmabuf:vfio0:0000:00:03.0/1
ffffbc140000-ffffbc240000 rw-s 00000000 00:0b 2         /dmabuf:vfio0:0000:00:03.0/0

We could possibly stash the original offset somewhere and then render it
in the name string, but the name's already about the max size and using
the existing vm_offs column is nicer IMO, doesn't need a new field, etc.

I need to work on this comment then!  What this is trying to say is that
the DMABUF is made artificially larger than the part that is visible
through the VMA.

I.e. the DMABUF starts at the beginning of the BAR and so an mmap for
offset +0x4000 for 0x1000 bytes starts at 0 and the VMA sees
0x4000-0x5000.

>> +	 * This differs from an mmap() of an explicitly-exported
>> +	 * DMABUF which is an arbitrary slice of the BAR, would be
>> +	 * created with the desired offset+size, and would usually be
>> +	 * mmap()ed with pgoff = 0.
>> +	 *
>> +	 * Both are equivalent and vfio_pci_dma_buf_find_pfn() finds
>> +	 * the same PFNs.
>> +	 */
>> +	priv->vdev = vdev;
>> +	priv->nr_ranges = nr_ranges;
>> +	priv->size = (vma->vm_pgoff << PAGE_SHIFT) + req_len;
> 
> And why is size being calculated from pgoff ?

This is the part that makes the size the requested size plus the
invisible portion before the VMA starts (equal to an extra 0x4000 in the
example above, distance from offset 0).


Thanks,


Matt

PS: Thanks also for the other reviews!

